package com.lzhpo.aurora.admin.service.impl;


import com.lzhpo.aurora.admin.entity.Role;
import com.lzhpo.aurora.admin.mapper.RoleMapper;
import com.lzhpo.aurora.admin.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    @Cacheable(cacheNames = "role")
    public List<Role> roleFindAll(int start, int limit) {
        return roleMapper.roleFindAll(start, limit);
    }

    @Override
    @Cacheable(cacheNames = "role")
    public List<Role> roleLikeDesc(String description, int start, int limit) {
        return roleMapper.roleLikeDesc(description, start, limit);
    }

    @Override
    @Cacheable(cacheNames = "role")
    public Integer countLikeDesc(String description) {
        return roleMapper.countLikeDesc(description);
    }

    @Override
    @Cacheable(cacheNames = "role")
    public int roleCount() {
        return roleMapper.roleCount();
    }

    @Override
    @CacheEvict(cacheNames = "role", allEntries = true)
    public void batchDel(String[] ids) {
        roleMapper.batchDel(ids);
    }

    @Override
    @CacheEvict(cacheNames = "role", allEntries = true)
    public void deleteOne(Integer role_id) {
        roleMapper.deleteOne(role_id);
    }

    @Override
    @CachePut(cacheNames = "role", unless="#result == null")
    public void addRole(Role role) {
        roleMapper.addRole(role);
    }

    @Override
    @CacheEvict(cacheNames = "role", allEntries = true)
    public void editRole(Role role) {
        roleMapper.editRole(role);
    }

    @Override
    @Cacheable(cacheNames = "role")
    public List<Role> findAllRole() {
        return roleMapper.findAllRole();
    }

}
