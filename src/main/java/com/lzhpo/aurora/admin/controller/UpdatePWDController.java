package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.User;
import com.lzhpo.aurora.admin.service.UpdatePWDService;
import com.lzhpo.aurora.admin.util.LayuiData;
import com.lzhpo.aurora.admin.util.MD5Utils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 修改密码
 * </p>
 */
@Controller
public class UpdatePWDController {

    private Logger logger = LoggerFactory.getLogger(UpdatePWDController.class);

    @Autowired
    private UpdatePWDService updatePWDService;

    /**
     * 修改密码
     * @param request
     * @return
     */
    @RequestMapping("/admin/updatePWD")
    @ResponseBody
    @Operation(value = "用户修改密码")
    public LayuiData updatePWD(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        //获取当前登录的用户id
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        Integer user_id = user.getUser_id();
        //前端传来的密码
        String password = request.getParameter("password");
        logger.info("【前端传来的原密码明文：" +password +"】");
        //原密码加密（默认盐值为lzhpo）
        String oldPWD = MD5Utils.encrypt(user.getUsername(),password); //旧密码加密，传入用户名和密码，以便于判断和数据库中加密的密码是否一致
        logger.info("【前端传来的原密码加密：" +oldPWD +"】");
        String passwordSecond = request.getParameter("passwordSecond");
        logger.info("【将要加密的新密码：" +passwordSecond +"】");
        //校验新密码是否与数据库的一致
        String oldPWDMySQL = updatePWDService.findById(user_id);
        if (oldPWD.equals(oldPWDMySQL)){
            //修改密码（加密）
            String newPDW = MD5Utils.encrypt(user.getUsername(),passwordSecond); //新密码加密，传入用户名和密码
            logger.info("【新密码加密结果：" +newPDW +"】");
            try {
                user.setUser_id(user_id); //修改的时候必须要有id，不然mybatis会关闭非事务的SqlSession
                user.setPassword(newPDW);
                updatePWDService.updatePWD(user);
                layuiData.setMsg("修改密码成功！请退出重新登录！");
                SecurityUtils.getSubject().logout(); //退出登录
                logger.info("【修改密码成功】");
            } catch (Exception e) {
                e.printStackTrace();
                layuiData.setCode(-1);
                layuiData.setMsg("修改失败！");
                logger.info("【修改密码失败】");
            }
        }else { //如果不一致
            layuiData.setCode(-1);
            layuiData.setMsg("修改失败！原密码不正确！");
            logger.info("【修改密码失败，原密码不正确】");
        }
        System.out.println("===========密码修改完毕==================");
        return layuiData;
    }
}
