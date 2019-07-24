package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface RoleService {
    /**
     * 查询全部
     * @param start
     * @param limit
     * @return
     */
    List<Role> roleFindAll(@Param("start") int start, @Param("limit") int limit);

    /**
     * 根据description关键字模糊查询角色
     * @param description
     * @return
     */
    List<Role> roleLikeDesc(String description, @Param("start") int start, @Param("limit") int limit);

    /**
     * 根据description关键字模糊查询角色条数
     */
    Integer countLikeDesc(String description);

    /**
     * 查询总条数
     * @return
     */
    int roleCount();

    /**
     * 批量删除
     */
    void batchDel(String[] ids);

    /**
     * 单个删除
     */
    void deleteOne(Integer role_id);

    /**
     * 添加
     */
    void addRole(Role role);

    /**
     * 编辑
     */
    void editRole(Role role);

    /**
     * 查询所有角色
     */
    List<Role> findAllRole();

}
