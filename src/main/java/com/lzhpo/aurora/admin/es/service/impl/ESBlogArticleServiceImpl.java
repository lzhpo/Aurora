package com.lzhpo.aurora.admin.es.service.impl;

import com.lzhpo.aurora.admin.entity.BlogArticle;
import com.lzhpo.aurora.admin.es.repository.BlogArticleRepository;
import com.lzhpo.aurora.admin.es.service.ESBlogArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/7/23
 * @Description：
 */
@Service
public class ESBlogArticleServiceImpl implements ESBlogArticleService {

    @Autowired
    private BlogArticleRepository blogArticleRepository;

    @Override
    public List<BlogArticle> findAll(Pageable pageable) {
        ArrayList<BlogArticle> blogArticleArrayList = new ArrayList<>();
        Page<BlogArticle> blogArticlePage = blogArticleRepository.findAll(pageable);
        blogArticlePage.forEach(blogArticleArrayList::add);
        return blogArticleArrayList;
    }

    @Override
    public Integer countAll() {
        long count = blogArticleRepository.count();
        Integer countBlogArticle = Integer.parseInt(String.valueOf(count));
        return countBlogArticle;
    }

    @Override
    public List<BlogArticle> findAllByContent(String content, Pageable pageable) {
        return blogArticleRepository.findAllByContent(content, pageable);
    }

    @Override
    public Integer countAllByContent(String content) {
        return blogArticleRepository.countAllByContent(content);
    }
}
