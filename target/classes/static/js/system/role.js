
layui.use('table', function(){
    var table = layui.table;

    table.render({
        elem: '#roleList'
        ,url:'/admin/system/role/list'
        ,toolbar: '#roleToolbar'
        ,title: '用户数据表'
        ,cols: [
            [
            {type: 'checkbox'}
            ,{field:'role_id',align: 'center', title:'角色ID', sort: true}
            ,{field:'role_name',align: 'center', title:'角色名称'}
            ,{field:'description',align: 'center', title:'角色描述'}
            ,{title:'操作',align: 'center', toolbar: '#roleBar'}
        ]
        ]
        ,page: {page: true, theme: '#1E9FFF'}
        ,id: 'roleTableId'
    });

    //表格重载
    var $ = layui.$, active = {
        reload: function(){
            //执行重载
            table.reload('roleTableId', { //表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    description: $('#roleDescriptionReload').val()
                }
            });
        }
    };

    $('#roleDescriptionSearch').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //头工具栏事件
    table.on('toolbar(roleTable)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'getCheckData':
                var data = checkStatus.data;
                layer.alert(JSON.stringify(data));
                break;
            case 'roleAdd':
                layer.open({
                    type: 1
                    , title: '新增角色'
                    //, skin: 'layui-layer-molv' //墨绿主题
                    , area: ['600px', '300px']
                    , content: '' +
                        // 使用了Boostrap的表单
                        '<form style="margin-right: 30px;margin-left: 30px;margin-top: 30px" class="form-horizontal" id="addRole">' +
                        '    <div class="form-group">' +
                        '        <label class="col-sm-2 control-label">角色名称</label>' +
                        '        <div class="col-sm-10">' +
                        '            <input type="text" name="role_name" required lay-verify="required" autocomplete="off" class="form-control">' +
                        '        </div>' +
                        '    </div>' +
                        '    <div class="form-group">' +
                        '        <label class="col-sm-2 control-label">角色描述</label>' +
                        '        <div class="col-sm-10">' +
                        '            <input type="text" name="description" required lay-verify="required" autocomplete="off" class="form-control">' +
                        '        </div>' +
                        '    </div>' +
                        '</form>'
                    , btn: ['确认', '取消']
                    , btnAlign: 'c'
                    , yes: function (index) {
                        $.ajax({
                            url: '/admin/system/role/add',
                            type: 'post',
                            dataType: 'json',
                            //contentType: "application/x-www-form-urlencoded",
                            data: $("#addRole").serialize(),
                            success: function (result) {
                                if (result.code === 0){
                                    layer.msg(result.msg,{icon: 6});
                                    setTimeout('location.reload();',2000); //2秒后再执行重载数据表格
                                } else {
                                    layer.msg(result.msg, {time: 3000, icon: 5});
                                }
                            },
                            error:function () {
                                layer.msg("添加失败！", {time: 3000, icon: 5});
                            }
                        });
                        layer.close(index);
                    }
                });
                break;
            case 'roleBatchDel':
                var data = checkStatus.data;
                if (data.length > 0){
                    var ids = "";
                    for (var i = 0; i < data.length; i++) {
                        ids += data[i].role_id +",";
                    }
                    console.log("删除：" +ids);
                    layer.confirm("确认删除这" +data.length +"个角色吗？",{
                        anim: 6,
                        btn: ['确定','取消'],
                        yes: function () {
                            $.ajax({
                                url: '/admin/system/role/batchDel',
                                type: 'post',
                                dataType: 'json',
                                data: {'ids': ids},
                                success: function (result) {
                                    if (result.code === 0){
                                        layer.msg(result.msg);
                                        setTimeout("window.location.reload()", 3000);
                                    } else{
                                        layer.msg(result.msg);
                                    }
                                },
                                error: function () {
                                    layer.msg("删除失败！");
                                }
                            })
                        }
                    });
                } else {
                    layer.msg("请选择需要删除的角色！", {anim: 6});
                }
                break;
        }
    });

    //监听行工具事件
    table.on('tool(roleTable)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            var role_id = data.role_id;
            console.log("删除：" +role_id);
            layer.confirm('确认删除这个角色吗？',{
                anim: 6,
                btn: ['确定','取消'],
                yes: function () {
                    $.ajax({
                        url: '/admin/system/role/deleteOne',
                        type: 'post',
                        dataType: 'json',
                        data: {'role_id': role_id},
                        success: function (result) {
                            if (result.code === 0){
                                layer.msg(result.msg);
                                setTimeout("window.location.reload()", 3000);
                            } else{
                                layer.msg(result.msg);
                            }
                        },
                        error: function () {
                            layer.msg("删除失败！");
                        }
                    })
                }
            });
        } else if(obj.event === 'edit'){
            layer.open({
                type: 1
                , title: '编辑角色'
                //, skin: 'layui-layer-molv' //墨绿主题
                , area: ['600px', '300px']
                , content: '' +
                    // 使用了Boostrap的表单
                    '<form style="margin-right: 30px;margin-left: 30px;margin-top: 30px" class="form-horizontal" id="editRole">' +
                    '    <div class="form-group" style="display: none;">' +
                    '        <label class="col-sm-2 control-label">角色ID</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="role_id" value="'+data.role_id+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group">' +
                    '        <label class="col-sm-2 control-label">角色名称</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="role_name" value="'+data.role_name+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group">' +
                    '        <label class="col-sm-2 control-label">角色描述</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="description" value="'+data.description+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '</form>'
                , btn: ['确认', '取消']
                , btnAlign: 'c'
                , yes: function (index) {
                    $.ajax({
                        url: '/admin/system/role/edit',
                        type: 'post',
                        dataType: 'json',
                        //contentType: "application/x-www-form-urlencoded",
                        data: $("#editRole").serialize(),
                        success: function (result) {
                            if (result.code === 0){
                                layer.msg(result.msg,{icon: 6});
                                setTimeout('location.reload();',2000); //2秒后再执行重载数据表格
                            } else {
                                layer.msg(result.msg, {time: 3000, icon: 5});
                            }
                        },
                        error:function () {
                            layer.msg("添加失败！", {time: 3000, icon: 5});
                        }
                    });
                    layer.close(index);
                }
            });
        } else if (obj.event === 'role_res'){
            var role_id = data.role_id;
            console.log("所选行的角色id：" +role_id);
            //权限树start
            layui.use(['jquery', 'authtree', 'form', 'layer', 'table'], function(){
                var $ = layui.jquery;
                var authtree = layui.authtree;
                var form = layui.form;
                var layer = layui.layer;
                var table = layui.table;

                // 一般来说，权限数据是异步传递过来的
                var getLeaf = ""; //选中的叶子节点
                var getMaxDept = ""; //树的深度
                var checked = ""; //所有已选中的节点
                var getNotChecked = ""; //未选中
                $.ajax({
                    url: '/admin/system/resources/roleTree',
                    dataType: 'json',
                    data: {'role_id': role_id},
                    success: function(res){
                        // 如果后台返回的不是树结构，请使用 authtree.listConvert 转换
                        var trees = authtree.listConvert(res.data.list,{
                            primaryKey: 'id' //注意是跟pid一起的id，未必是主键id
                            ,startPid: 0 //startPid 参数的数据类型需要和列表返回的一致，如果列表返回的id数据均为字符串，则 startPid 应该为 '0'
                            ,parentKey: 'pid' //id 和 pid 的数据类型需一致
                            ,nameKey: 'resources_name'
                            ,valueKey: 'id' //id 和 pid 的数据类型需一致
                            ,checkedKey: res.data.checkedId
                        });
                        //初始化显示权限树
                        authtree.render('#LAY-auth-tree-index', trees, {
                            inputname: 'authids[]',
                            layfilter: 'lay-check-auth',
                            autowidth: true,
                            autochecked: true, //选中节点后,是否自动选中直属父级并且选中所有子节点
                            autoclose: true, //取消节点选中后,是否自动取消父级选中(当兄弟节点均为未选中时)
                            //theme: 'auth-skin-universal', //主题
                            themePath: '/layui-authtree/layui_exts/tree_themes/' // 主题路径，默认 layui_exts/tree_themes/
                        });
                        // 权限树操作---->使用 authtree.on() 不会有冒泡延迟
                        authtree.on('change(lay-check-auth)', function(data) {
                            // 获取所有已选中节点
                            checked = authtree.getChecked('#LAY-auth-tree-index');
                            console.log('所有已选中的节点(checked)', checked);

                            // 获取选中的叶子节点
                            getLeaf = authtree.getLeaf('#LAY-auth-tree-index');
                            console.log('叶子节点(leaf)', getLeaf);

                            //权限树的深度
                            getMaxDept = authtree.getMaxDept('#LAY-auth-tree-index');
                            console.log('权限树的深度(getMaxDept)', getMaxDept);

                            //未选中的数据，用来选择未勾选的
                            getNotChecked = authtree.getNotChecked('#LAY-auth-tree-index');
                            console.log("未选中：" +getNotChecked);
                        });
                    }
                });
                //提交
                form.on('submit(LAY-auth-tree-submit)', function(obj){
                    var countLeaf = "";
                    for (var i = 0; i < getLeaf.length; i++) {
                        countLeaf += getLeaf[i] + ",";
                    }
                    var countNotChecked = "";
                    for (var i = 0; i < getNotChecked.length; i++) {
                        countNotChecked += getNotChecked[i] + ",";
                    }
                    var authids = authtree.getAll('#LAY-auth-tree-index');
                    console.log('Choosed authids is', authids);
                    obj.field.authids = authids;
                    $.ajax({
                        url: '/admin/system/role/power/add',
                        dataType: 'json',
                        data: {'role_id': role_id, 'checked': checked, 'countNotChecked': countNotChecked, 'countLeaf': countLeaf, 'getMaxDept': getMaxDept},
                        success: function(res){
                            if (res.code === 0){
                                layer.msg(res.msg,{icon: 1});
                                setTimeout("window.location.reload();", 2000);
                            } else if (res.code === 1){
                                layer.msg(res.msg,{icon: 3});
                                setTimeout("window.location.reload();", 2000);
                            }
                        },
                        error: function () {
                            layer.msg("提交失败！",{icon: 2, anim: 6});
                            setTimeout("window.location.reload();", 2000);
                        }
                    });
                    return false;
                });
            });
            //权限树end
        }
    });
});

