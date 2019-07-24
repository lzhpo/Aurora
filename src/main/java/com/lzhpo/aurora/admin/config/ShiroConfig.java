package com.lzhpo.aurora.admin.config;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import com.lzhpo.aurora.admin.shiro.ShiroRealm;
import com.lzhpo.aurora.admin.shiro.ShiroSessionListener;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.session.SessionListener;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.LifecycleBeanPostProcessor;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.crazycake.shiro.RedisCacheManager;
import org.crazycake.shiro.RedisManager;
import org.crazycake.shiro.RedisSessionDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * shiro的配置类
 * </p>
 */
@Configuration
public class ShiroConfig {

    private Logger logger = LoggerFactory.getLogger(ShiroConfig.class);

    @Bean
    public static LifecycleBeanPostProcessor getLifecycleBeanPostProcessor() {
        return new LifecycleBeanPostProcessor();
    }

    /**
     * 创建ShiroFilterFactoryBean
     *
     * Shiro内置过滤器，可以实现权限相关的拦截器
     *    常用的过滤器：
     *       anon: 无需认证（登录）可以访问
     *       authc: 必须认证才可以访问
     *       user: 如果使用rememberMe的功能可以直接访问
     *       perms： 该资源必须得到资源权限才可以访问
     *       role: 该资源必须得到角色权限才可以访问
     */
    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(DefaultSecurityManager securityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        // 设置securityManager
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        // 登录的url
        shiroFilterFactoryBean.setLoginUrl("/login");
        // 登录成功后跳转的url
        shiroFilterFactoryBean.setSuccessUrl("/admin");
        // 未授权url
        shiroFilterFactoryBean.setUnauthorizedUrl("/errorPage");

        LinkedHashMap<String, String> filterChainDefinitionMap = new LinkedHashMap<>();

        // 定义filterChain，静态资源不拦截
        filterChainDefinitionMap.put("/AdminLTE/**", "anon");
        filterChainDefinitionMap.put("/design/**", "anon");
        filterChainDefinitionMap.put("/editor-md/**", "anon");
        filterChainDefinitionMap.put("/js/**", "anon");
        filterChainDefinitionMap.put("/layui/**", "anon");
        filterChainDefinitionMap.put("/layui-authtree/**", "anon");
        filterChainDefinitionMap.put("/login/**", "anon");
        filterChainDefinitionMap.put("/Semantic-UI/**", "anon");
        filterChainDefinitionMap.put("/lib/**","anon");
        // 不拦截的页面地址
        filterChainDefinitionMap.put("/druid/**", "anon");
        filterChainDefinitionMap.put("/swagger/**", "anon");
        filterChainDefinitionMap.put("/", "anon");
        //验证码不拦截
        filterChainDefinitionMap.put("/kaptcha/defaultKaptcha", "anon");
        // 配置退出过滤器，其中具体的退出代码Shiro已经替我们实现了
        filterChainDefinitionMap.put("/logout", "logout");
        // 除上以外所有url都必须认证通过才可以访问，未通过认证自动访问LoginUrl
        filterChainDefinitionMap.put("/**", "user");

        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    /**
     * 创建DefaultWebSecurityManager
     * @return
     */
    @Bean
    public DefaultWebSecurityManager securityManager(){
        DefaultWebSecurityManager securityManager =  new DefaultWebSecurityManager();
        //关联shiroRealm
        securityManager.setRealm(shiroRealm());
        //关联记住我
        securityManager.setRememberMeManager(rememberMeManager());
        //关联shiro-redis缓存
        securityManager.setCacheManager(cacheManager());
        //关联shiro-session
        securityManager.setSessionManager(sessionManager());
        return securityManager;
    }

    /**
     * 创建Realm
     */
    @Bean
    public ShiroRealm shiroRealm(){
        ShiroRealm shiroRealm = new ShiroRealm();
        return shiroRealm;
    }

    /**
     * cookie对象
     */
    public SimpleCookie rememberMeCookie(){
        // 设置cookie名称，对应login.html页面的<input type="checkbox" name="rememberMe"/>
        SimpleCookie cookie = new SimpleCookie("rememberMe");
        //设置cookie过期时间，单位为秒
        cookie.setMaxAge(86400);
        return cookie;
    }

    /**
     * cookie管理对象
     */
    public CookieRememberMeManager rememberMeManager() {
        CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
        cookieRememberMeManager.setCookie(rememberMeCookie());
        // rememberMe cookie加密的密钥
        cookieRememberMeManager.setCipherKey(Base64.decode("4AvVhmFLUs0KTA3Kprsdag=="));
        return cookieRememberMeManager;
    }

    /**
     * 开启shiro权限注解功能
     */
    @Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(DefaultSecurityManager securityManager) {
        AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
        authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
        return authorizationAttributeSourceAdvisor;
    }

    /**
     * 开启aop注解
     * @return
     */
    @Bean
    @ConditionalOnMissingBean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAAP = new DefaultAdvisorAutoProxyCreator();
        defaultAAP.setProxyTargetClass(true);
        return defaultAAP;
    }

    /**
     * 配置ShiroDialect，用于thymeleaf和shiro标签配合使用
     */
    @Bean
    public ShiroDialect getShiroDialect(){
        return new ShiroDialect();
    }

    /**
     * ====================================================shiro-redis====================================================
     */

    /**
     * shiro-redis缓存
     * @return
     */
    public RedisManager redisManager() {
        RedisManager redisManager = new RedisManager();
        return redisManager;
    }
    public RedisCacheManager cacheManager() {
        RedisCacheManager redisCacheManager = new RedisCacheManager();
        redisCacheManager.setRedisManager(redisManager());
         //shiro-redis插件3.0版本之后的规范必须要有一个id
        redisCacheManager.setPrincipalIdFieldName("user_id");
        return redisCacheManager;
    }

    /**
     * shiro-session
     */
    @Bean
    public RedisSessionDAO sessionDAO() {
        RedisSessionDAO redisSessionDAO = new RedisSessionDAO();
        redisSessionDAO.setRedisManager(redisManager());
        return redisSessionDAO;
    }
    @Bean
    public SessionManager sessionManager() {
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        Collection<SessionListener> listeners = new ArrayList<>();
        listeners.add(new ShiroSessionListener());
        sessionManager.setSessionListeners(listeners);
        sessionManager.setSessionDAO(sessionDAO());
        return sessionManager;
    }
}
