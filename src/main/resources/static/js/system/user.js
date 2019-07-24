layui.use(['table','form'], function(){
    var table = layui.table
        ,form = layui.form;

    table.render({
        elem: '#userList'
        ,url:'/admin/system/user/list'
        ,toolbar: '#userToolbar'
        ,title: '用户数据表'
        ,cols: [
            [
                {type: 'checkbox'}
                ,{field:'user_id', title:'ID', sort: true, align: 'center'}
                ,{field:'username', title:'用户名', align: 'center'}
                ,{field:'email', title:'邮箱', align: 'center'}
                ,{field:'sex', title:'性别', templet: '#switchTpl', align: 'center'}
                ,{field:'status', title:'是否锁定', templet: '#checkboxTpl', align: 'center'}

                ,{title:'操作', toolbar: '#userBar', align: 'center'}
            ]
        ]
        ,page: {page: true, theme: '#1E9FFF'}
        ,id: 'userTableId'
    });

    var $ = layui.$, active = {
        reload: function () { //重载数据表格
            //执行重载
            table.reload('userTableId', {  //update是数据表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    //updatelogLoad，在搜索的input表单里面的id
                    username: $('#userSearch').val()
                }
            });
        }
    };
    $('#sousuo').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //监听性别操作
    form.on('switch(sexDemo)', function(obj){
        layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
        // console.log(obj.elem); //得到checkbox原始DOM对象
        // console.log(obj.elem.checked); //开关是否开启，true或者false
        // console.log(obj.value); //开关value值，也可以通过data.elem.value得到
        // console.log(obj.othis); //得到美化后的DOM对象
        var sexChecked = obj.elem.checked; //true为女，false为男
        console.log("sex1: " +sexChecked); //是否选择，直接使用value是没用的，获取的手机value的值，而不是修改后的值
        //监听行单击事件
        table.on('row(userTable)', function(res){
            console.log(res.tr);//得到当前行元素对象
            console.log(res.data); //得到当前行数据
            var user_id = res.data.user_id; //user_id
            console.log("user_id: " +user_id);
            console.log("sex2: " +sexChecked); //sex
            var status = res.data.status; //status
            console.log("status: " +status);
            //提交修改
            $.ajax({
                url: '/admin/system/user/edit',
                type: 'post',
                dataType: 'json',
                //contentType: "application/x-www-form-urlencoded",
                data: {'user_id': user_id,'sexChecked': sexChecked, 'status': status},
                success: function (data) {
                    if (data.code === 0){
                        layer.msg(data.msg,{icon: 6});
                        setTimeout('location.reload();',2000); //2秒后再执行重载数据表格
                    } else {
                        layer.msg(data.msg, {time: 3000, icon: 5});
                    }
                },
                error:function () {
                    layer.msg("提交失败！", {time: 3000, icon: 5});
                }
            });
        });
    });

    //监听锁定操作
    form.on('checkbox(lockDemo)', function(obj){
        layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
        console.log("locked-value: " +this.value);
        var statusChecked = obj.elem.checked; //true为锁定，false为正常
        console.log("statusChecked1: " +statusChecked); //是否选择，直接使用value是没用的，获取的是value的值，而不是修改后的值
        //监听行单击事件
        table.on('row(userTable)', function(res){
            console.log(res.tr);//得到当前行元素对象
            console.log(res.data); //得到当前行数据
            var user_id = res.data.user_id; //user_id
            console.log("user_id: " +user_id);
            console.log("statusChecked2: " +statusChecked); //status是否选择，true为锁定
            var sex = res.data.sex; //sex
            console.log("sex: " +sex);
            //提交修改
            $.ajax({
                url: '/admin/system/user/edit',
                type: 'post',
                dataType: 'json',
                //contentType: "application/x-www-form-urlencoded",
                data: {'user_id': user_id,'sex': sex, 'statusChecked': statusChecked},
                success: function (data) {
                    if (data.code === 0){
                        layer.msg(data.msg,{icon: 6});
                        setTimeout('location.reload();',2000); //2秒后再执行重载数据表格
                    } else {
                        layer.msg(data.msg, {time: 3000, icon: 5});
                    }
                },
                error:function () {
                    layer.msg("提交失败！", {time: 3000, icon: 5});
                }
            });
        });
    });


    //头工具栏事件
    table.on('toolbar(userTable)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'userAdd':
                layer.open({
                    type: 1
                    , title: '添加用户'
                    //, skin: 'layui-layer-molv' //墨绿主题
                    , area: ['600px', '400px']
                    , content: '' +
                        // 使用了Boostrap的表单
                        '<form style="margin-right: 30px;margin-left: 20px;margin-top: 30px" class="form-horizontal" id="addUser">' +
                        '    <div class="form-group" style="display: none;">' +
                        '        <label class="col-sm-2 control-label">用户ID</label>' +
                        '        <div class="col-sm-10">' +
                        '            <input type="text" name="user_id" required lay-verify="required" autocomplete="off" class="form-control">' +
                        '        </div>' +
                        '    </div>' +
                        '    <div class="form-group">' +
                        '        <label class="col-sm-2 control-label">用户名</label>' +
                        '        <div class="col-sm-10">' +
                        '            <input type="text" name="username" required lay-verify="required" autocomplete="off" class="form-control">' +
                        '        </div>' +
                        '    </div>' +
                        '    <div class="form-group">' +
                        '        <label class="col-sm-2 control-label">密码</label>' +
                        '        <div class="col-sm-10">' +
                        '            <input type="text" name="password" required lay-verify="required" autocomplete="off" class="form-control">' +
                        '        </div>' +
                        '    </div>' +
                        '    <div class="form-group">' +
                        '        <label class="col-sm-2 control-label">邮箱</label>' +
                        '        <div class="col-sm-10">' +
                        '            <input type="text" name="email" required lay-verify="required" autocomplete="off" class="form-control">' +
                        '        </div>' +
                        '    </div>' +
                        '    <div class="form-group">' +
                        '        <label class="col-sm-2 control-label">性别</label>' +
                        '        <div class="col-sm-10">' +
                        '            <select name="sex">' +
                        '               <option value="0">女</option>'+
                        '               <option value="1">男</option>'+
                        '            </select>'+
                        '        </div>' +
                        '    </div>' +
                        '    <div class="form-group">' +
                        '        <label class="col-sm-2 control-label">是否锁定</label>' +
                        '        <div class="col-sm-10">' +
                        '            <select name="status">' +
                        '               <option value="0">是</option>'+
                        '               <option value="1">否</option>'+
                        '            </select>'+
                        '        </div>' +
                        '    </div>' +
                        '</form>'
                    , btn: ['确认', '取消']
                    , btnAlign: 'c'
                    , yes: function (index) {
                        $.ajax({
                            url: '/admin/system/user/add',
                            type: 'post',
                            dataType: 'json',
                            //contentType: "application/x-www-form-urlencoded",
                            data: $("#addUser").serialize(),
                            success: function (data) {
                                if (data.code === 0){
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
                break;
            case 'batchDel':
                var data = checkStatus.data;
                if (data.length > 0) {
                    var ids = "";
                    for (var i = 0; i < data.length; i++) {
                        ids += data[i].user_id +",";
                    }
                    console.log("删除：" +ids);
                    layer.confirm("确定删除这" +data.length +"个用户吗？",{
                        anim: 6,
                        btn: ['确定','取消'],
                        yes: function () {
                            $.ajax({
                                url: '/admin/system/user/batchDel',
                                type: 'post',
                                dataType: 'json',
                                data: {'ids': ids},
                                success: function (result) {
                                    if (result.code === 0){
                                        layer.msg(result.msg);
                                        setTimeout("window.location.reload();",3000);
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
                }else{
                    layer.msg("请选择要删除的用户！");
                }
                break;
        }
    });

    //监听行工具事件
    table.on('tool(userTable)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            var user_id = data.user_id;
            console.log("删除：" +user_id);
            layer.confirm('确定删除这个用户吗？',{
                anim: 6,
                btn: ['确定','取消'],
                yes: function () {
                    $.ajax({
                        url: '/admin/system/user/deleteById',
                        type: 'post',
                        dataType: 'json',
                        data: {'user_id': user_id},
                        success: function (result) {
                            if (result.code === 0){
                                layer.msg(result.msg);
                                setTimeout("window.location.reload();",3000);
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
                , title: '修改用户'
                //, skin: 'layui-layer-molv' //墨绿主题
                , area: ['600px', '300px']
                , content: '' +
                    // 使用了Boostrap的表单
                    '<form style="margin-right: 30px;margin-left: 20px;margin-top: 30px" class="form-horizontal" id="editUser">' +
                    '    <div class="form-group" style="display: none;">' +
                    '        <label class="col-sm-2 control-label">用户ID</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="user_id" value="'+data.user_id+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group">' +
                    '        <label class="col-sm-2 control-label">用户名</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="username" value="'+data.username+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group">' +
                    '        <label class="col-sm-2 control-label">密码</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="password" required lay-verify="required" placeholder="请输入密码..." autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group">' +
                    '        <label class="col-sm-2 control-label">邮箱</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="email" value="'+data.email+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '</form>'
                , btn: ['确认', '取消']
                , btnAlign: 'c'
                , yes: function (index) {
                    // console.log($("#editUser").serialize());
                    $.ajax({
                        url: '/admin/system/user/edit',
                        type: 'post',
                        dataType: 'json',
                        //contentType: "application/x-www-form-urlencoded",
                        data: $("#editUser").serialize(),
                        success: function (data) {
                            if (data.code === 0){
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
        } else if (obj.event === 'userRole'){
            layui.use('form', function(){
                var form = layui.form;

                var user_id = data.user_id;
                console.log("user_id: " +user_id);
                var role_id = "";

                //表单初始赋值
                $.ajax({
                    url: '/admin/system/user/findUserRole',
                    type: 'get',
                    dataType: 'json',
                    data: {'user_id': user_id},
                    success: function (roleIdByUserId) {
                        if (roleIdByUserId != null || roleIdByUserId !== ""){
                            form.val('userRoleFrom', {
                                "role_id": roleIdByUserId
                            });
                        }
                    },
                    error: function () {
                        layer.msg("此用户暂未分配角色！请分配！");
                        //监听分配角色的select
                        form.on('select(userRoleFilter)', function(data){
                            role_id = data.value;
                            console.log(role_id); //得到被选中的值

                            //表单提交ajax
                            $.ajax({
                                url: '/admin/system/user/addRole',
                                type: 'post',
                                dataType: 'json',
                                data: {'user_id': user_id, 'role_id': role_id},
                                success: function (res) {
                                    if (res.code === 0){
                                        layer.msg(res.msg, {icon: 1});
                                        setTimeout("window.location.reload();", 2000);
                                    } else {
                                        layer.msg(res.msg, {icon: 0, anim: 6});
                                        setTimeout("window.location.reload();", 2000);
                                    }
                                },
                                error: function () {
                                    layer.alert("分配用户角色出错！");
                                    setTimeout("window.location.reload();", 2000);
                                }
                            })
                        });
                    }
                });

                //表单修改
                form.on('select(userRoleFilter)', function(data){
                    role_id = data.value;
                    console.log(role_id); //得到被选中的值
                    //表单提交ajax
                    $.ajax({
                        url: '/admin/system/user/updateUserRole',
                        type: 'post',
                        dataType: 'json',
                        data: {'user_id': user_id, 'role_id': role_id},
                        success: function (res) {
                            if (res.code === 0){
                                layer.msg(res.msg, {icon: 1});
                                setTimeout("window.location.reload();", 2000);
                            } else {
                                layer.msg(res.msg, {icon: 0, anim: 6});
                                setTimeout("window.location.reload();", 2000);
                            }
                        },
                        error: function () {
                            layer.alert("修改用户角色出错！");
                            // setTimeout("window.location.reload();", 2000);
                        }
                    })
                });
            });
        }
    });
});

//页面加载完就执行加载角色列表，防止二次渲染
$(function(){
    $.get("/admin/system/role/findAllRole",function(res) {
        if (res.code === 0) {
            var opt = "";
            layui.each(res.data, function (index, item) {
                opt += '<option value="' + item.role_id + '">' + item.role_name + '</option>';
            });
            // console.log(opt); //打印加载的html角色列表
            $("#userRoleHtml").append(opt);
        } else if (res.code === -1){
            layer.alert(res.msg, {anim: 6});
        }
    });
});