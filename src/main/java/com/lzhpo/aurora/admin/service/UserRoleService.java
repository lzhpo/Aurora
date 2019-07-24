package com.lzhpo.aurora.admin.service;

/**
 * @Author：lzhpo
 * @Date：2019/7/14
 * @Description：
 */
public interface UserRoleService {
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
