
var editObj=null,ptable=null,treeGrid=null,tableId='treeTable',layer=null;
layui.config({
    base: '/design/extend/'
}).extend({
    treeGrid:'treeGrid'
}).use(['jquery','treeGrid','layer','form'], function(){
    var $=layui.jquery;
    treeGrid = layui.treeGrid;//很重要
    layer=layui.layer;
    var form = layui.form; //layui的form
    ptable=treeGrid.render({
        id:tableId
        ,elem: '#'+tableId
        ,url:'/admin/system/resources/list'
        ,cellMinWidth: 100
        ,idField:'id'//必须字段，就是和pid一起的id，如果配置错误，则会出现显示错乱
        ,treeId:'id'//树形id字段名称
        ,treeUpId:'pid'//树形父id字段名称
        ,treeShowName:'resources_name'//以树形式显示的字段
        ,heightRemove:[".dHead",10]//不计算的高度,表格设定的是固定高度，此项不生效
        ,height:'100%'
        ,isFilter:false
        ,iconOpen:true//是否显示图标【默认显示】
        ,isOpenDefault:true//节点默认是展开还是折叠【默认展开】
        ,loading:true
        ,method:'post'
        ,isPage:false
        ,cols: [
            [
            {type:'checkbox'}
            ,{field:'resources_id', title: '资源ID',sort:'true'}
            ,{field:'resources_name', title: '资源名称'}
            ,{field:'url', title: '资源链接'}
            ,{field:'type', title: '类型'}
            ,{field:'permission', title: '权限'}
            ,{field:'id', title: 'id'}
            ,{field:'pid', title: 'pid'}

            ,{title:'操作',align: 'center', toolbar: '#resourcesBar'}
            // ,{title: '操作', align:'center'/*toolbar: '#barDemo'*/
            //     ,templet: function(d){
            //         var editBtn='<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>';
            //         var delBtn='<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>';
            //         return editBtn+delBtn;
            //     }
            // }
        ]
        ]
        ,parseData:function (res) {//数据加载后回调
            return res;
        }
        ,onClickRow:function (index, o) {
            console.log(index,o,"单击！");
            //msg("单击！,按F12，在控制台查看详细参数！");
            treeGrid.on('tool('+tableId+')',function (obj) {
                if(obj.event === 'del'){//删除行
                    var id = o.id;
                    console.log("节点的id: " +id);
                    layer.confirm("你确定删除数据吗？如果存在下级节点则一并删除，此操作不能撤销！", {icon: 3, title:'提示'},
                        function(index){//确定回调
                            $.ajax({
                                url: '/admin/system/resources/batchDelNodeId',
                                type: 'post',
                                dataType: 'json',
                                data: {'id': id},
                                success: function (res) {
                                    if (res.code === 0){
                                        layer.msg(res.msg,{icon: 1});
                                        setTimeout("window.location.reload();", 2000);
                                    } else {
                                        layer.msg(res.msg, {icon: 3});
                                        setTimeout("window.location.reload();", 2000);
                                    }
                                },
                                error: function () {
                                    layer.msg('服务器内部错误，删除失败！', {icon: 3});
                                }
                            });
                            layer.close(index);
                        },function (index) {//取消回调
                            layer.close(index);
                        }
                    );
                } else if (obj.event === "edit"){
                    //获取值
                    var resources_id = o.resources_id;
                    console.log("节点的id: " +resources_id);
                    var pid = o.pid;
                    console.log("pid: " +pid);
                    $.ajax({
                        url:'/admin/system/resources/updateResources/editData',
                        type:'get',
                        data: {'resources_id': resources_id,'pid': pid},
                        dataType:'json',
                    });
                    //打开一个弹窗
                    layer.open({
                        // type: 1
                        type: 2
                        ,title: '修改'
                        // ,skin: 'layui-layer-molv' //墨绿主题
                        ,area: ['500px', '450px']
                        ,btnAlign: 'c'
                        ,content: '/admin/system/resources/updateResources/view'
                    });
                }
            });
        }
        ,onDblClickRow:function (index, o) {
            console.log(index,o,"双击");
            msg("双击！,按F12，在控制台查看详细参数！");
        }
        ,onCheck:function (obj,checked,isAll) {//复选事件
            console.log(obj,checked,isAll,"复选");
            msg("复选,按F12，在控制台查看详细参数！");
        }
        ,onRadio:function (obj) {//单选事件
            console.log(obj,"单选");
            msg("单选,按F12，在控制台查看详细参数！");
        }
    });


    //自定义表单验证规则
    form.verify({
        resources_nameVerify: function(value){
            if(value.length <= 0){
                return '请输入资源名称';
            }
        },
        urlVerify: function(value){
            if(value.length <= 0){
                return '请输入资源url！';
            }
        },
        typeVerify: function(value){
            if(value.length <= 0){
                return '请输入资源类型';
            }
        },
        permissionVerify: function(value){
            if(value.length <= 0){
                return '请输入权限';
            }
        },
        idVerify: function(value){
            if(value.length <= 0){
                return '请输入节点id';
            }
        },
        pidVerify: function(value){
            if (value.length <= 0){
                return '请输入父节点id(pid)';
            }
        }
    });


    //监听添加的提交
    form.on('submit(addFormSave)', function(data){
        // layer.msg(JSON.stringify(data.field));
        $.ajax({
            url: '/admin/system/resources/addResources',
            type: 'post',
            dataType: 'json',
            //contentType: "application/x-www-form-urlencoded",
            data: $("#addResources").serialize(), //获取input的name的值，然后序列化
            success: function (res) {
                if (res.code === 0){
                    layer.msg(res.msg,{icon: 1});
                    setTimeout("window.location.reload();", 2000);
                } else {
                    layer.msg(res.msg, {icon: 3});
                    setTimeout("window.location.reload();", 2000);
                }
            },
            error: function () {
                layer.msg('服务器内部错误，操作失败！', {icon: 3});
            }
        });
        return false;
    });

    //监听修改的提交
    form.on('submit(updateResSave)', function(data){
        // layer.msg(JSON.stringify(data.field));
        $.ajax({
            url: '/admin/system/resources/update',
            type: 'post',
            dataType: 'json',
            //contentType: "application/x-www-form-urlencoded",
            data: $("#updateResFrom").serialize(), //获取input的name的值，然后序列化
            success: function (res) {
                if (res.code === 0){
                    layer.msg(res.msg,{icon: 1});
                    setTimeout("window.location.reload();", 2000);
                } else {
                    layer.msg(res.msg, {icon: 3});
                    setTimeout("window.location.reload();", 2000);
                }
            },
            error: function () {
                layer.msg('服务器内部错误，操作失败！', {icon: 3});
            }
        });
        return false;
    });
});


