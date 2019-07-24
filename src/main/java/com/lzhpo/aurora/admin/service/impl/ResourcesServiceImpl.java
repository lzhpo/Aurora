package com.lzhpo.aurora.admin.service.impl;


import com.lzhpo.aurora.admin.entity.Resources;
import com.lzhpo.aurora.admin.mapper.ResourcesMapper;
import com.lzhpo.aurora.admin.service.ResourcesService;
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
public class ResourcesServiceImpl implements ResourcesService {

    @Autowired
    private ResourcesMapper resourcesMapper;

    @Override
    @Cacheable(cacheNames = "resources")
    public List resourcesFindAll() {
        return resourcesMapper.resourcesFindAll();
    }

    @Override
    @Cacheable(cacheNames = "resources")
    public List resourcesFindLikeName(String resourcee_name) {
        return resourcesMapper.resourcesFindLikeName(resourcee_name);
    }

    @Override
    @CacheEvict(cacheNames = "resources", allEntries = true)
    public void resourcesDelOne(Integer resources_id) {
        resourcesMapper.resourcesDelOne(resources_id);
    }

    @Override
    @Cacheable(cacheNames = "resources")
    public int resourcesCount() {
        return resourcesMapper.resourcesCount();
    }

    @Override
    public List resourcesTree() {
        return resourcesMapper.resourcesTree();
    }

    @Override
    public void addRoleRes(Integer role_id, Integer res_id) {
        resourcesMapper.addRoleRes(role_id, res_id);
    }

    @Override
    public int findResIdByLeafId(Integer id) {
        return resourcesMapper.findResIdByLeafId(id);
    }

    @Override
    public List<Resources> findPowerByRoleId(Integer role_id) {
        return resourcesMapper.findPowerByRoleId(role_id);
    }

    @Override
    @CacheEvict(cacheNames = "resources", allEntries = true)
    public void batchDelNodeId(String[] ids) {
        resourcesMapper.batchDelNodeId(ids);
    }

    @Override
    @CacheEvict(cacheNames = "resources", allEntries = true)
    public void updateResources(Resources resources) {
        resourcesMapper.updateResources(resources);
    }

    @Override
    @CachePut(cacheNames = "resources", unless="#result == null")
    public void addResources(Resources resources) {
        resourcesMapper.addResources(resources);
    }

    @Override
    @CacheEvict(cacheNames = "resources", allEntries = true)
    public void batchDelByResourcesId(String[] ResourcesIds) {
        resourcesMapper.batchDelByResourcesId(ResourcesIds);
    }
}
