// 回车键登录
function keyLogin() {
    if (event.keyCode==13){ //回车键的键值为13
        document.getElementById("enterKeyBtn").click(); //调用登录按钮的登录事件
    }

}
//登录
function login() {
    //layui
    layui.use('layer', function(){
        var layer = layui.layer;

        var username = $("input[name='username']").val();
        var password = $("input[name='password']").val();
        var code = $("input[name='code']").val();
        var rememberMe = $("input[name='rememberMe']").is(':checked');
        console.log("username: " +username);
        console.log("password: " +password);
        console.log("code: " +code);
        console.log("rememberMe: " +rememberMe);
        if (username,password,code != null || username,password,code !== ""){
            $.ajax({
                type: "post",
                url: "/login",
                data: {"username": username ,"password": password ,"code": code ,"rememberMe": rememberMe},
                dataType: "json",
                success: function (r) {
                    if (r.code === 0) {
                        layer.msg("登录成功...", {icon: 1});
                        setTimeout("location.href = '/admin';", 2000);
                    } else {
                        layer.msg(r.msg,{icon: 2, anim: 6});
                    }
                },
                error: function () {
                    layer.msg("服务器错误，登录失败！",{icon: 2, anim: 6});
                }
            });
        } else if (username == null || username === ""){
            layer.msg("账号不能为空！",{anim: 6});
        } else if (password == null || password === ""){
            layer.msg("密码不能为空！",{anim: 6});
        } else if (code == null || code === ""){
            layer.msg("请输入验证码！",{anim: 6});
        }
    });
}