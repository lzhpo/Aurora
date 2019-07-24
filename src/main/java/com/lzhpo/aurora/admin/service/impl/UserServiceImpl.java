package com.lzhpo.aurora.admin.service.impl;


import com.lzhpo.aurora.admin.entity.User;
import com.lzhpo.aurora.admin.mapper.UserMapper;
import com.lzhpo.aurora.admin.service.UserService;
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
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    @Cacheable(cacheNames = "user")
    public List userFindAll(int start, int limit) {
        return userMapper.userFindAll(start, limit);
    }

    @Override
    public User userFindByName(String username) {
        return userMapper.userFindByName(username);
    }

    @Override
    @Cacheable(cacheNames = "user")
    public List userFindLikeName(String username) {
        return userMapper.userFindLikeName(username);
    }

    @Override
    @CachePut(cacheNames = "user", unless="#result == null")
    public int userCount() {
        return userMapper.userCount();
    }

    @Override
    @CacheEvict(cacheNames = "user", allEntries = true)
    public void batchDel(String[] ids) {
        userMapper.batchDel(ids);
    }

    @Override
    @CacheEvict(cacheNames = "user", allEntries = true)
    public void deleteById(Integer user_id) {
        userMapper.deleteById(user_id);
    }

    @Override
    @CachePut(cacheNames = "user", unless="#result == null")
    public void userAdd(User user) {
        userMapper.userAdd(user);
    }

    @Override
    @CacheEvict(cacheNames = "user", allEntries = true)
    public void userEdit(User user) {
        userMapper.userEdit(user);
    }

    @Override
    @CacheEvict(cacheNames = "user", allEntries = true)
    public void updateSexAndStatus(Integer user_id, Integer sex, Integer status) {
        userMapper.updateSexAndStatus(user_id, sex, status);
    }
}
