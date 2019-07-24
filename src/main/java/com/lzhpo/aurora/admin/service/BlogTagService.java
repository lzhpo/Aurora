package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.BlogTag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/6/16
 * @Description：
 */
public interface BlogTagService {

    /**
     * 分页查询
     * @param start
     * @param limit
     * @return
     */
    List<BlogTag> selectByLimit(@Param("start") int start, @Param("limit") int limit);

    /**
     * 标签的模糊查询
     */
    List<BlogTag> selectByLikeName(String tagName, @Param("start") int start, @Param("limit") int limit);

    /**
     * 标签的模糊查询总条数
     */
    Integer countByLikeName(String tagName);

    /**
     * 统计总条数
     * @return
     */
    int count();

    /**
     * 查询全部
     * @return
     */
    List<BlogTag> selectAll();

    /**
     * 删除
     * @param tagId
     * @return
     */
    void deleteById(Integer tagId);

    /**
     * 新增
     * @param record
     * @return
     */
    void insert(BlogTag blogTag);

    /**
     * 批量删除
     */
    void batchDel(String[] ids);

    /**
     * 根据id查询
     * @param tagId
     * @return
     */
    BlogTag selectById(Integer tagId);

    /**
     * 修改
     * @param blogTag
     * @return
     */
    void updateById(BlogTag blogTag);

}
