package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.Log;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface LogService {
    /**
     * Aop自动保存操作日志
     * @param log
     */
    void saveLog(Log log);
    List<Log> logFindAll(@Param("start") int start, @Param("limit") int limit);

    /**
     * 根据方法名查询
     * @param operation
     * @return
     */
    List<Log> logFindByOprt(String operation, @Param("start") int start, @Param("limit") int limit);

    /**
     * 根据方法名查询总条数
     */
    Integer countFindByOprt(String operation);

    /**
     * 统计条数
     * @return
     */
    int logCount();

    /**
     * 批量删除
     */
    void batchDel(String[] ids);

    /**
     * 单个删除
     */
    void deleteById(Integer log_id);

}
