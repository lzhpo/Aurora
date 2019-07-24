package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.OnlineUser;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface OnlineService {
    List<OnlineUser> list();
    boolean forceLogout(String sessionId);
}
