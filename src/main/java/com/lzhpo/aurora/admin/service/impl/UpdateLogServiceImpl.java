package com.lzhpo.aurora.admin.service.impl;


import com.lzhpo.aurora.admin.entity.UpdateLog;
import com.lzhpo.aurora.admin.mapper.UpdateLogMapper;
import com.lzhpo.aurora.admin.service.UpdateLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 *
 * @Cacheable：
 *          先查Redis缓存，Redis缓存中有，则从Redis中获取，没有就查数据库，查出来放进Redis缓存中。
 *
 * @CacheEvict：
 *          用来标注在需要清除缓存元素的方法或类上的。
 *          当标记在一个类上时表示其中所有的方法的执行都会触发缓存的清除操作。
 *
 * @CachePut：
 *          每次都会执行该方法，并将执行结果以键值对的形式存入指定的缓存中。
 *
 * 我的做法以及思路：
 *          添加和统计条数使用 @CachePut(cacheNames = "UpdateLog",unless="#result == null")
 *          更新删除使用 @CacheEvict(cacheNames = "UpdateLog", allEntries = true)
 *          查询都是用 @Cacheable(cacheNames = "UpdateLog")
 * </p>
 */
@Service
@Transactional
public class UpdateLogServiceImpl implements UpdateLogService {

    @Autowired
    private UpdateLogMapper updateLogMapper;

    @Override
    @Cacheable(cacheNames = "updateLog")
    public List getUpdateLog(int start, int limit) {
        return updateLogMapper.getUpdateLog(start, limit);
    }

    @Override
    @Cacheable(cacheNames = "updateLog")
    public List getUpdateLogByDesc(String desc) {
        return updateLogMapper.getUpdateLogByDesc(desc);
    }

    @Override
    @CacheEvict(cacheNames = "updateLog", allEntries = true)
    public void deleteUpdateLogByID(Integer id) {
        updateLogMapper.deleteUpdateLogByID(id);
    }

    @Override
    @CachePut(cacheNames = "updateLog", unless="#result == null") //放入listUpdatelog，不缓存空值
    public void addUpdateLogData(UpdateLog updateLog) {
        updateLogMapper.addUpdateLogData(updateLog);
    }

    @Override
    @CacheEvict(cacheNames = "updateLog", allEntries = true)
    public void batchDelete(String[] ids) {
        updateLogMapper.batchDelete(ids);
    }

    @Override
    @CacheEvict(cacheNames = "updateLog", allEntries = true)
    public void editUpdateLogById(UpdateLog updateLog) {
        updateLogMapper.editUpdateLogById(updateLog);
    }

    @Override
    @CachePut(cacheNames = "updateLog", unless="#result == null") //因为统计所有条数的话，基于我使用的layui，加上业务需求，我的做法是使用@CachePut，每次查询的结果都放Redis缓存中进去。
    public int UpdateLogCount() {
        return updateLogMapper.UpdateLogCount();
    }
}
