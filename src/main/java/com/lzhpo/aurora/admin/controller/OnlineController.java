package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.OnlineUser;
import com.lzhpo.aurora.admin.service.OnlineService;
import com.lzhpo.aurora.admin.util.ResponseBo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Controller
@RequestMapping("/admin/system")
public class OnlineController {

    @Autowired
    private OnlineService onlineService;

    @RequestMapping("/onlineUser")
    @RequiresPermissions(value = "onlineUser:look")
    @Operation(value = "进入在线用户页面")
    public String online() {
        return "admin/system/online";
    }

    @ResponseBody
    @RequestMapping("/onlineUser/list")
    @Operation(value = "查询在线用户列表")
    public List<OnlineUser> list() {
        return onlineService.list();
    }

    @ResponseBody
    @RequestMapping("/onlineUser/forceLogout")
    @Operation(value = "踢出在线用户")
    public ResponseBo forceLogout(String id) {
        try {
            onlineService.forceLogout(id);
            return ResponseBo.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseBo.error("踢出用户失败");
        }
    }
}