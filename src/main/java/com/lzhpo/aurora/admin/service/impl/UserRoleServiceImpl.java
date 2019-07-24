package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.mapper.UserRoleMapper;
import com.lzhpo.aurora.admin.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author：lzhpo
 * @Date：2019/7/14
 * @Description：
 */
@Service
@Transactional
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public void addUserRole(Integer user_id, Integer role_id) {
        userRoleMapper.addUserRole(user_id, role_id);
    }

    @Override
    public Integer findRoleIdByUserId(Integer user_id) {
        return userRoleMapper.findRoleIdByUserId(user_id);
    }

    @Override
    public void updateUserRole(Integer user_id, Integer role_id) {
        userRoleMapper.updateUserRole(user_id, role_id);
    }
}
