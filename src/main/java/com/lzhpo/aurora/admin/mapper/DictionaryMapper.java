package com.lzhpo.aurora.admin.mapper;

import com.lzhpo.aurora.admin.entity.Dictionary;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：MySQL字典</p>
 */
public interface DictionaryMapper {
    //查询所有
    List<Dictionary> findAll(@Param("start") int start, @Param("limit") int limit);
    //根据字段名称模糊查询
    List<Dictionary> findLikeColumName(String columName);
    //统计条数
    int count();
}
