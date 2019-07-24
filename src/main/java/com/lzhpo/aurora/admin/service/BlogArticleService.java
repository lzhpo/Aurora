package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.BlogArticle;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/6/16
 * @Description：
 */
public interface BlogArticleService {
    /**
     * 查询总记录数
     * @return
     */
    int count();

    /**
     * 分页查询
     * @param start
     * @param limit
     * @return
     */
    List<BlogArticle> selectByLimit(@Param("start") int start, @Param("limit") int limit);

    /**
     * 根据博客内容模糊查询
     */
    List<BlogArticle> selectByLikeContent(String content, @Param("start") int start, @Param("limit") int limit);

    /**
     * 根据博客内容模糊查询的总条数
     */
    Integer countByLikeContent(String content);

    /**
     * 添加博客
     */
    void addBlog(BlogArticle blogArticle);

    /**
     * 单个删除
     */
    void delBlog(Integer blogId);

    /**
     * 批量删除
     */
    void batchDelBlog(String[] ids);

    /**
     * 更新博客
     */
    void updateBlog(BlogArticle blogArticle);

    /**
     * 根据id查询
     */
    BlogArticle selectById(Integer blogId);
}
