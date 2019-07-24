package com.lzhpo.aurora.admin.mapper;

import com.lzhpo.aurora.admin.entity.Resources;

import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/7/14
 * @Description：
 */
public interface RoleResourcesMapper {

    /**
     * 获取未选中的数据，也就是取消的权限
     * 根据Resources中的节点id来查询Resources的主键id
     * 然后根据Resources的主键id来删除RoleRes中的对应数据。
     */
    void deleteRoleResById(Integer role_id, Integer res_id);

}
