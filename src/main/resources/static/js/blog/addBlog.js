//发布文章
function AddBlog() {
    layui.use('layer', function(){
        var layer = layui.layer;

        //loading层，发送邮件完毕--->执行完毕，关闭loading--->layer.close(index);
        var index = layer.load(1, {
            shade: [0.5,'#fff'] //0.5透明度的白色背景
        });
        var AddArticle = $('#AddArticle').serialize();
        console.log("AddArticle: " +AddArticle);
        $.ajax({
            url:'/admin/blog/blogArticle/add',
            type:'post',
            dataType:'json',
            data:AddArticle,
            success:function(result){
                //回调函数
                if (result.code === 0){
                    layer.msg(result.msg,{icon: 6});
                    setTimeout("window.location.href = '/admin/blog/blogArticle'",2000);
                    layer.close(index);    //执行完毕，关闭loading
                } else{
                    layer.msg(result.msg, {anim:6,icon: 5});
                    setTimeout("window.location.href = '/admin/blog/blogArticle'",2000);
                    layer.close(index);    //执行完毕，关闭loading
                }
            },
            error: function () {
                layer.msg('发布文章失败！', {anim:6,icon: 5});
                setTimeout("window.location.href = '/admin/blog/blogArticle'",2000);
                layer.close(index);    //执行完毕，关闭loading
            }
        });
    });
}

//修改博客
function UpdateBlog() {
    layui.use('layer', function(){
        var layer = layui.layer;

        //loading层，发送邮件完毕--->执行完毕，关闭loading--->layer.close(index);
        var index = layer.load(1, {
            shade: [0.5,'#fff'] //0.5透明度的白色背景
        });
        console.log("修改后的：" +$("#AddArticle").serialize());
        $.ajax({
            url: '/admin/blog/blogArticle/editBlog',
            type: 'post',
            dataType: 'json',
            data: $("#AddArticle").serialize(),
            success: function (data) {
                if (data.code === 0){
                    layer.msg(data.msg,{icon: 6});
                    setTimeout("window.location.href = '/admin/blog/blogArticle'",2000);
                    layer.close(index);    //执行完毕，关闭loading
                } else {
                    layer.msg(data.msg, {icon: 5});
                    setTimeout("window.location.href = '/admin/blog/blogArticle'",2000);
                    layer.close(index);    //执行完毕，关闭loading
                }
            },
            error:function () {
                layer.msg('系统错误，修改失败！', {time: 3000, icon: 5});
                setTimeout("window.location.href = '/admin/blog/blogArticle'",2000);
                layer.close(index);    //执行完毕，关闭loading
            }
        });
    });
}