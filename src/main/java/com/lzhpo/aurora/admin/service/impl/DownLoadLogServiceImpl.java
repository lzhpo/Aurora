package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.entity.DownLoadLog;
import com.lzhpo.aurora.admin.entity.MyFile;
import com.lzhpo.aurora.admin.mapper.DownLoadLogMapper;
import com.lzhpo.aurora.admin.service.DownLoadLogService;
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
public class DownLoadLogServiceImpl implements DownLoadLogService {

    @Autowired
    private DownLoadLogMapper downLoadLogMapper;

    @Override
    @Cacheable(cacheNames = "dllog")
    public List<DownLoadLog> findAll(int start, int limit) {
        return downLoadLogMapper.findAll(start, limit);
    }

    @Override
    @Cacheable(cacheNames = "dllog")
    public List<MyFile> findFileLikeName(String file_name) {
        return downLoadLogMapper.findFileLikeName(file_name);
    }

    @Override
    @CachePut(cacheNames = "dllog", unless="#result == null")
    public int dllogCount() {
        return downLoadLogMapper.dllogCount();
    }

    @Override
    @CachePut(cacheNames = "dllog", unless="#result == null")
    public void addDlLog(DownLoadLog downLoadLog) {
        downLoadLogMapper.addDlLog(downLoadLog);
    }

    @Override
    @CacheEvict(cacheNames = "dllog", allEntries = true)
    public void delDllog(Integer dllog_id) {
        downLoadLogMapper.delDllog(dllog_id);
    }

    @Override
    @CacheEvict(cacheNames = "dllog", allEntries = true)
    public void batchDelDllog(String[] dllogIds) {
        downLoadLogMapper.batchDelDllog(dllogIds);
    }
}
