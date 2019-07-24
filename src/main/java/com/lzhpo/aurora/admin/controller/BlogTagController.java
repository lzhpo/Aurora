package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.BlogTag;
import com.lzhpo.aurora.admin.entity.BlogType;
import com.lzhpo.aurora.admin.service.BlogTagService;
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
public class BlogTagController {

    @Autowired
    private BlogTagService blogTagService;

    @RequestMapping("/blogTag")
    @RequiresPermissions(value = "blogTag:look")
    @Operation(value = "进入博客标签页面")
    public String tag(){
        return "admin/blog/blogTag";
    }

    /**
     * 查询和分页查询
     * @param request
     * @return
     */
    @RequestMapping("/tag/list")
    @ResponseBody
    @Operation(value = "查询博客标签列表")
    public LayuiData tagList(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        int page = Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        int start = (page -1) * limit;
        //判断是否是模糊查询
        String tagName = request.getParameter("tagName");
        if (tagName == null || tagName == ""){
            List<BlogTag> blogTags = blogTagService.selectByLimit(start, limit);
            layuiData.setData(blogTags);
            int count = blogTagService.count();
            layuiData.setCount(count);
        } else {
            List<BlogTag> blogTags = blogTagService.selectByLikeName(tagName, start, limit);
            layuiData.setData(blogTags);
            Integer countByLikeName = blogTagService.countByLikeName(tagName);
            layuiData.setCount(countByLikeName);
        }
        return layuiData;
    }

    /**
     * 批量删除
     */
    @RequestMapping("/blogTag/batchDel")
    @ResponseBody
    @Operation(value = "批量删除博客标签")
    public LayuiData batchDel(String ids){
        LayuiData layuiData = new LayuiData();
        String[] split = ids.split(",");
        try {
            blogTagService.batchDel(split);
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
    @RequestMapping("/blogTag/deleteById")
    @ResponseBody
    @Operation(value = "删除博客标签")
    public LayuiData deleteById(String tagId){
        LayuiData layuiData = new LayuiData();
        try {
            blogTagService.deleteById(Integer.valueOf(tagId));
            layuiData.setMsg("删除成功！");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 添加
     */
    @RequestMapping("/blogTag/add")
    @ResponseBody
    @Operation(value = "添加博客标签")
    public LayuiData add(BlogTag blogTag){
        LayuiData layuiData = new LayuiData();
        try {
            blogTagService.insert(blogTag);
            layuiData.setMsg("添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("添加失败！");
        }
        return layuiData;
    }

    /**
     * 修改
     */
    @RequestMapping("/blogTag/edit")
    @ResponseBody
    @Operation(value = "修改博客标签")
    public LayuiData edit(BlogTag blogTag){
        LayuiData layuiData = new LayuiData();
        try {
            blogTagService.updateById(blogTag);
            layuiData.setMsg("修改成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("修改失败！");
        }
        return layuiData;
    }
}
