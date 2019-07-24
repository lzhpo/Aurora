package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.UpdateLog;
import org.apache.ibatis.annotations.Param;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface UpdateLogService {

    /**
     * 查询所有更新记录
     * @param start
     * @param limit
     * @return
     */
    List<UpdateLog> getUpdateLog(@Param("start") int start, @Param("limit") int limit);

    /**
     * 通过description查询更新记录
     * @param description
     * @return
     */
    List<UpdateLog> getUpdateLogByDesc(String description, @Param("start") int start, @Param("limit") int limit);

    /**
     * 通过description查询更新记录总条数
     * @param description
     * @return
     */
    Integer countUpdateLogByDesc(String description);

    /**
     * 删除更新记录
     * @param id
     */
    void deleteUpdateLogByID(Integer id);

    /**
     * 新增更新记录
     * @param updateLog
     */
    void addUpdateLogData(UpdateLog updateLog);

    /**
     * 批量删除更新记录
     * @param ids
     */
    void batchDelete(String[] ids);

    /**
     * 编辑更新记录
     * @param updateLog
     */
    void editUpdateLogById(UpdateLog updateLog);

    /**
     * 查询总共有多少条数据
     * @return
     */
    int UpdateLogCount();

}
