package com.lzhpo.aurora.admin.mapper;

import com.lzhpo.aurora.admin.entity.Role;
import com.lzhpo.aurora.admin.entity.UserRole;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface UserRoleMapper {

    //查询用户角色
    List<Role> findByUserName(String username);

    /**
     * 给用户赋予角色
     */
    void addUserRole(Integer user_id, Integer role_id);

    /**
     * 根据用户id查询角色id
     */
    Integer findRoleIdByUserId(Integer user_id);

    /**
     * 修改用户的角色
     */
    void updateUserRole(Integer user_id, Integer role_id);
}
