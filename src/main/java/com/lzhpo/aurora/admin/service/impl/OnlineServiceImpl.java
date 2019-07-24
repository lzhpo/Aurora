package com.lzhpo.aurora.admin.service.impl;


import com.lzhpo.aurora.admin.entity.OnlineUser;
import com.lzhpo.aurora.admin.entity.User;
import com.lzhpo.aurora.admin.service.OnlineService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.util.WebUtils;
import org.crazycake.shiro.RedisSessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 实时显示，不需要查询数据库，所以不需要放入Redis缓存。
 * </p>
 */
@Service
@Transactional
public class OnlineServiceImpl implements OnlineService {

    @Autowired
    private RedisSessionDAO RedisSessionDAO;

    @Override
    public List<OnlineUser> list() {
        List<OnlineUser> list = new ArrayList<>();
        Collection<Session> sessions = RedisSessionDAO.getActiveSessions();
        for (Session session : sessions) {
            OnlineUser userOnline = new OnlineUser();
            User user = new User();
            SimplePrincipalCollection principalCollection = new SimplePrincipalCollection();
            if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
                continue;
            } else {
                principalCollection = (SimplePrincipalCollection) session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
                user = (User) principalCollection.getPrimaryPrincipal();
                userOnline.setUsername(user.getUsername());
                userOnline.setUserId(user.getUser_id().toString());
            }
            userOnline.setId((String) session.getId());
            userOnline.setHost(session.getHost());
            userOnline.setStartTimestamp(session.getStartTimestamp());
            userOnline.setLastAccessTime(session.getLastAccessTime());
            userOnline.setTimeout(session.getTimeout()); //获取用户超时时间。当某个用户被踢出后（Session Time置为0），该Session并不会立刻从ActiveSessions中剔除，所以我们可以通过其timeout信息来判断该用户在线与否。
            userOnline.setStatus("在线");

            list.add(userOnline);
        }
        return list;
    }

    @Override
    public boolean forceLogout(String sessionId) {
        Session session = RedisSessionDAO.readSession(sessionId);
        session.setTimeout(0);
        session.stop();
        RedisSessionDAO.delete(session);
        return true;
    }
}
