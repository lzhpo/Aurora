package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.entity.MyFile;
import com.lzhpo.aurora.admin.mapper.MyFileMapper;
import com.lzhpo.aurora.admin.service.MyFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
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
public class MyFileServiceImpl implements MyFileService {

    @Autowired
    private MyFileMapper MyFileMapper;

    @Override
    @Cacheable(cacheNames = "file")
    public List<MyFile> findAllFile() {
        return MyFileMapper.findAllFile();
    }

    @Override
    @Cacheable(cacheNames = "file")
    public List<MyFile> findFileLikeName(String file_name, int start, int limit) {
        return MyFileMapper.findFileLikeName(file_name, start, limit);
    }

    @Override
    @Cacheable(cacheNames = "file")
    public Integer countFileLikeName(String file_name) {
        return MyFileMapper.countFileLikeName(file_name);
    }

    @Override
    @CacheEvict(cacheNames = "file", allEntries = true)
    public void updateFile(MyFile myFile) {
        MyFileMapper.updateFile(myFile);
    }

    @Override
    @Cacheable(cacheNames = "file")
    public List<MyFile> findFilePage(int start, int limit) {
        return MyFileMapper.findFilePage(start, limit);
    }

    @Override
    @CacheEvict(cacheNames = "file", allEntries = true)
    public void deleteOne(Integer file_id) {
        MyFileMapper.deleteOne(file_id);
    }

    @Override
    @CacheEvict(cacheNames = "file", allEntries = true)
    public void batchDel(String[] ids) {
        MyFileMapper.batchDel(ids);
    }

    @Override
    @Cacheable(cacheNames = "file")
    public int fileCount() {
        return MyFileMapper.fileCount();
    }

    @Override
    @CachePut(cacheNames = "file", unless="#result == null")
    public void saveFile(MyFile file) {
        MyFileMapper.saveFile(file);
    }

}
