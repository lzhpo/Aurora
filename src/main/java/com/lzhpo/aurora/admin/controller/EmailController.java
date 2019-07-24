package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.Email;
import com.lzhpo.aurora.admin.entity.User;
import com.lzhpo.aurora.admin.service.EmailService;
import com.lzhpo.aurora.admin.util.LayuiData;
import io.github.biezhi.ome.OhMyEmail;
import io.github.biezhi.ome.SendMailException;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.List;

import static io.github.biezhi.ome.OhMyEmail.SMTP_QQ;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Controller
@RequestMapping("/admin/tool")
public class EmailController {

    @Autowired
    private EmailService emailService;

    /**
     * 发送邮件是否开启debug
     */
    @Value("${myEmail.debug}")
    private boolean debug;

    /**
     * 发送邮件的邮箱账号
     */
    @Value("${myEmail.username}")
    private String username;

    /**
     * 发送邮件的邮箱授权码
     */
    @Value("${myEmail.password}")
    private String password;

    /**
     * 页面视图跳转
     * @return
     */
    @RequestMapping("/email")
    @RequiresPermissions(value = "email:look")
    @Operation(value = "进入发送邮件页面")
    public String email(){
        return "admin/tool/email";
    }

    /**
     * 发送邮件，同时写入数据库。
     * @param request
     * @return
     */
    @RequestMapping("/email/submit")
    @ResponseBody
    @Operation(value = "发送邮件，同时将记录写入数据库")
    public LayuiData submit(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        //前端接受内容相关
        String title = request.getParameter("title");
        String sendNickName = request.getParameter("nickName");
        String acceptEmail = request.getParameter("acceptEmail");
        String content = request.getParameter("content");
        //配置邮件相关
        OhMyEmail.config(SMTP_QQ(debug), username, password);
        //配置内容相关
        try {
            OhMyEmail.subject(title)
                    .from(sendNickName)
                    .to(acceptEmail)
                    .html(content)
                    .send();
            layuiData.setMsg("发送成功！");
            /** 写入数据库 **/
            Email email = new Email();
            email.setTitle(title);
            email.setContent(content);
            email.setSendDate(new Date());
            User user = (User) SecurityUtils.getSubject().getPrincipal(); //获取操作用户
            email.setUsername(user.getUsername());
            emailService.addEmail(email);
        } catch (SendMailException e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("发送失败！");
        }
        return layuiData;
    }

    /**
     * 数据表格分页显示数据
     */
    @RequestMapping("/email/list")
    @ResponseBody
    @Operation(value = "查询发送邮件记录列表")
    public LayuiData emailList(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        int page = Integer.parseInt(request.getParameter("page"));
        int limit = Integer.parseInt(request.getParameter("limit"));
        int start = (page - 1) * limit;
        String content = request.getParameter("content");
        if (content == null || content == ""){
            List<Email> emailByPage = emailService.findEmailByPage(start, limit);
            layuiData.setData(emailByPage);
            layuiData.setCount(emailService.emailCount());
        } else {
            List<Email> emailLikeContent = emailService.findEmailLikeContent(content, start, limit);
            layuiData.setData(emailLikeContent);
            layuiData.setCount(emailService.countEmailLikeContent(content));
        }
        return layuiData;
    }

    /**
     * 批量删除邮件
     */
    @RequestMapping("/email/batchDelEmail")
    @ResponseBody
    @Operation(value = "批量删除邮件记录")
    public LayuiData batchDelEmail(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String emailIds = request.getParameter("emailIds");
        String[] emailIdsSplit = emailIds.split(",");
        try {
            emailService.batchDelEmail(emailIdsSplit);
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
    @RequestMapping("/email/delEmail")
    @ResponseBody
    @Operation(value = "删除邮件记录")
    public LayuiData delEmail(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String emailId = request.getParameter("emailId");
        try {
            emailService.delEmail(Integer.parseInt(emailId));
            layuiData.setMsg("删除成功！");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }
}
