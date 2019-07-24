layui.use('table', function(){
    var table = layui.table;

    table.render({
        elem: '#logList'
        ,url:'/admin/tool/log/list'
        ,toolbar: '#logToolbar'
        ,title: '操作记录数据表'
        ,limits: [10,200,500,1500,3000,5000,8000,10000] //每页条数的选择项，默认：[10,20,30,40,50,60,70,80,90]。
        ,cols: [
            [
                {type: 'checkbox'}
                ,{field:'log_id', title:'ID', sort: true, align: 'center'}
                ,{field:'username', title:'操作用户', align: 'center'}
                ,{field:'operation', title:'操作名称', align: 'center'}
                ,{field:'method', title:'操作方法', align: 'center'}
                ,{field:'params', title:'操作参数', align: 'center'}
                ,{field:'dotime', title:'操作耗时', sort: true, align: 'center'}
                ,{field:'ip', title:'IP地址', align: 'center'}
                ,{field:'create_time', title:'操作时间', sort: true, align: 'center'}
                ,{title:'操作', toolbar: '#logBar', align: 'center'}
            ]
        ]
        ,page: {page: true, theme: '#1E9FFF'}
        ,id: 'log'
    });

    //根据操作名称查询
    var $ = layui.$, active = {
        reload: function () { //重载数据表格
            //执行重载
            table.reload('log', {  //update是数据表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    //updatelogLoad，在搜索的input表单里面的id
                    operation: $('#logLoad').val()
                }
            });
        },
        flushTable: function () { //刷新数据表格
            location.reload();
        }
    };
    $('#sousuo').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //头工具栏事件
    table.on('toolbar(logTable)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'lookJSON':
                var data = checkStatus.data;
                layer.alert(JSON.stringify(data));
                break;
            case 'batchDel':
                var data = checkStatus.data;
                var ids = "";
                for (var i = 0; i < data.length; i++) {
                    ids += data[i].log_id +",";
                }
                if (data.length > 0){
                    console.log("删除： " +ids);
                    layer.confirm("确定删除这" +data.length +"条记录？", {
                        title: '批量删除操作记录',
                        anim: 6,
                        btn: ['确定', '取消'],
                        yes: function () {
                            $.ajax({
                                url: '/admin/tool/log/batchDel',
                                dataType: 'json',
                                type: 'post',
                                data: {'ids': ids},
                                success: function (result) {
                                    if (result.code === 0){
                                        layer.msg(result.msg, {icon: 1});
                                        setTimeout("window.location.reload();", 2000);
                                    } else {
                                        layer.msg(result.msg, {icon: 2, anim: 6});
                                        setTimeout("window.location.reload();", 2000);
                                    }
                                },
                                error: function () {
                                    layer.msg("删除失败！", {icon: 2, anim: 6});
                                    setTimeout("window.location.reload();", 2000);
                                }
                            })
                        }
                    });
                } else {
                    layer.msg("请选择需要删除的记录！", {
                        icon: 0,
                        anim: 6
                    })
                }
                break;
        }
    });

    //监听行工具事件
    table.on('tool(logTable)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            var log_id = data.log_id;
            console.log('删除: ' +log_id);
            layer.confirm("确定删除此记录吗？", {
                title: '删除操作记录',
                anim: 6,
                btn: ['确定', '取消'],
                yes: function () {
                    $.ajax({
                        url: '/admin/tool/log/deleteById',
                        dataType: 'json',
                        type: 'post',
                        data: {'log_id': log_id},
                        success: function (result) {
                            if (result.code === 0){
                                layer.msg(result.msg, {icon: 1});
                                setTimeout("window.location.reload();", 2000);
                            } else {
                                layer.msg(result.msg, {icon: 2, anim: 6});
                                setTimeout("window.location.reload();", 2000);
                            }
                        },
                        error: function () {
                            layer.msg("删除失败！", {icon: 2, anim: 6});
                            setTimeout("window.location.reload();", 2000);
                        }
                    })
                }
            })
        }
    });
});