layui.use(['form', 'layedit', 'layer', 'table'], function() {
    var form = layui.form
        , layedit = layui.layedit
        , layer = layui.layer
        , table = layui.table;


    table.render({
        elem: '#emailTable'
        ,url:'/admin/tool/email/list'
        ,toolbar: '#emailToolbar'
        ,title: '用户数据表'
        ,cols: [[
            {type: 'checkbox'}
            ,{field:'emailId', title:'ID', align: 'center', width: '50', unresize: true, sort: true}
            ,{field:'title', align: 'center', width:'200', title:'邮件主题'}
            ,{field:'content', align: 'center', width:'300', title:'邮件内容'}
            ,{field:'sendDate', align: 'center', width:'200', title:'发送时间', sort: true}
            ,{field:'username', align: 'center', width:'100', title:'发件人'}
            ,{title:'操作', align: 'center', width:'100', toolbar: '#emailBar'}
        ]]
        ,page: {page: true, theme: '#1E9FFF'}
        ,id: 'emailTableId'
    });

    //表格重载
    var $ = layui.$, active = {
        reload: function(){
            //执行重载
            table.reload('emailTableId', { //表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    content: $('#emailContentReload').val()
                }
            });
        }
    };

    $('#contentSearch').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //头工具栏事件
    table.on('toolbar(emailTableFilter)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        if (obj.event === 'batchDelEmail') {
            var data = checkStatus.data;
            if (data.length > 0){
                var emailIds = "";
                for (var i = 0; i < data.length; i++) {
                    emailIds += data[i].emailId +",";
                }
                console.log("删除：" +emailIds);
                layer.confirm("确认删除这" +data.length +"条邮件记录吗？",{
                    anim: 6,
                    btn: ['确认','取消'],
                    yes: function (res) {
                        $.ajax({
                            url: '/admin/tool/email/batchDelEmail',
                            type: 'post',
                            dataType: 'json',
                            data: {'emailIds': emailIds},
                            success: function (res) {
                                if (res.code === 0){
                                    layer.msg(res.msg,{icon: 1});
                                    setTimeout("window.location.reload();", 2000);
                                } else {
                                    layer.msg(res.msg, {icon: 3});
                                    setTimeout("window.location.reload();", 2000);
                                }
                            },
                            error: function () {
                                layer.msg('服务器内部错误，删除失败！', {icon: 3});
                            }
                        })
                    }
                })
            } else {
                layer.msg("请选择需要删除的邮件记录！",{anim: 6});
            }
        }
    });

    //监听行工具事件
    table.on('tool(emailTableFilter)', function(obj){
        var data = obj.data;
        var emailId = data.emailId;
        console.log("删除：" +emailId);
        if(obj.event === 'del'){
            layer.confirm("确认删除这条邮件记录吗？",{
                anim: 6,
                btn: ['确认','取消'],
                yes: function (res) {
                    $.ajax({
                        url: '/admin/tool/email/delEmail',
                        type: 'post',
                        dataType: 'json',
                        data: {'emailId': emailId},
                        success: function (res) {
                            if (res.code === 0){
                                layer.msg(res.msg,{icon: 1});
                                setTimeout("window.location.reload();", 2000);
                            } else {
                                layer.msg(res.msg, {icon: 3});
                                setTimeout("window.location.reload();", 2000);
                            }
                        },
                        error: function () {
                            layer.msg('服务器内部错误，删除失败！', {icon: 3});
                        }
                    })
                }
            })
        }
    });


    //创建一个编辑器
    var editIndex = layedit.build('LAY_demo_editor',{
        tool: [
            'strong' //加粗
            ,'italic' //斜体
            ,'underline' //下划线
            ,'del' //删除线

            ,'|' //分割线

            ,'left' //左对齐
            ,'center' //居中对齐
            ,'right' //右对齐
            ,'link' //超链接
            ,'unlink' //清除链接
            ,'face' //表情
            // ,'image' //插入图片
        ]
    });
});

//发送邮件
function sendEmail() {
    //loading层，发送邮件完毕--->执行完毕，关闭loading--->layer.close(index);
    var index = layer.load(1, {
        shade: [0.5,'#fff'] //0.5透明度的白色背景
    });
    //发送邮件，提交ajax请求
    $.ajax({
        url: '/admin/tool/email/submit',
        type: 'post',
        data: $("#emailFromId").serialize(),
        dataType: 'json',
        success: function (res) {
            if (res.code === 0){
                layer.msg(res.msg,{icon: 1});
                setTimeout("window.location.reload();", 2000);
                layer.close(index);    //执行完毕，关闭loading
            } else {
                layer.alert(res.msg, {icon: 3});
            }
        },
        error: function () {
            layer.alert('服务器内部错误，发送失败！', {icon: 3});
        }
    });
}