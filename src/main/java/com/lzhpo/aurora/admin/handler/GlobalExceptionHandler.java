package com.lzhpo.aurora.admin.handler;

import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 全局异常捕捉处理
 * </p>
 */
@ControllerAdvice
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class GlobalExceptionHandler {

    private Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    /**
     * 捕捉AuthorizationException异常，也就是没有权限的用户。
     * 让用户跳转到错误页面errorPage
     * @return
     */
    @ExceptionHandler(value = AuthorizationException.class)
    public String handleAuthorizationException() {
        logger.error("【没有权限--->AuthorizationException异常--->errorPage】");
        return "errorPage";
    }
}