//根据主键resources_id批量删除
function batchDelByResourcesId() {
    var checkStatus = treeGrid.checkStatus(tableId)
        ,data = checkStatus.data;
    var ResourcesIds = "";
    if (data.length > 0){
        layer.confirm('确定删除这' +data.length +"个资源？",{
            btn: ['确定','取消'],
            anim: '6',
            yes: function (index) {
                for (var i = 0; i < data.length; i++) {
                    ResourcesIds += data[i].resources_id +",";
                }
                console.log("删除resources_id：" +ResourcesIds);
                $.ajax({
                    url:'/admin/system/resources/batchDelByResourcesId',
                    type:'post',
                    data: {'ResourcesIds': ResourcesIds}, //注意显示编辑视图的update_id也要在
                    dataType:'json',
                    success: function (res) {
                        if (res.code === 0){
                            layer.msg(res.msg,{icon: 1});
                            setTimeout("window.location.reload();", 2000);
                        } else {
                            layer.msg(res.msg, {icon: 3});
                            setTimeout("window.location.reload();", 2000);
                        }
                    },
                    error: function () {
                        layer.msg('服务器内部错误，操作失败！', {icon: 3});
                    }
                });
                layer.close(index);
            }
        })
    } else {
        layer.alert("请选择需要删除的资源！", {anim: 6})
    }
}



function print() {
    console.log(treeGrid.cache[tableId]);
    msg("对象已打印，按F12，在控制台查看！");
}

function msg(msg) {
    var loadIndex=layer.msg(msg, {
        time:3000
        ,offset: 'b'//顶部
        ,shade: 0
    });
}

function openorclose() {
    var map=treeGrid.getDataMap(tableId);
    var o= map['102'];
    treeGrid.treeNodeOpen(tableId,o,!o[treeGrid.config.cols.isOpen]);
}


function openAll() {
    var treedata=treeGrid.getDataTreeList(tableId);
    treeGrid.treeOpenAll(tableId,!treedata[0][treeGrid.config.cols.isOpen]);
}

function radioStatus() {
    var data = treeGrid.radioStatus(tableId)
    layer.alert(JSON.stringify(data));
}
function getCheckLength() {
    var checkStatus = treeGrid.checkStatus(tableId)
        ,data = checkStatus.data;
    layer.msg('选中了：'+ data.length + ' 个');
}

function reload() {
    treeGrid.reload(tableId,{
        page:{
            curr:1
        }
    });
}
function query() {
    treeGrid.query(tableId,{
        where:{
            name:'sdfsdfsdf'
        }
    });
}

function test() {
    console.log(treeGrid.cache[tableId],treeGrid.getClass(tableId));


    /*var map=treeGrid.getDataMap(tableId);
    var o= map['102'];
    o.name="更新";
    treeGrid.updateRow(tableId,o);*/
}

//##############修改资源##############

//页面加载完就执行加载角色列表，防止二次渲染
$(function(){
    $.get("/admin/system/resources/initResSelects",function(res) {
        if (res.code === 0) {
            var pidHtml = "";
            var nodeIdHtml = "";
            layui.each(res.data, function (index, item) {
                pidHtml += '<option value="' + item.id + '">' + item.resources_name + '</option>';
                nodeIdHtml += '<option value="' + item.id + '">' + item.resources_name + '</option>';
            });
            console.log("pidHtml: \n" +pidHtml);
            $("#MyPid").append(pidHtml);
            console.log("nodeIdHtml: \n" +nodeIdHtml);
            $("#MyNodeId").append(nodeIdHtml);
        } else if (res.code === -1){
            layer.alert(res.msg, {anim: 6});
        }
    });
});