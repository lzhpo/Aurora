
//文件列表表格
layui.use('table', function(){
    var table = layui.table;

    table.render({
        elem: '#MyFile'
        ,url:'/admin/tool/file/list'
        ,toolbar: '#fileToolBar'
        ,title: '用户数据表'
        ,cols: [[
            {type: 'checkbox'}
            ,{field:'file_id', align: 'center', title:'ID', sort: true}
            ,{field:'file_name', align: 'center', title:'文件名'}
            ,{field:'file_path', align: 'center', title:'文件路径'}
            ,{field:'file_size', align: 'center', title:'文件大小(MB)', sort: true}

            ,{ title:'操作', align: 'center', toolbar: '#FileRightBar'}
        ]]
        ,page: {page: true, theme: '#1E9FFF'}
        ,id: 'fileTableId'
    });

    //表格重载
    var $ = layui.$, active = {
        reload: function(){
            //执行重载
            table.reload('fileTableId', { //表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    file_name: $('#fileNameReload').val()
                }
            });
        }
    };

    $('#fileNameSearch').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //头工具栏事件
    table.on('toolbar(MyFileTable)', function(obj){
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
            case 'batchDel':
                var data = checkStatus.data;
                var ids = "";
                var file_name = "";
                for (var i = 0; i < data.length; i++) {
                    ids += data[i].file_id +",";
                    file_name += data[i].file_name +",";
                }
                console.log("删除ids：" +ids);
                console.log("ids对应的file_name: " +file_name);
                if (data.length > 0){
                    layer.confirm("确认删除这" +data.length +"个文件？",{
                        anim: 6,
                        btn: ['确认', '取消'],
                        yes: function () {
                            $.ajax({
                                url: '/admin/tool/file/batchDel',
                                type: 'post',
                                dataType: 'json',
                                data: {'ids': ids, 'file_name': file_name},
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
                } else {
                    layer.msg("请选择需要删除的文件！", {
                        icon: 0,
                        anim: 6
                    })
                }
        }
    });

    //监听行工具事件
    table.on('tool(MyFileTable)', function(obj){
        var data = obj.data;
        console.log(obj);
        console.log("file_id: " +data.file_id);
        console.log("file_name: " +data.file_name);
        if(obj.event === 'del'){    //删除文件
            layer.confirm('真的删除行么', function(index){
                $.ajax({
                    url:'/admin/tool/file/deleteOne',
                    type:'post',
                    dataType:'json',
                    data:{'file_id': data.file_id, 'file_name': data.file_name},
                    success: function (result) {
                        //回调函数
                        if (result.code == 0){
                            layer.msg(result.msg);
                            setTimeout('location.reload();',2000); //2秒后再执行，为true时强制从服务器加载数据
                        } else {
                            layer.msg(result.msg);
                        }
                    },
                    error:function () {
                        layer.msg(result.msg);
                    }
                });
                obj.del();
                layer.close(index);
            });
        } else if(obj.event === 'edit'){    //编辑文件
            layer.open({
                type: 1
                ,title: '修改文件名'
                //,skin: 'layui-layer-molv' //墨绿主题
                ,area: ['600px', '200px']
                ,btn:['确认更改','取消']
                ,btnAlign: 'c'
                ,content:'' +
                    // 使用了Boostrap的表单
                    '<form style="margin-right: 30px;margin-left: 30px;margin-top: 30px" class="form-horizontal" id="edit">' +
                    '    <div class="form-group" style="display: none">' +
                    '        <label class="col-sm-2 control-label">ID</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" name="file_id" value="'+data.file_id+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group">' +
                    '        <label class="col-sm-2 control-label">文件名</label>' +
                    '        <div class="col-sm-10">' +
                    '            <small>注意不要动文件名后缀！！！否则可能造成此文件无法下载！！！</small>'+
                    '            <input type="text" id="date" name="file_name" value="'+data.file_name+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group" style="display: none">' +
                    '        <label class="col-sm-2 control-label">文件路径</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input type="text" id="date" name="file_path" value="'+data.file_path+'" required lay-verify="required" autocomplete="off" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '    <div class="form-group" style="display: none">' +
                    '        <label class="col-sm-2 control-label">文件大小</label>' +
                    '        <div class="col-sm-10">' +
                    '            <input name="file_size" value="'+data.file_size+'" required lay-verify="required" class="form-control">' +
                    '        </div>' +
                    '    </div>' +
                    '</form>'
                ,yes:function(index){
                    $.ajax({
                        url:'/admin/tool/file/updateFileName',
                        type:'post',
                        data:$("#edit").serialize(), //注意显示编辑视图的update_id也要在
                        dataType:'json',
                        //contentType:"application/x-www-form-urlencoded",
                        success: function (result) {
                            //回调函数
                            if (result.code == 0){
                                layer.msg(result.msg);
                                setTimeout('location.reload();',2000); //2秒后再执行，为true时强制从服务器加载数据
                            } else {
                                layer.msg(result.msg);
                            }
                        },
                        error:function () {
                            layer.msg(result.msg);
                        }
                    });
                    layer.close(index);
                }
            });
        }else if (obj.event === 'downLoad'){    //下载文件
            //jQuery的ajax回调已经把response的数据以字符串的方式解析，所以我采用这种方式（window.location.href）下载
            window.location.href = '/admin/tool/file/downLoadOne/'+data.file_name;
        }
    });
});


//下载记录的数据表格
layui.use('table', function(){
    var table = layui.table;

    table.render({
        elem: '#roleList'
        ,url:'/admin/tool/file/dllog/list'
        ,toolbar: '#roleToolbar'
        ,title: '用户数据表'
        ,cols: [
            [
                {type: 'checkbox'}
                ,{field:'dllog_id', align: 'center', title:'ID',width: 100, sort: true}
                ,{field:'file_name', align: 'center', title:'下载文件名',width: 400}
                ,{field:'dllog_date', align: 'center', title:'下载时间',width: 200, sort: true}
                ,{field:'username', align: 'center', title:'下载用户',width: 200}

                ,{ title:'操作', align: 'center',width: 100, toolbar: '#dllogFileRightBar'}
            ]
        ]
        ,page: {page: true, theme: '#1E9FFF'}
        ,id: 'dllogTableId' //表格id
    });

    //表格重载
    var $ = layui.$, active = {
        reload: function(){
            //执行重载
            table.reload('dllogTableId', { //表格的id
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    file_name: $('#dllogFileNameReload').val()
                }
            });
        }
    };

    $('#dllogFileNameSearch').on('click', function(){
        var type = $(this).data('type');
        active[type] ? active[type].call(this) : '';
    });

    //头工具栏事件
    table.on('toolbar(roleTableFilter)', function(obj){
        var checkStatus = table.checkStatus(obj.config.id);
        switch(obj.event){
            case 'getJSON': //获取JSON数据
                var data = checkStatus.data;
                layer.alert(JSON.stringify(data));
                break;
            case 'flushDllogTable': //刷新数据表格
                //执行重载
                table.reload('dllogTableId');  //数据表格id
                break;
            case 'batchDelDllog':
                var data = checkStatus.data;
                if (data.length > 0){
                    var dllogIds = "";
                    for (var i = 0; i < data.length; i++) {
                        dllogIds += data[i].dllog_id +",";
                    }
                    console.log("删除：" +dllogIds);
                    layer.confirm("确认删除这" +data.length +"条文件下载记录吗？",{
                        anim: 6,
                        btn: ['确认','取消'],
                        yes: function () {
                            $.ajax({
                                url: '/admin/tool/file/batchDelDllog',
                                type: 'post',
                                dataType: 'json',
                                data: {'dllogIds': dllogIds},
                                success: function (res) {
                                    if (res.code === 0){
                                        layer.msg(res.msg,{icon: 1});
                                        setTimeout("window.location.reload();", 2000);
                                    } else {
                                        layer.msg(res.msg, {icon: 3});
                                    }
                                },
                                error: function () {
                                    layer.msg('服务器内部错误，删除失败！', {icon: 3});
                                }
                            })
                        }
                    })
                } else {
                    layer.msg("请选择需要删除的文件下载记录！",{anim: 6});
                }
                break;
        }
    });

    //监听行工具事件
    table.on('tool(roleTableFilter)', function(obj){
        var data = obj.data;
        var dllog_id = data.dllog_id;
        console.log("删除：" +dllog_id);
        if(obj.event === 'delDllog'){
            layer.confirm("确认删除这条文件下载记录吗？",{
                anim: 6,
                btn: ['确认','取消'],
                yes: function () {
                    $.ajax({
                        url: '/admin/tool/file/delDllog',
                        type: 'post',
                        dataType: 'json',
                        data: {'dllog_id': dllog_id},
                        success: function (res) {
                            if (res.code === 0){
                                layer.msg(res.msg,{icon: 1});
                                setTimeout("window.location.reload();", 2000);
                            } else {
                                layer.msg(res.msg, {icon: 3});
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

});

//文件上传
layui.use('upload', function(){
    var $ = layui.jquery
        ,upload = layui.upload;
    //多文件列表示例
    var demoListView = $('#demoList')
        ,uploadListIns = upload.render({
        elem: '#testList'
        ,url: '/admin/tool/file/uploadFile'
        ,multiple: true
        ,auto: false
        ,accept: 'file' //指定允许上传时校验的文件类型，可选值有：images（图片）、file（所有文件）、video（视频）、audio（音频）
        ,number: 0 //设置同时可上传的文件数量，一般配合 multiple 参数出现。0为不限制。
        ,size: 0    //0为不限制。
        ,drag: true //是否支持拖拽上传
        ,bindAction: '#testListAction'
        ,choose: function(obj){
            var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
            //读取本地文件
            obj.preview(function(index, file, result){
                var tr = $(['<tr id="upload-'+ index +'">'
                    ,'<td>'+ file.name +'</td>'
                    ,'<td>'+ (file.size/1014000).toFixed(6) +'MB</td>'
                    ,'<td>等待上传</td>'
                    ,'<td>'
                    ,'<button class="layui-btn layui-btn-sm layui-btn-mini demo-reload layui-hide">重传</button>'
                    ,'<button class="layui-btn layui-btn-sm layui-btn-mini layui-btn-danger demo-delete">删除</button>'
                    ,'</td>'
                    ,'</tr>'].join(''));
                //单个重传
                tr.find('.demo-reload').on('click', function(){
                    obj.upload(index, file);
                });
                //删除
                tr.find('.demo-delete').on('click', function(){
                    delete files[index]; //删除对应的文件
                    tr.remove();
                    uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                });
                demoListView.append(tr);
            });
        }
        ,done: function(res, index, upload){
            if(res.code === 0){ //上传成功
                window.location.href='/admin/tool/file'; //上传成功之后刷新页面
                var tr = demoListView.find('tr#upload-'+ index)
                    ,tds = tr.children();
                tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                tds.eq(3).html(''); //清空操作
                return delete this.files[index]; //删除文件队列已经上传成功的文件
            }
            this.error(index, upload);
        }
        ,error: function(index, upload){
            var tr = demoListView.find('tr#upload-'+ index)
                ,tds = tr.children();
            tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
            tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
        }
    });
});