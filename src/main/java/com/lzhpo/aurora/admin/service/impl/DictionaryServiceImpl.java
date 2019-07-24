package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.entity.Dictionary;
import com.lzhpo.aurora.admin.mapper.DictionaryMapper;
import com.lzhpo.aurora.admin.service.DictionaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Service
@Transactional
public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    private DictionaryMapper dictionaryMapper;

    @Override
    @Cacheable(cacheNames = "dictionary")
    public List<Dictionary> findAll(int start, int limit) {
        return dictionaryMapper.findAll(start, limit);
    }

    @Override
    @Cacheable(cacheNames = "dictionary")
    public List<Dictionary> findLikeColumName(String columName) {
        return dictionaryMapper.findLikeColumName(columName);
    }

    @Override
    @CachePut(cacheNames = "dictionary", unless="#result == null")
    public int count() {
        return dictionaryMapper.count();
    }
}
