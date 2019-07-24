package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.Dictionary;
import com.lzhpo.aurora.admin.service.DictionaryService;
import com.lzhpo.aurora.admin.util.LayuiData;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Controller
@RequestMapping("/admin/tool")
public class DictionaryController {

    @Autowired
    private DictionaryService dictionaryService;

    /**
     * 视图跳转
     */
    @RequestMapping("/dictionary")
    @RequiresPermissions(value = "dictionary:look")
    @Operation(value = "进入数据库字典页面")
    public String dictionary(){
        return "admin/tool/dictionary";
    }

    @RequestMapping("/dictionary/list")
    @ResponseBody
    @Operation(value = "查询数据库字典列表")
    public LayuiData dictionaryList(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        int page = Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        int start = (page - 1) * limit;
        int count = dictionaryService.count();
        String columName = request.getParameter("columName");
        if (columName == null || columName == ""){
            List<Dictionary> data = dictionaryService.findAll(start, limit);
            layuiData.setData(data);
            layuiData.setCount(count);
            return layuiData;
        } else {
            List<Dictionary> data = dictionaryService.findLikeColumName(columName);
            layuiData.setData(data);
            layuiData.setCount(count);
        }
        return layuiData;
    }
}
