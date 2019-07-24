layui.use('table', function(){
    var table = layui.table;

    table.render({
        elem: '#logList'
        ,url:'/admin/tool/dictionary/list'
        ,toolbar: '#logToolbar'
        ,title: '用户数据表'
        ,cols: [
            [
                {type: 'checkbox', fixed: 'left'}
                ,{field:'columName', title:'数据库名称', sort: true}
                ,{field:'tableName', title:'数据表名称'}
                ,{field:'columName', title:'字段名字'}
                ,{field:'columType', title:'类型'}
                ,{field:'culumComment', title:'注释'}
            ]
        ]
        ,page: {page: true, theme: '#1E9FFF'}
        ,id: 'dictionaryTableId'
    });

    //表格重载
    var $ = layui.$, active = {
        reload: function(){
            //执行重载
            table.reload('dictionaryTableId', { //表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    tableName: $('#tableNameContentReload').val()
                }
            });
        }
    };

    $('#tableNameSearch').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });


    //头工具栏事件
    table.on('toolbar(logTable)', function(obj){
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
            case 'isAll':
                layer.msg(checkStatus.isAll ? '全选': '未全选');
                break;
        };
    });

    //监听行工具事件
    table.on('tool(logTable)', function(obj){
        var data = obj.data;
        //console.log(obj)
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                obj.del();
                layer.close(index);
            });
        } else if(obj.event === 'edit'){
            layer.prompt({
                formType: 2
                ,value: data.email
            }, function(value, index){
                obj.update({
                    email: value
                });
                layer.close(index);
            });
        }
    });
});