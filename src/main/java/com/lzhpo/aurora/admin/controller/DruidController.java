package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * Druid监控的Controller
 * </p>
 */
@Controller
@RequestMapping("/admin/tool")
public class DruidController {

    @RequestMapping("/druid")
    @RequiresPermissions(value = {"druid:look"})
    @Operation(value = "进入Druid页面")
    public ModelAndView druid(){
        return new ModelAndView("admin/tool/druid");
    }
}
