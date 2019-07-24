package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.BlogType;
import com.lzhpo.aurora.admin.service.BlogTypeService;
import com.lzhpo.aurora.admin.util.LayuiData;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/6/16
 * @Description：
 */
@Controller
@RequestMapping("/admin/blog")
public class BlogTypeController {

    @Autowired
    private BlogTypeService blogTypeService;

    @RequestMapping("/blogType")
    @RequiresPermissions(value = "blogType:look")
    @Operation(value = "进入博客分类页面")
    public String type(){
        return "admin/blog/blogType";
    }

    @RequestMapping("/blogType/list")
    @ResponseBody
    @Operation(value = "查询博客分类列表")
    public LayuiData blogTypeList(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        int count = blogTypeService.count();
        layuiData.setCount(count);
        //前端
        int page = Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        int start = (page -1) * limit;
        //模糊查询
        String typeName = request.getParameter("typeName");
        if (typeName == null || typeName == ""){
            List<BlogType> blogTypes = blogTypeService.selectByLimit(start, limit);
            layuiData.setData(blogTypes);
        } else {
            List<BlogType> blogTypes = blogTypeService.selectByLikeName(typeName);
            layuiData.setData(blogTypes);
        }
        return layuiData;
    }

    /**
     * 新增
     */
    @RequestMapping("/blogType/add")
    @ResponseBody
    @Operation(value = "新增博客分类")
    public LayuiData blogTypeAdd(BlogType blogType){
        LayuiData layuiData = new LayuiData();
        try {
            blogTypeService.addType(blogType);
            layuiData.setMsg("添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("添加失败！");
        }
        return layuiData;
    }

    /**
     * 批量删除
     */
    @RequestMapping("/blogType/batchDel")
    @ResponseBody
    @Operation(value = "批量删除博客分类")
    public LayuiData batchDel(String ids){
        LayuiData layuiData = new LayuiData();
        String[] split = ids.split(",");
        try {
            blogTypeService.batchDel(split);
            layuiData.setMsg("删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 单个删除
     */
    @RequestMapping("/blogType/delOne")
    @ResponseBody
    @Operation(value = "删除博客分类")
    public LayuiData delOne(String typeId){
        LayuiData layuiData = new LayuiData();
        try {
            blogTypeService.delOne(Integer.valueOf(typeId));
            layuiData.setMsg("删除成功！");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 编辑
     */
    @RequestMapping("/blogType/edit")
    @ResponseBody
    @Operation(value = "修改博客分类")
    public LayuiData edit(BlogType blogType){
        LayuiData layuiData = new LayuiData();
        try {
            blogTypeService.update(blogType);
            layuiData.setMsg("修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("修改失败！");
        }
        return layuiData;
    }
}
