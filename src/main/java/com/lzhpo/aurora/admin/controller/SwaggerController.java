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
 * Swagger页面跳转
 * </p>
 */
@Controller
@RequestMapping("/admin/tool")
public class SwaggerController {

    @RequestMapping("/swagger")
    @RequiresPermissions(value = "swagger:look")
    @Operation(value = "进入swagger页面")
    public ModelAndView Swagger(){
        return new ModelAndView("admin/tool/swagger");
    }
}
