layui.use('table', function(){
    var table = layui.table;

    table.render({
        elem: '#articleList'
        ,url:'/admin/blog/blogArticle/selectByLimit'
        ,toolbar: '#articleToolbar'
        ,title: '用户数据表'
        ,limit: 6  //每页展示的数量
        ,cols: [
            [
                {type: 'checkbox'}
                ,{field:'blogId', title:'ID', sort: true, align: 'center'}
                ,{field:'title', title:'标题', align: 'center'}
                ,{title:'封面图', align: 'center', templet: '#ShowCoverImg'}
                ,{field:'content', title:'文章内容', align: 'center'}
                ,{field:'description', title:'描述', align: 'center'}
                ,{field:'tags', title:'标签', align: 'center'}
                ,{field:'type', title:'分类', align: 'center'}
                ,{field:'createDate', title:'创建时间', align: 'center', sort: true}
                ,{field:'username', title:'作者', align: 'center'}

                ,{title:'操作', toolbar: '#articleBar', align: 'center'}
            ]
        ]
        ,page: {page: true, theme: '#1E9FFF'}
        ,id: 'BlogArticle'
    });

    //重载数据表格，搜索
    var $ = layui.$, active = {
        reload: function () { //重载数据表格
            //执行重载
            table.reload('BlogArticle', {  //BlogArticle是数据表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    //BlogArticleLoad，在搜索的input表单里面的id
                    content: $('#BlogArticleLoad').val()
                }
            });
        }
    };
    $('#sousuo').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //头工具栏事件
    table.on('toolbar(articleTable)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        var data = checkStatus.data;
        switch(obj.event){
            case 'getCheckData':
                layer.alert(JSON.stringify(data));
                break;
            case 'getCheckLength':
                layer.msg('选中了：'+ data.length + ' 个');
                break;
            case 'batchDel':
                var ids = "";
                if (data.length > 0){
                    for (var i = 0; i < data.length; i++) {
                        ids += data[i].blogId +','; //用逗号分隔
                    }
                    console.log('ids: ' +ids);
                    layer.confirm('确认删除这' +data.length +'篇文章吗？',{
                        anim:6
                        ,btn: ['确定','返回']
                        ,yes: function (index) {
                            $.ajax({
                                url: '/admin/blog/blogArticle/batchDel',
                                type: 'post',
                                dataType: 'json',
                                data: {'ids': ids},
                                success: function (result) {
                                    if (result.code === 0){
                                        layer.msg(result.msg);
                                        setTimeout('window.location.reload()',3000);
                                    } else{
                                        layer.msg(result.msg);
                                    }
                                },
                                error: function (result) {
                                    layer.msg('删除失败！');
                                }
                            });
                        }
                    });
                }
                else{
                    layer.msg('请选择需要删除的文章！');
                }
                break;
        }
    });

    //监听行工具事件
    table.on('tool(articleTable)', function(obj){
        var data = obj.data; //获取当前行数据
        console.log('blogId: '+data.blogId); //获取blogId，不要先定义一个var blogId = data.blogId ，容易取不到值，后端容易出现空指针。
        if(obj.event === 'del'){
            layer.confirm('确认删除这篇文章吗？', {
                anim:6
                ,btn: ['确定', '返回']
                ,yes: function(index){
                    $.ajax({
                        url: '/admin/blog/blogArticle/delBlog',
                        type: 'post',
                        dataType: 'json',
                        data: {'blogId': data.blogId},
                        success: function (data) {
                            if (data.code == 0){
                                layer.msg(data.msg,{icon: 6});
                                setTimeout('location.reload();',2000); //2秒后再执行重载数据表格
                            } else {
                                layer.msg(data.msg, {time: 3000, icon: 5});
                            }
                        },
                        error:function () {
                            layer.msg('删除失败！', {time: 3000, icon: 5});
                        }
                    });
                    layer.close(index);
                }
            });
        } else if(obj.event === 'edit'){
            window.location.href = '/admin/blog/blogArticle/editBlogView/' +data.blogId;
        }
    });
});

//刷新页面
function flushPage() {
    window.location.reload();
}