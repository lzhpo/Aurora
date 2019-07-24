package com.lzhpo.aurora.admin.es.repository;

import com.lzhpo.aurora.admin.entity.BlogArticle;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchCrudRepository;

import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/7/23
 * @Description：
 * 文章内容存入ES的接口。
 */
public interface BlogArticleRepository extends ElasticsearchCrudRepository<BlogArticle, Integer> {

    /**
     * 分页查询全部数据
     */
    Page<BlogArticle> findAll(Pageable pageable);

    /**
     * 根据文章内容模糊查询分页查询ES中的文章全部数据
     */
    List<BlogArticle> findAllByContent(String content, Pageable pageable);

    /**
     * 根据文章内容模糊查询分页查询ES中的文章总数
     */
    Integer countAllByContent(String content);

}
