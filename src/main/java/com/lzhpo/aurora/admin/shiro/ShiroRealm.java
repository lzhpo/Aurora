package com.lzhpo.aurora.admin.shiro;


import com.lzhpo.aurora.admin.entity.Resources;
import com.lzhpo.aurora.admin.entity.Role;
import com.lzhpo.aurora.admin.entity.User;
import com.lzhpo.aurora.admin.mapper.UserMapper;
import com.lzhpo.aurora.admin.mapper.UserResourcesMapper;
import com.lzhpo.aurora.admin.mapper.UserRoleMapper;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 自定义Realm
 * </p>
 */
public class ShiroRealm extends AuthorizingRealm {

    private Logger logger = LoggerFactory.getLogger(ShiroRealm.class);

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private UserResourcesMapper userResourcesMapper;


    /**
     * 获取用户角色和权限:
     *
     * 通过方法userRoleMapper.findByUserName(userName)和userPermissionMapper.findByUserName(userName)获取了当前登录用户的角色和权限集，
     * 然后保存到SimpleAuthorizationInfo对象中，并返回给Shiro，这样Shiro中就存储了当前用户的角色和权限信息了。
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
        logger.info("【doGetAuthorizationInfo()开始执行...】");
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        String userName = user.getUsername();
        logger.info("【用户名为"+userName +"的用户开始获取权限...】");
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();

        /**
         * 获取用户角色集
         */
        List<Role> roleList = userRoleMapper.findByUserName(userName);
        Set<String> roleSet = new HashSet<>();
        for (Role r : roleList) {
            roleSet.add(r.getRole_name());
        }
        simpleAuthorizationInfo.setRoles(roleSet); //不能出现空值null
        logger.info("【用户名为"+userName +"的用户拥有的角色为"+ roleSet+"】");

        /**
         * 获取用户权限集
         */
        List<Resources> ResourcesList = userResourcesMapper.findByUserName(userName);
        Set<String> ResourcesSet = new HashSet<>();
        for (Resources p : ResourcesList) {
            ResourcesSet.add(p.getPermission());//里面不能存在空值null
        }
        simpleAuthorizationInfo.setStringPermissions(ResourcesSet);
        logger.info("【" +"用户名为" +userName +"的用户拥有的权限为" +ResourcesSet +"】");

        return simpleAuthorizationInfo;
    }

    /**
     * 登录认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        logger.info("【doGetAuthenticationInfo()方法开始执行...】");
        // 获取用户输入的用户名和密码
        String userName = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());
        logger.info("【用户名为" +userName +"的用户开始登陆" +"】");
        // 通过用户名到数据库查询用户信息
        User user = userMapper.userFindByName(userName);
        if (user == null) {
            logger.error("【用户名或密码错误】");
            throw new UnknownAccountException("用户名或密码错误！");
        }
        if (!password.equals(user.getPassword())) {
            logger.error("【用户名或密码错误】");
            throw new IncorrectCredentialsException("用户名或密码错误！");
        }
        if (user.getStatus().equals("0")) {
            logger.error("【用户名为" +userName +"的账号已被锁定】");
            throw new LockedAccountException("账号已被锁定,请联系管理员！");
        }
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, password, getName());
        return info;
    }
}