//==========================================权限树start==========================================
layui.config({
    base: '/layui-authtree/layui_exts/',
}).extend({
    authtree: 'authtree',
});


//权限树操作
//获取未选中的节点
function getNotChecked(dst) {
    layui.use(['jquery', 'layer', 'authtree'], function(){
        var layer = layui.layer;
        var authtree = layui.authtree;

        authtree.getNotChecked(dst);
    });
}

//获取树的深度
function getMaxDept(dst) {
    layui.use(['jquery', 'layer', 'authtree'], function(){
        var layer = layui.layer;
        var authtree = layui.authtree;

        authtree.getMaxDept(dst);
    });
}
// 全选样例
function checkAll(dst){
    layui.use(['jquery', 'layer', 'authtree'], function(){
        var layer = layui.layer;
        var authtree = layui.authtree;

        authtree.checkAll(dst);
    });
}
// 全不选样例
function uncheckAll(dst){
    layui.use(['jquery', 'layer', 'authtree'], function(){
        var layer = layui.layer;
        var authtree = layui.authtree;

        authtree.uncheckAll(dst);
    });
}
// 显示全部
function showAll(dst){
    layui.use(['jquery', 'layer', 'authtree'], function(){
        var layer = layui.layer;
        var authtree = layui.authtree;

        authtree.showAll(dst);
    });
}
// 隐藏全部
function closeAll(dst){
    layui.use(['jquery', 'layer', 'authtree'], function(){
        var layer = layui.layer;
        var authtree = layui.authtree;

        authtree.closeAll(dst);
    });
}
//==========================================权限树end==========================================






















