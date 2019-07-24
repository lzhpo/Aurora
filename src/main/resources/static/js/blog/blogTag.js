layui.use('table', function(){
    var table = layui.table;

    table.render({
        elem: '#tagList'
        ,url:'/admin/blog/tag/list'
        ,toolbar: '#tagToolbar'
        ,title: '用户数据表'
        ,limit: 6  //每页展示的数量
        ,cols: [
            [
                {type: 'checkbox'}
                ,{field:'tagId', title:'ID', sort: true, align: 'center'}
                ,{field:'tagName', title:'标签', align: 'center'}

                ,{title:'操作', toolbar: '#tagBar', align: 'center'}
            ]
        ]
        ,page: {page: true, theme: '#1E9FFF'}
        ,id: 'tagTable'
    });

    var $ = layui.$, active = {
        reload: function () { //重载数据表格
            //执行重载
            table.reload('tagTable', {  //update是数据表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    //tagName，在搜索的input表单里面的id
                    tagName: $('#tagSearch').val()
                }
            });
        }
    };
    $('#sousuo').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //头工具栏事件
    table.on('toolbar(tagTableFilter)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'getCheckData':
                var data = checkStatus.data;
                layer.alert(JSON.stringify(data));
                break;
            case 'addTag':
                layer.open({
                    type: 1
                    , title: '添加文章标签'
                    //, skin: 'layui-layer-molv' //墨绿主题
                    , area: ['600px', '200px']
                    , content: '' +
                        // 使用了Boostrap的表单
                        '<form style="margin-right: 30px;margin-left: 20px;margin-top: 30px" class="form-horizontal" id="addBlogTag">' +
                        '    <div class="form-group" style="display: none;">' +
                        '        <label class="col-sm-2 control-label">标签ID</label>' +
                        '        <div class="col-sm-10">' +
                        '            <input type="text" name="tagId" required lay-verify="required" autocomplete="off" class="form-control">' +
                        '        </div>' +
                        '    </div>' +
                        '    <div class="form-group">' +
                        '        <label class="col-sm-2 control-label">标签名称</label>' +
                        '        <div class="col-sm-10">' +
                        '            <input type="text" name="tagName" required lay-verify="required" autocomplete="off" class="form-control">' +
                        '        </div>' +
                        '    </div>' +
                        '</form>'
                    , btn: ['确认添加', '取消']
                    , btnAlign: 'c'
                    , yes: function (index) {
                        $.ajax({
                            url: '/admin/blog/blogTag/add',
                            type: 'post',
                            dataType: 'json',
                            //contentType: "application/x-www-form-urlencoded",
                            data: $("#addBlogTag").serialize(),
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
                break;
            case 'batchDelTag':
                var data = checkStatus.data;
                if (data.length > 0){
                    var ids = "";
                    for (var i = 0; i < data.length; i++) {
                        ids += data[i].tagId + ",";
                    }
                    console.log("删除：" +ids);
                    layer.confirm("确定删除这"+data.length+"个标签吗？",{
                        anim: 6,
                        btn: ['确定','取消'],
                        yes: function () {
                            $.ajax({
                                url: '/admin/blog/blogTag/batchDel',
                                type: 'post',
                                dataType: 'json',
                                data: {'ids': ids},
                                success: function (result) {
                                    if (result.code === 0){
                                        layer.msg(result.msg);
                                        setTimeout("window.location.reload()",3000);
                                    } else {
                                        layer.msg(result.msg,{amin: 6});
                                    }
                                },error: function () {
                                    layer.msg("删除失败！",{anim:  6})
                                }
                            })
                        }
                    })
                } else{
                    layer.msg("请选择需要删除的标签！");
                }
                break;
        };
    });

    //监听行工具事件
    table.on('tool(tagTableFilter)', function(obj){
        var data = obj.data;
        console.log(obj);
        if(obj.event === 'del'){
            layer.confirm("确定删除这个标签吗？",{
                anim: 6,
                btn: ['确定','取消'],
                yes: function () {
                    console.log("删除：" +data.tagId);
                    $.ajax({
                        url: '/admin/blog/blogTag/deleteById',
                        type: 'post',
                        dataType: 'json',
                        data: {'tagId': data.tagId},
                        success: function (result) {
                            if (result.code === 0){
                                layer.msg(result.msg);
                                setTimeout("window.location.reload()",3000);
                            } else {
                                layer.msg(result.msg,{amin: 6});
                            }
                        },error: function () {
                            layer.msg("删除失败！",{anim:  6})
                        }
                    })
                }
            })
        } else if(obj.event === 'edit'){
            layer.open({
                type: 1
                , title: '修改文章标签'
                //, skin: 'layui-layer-molv' //墨绿主题
                , area: ['600px', '200px']
                , content: '' +
                    // 使用了Boostrap的表单
                    '<form style="margin-right: 30px;margin-left: 20px;margin-top: 30px" class="form-horizontal" id="editBlogTag">' +
                    '    <div class="form-group" style="display: none;">' +
                    '        <label class="col-sm-2 control-label">标签ID</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="tagId" value="'+data.tagId+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group">' +
                    '        <label class="col-sm-2 control-label">标签名称</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="tagName" value="'+data.tagName+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '</form>'
                , btn: ['确认添加', '取消']
                , btnAlign: 'c'
                , yes: function (index) {
                    $.ajax({
                        url: '/admin/blog/blogTag/edit',
                        type: 'post',
                        dataType: 'json',
                        //contentType: "application/x-www-form-urlencoded",
                        data: $("#editBlogTag").serialize(),
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