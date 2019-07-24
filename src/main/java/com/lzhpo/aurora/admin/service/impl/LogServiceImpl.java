package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.entity.Log;
import com.lzhpo.aurora.admin.mapper.LogMapper;
import com.lzhpo.aurora.admin.service.LogService;
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
public class LogServiceImpl implements LogService {

    @Autowired
    private LogMapper logMapper;

    @Override
    @CachePut(cacheNames = "log", unless="#result == null")
    public void saveLog(Log log) {
        logMapper.saveLog(log);
    }

    @Override
    @Cacheable(cacheNames = "log")
    public List<Log> logFindAll(int start, int limit) {
        return logMapper.logFindAll(start, limit);
    }

    @Override
    @Cacheable(cacheNames = "log")
    public List<Log> logFindByOprt(String operation, int start, int limit) {
        return logMapper.logFindByOprt(operation, start, limit);
    }

    @Override
    @Cacheable(cacheNames = "log")
    public Integer countFindByOprt(String operation) {
        return logMapper.countFindByOprt(operation);
    }

    @Override
    @Cacheable(cacheNames = "log")
    public int logCount() {
        return logMapper.logCount();
    }

    @Override
    @CacheEvict(cacheNames = "log", allEntries = true)
    public void batchDel(String[] ids) {
        logMapper.batchDel(ids);
    }

    @Override
    @CacheEvict(cacheNames = "log", allEntries = true)
    public void deleteById(Integer log_id) {
        logMapper.deleteById(log_id);
    }
}
