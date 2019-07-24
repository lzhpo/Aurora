layui.use(['table','layer'], function() {
    var table = layui.table
        ,layer = layui.layer;
    //方法级渲染
    table.render({
        elem: '#updatelogList'
        ,url:'/admin/tool/updatelog/list'
        ,toolbar: '#updateToolbar'
        ,title: '更新日志'
        ,cols: [
            [
                {type: 'checkbox', fixed: 'left'}
                ,{field:'updatelog_id', title:'ID',sort:'true', fixed: 'left', align: 'center'}
                ,{field:'create_date', title:'更新时间', align: 'center'}
                ,{field:'description', title:'更新描述', align: 'center'}

                ,{fixed: 'right', title:'操作', toolbar: '#updateBar', align: 'center'}
            ]
        ]
        ,id:'updatelog'
        ,page: {page: true, theme: '#1E9FFF'}
    });

    //头工具栏事件
    table.on('toolbar(updatelogTable)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'lookJSON': //查看：转换为JSON数据
                var data = checkStatus.data;
                layer.alert(JSON.stringify(data));
                break;
            case 'delAll': //批量删除
                var data = checkStatus.data;
                //layer.msg('选中了：'+ data.length + ' 个');
                var ids = "";
                if(data.length > 0){
                    for(var i=0; i<data.length; i++){
                        ids += data[i].updatelog_id+",";
                    }
                    console.log('需要删除的文章：' +ids);
                    console.log("将要删除的id：" +ids);
                    layer.confirm('是否删除这'+data.length+'数据',{icon:3,title:'提示'},function (index) {
                        $.ajax({
                            url:'/admin/tool/updatelog/batchDelete',
                            type:'post',
                            data:{
                                'ids' : ids //传给后端需要删除的id字符串带着逗号(,)
                            },
                            dataType:'json',
                            success: function (data) {
                                if (data.code == 0){
                                    layer.msg(data.msg,{icon: 6});
                                    setTimeout('location.reload(true);',2000); //2秒后再执行重载数据表格
                                } else {
                                    layer.msg(data.msg, {time: 3000, icon: 5});
                                }
                            },
                            error:function () {
                                layer.msg(data.msg, {time: 3000, icon: 5});
                            }
                        });
                        layer.close(index);
                    });
                }else{
                    layer.alert("请选择要删除的数据!")
                }
                break;
        }
    });

    var $ = layui.$, active = {
        reload: function () { //重载数据表格
            //执行重载
            table.reload('updatelog', {  //update是数据表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    //updatelogLoad，在搜索的input表单里面的id
                    description: $('#updatelogLoad').val()
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
    $('#shuaxin').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });
});


//=============================操作=================================
// 实例化表单,让表单上面的数据显示
layui.use(['table','element','layer'],function () {
    var  $ = layui.jquery
        ,layer = layui.layer        //弹层
        ,table = layui.table;      //表格
    table.render();
    //监听工具条
    table.on('tool(updatelogTable)', function (obj) {
        //注：tool是工具条事件名，updatelogTable lay-filter="对应的值"
        var data = obj.data //获得当前行数据
            ,layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'del') {
            layer.alert('将要删除该行数据,确定吗?', {
                anim:6
                ,btn: ['确定','取消'] //按钮
                ,yes:function(index){
                    var getData = new Object();
                    getData.id = data.updatelog_id;
                    $.ajax({
                        url:'/admin/tool/updatelog/delete',
                        type:'post',
                        data:getData,
                        dataType:'json',
                        success: function (data) {
                            if (data.code === 0){
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
        } else if (layEvent === 'edit') {
            layui.use(['laydate'], function() {
                var laydate = layui.laydate;
                //日期
                laydate.render({
                    elem: '#date'
                    ,format: 'yyyy-MM-dd HH:mm:ss' //日期格式化
                    ,theme: 'molv' //日期主题
                });
            });
            layer.open({
                type: 1
                ,title: '修改更新记录'
                //,skin: 'layui-layer-molv' //墨绿主题
                ,area: ['600px', '250px']
                ,btn:['确认','取消']
                ,btnAlign: 'c'
                ,content:'' +
                    // 使用了Boostrap的表单
                    '<form style="margin-right: 30px;margin-left: 30px;margin-top: 30px" class="form-horizontal" id="edit">' +
                    '    <div class="form-group" style="display: none">' +
                    '        <label class="col-sm-2 control-label">ID</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="updatelog_id" value="'+data.updatelog_id+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group">' +
                    '        <label class="col-sm-2 control-label">更新时间</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" id="date" name="create_date" value="'+data.create_date+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group">' +
                    '        <label class="col-sm-2 control-label">更新内容</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input name="description" value="'+data.description+'" required lay-verify="required" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '</form>'
                ,yes:function(index){
                    $.ajax({
                        url:'/admin/tool/updatelog/edit',
                        type:'post',
                        data:$("#edit").serialize(), //注意显示编辑视图的update_id也要在
                        dataType:'json',
                        //contentType:"application/x-www-form-urlencoded",
                        success: function (data) {
                            if (data.code == 0){
                                layer.msg(data.msg,{icon: 6});
                                setTimeout('location.reload(true);',2000); //2秒后再执行重载页面
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

//添加
function add() {
    layui.use(['laydate'], function() {
        var laydate = layui.laydate;
        //日期
        laydate.render({
            elem: '#date'
            ,format: 'yyyy-MM-dd HH:mm:ss' //日期格式化
            ,theme: 'molv' //日期主题
        });
    });

    layer.open({
        type: 1
        , title: '新增更新记录'
        //, skin: 'layui-layer-molv' //墨绿主题
        , area: ['600px', '300px']
        , content: '' +
            // 使用了Boostrap的表单
            '<form style="margin-right: 30px;margin-left: 30px;margin-top: 30px" class="form-horizontal" id="addUpdateLog">' +
            '    <div class="form-group">' +
            '        <label class="col-sm-2 control-label">更新时间</label>' +
            '        <div class="col-sm-10">' +
            '            <input type="text" id="date" name="create_date" required lay-verify="required" autocomplete="off" class="form-control">' +
            '        </div>' +
            '    </div>' +
            '    <div class="form-group">' +
            '        <label class="col-sm-2 control-label">更新内容</label>' +
            '        <div class="col-sm-10">' +
            '            <textarea rows="3" name="description" required lay-verify="required" class="form-control"></textarea>' +
            '        </div>' +
            '    </div>' +
            '</form>'
        , btn: ['确认添加', '取消']
        , btnAlign: 'c'
        , yes: function (index) {
            $.ajax({
                url: '/admin/tool/updatelog/add',
                type: 'post',
                dataType: 'json',
                //contentType: "application/x-www-form-urlencoded",
                data: $("#addUpdateLog").serialize(),
                success: function (data) {
                    if (data.code === 0){
                        layer.msg(data.msg,{icon: 6});
                        setTimeout('location.reload(true);',2000); //2秒后再执行重载数据表格
                    } else {
                        layer.msg(data.msg, {time: 3000, icon: 5});
                    }
                },
                error:function () {
                    layer.msg("添加失败！", {time: 3000, icon: 5});
                }
            });
            layer.close(index);
        }
    });
}
