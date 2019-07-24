package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.entity.Email;
import com.lzhpo.aurora.admin.mapper.EmailMapper;
import com.lzhpo.aurora.admin.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/7/20
 * @Description：
 */
@Service
@Transactional
public class EmailServiceImpl implements EmailService {

    @Autowired
    private EmailMapper emailMapper;

    @Override
    @Cacheable(cacheNames = "email")
    public List<Email> findEmailByPage(int start, int limit) {
        return emailMapper.findEmailByPage(start, limit);
    }

    @Override
    @Cacheable(cacheNames = "email")
    public List<Email> findEmailLikeContent(String content) {
        return emailMapper.findEmailLikeContent(content);
    }

    @Override
    @CachePut(cacheNames = "email", unless="#result == null")
    public int emailCount() {
        return emailMapper.emailCount();
    }

    @Override
    @CachePut(cacheNames = "email", unless="#result == null")
    public void addEmail(Email email) {
        emailMapper.addEmail(email);
    }

    @Override
    @CacheEvict(cacheNames = "email", allEntries = true)
    public void delEmail(Integer emailId) {
        emailMapper.delEmail(emailId);
    }

    @Override
    @CacheEvict(cacheNames = "email", allEntries = true)
    public void batchDelEmail(String[] emailIds) {
        emailMapper.batchDelEmail(emailIds);
    }
}
