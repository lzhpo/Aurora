package com.lzhpo.aurora.admin.es.service;

import com.lzhpo.aurora.admin.entity.BlogArticle;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/7/23
 * @Description：
 */
public interface ESBlogArticleService {

    /**
     * 分页查询全部数据
     */
    List<BlogArticle> findAll(Pageable pageable);

    /**
     * 查询ES中的文章总数
     */
    Integer countAll();

    /**
     * 根据文章内容模糊查询分页查询ES中的文章全部数据
     */
    List<BlogArticle> findAllByContent(String content, Pageable pageable);

    /**
     * 根据文章内容模糊查询分页查询ES中的文章总数
     */
    Integer countAllByContent(String content);
}
