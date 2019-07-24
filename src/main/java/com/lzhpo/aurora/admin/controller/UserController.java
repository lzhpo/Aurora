package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.Role;
import com.lzhpo.aurora.admin.entity.User;
import com.lzhpo.aurora.admin.service.UserRoleService;
import com.lzhpo.aurora.admin.service.UserService;
import com.lzhpo.aurora.admin.util.LayuiData;
import com.lzhpo.aurora.admin.util.MD5Utils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
@RequestMapping("/admin/system")
public class UserController {

    private Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    /**
     * 视图跳转
     */
    @RequiresPermissions(value = "user:look")
    @RequestMapping("/user")
    @Operation(value = "进入用户管理页面")
    public String user(){
        return "admin/system/user";
    }

    /**
     * 查询全部  分页查询
     * @param request
     * @return
     */
    @RequestMapping("/user/list")
    @ResponseBody
    @Operation(value = "查询用户列表")
    public LayuiData userList(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        //当前页数
        int page = Integer.parseInt(request.getParameter("page"));
        //总页数
        int limit = Integer.parseInt(request.getParameter("limit"));
        //sql限制条件
        int start = (page -1) * limit;
        int userCount = userService.userCount();
        layuiData.setCount(userCount);
        String username = request.getParameter("username");
        if (username == null || username ==""){
            List data = userService.userFindAll(start, limit);
            layuiData.setData(data);
            return layuiData;
        } else {
            List data = userService.userFindLikeName(username);
            layuiData.setData(data);
        }
        return layuiData;
    }

    /**
     * 批量删除
     */
    @RequestMapping("/user/batchDel")
    @ResponseBody
    @Operation(value = "批量删除用户")
    public LayuiData userBatchDel(String ids){
        LayuiData layuiData = new LayuiData();
        String[] split = ids.split(",");
        logger.info("【删除：" +ids +"】");
        try {
            userService.batchDel(split);
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
     * @param user_id
     * @return
     */
    @RequestMapping("/user/deleteById")
    @ResponseBody
    @Operation(value = "删除用户")
    public LayuiData userDeleteById(String user_id){
        LayuiData layuiData = new LayuiData();
        try {
            userService.deleteById(Integer.valueOf(user_id));
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
     * @param user
     * @return
     */
    @RequestMapping("/user/add")
    @ResponseBody
    @Operation(value = "添加用户")
    public LayuiData userAdd(User user){
        LayuiData layuiData = new LayuiData();
        String password = user.getPassword();
        String username = user.getUsername();
        logger.info("【修改用户：" +username +"，新密码为：" +password +"】");
        String encryptPWD = MD5Utils.encrypt(username, password);
        user.setPassword(encryptPWD);
        try {
            userService.userAdd(user);
            layuiData.setMsg("添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("添加失败！");
        }
        return layuiData;
    }


    /**
     * 修改用户信息
     */
    @RequestMapping("/user/edit")
    @ResponseBody
    @Operation(value = "修改用户信息")
    public LayuiData userEdit(User user, HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String user_id = request.getParameter("user_id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String sexChecked = request.getParameter("sexChecked");
        logger.info("sexChecked: " +sexChecked);
        //logger.info("sexChecked: " +sexChecked);
        String statusChecked = request.getParameter("statusChecked");
        try {
            /** 如果密码为空说明是在数据表格中修改的数据，则不用设置密码加盐 **/
            if (password == null || password == ""){
                /** 如果获取不到状态是true还是false，说明是在修改性别 **/
                if (statusChecked == null || statusChecked == ""){ /** 操作--->性别 **/
                    Integer sex = null;
                    user.setUser_id(Integer.parseInt(user_id));
                    if (sexChecked.equals("true")){ //说明是女的
                        sex = 0;
                    } else if (sexChecked.equals("false")){
                        sex = 1;
                    }
                    String statusStr = request.getParameter("status");
                    int status = Integer.parseInt(statusStr);
                    userService.updateSexAndStatus(Integer.parseInt(user_id),sex, status);
                } else { /** 操作--->锁定 **/
                    Integer status = null;
                    if (statusChecked.equals("true")){ //说明是锁定
                        status = 0;
                    } else if (statusChecked.equals("false")){
                        status = 1;
                    }
                    String sex = request.getParameter("sex");
                    userService.updateSexAndStatus(Integer.parseInt(user_id),Integer.parseInt(sex), status);
                }
                layuiData.setMsg("修改成功！");
            } else { /** 相反，如果密码不为空，就得设置密码加盐 **/

                user.setPassword(MD5Utils.encrypt(username,password)); //密码使用用户名加盐
                userService.userEdit(user);
                layuiData.setMsg("修改成功！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("更新失败！");
        }
        return layuiData;
    }

    /**
     * 给用户赋予角色
     */
    @RequestMapping("/user/addRole")
    @ResponseBody
    @Operation(value = "给用户赋予角色")
    public LayuiData addRole(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String user_id = request.getParameter("user_id");
        String role_id = request.getParameter("role_id");
        try {
            userRoleService.addUserRole(Integer.parseInt(user_id), Integer.parseInt(role_id));
            layuiData.setMsg("分配角色成功！");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("分配角色失败！");
        }
        return layuiData;
    }

    /**
     * 根据用户查询其角色
     */
    @RequestMapping("/user/findUserRole")
    @ResponseBody
    @Operation(value = "根据用户查询其角色")
    public Integer findUserRole(HttpServletRequest request){
        String user_id = request.getParameter("user_id");
        Integer roleIdByUserId = userRoleService.findRoleIdByUserId(Integer.parseInt(user_id));
        return roleIdByUserId;
    }

    /**
     * 修改用户的角色
     */
    @RequestMapping("/user/updateUserRole")
    @ResponseBody
    @Operation(value = "修改用户的角色")
    public LayuiData updateUserRole(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String user_id = request.getParameter("user_id");
        String role_id = request.getParameter("role_id");
        try {
            userRoleService.updateUserRole(Integer.parseInt(user_id), Integer.parseInt(role_id));
            layuiData.setMsg("修改成功！");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("修改失败！");
        }
        return layuiData;
    }


}
