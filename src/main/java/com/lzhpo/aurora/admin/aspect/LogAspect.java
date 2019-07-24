package com.lzhpo.aurora.admin.aspect;


import com.alibaba.fastjson.JSON;
import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.Log;
import com.lzhpo.aurora.admin.entity.OnlineUser;
import com.lzhpo.aurora.admin.entity.User;
import com.lzhpo.aurora.admin.es.repository.LogRepository;
import com.lzhpo.aurora.admin.service.LogService;
import com.lzhpo.aurora.admin.util.IpAdrressUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.crazycake.shiro.RedisSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.*;

/**
 * <p>Title：实现日志AOP类</p>
 * <p>Description：
 * 系统日志：切面处理类。
 *
 * 在这里我是调用service保存SysLog实体类到数据库，
 * 也可以选择直接输出到控制台，就可以不用写service类、mapper类、JavaBean。
 * </p>
 *
 * @Author：lzhpo
 */
@Aspect
@Component
public class LogAspect {

    private Logger logger = LoggerFactory.getLogger(LogAspect.class);

    @Autowired
    private LogService logService;

    @Autowired
    private LogRepository logRepository;

    //定义切点 @Pointcut
    //在注解的位置切入代码
    @Pointcut("@annotation(com.lzhpo.aurora.admin.annotation.Operation)")
    public void logPoinCut() {
    }

    //切面 配置通知
    @AfterReturning("logPoinCut()")
    public void saveSysLog(JoinPoint joinPoint) {
        //操作开始时间
        long startTime =  System.nanoTime();

        //日志实体类
        Log log = new Log();


        /**获取切入点所在的方法**/
        //从切面织入点处通过反射机制获取织入点处的方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        //获取切入点所在的方法
        Method method = signature.getMethod();


        /**获取操作(com.lzhpo.aurora.admin.annotation.Operation)**/
        Operation operation = method.getAnnotation(Operation.class);
        if (operation != null) {
            String value = operation.value();
            log.setOperation(value);//保存获取的操作
        }

        /**获取请求的类名**/
        String className = joinPoint.getTarget().getClass().getName();

        /**获取请求的方法名**/
        String methodName = method.getName();
        log.setMethod(className + "." + methodName);

        /**请求的参数**/
        Object[] args = joinPoint.getArgs();
        //法1：将参数所在的数组转换成json--->使用SpringBoot默认的jackjson
//        String params = null;
//        try {
//            params = JacksonUtil.obj2json(args);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        //法2：将参数所在的数组转换成json--->使用fastjson
        //使用 Object[] args = joinPoint.getArgs(); 获取入参的时候，args还包含了一些其他的内容，比如ServletRequest等，而这些入参并不能进行序列化
        Object[] arguments  = new Object[args.length];
        for (int i = 0; i < args.length; i++) {
            /**
             * 报错记录：
             * 调用getAsyncContext方法出现了问题.表示当前这个request对象不是异步模式的,所以不能调用getAsyncContext这个方法.
             * 这个request的异步模式,是servlet3中的一个新特性,可以使用注解或者配置xml的方式进行开启,一般用于异步请求,
             * 这个request的异步模式的使用场景,就不多论述了.回到问题中来,fastjson序列化出错,出错的原因是fastjson调用了getAsyncContext方法,
             * 由于request不是异步模式,所以报错了,那么结果就是fastjson序列化出错了.
             *
             * ​ 再看一下异常信息,按照打印的栈信息来看,是RequestFacade对象中的getAsyncContext方法被调用了,但是工程里面并没用用到RequestFacade对象呀,
             * 查看RequestFacade类的源码过后发现RequestFacade其实是HttpServletRequest的一个具体实现.那么问题就定位到了,fastjson把HttpServletRequest序列化了。
             *
             * instanceof：
             * instanceof是Java的一个二元操作符，和==，>，<是同一类东西。由于它是由字母组成的，所以也是Java的保留关键字。它的作用是测试它左边的对象是否是它右边的类的实例，返回boolean类型的数据。
             * 运算符是双目运算符,左面的操作元是一个对象实例,右面是一个类.当左面的对象是右面的类创建的对象时,该运算符运算的结果是true,否则是false
             */
            if (args[i] instanceof ServletRequest || args[i] instanceof HttpServletRequest || args[i] instanceof ServletResponse || args[i] instanceof MultipartFile) {
                //ServletRequest、HttpServletRequest、ServletResponse、MultipartFile都不能被fastjson序列化！
                continue;
            }
            arguments[i] = args[i];
        }
        String params = null;
        try {
            params = JSON.toJSONString(arguments);
            logger.info("【操作记录的请求参数：" + params +"】");
        } catch (Exception e) {
            e.printStackTrace();
        }

        log.setParams(params);

        /**请求的日期时间**/
        log.setCreate_time(new Date());

        //1.使用jdk自带的方法--->获取计算机用户名
//        String username = System.getProperty("user.name");
//        log.setUsername(username);
//        log.setUsername(username);
        //2.使用shiro获取操作的用户
        User user = (User) SecurityUtils.getSubject().getPrincipal(); //获取操作的用户名
        log.setUsername(user.getUsername());

        /**获取用户ip地址**/
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        log.setIp(IpAdrressUtil.getIpAdrress(request));

        /** 操作耗时 **/
        long endTime = System.nanoTime(); // 获取结束时间
        String dotime= new Formatter().format("%.6f", (double)((endTime-startTime))/1000000).toString();
        log.setDotime(dotime + "ms");

        /**
         * 调用service保存SysLog实体类到数据库
         */
        try {
            logService.saveLog(log);
            logger.info("【数据{}保存到MySQL成功】", log);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /**
         * 保存到ElasticSearch中
         */
        try {
            logRepository.save(log);
            logger.info("【数据{}保存到ElasticSearch成功】", log);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}