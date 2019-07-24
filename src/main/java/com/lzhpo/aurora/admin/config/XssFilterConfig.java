package com.lzhpo.aurora.admin.config;

import com.lzhpo.aurora.admin.xss.XssFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 防御XSS攻击（使用JavaConfig的形式配置）
 * </p>
 */
@Configuration
public class XssFilterConfig {

    /**
     * 使XssFilter生效
     * @return
     */
    @Bean
    public FilterRegistrationBean xssFilterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new XssFilter());
        filterRegistrationBean.setOrder(1);
        filterRegistrationBean.setEnabled(true);
        filterRegistrationBean.addUrlPatterns("/*");
        Map<String, String> initParameters = new HashMap<String, String>();
        initParameters.put("excludes", "/favicon.ico,/img/*,/js/*,/css/*");
        initParameters.put("isIncludeRichText", "true");
        filterRegistrationBean.setInitParameters(initParameters);
        return filterRegistrationBean;
    }

}
