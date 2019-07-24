layui.use('form', function(){
    var form = layui.form;

    //自定义表单验证规则
    form.verify({
        PWD: function(value){
            if(value.length < 6){
                return '密码至少为6个字符！';
            }
        },
        PWD1: function(value){
            if(value.length < 4){
                return '密码至少为6个字符！';
            }
        },
        PWD2: function(value){
            if(value.length < 4){
                return '密码至少为6个字符！';
            }
            var pwd1 = $('#pwd1').val();
            if (value != pwd1){
                return '两次输入密码不一致！';
            }
        }
    });

    //监听提交
    form.on('submit(formDemo)', function(data){
        // layer.msg(JSON.stringify(data.field));
        $.ajax({
            url: '/admin/updatePWD',
            type: 'post',
            dataType: 'json',
            //contentType: "application/x-www-form-urlencoded",
            data: $("#updatePWD").serialize(), //获取input的name的值，然后序列化
            success: function (data) {
                if (data.code == 0){
                    layer.msg(data.msg, {time: 3000, icon: 1});
                } else {
                    layer.msg(data.msg, {time: 3000, icon: 2});
                }
            },
            error:function () {
                layer.msg(data.msg, {time: 3000, icon: 2});
            }
        });
        return false;
    });
});
