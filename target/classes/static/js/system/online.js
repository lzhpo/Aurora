$.get("/admin/system/onlineUser/list", {}, function(r){
    var length = r.length;
    $("#onlineCount").text(length);
    var html = "";
    for(var i = 0; i < length; i++){
        html += "" +
            "<tbody>"
            + "<tr>"
            + "<td>" + (i+1) + "</td>"
            + "<td>" + r[i].username + "</td>"
            + "<td>" + new Date(r[i].startTimestamp).Format("yyyy-MM-dd hh:mm:ss") + "</td>"
            + "<td>" + new Date(r[i].lastAccessTime).Format("yyyy-MM-dd hh:mm:ss") + "</td>"
            + "<td>" + r[i].host + "</td>"
            + "<td>" + r[i].status + "</td>"
            + "<td><button class='layui-btn layui-btn-xs layui-btn-danger' href='#' onclick='offline(\"" + r[i].id + "\",\"" + r[i].status +"\")'>下线</button></td>"
            + "</tr>" +
            "</tbody>";
    }
    $("table").append(html);
},"json");

function offline(id,status){
    if(status == "离线"){
        alert("该用户已是离线状态！！");
        return;
    }
    $.get("/admin/system/onlineUser/forceLogout", {"id": id}, function(r){
        if (r.code == 0) {
            alert('该用户已强制下线！');
            location.href = '/admin/system/onlineUser';
        } else {
            alert(r.msg);
        }
    },"json");
}