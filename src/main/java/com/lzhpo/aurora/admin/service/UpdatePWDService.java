package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.User;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface UpdatePWDService {

    //修改密码
    void updatePWD(User user);

    //根据id查询用户
    String findById(Integer id);
}
