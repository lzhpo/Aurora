package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.entity.BlogType;
import com.lzhpo.aurora.admin.mapper.BlogTypeMapper;
import com.lzhpo.aurora.admin.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/6/16
 * @Description：
 */
@Service
@Transactional
public class BlogTypeServiceImpl implements BlogTypeService {

    @Autowired
    private BlogTypeMapper blogTypeMapper;

    @Override
    @Cacheable(cacheNames = "blogType")
    public List<BlogType> selectByLimit(int start, int limit) {
        return blogTypeMapper.selectByLimit(start, limit);
    }

    @Override
    @Cacheable(cacheNames = "blogType")
    public List<BlogType> selectByLikeName(String tpyeName) {
        return blogTypeMapper.selectByLikeName(tpyeName);
    }

    @Override
    @CachePut(cacheNames = "blogType",unless="#result == null")
    public int count() {
        return blogTypeMapper.count();
    }

    @Override
    @Cacheable(cacheNames = "blogType")
    public List<BlogType> selectAll() {
        return blogTypeMapper.selectAll();
    }

    @Override
    @CachePut(cacheNames = "blogType",unless="#result == null")
    public void addType(BlogType blogType) {
        blogTypeMapper.addType(blogType);
    }

    @Override
    @CacheEvict(cacheNames = "blogType", allEntries = true)
    public void batchDel(String[] ids) {
        blogTypeMapper.batchDel(ids);
    }

    @Override
    @CacheEvict(cacheNames = "blogType", allEntries = true)
    public void delOne(Integer typeId) {
        blogTypeMapper.delOne(typeId);
    }

    @Override
    @CacheEvict(cacheNames = "blogType", allEntries = true)
    public void update(BlogType blogType) {
        blogTypeMapper.update(blogType);
    }
}
