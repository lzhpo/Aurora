package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.entity.BlogTag;
import com.lzhpo.aurora.admin.entity.BlogType;
import com.lzhpo.aurora.admin.mapper.BlogTagMapper;
import com.lzhpo.aurora.admin.service.BlogTagService;
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
public class BlogTagServiceImpl implements BlogTagService {

    @Autowired
    private BlogTagMapper blogTagMapper;

    @Override
    @Cacheable(cacheNames = "blogTag")
    public List<BlogTag> selectByLimit(int start, int limit) {
        return blogTagMapper.selectByLimit(start, limit);
    }

    @Override
    @Cacheable(cacheNames = "blogTag")
    public List<BlogTag> selectByLikeName(String tagName, int start, int limit) {
        return blogTagMapper.selectByLikeName(tagName, start, limit);
    }

    @Override
    @Cacheable(cacheNames = "blogTag")
    public Integer countByLikeName(String tagName) {
        return blogTagMapper.countByLikeName(tagName);
    }

    @Override
    @Cacheable(cacheNames = "blogTag")
    public int count() {
        return blogTagMapper.count();
    }

    @Override
    @Cacheable(cacheNames = "blogTag")
    public List<BlogTag> selectAll() {
        return blogTagMapper.selectAll();
    }

    @Override
    @CacheEvict(cacheNames = "blogTag",allEntries = true)
    public void deleteById(Integer tagId) {
        blogTagMapper.deleteById(tagId);
    }

    @Override
    @CachePut(cacheNames = "blogTag",unless="#result == null")
    public void insert(BlogTag blogTag) {
        blogTagMapper.insert(blogTag);
    }

    @Override
    @CacheEvict(cacheNames = "blogTag",allEntries = true)
    public void batchDel(String[] ids) {
        blogTagMapper.batchDel(ids);
    }

    @Override
    @Cacheable(cacheNames = "blogTag")
    public BlogTag selectById(Integer tagId) {
        return blogTagMapper.selectById(tagId);
    }

    @Override
    @CacheEvict(cacheNames = "blogTag",allEntries = true)
    public void updateById(BlogTag blogTag) {
        blogTagMapper.updateById(blogTag);
    }
}
