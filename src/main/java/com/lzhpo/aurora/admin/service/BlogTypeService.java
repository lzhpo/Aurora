package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.BlogType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/6/16
 * @Description：
 */
public interface BlogTypeService {

    /**
     * 分页查询
     * @param start
     * @param limit
     * @return
     */
    List<BlogType> selectByLimit(@Param("start") int start, @Param("limit") int limit);

    /**
     * 模糊查询，根据type_name
     * @param tpyeName
     * @return
     */
    List<BlogType> selectByLikeName(String tpyeName);

    /**
     * 统计所有条数
     * @return
     */
    int count();

    /**
     * 查看全部
     * @return
     */
    List<BlogType> selectAll();

    /**
     * 新增
     */
    void addType(BlogType blogType);

    /**
     * 批量删除
     * @param ids
     */
    void batchDel(String[] ids);

    /**
     * 单个删除
     * @param typeId
     * @return
     */
    void delOne(Integer typeId);

    /**
     * 更新
     * @param blogType
     * @return
     */
    void update(BlogType blogType);
}
