package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.entity.BlogArticle;
import com.lzhpo.aurora.admin.mapper.BlogArticleMapper;
import com.lzhpo.aurora.admin.service.BlogArticleService;
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
public class BlogArticleServiceImpl implements BlogArticleService {

    @Autowired
    private BlogArticleMapper blogArticleMapper;

    @Override
    @Cacheable(cacheNames = "blogArticle")
//    @CachePut(cacheNames = "blogArticle",unless="#result == null") //因为统计所有条数的话，基于我使用的layui，加上业务需求，我的做法是使用@CachePut，每次查询的结果都放Redis缓存中进去。
    public int count() {
        return blogArticleMapper.count();
    }

    @Override
    @Cacheable(cacheNames = "blogArticle")
    public List<BlogArticle> selectByLimit(int start, int limit) {
        return blogArticleMapper.selectByLimit(start, limit);
    }

    @Override
    @Cacheable(cacheNames = "blogArticle")
    public List<BlogArticle> selectByLikeContent(String content, int start, int limit) {
        return blogArticleMapper.selectByLikeContent(content, start, limit);
    }

    @Override
    @Cacheable(cacheNames = "blogArticle")
    public Integer countByLikeContent(String content) {
        return blogArticleMapper.countByLikeContent(content);
    }

    @Override
    @CachePut(cacheNames = "blogArticle",unless="#result == null")
    public void addBlog(BlogArticle blogArticle) {
        blogArticleMapper.addBlog(blogArticle);
    }

    @Override
    @CacheEvict(cacheNames = "blogArticle",allEntries = true)
    public void delBlog(Integer blogId) {
        blogArticleMapper.delBlog(blogId);
    }

    @Override
    @CacheEvict(cacheNames = "blogArticle",allEntries = true)
    public void batchDelBlog(String[] ids) {
        blogArticleMapper.batchDelBlog(ids);
    }

    @Override
    @CacheEvict(cacheNames = "blogArticle",allEntries = true)
    public void updateBlog(BlogArticle blogArticle) {
        blogArticleMapper.updateBlog(blogArticle);
    }

    @Override
    @Cacheable(cacheNames = "blogArticle")
    public BlogArticle selectById(Integer blogId) {
        return blogArticleMapper.selectById(blogId);
    }
}
