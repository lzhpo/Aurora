//发布文章
function AddBlog() {
    layui.use('layer', function(){
        var layer = layui.layer;
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
            } else{
                layer.msg(result.msg, {anim:6,icon: 5});
                setTimeout("window.location.href = '/admin/blog/blogArticle'",2000);
            }
        },
        error: function () {
            layer.msg('发布文章失败！', {anim:6,icon: 5});
            setTimeout("window.location.href = '/admin/blog/blogArticle'",2000);
        }
    });
}

//修改博客
function UpdateBlog() {
    layui.use('layer', function(){
        var layer = layui.layer;
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
            } else {
                layer.msg(data.msg, {icon: 5});
                setTimeout("window.location.href = '/admin/blog/blogArticle'",2000);
            }
        },
        error:function () {
            layer.msg('修改失败！', {time: 3000, icon: 5});
            setTimeout("window.location.href = '/admin/blog/blogArticle'",2000);
        }
    });
}