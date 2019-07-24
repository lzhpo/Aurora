package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.Role;
import com.lzhpo.aurora.admin.service.RoleService;
import com.lzhpo.aurora.admin.util.LayuiData;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/admin/system")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * 视图跳转
     */
    @RequiresPermissions(value = "role:look")
    @RequestMapping("/role")
    @Operation(value = "进入角色管理页面")
    public String role(){
        return "admin/system/role";
    }

    /**
     * 查询全部
     */
    @RequestMapping("/role/list")
    @ResponseBody
    @Operation(value = "查询角色列表")
    public LayuiData roleList(HttpServletRequest request){
        //当前页数
        int page = Integer.parseInt(request.getParameter("page"));
        //显示条数
        int limit = Integer.parseInt(request.getParameter("limit"));
        //sql限制条件
        int start = (page -1) * limit;
        int roleCount = roleService.roleCount();
        LayuiData layuiData = new LayuiData();
        String description = request.getParameter("description");
        //未输入描述，查询全部
        if (description == null || description == ""){
            List data = roleService.roleFindAll(start, limit);
            layuiData.setCount(roleCount);
            layuiData.setData(data);
            return layuiData;
        } else { //根据description模糊查询
            List data = roleService.roleLikeDesc(description);
            layuiData.setCount(roleCount);
            layuiData.setData(data);
        }
        return layuiData;
    }

    /**
     * 批量删除
     */
    @RequestMapping("/role/batchDel")
    @ResponseBody
    @Operation(value = "批量删除角色")
    public LayuiData batchDel(String ids){
        LayuiData layuiData = new LayuiData();
        String[] split = ids.split(",");
        try {
            roleService.batchDel(split);
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
    @RequestMapping("/role/deleteOne")
    @ResponseBody
    @Operation(value = "删除角色")
    public LayuiData deleteOne(String role_id){
        LayuiData layuiData = new LayuiData();
        try {
            roleService.deleteOne(Integer.valueOf(role_id));
            layuiData.setMsg("删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }


    /**
     * 添加角色
     */
    @RequestMapping("/role/add")
    @ResponseBody
    @Operation(value = "添加角色")
    public LayuiData roleAdd(Role role){
        LayuiData layuiData = new LayuiData();
        try {
            roleService.addRole(role);
            layuiData.setMsg("添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("添加失败！");
        }
        return layuiData;
    }

    /**
     * 更新
     */
    @RequestMapping("/role/edit")
    @ResponseBody
    @Operation(value = "更新角色")
    public LayuiData roleEdit(Role role){
        LayuiData layuiData = new LayuiData();
        try {
            roleService.editRole(role);
            layuiData.setMsg("更新成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("更新失败！");
        }
        return layuiData;
    }

    /**
     * 查询所有角色
     */
    @RequestMapping("/role/findAllRole")
    @ResponseBody
    @Operation(value = "查询所有角色")
    public LayuiData findAll(){
        LayuiData layuiData = new LayuiData();
        try {
            List<Role> allRole = roleService.findAllRole();
            layuiData.setData(allRole);
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("加载角色列表失败！");
        }
        return layuiData;
    }

}
