package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.Dictionary;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：MySQL字典</p>
 */
public interface DictionaryService {
    /**
     * 查询所有
     * @param start
     * @param limit
     * @return
     */
    List<Dictionary> findAll(@Param("start") int start, @Param("limit") int limit);

    /**
     * 根据字段名称模糊查询
     * @param tableName
     * @return
     */
    List<Dictionary> findLikeColumName(String tableName, @Param("start") int start, @Param("limit") int limit);

    /**
     * 根据字段名称模糊查询总条数
     * @param tableName
     * @return
     */
    Integer countLikeColumName(String tableName);

    /**
     * 统计条数
     * @return
     */
    int count();
}
