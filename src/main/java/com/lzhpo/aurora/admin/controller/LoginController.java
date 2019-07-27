package com.lzhpo.aurora.admin.controller;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.User;
import com.lzhpo.aurora.admin.mapper.BlogArticleMapper;
import com.lzhpo.aurora.admin.mapper.MyFileMapper;
import com.lzhpo.aurora.admin.mapper.UserMapper;
import com.lzhpo.aurora.admin.util.CodeUtil;
import com.lzhpo.aurora.admin.util.LayuiData;
import com.lzhpo.aurora.admin.util.MD5Utils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 登录
 * </p>
 */
@Controller
public class LoginController {

    private Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private BlogArticleMapper blogArticleMapper;

    @Autowired
    private MyFileMapper myFileMapper;

    @Autowired
    private DefaultKaptcha defaultKaptcha;

    /**
     * index视图跳转
     */
    @RequestMapping("/")
    @Operation(value = "进入主页index")
    public String index(){
        return "index";
    }

    /**
     * 生成验证码
     */
    @RequestMapping("/kaptcha/defaultKaptcha")
    @Operation(value = "生成验证码")
    public void defaultKaptcha(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
            throws Exception {
        //byte[] captchaChallengeAsJpeg = null;
        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
        try {
            // 生产验证码字符串并保存到session中
            String createText = defaultKaptcha.createText();
            httpServletRequest.getSession().setAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY, createText);
            //控制台输出验证码
            String scode = (String) httpServletRequest.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY); //放入缓存中的正确密码
            logger.info("【正确的验证码为：" +scode +"】");
            // 使用生产的验证码字符串返回一个BufferedImage对象并转为byte写入到byte数组中
            BufferedImage challenge = defaultKaptcha.createImage(createText);
            ImageIO.write(challenge, "jpg", jpegOutputStream);
        } catch (IllegalArgumentException e) {
            httpServletResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        // 定义response输出类型为image/jpeg类型，使用response输出流输出图片的byte数组
        byte[] captchaChallengeAsJpeg = jpegOutputStream.toByteArray();
        httpServletResponse.setHeader("Cache-Control", "no-store");
        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setDateHeader("Expires", 0);
        httpServletResponse.setContentType("image/jpeg");
        ServletOutputStream responseOutputStream = httpServletResponse.getOutputStream();
        responseOutputStream.write(captchaChallengeAsJpeg);
        responseOutputStream.flush();
        responseOutputStream.close();
    }


    /**
     * login/admin 视图跳转控制
     *
     * (1)subject.isAuthenticated()
     *      表示用户进行了身份验证登录的，即使用Subject.login进行了登录。
     * (2)subject.isRemembered()
     *      表示用户是通过“记住我”登录的，此时可能并不是真正的你（如其他人使用你的电脑，或者你的cookie被窃取）在线访问的。
     *
     * 两者二选一，即subject.isAuthenticated()==true，则subject.isRemembered()==false；反之一样。
     */
    @GetMapping("/login")
    @Operation(value = "用户登录")
    public String login(){
        Subject subject = SecurityUtils.getSubject();
        //表示用户进行了身份验证登录的，即使用Subject.login进行了登录。
        if (subject.isAuthenticated()){
            return "redirect:/admin";
        }
        return "login";
    }

    /**
     * 前端登录校验：账号、密码、验证码、记住我
     */
    @PostMapping("/login")
    @ResponseBody
    @Operation(value = "用户登录校验")
    public LayuiData login(String username, String password, Boolean rememberMe, String code, HttpServletRequest request, HttpServletResponse httpServletResponse){
        LayuiData layuiData = new LayuiData();
        String scode = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY); //放入缓存中的正确密码
        //账号、密码、记住我
        password = MD5Utils.encrypt(username, password);
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        //验证码校验
        //logger.info("【正确的验证码为：" +scode +"】");
        logger.info("【用户输入的验证码为：" +code +"】");
        if (!CodeUtil.checkVerifyCode(request)) {
            layuiData.setCode(-1);
            layuiData.setMsg("验证码错误！");
            return layuiData;
        } else {
            Subject subject = SecurityUtils.getSubject();
            try {
                subject.login(token);
                layuiData.setMsg("登录成功！正在跳转中...");
            } catch (UnknownAccountException | IncorrectCredentialsException e) {
                token.clear();
                layuiData.setCode(-1);
                layuiData.setMsg("登录失败！用户名或密码错误！");
            } catch (LockedAccountException e){
                token.clear();
                layuiData.setCode(-1);
                layuiData.setMsg("登录失败！您的账号已被锁定！请联系管理员！");
            } catch (AuthenticationException e) {
                token.clear();
                layuiData.setCode(-1);
                layuiData.setMsg("登录认证失败！");
            }
        }
        return layuiData;
    }

    /**
     * 完成登录后，通过subject获取用户登录的信息
     *
     * 报错：大概意思就是已经提交了请求，这是个错误响应。
     * 2019-06-10 11:22:20.522 ERROR 24108 --- [nio-8080-exec-1] s.e.ErrorMvcAutoConfiguration$StaticView :
     * Cannot render error page for request [/admin] and exception [An error happened during template parsing (template: "class path resource [templates/admin/admin.html]")] as the response has already been committed.
     * As a result, the response may have the wrong status code.
     */
    @RequestMapping("/admin")
    @Operation(value = "进入后台主页面")
    public String getAdmin(Model model, HttpSession session){
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("user", user);
        int userCount = userMapper.userCount();
        session.setAttribute("userCount", userCount);
        int blogArticleCount = blogArticleMapper.count();
        session.setAttribute("blogArticleCount", blogArticleCount);
        int fileCount = myFileMapper.fileCount();
        session.setAttribute("fileCount", fileCount);
        return "admin/admin";
    }

    /**
     * iframe框架视图控制
     * @return
     */
    @RequestMapping("/admin/main")
    public String main(){
        return "admin/main";
    }


    /**
     * 错误页面：没有权限之类的统一错误页面.........
     */
    @RequestMapping("/errorPage")
    @Operation(value = "进入错误页面")
    public String noAuth(){
        return "errorPage";
    }
}
