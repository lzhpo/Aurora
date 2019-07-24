package com.lzhpo.aurora.admin.mapper;

import com.lzhpo.aurora.admin.entity.Log;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface LogMapper {
    //apo自动插入操作日志
    void saveLog(Log log);
    List<Log> logFindAll(@Param("start") int start, @Param("limit") int limit);
    //根据方法名查询
    List<Log> logFindByOprt(String operation);
    //统计条数
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
