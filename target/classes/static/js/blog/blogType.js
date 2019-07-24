layui.use('table', function(){
    var table = layui.table
        ,layer = layui.layer;

    table.render({
        elem: '#typeList'
        ,url:'/admin/blog/blogType/list'
        ,toolbar: '#typeToolbar'
        ,title: '用户数据表'
        ,limit: 6  //每页展示的数量
        ,cols: [
            [
                {type: 'checkbox'}
                ,{field:'typeId', title:'ID', sort: true, align: 'center'}
                ,{field:'typeName', title:'分类', align: 'center'}

                ,{title:'操作', toolbar: '#typeBar', align: 'center'}
            ]
        ]
        ,page: {page: true, theme: '#1E9FFF'}
        ,id: 'typeTable'
    });

    var $ = layui.$, active = {
        reload: function () { //重载数据表格
            //执行重载
            table.reload('typeTable', {  //update是数据表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    //updatelogLoad，在搜索的input表单里面的id
                    typeName: $('#typeNameSearch').val()
                }
            });
        }
    };
    $('#sousuo').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //头工具栏事件
    table.on('toolbar(typeTableFilter)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'getCheckData':
                var data = checkStatus.data;
                layer.alert(JSON.stringify(data));
                break;
            case 'getCheckLength':
                var data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
                break;
            case 'batchDelType':    //批量删除
                var data = checkStatus.data;
                if (data.length > 0){
                    layer.confirm('确定删除这'+data.length+'个分类吗？',{
                        btn: ['确定','取消'],
                        yes:function () {
                            var ids = "";
                            for (var i = 0; i < data.length; i++) {
                                ids += data[i].typeId + ",";
                            }
                            console.log("批量删除：" +ids);
                            $.ajax({
                                url: '/admin/blog/blogType/batchDel',
                                type: 'post',
                                dataType: 'json',
                                data: {'ids': ids},
                                success: function (result) {
                                    if (result.code === 0){
                                        layer.msg(result.msg);
                                        setTimeout("window.location.reload()", 3000);
                                    } else{
                                        layer.msg(result.msg,{anim:6});
                                    }
                                },
                                error: function () {
                                    layer.msg("删除失败！",{anim:6});
                                }
                            })
                        }
                    })
                } else{
                    layer.msg("请选择需要删除的分类！");
                }
                break;
        }
    });

    //监听行工具事件
    table.on('tool(typeTableFilter)', function(obj){
        var data = obj.data;
        console.log(obj);
        if(obj.event === 'del'){
            console.log("删除："+data.typeId);
            layer.confirm('确定删除这个分类吗？',{
                btn: ['确定','取消']
                ,yes: function () {
                    $.ajax({
                        url: '/admin/blog/blogType/delOne',
                        type: 'post',
                        dataType: 'json',
                        data: {'typeId': data.typeId},
                        success: function (result) {
                            if (result.code === 0){
                                layer.msg(result.msg);
                                setTimeout("window.location.reload()",3000);
                            } else{
                                layer.msg(result.msg,{anim:6});
                            }
                        },
                        error: function () {
                            layer.msg("删除失败！",{anim:6})
                        }
                    })
                }
            });
        } else if(obj.event === 'edit'){
            layer.open({
                type: 1
                , title: '编辑分类'
                //, skin: 'layui-layer-molv' //墨绿主题
                , area: ['600px', '200px']
                , content: '' +
                    // 使用了Boostrap的表单
                    '<form style="margin-right: 30px;margin-left: 20px;margin-top: 30px" class="form-horizontal" id="editBlogType">' +
                    '    <div class="form-group" style="display: none;">' +
                    '        <label class="col-sm-2 control-label">分类ID</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="typeId" value="'+data.typeId+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group">' +
                    '        <label class="col-sm-2 control-label">分类名称</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="typeName" value="'+data.typeName+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '</form>'
                , btn: ['确认添加', '取消']
                , btnAlign: 'c'
                , yes: function (index) {
                    $.ajax({
                        url: '/admin/blog/blogType/edit',
                        type: 'post',
                        dataType: 'json',
                        //contentType: "application/x-www-form-urlencoded",
                        data: $("#editBlogType").serialize(),
                        success: function (data) {
                            if (data.code == 0){
                                layer.msg(data.msg,{icon: 6});
                                setTimeout('location.reload();',2000); //2秒后再执行重载数据表格
                            } else {
                                layer.msg(data.msg, {time: 3000, icon: 5});
                            }
                        },
                        error:function () {
                            layer.msg(data.msg, {time: 3000, icon: 5});
                        }
                    });
                    layer.close(index);
                }
            });
        }
    });
});

//添加分类
function addType() {
    layui.use('table', function() {
        var table = layui.table
            , layer = layui.layer;

        layer.open({
            type: 1
            , title: '添加文章分类'
            //, skin: 'layui-layer-molv' //墨绿主题
            , area: ['600px', '200px']
            , content: '' +
                // 使用了Boostrap的表单
                '<form style="margin-right: 30px;margin-left: 20px;margin-top: 30px" class="form-horizontal" id="addBlogType">' +
                '    <div class="form-group" style="display: none;">' +
                '        <label class="col-sm-2 control-label">分类ID</label>' +
                '        <div class="col-sm-10">' +
                '            <input type="text" id="date" name="create_date" required lay-verify="required" autocomplete="off" class="form-control">' +
                '        </div>' +
                '    </div>' +
                '    <div class="form-group">' +
                '        <label class="col-sm-2 control-label">分类名称</label>' +
                '        <div class="col-sm-10">' +
                '            <input type="text" name="typeName" required lay-verify="required" autocomplete="off" class="form-control">' +
                '        </div>' +
                '    </div>' +
                '</form>'
            , btn: ['确认添加', '取消']
            , btnAlign: 'c'
            , yes: function (index) {
                $.ajax({
                    url: '/admin/blog/blogType/add',
                    type: 'post',
                    dataType: 'json',
                    //contentType: "application/x-www-form-urlencoded",
                    data: $("#addBlogType").serialize(),
                    success: function (data) {
                        if (data.code == 0){
                            layer.msg(data.msg,{icon: 6});
                            setTimeout('location.reload();',2000); //2秒后再执行重载数据表格
                        } else {
                            layer.msg(data.msg, {time: 3000, icon: 5});
                        }
                    },
                    error:function () {
                        layer.msg(data.msg, {time: 3000, icon: 5});
                    }
                });
                layer.close(index);
            }
        });
    })
}