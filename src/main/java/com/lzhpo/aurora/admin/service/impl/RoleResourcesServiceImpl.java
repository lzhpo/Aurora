package com.lzhpo.aurora.admin.service.impl;

import com.lzhpo.aurora.admin.entity.Resources;
import com.lzhpo.aurora.admin.mapper.RoleResourcesMapper;
import com.lzhpo.aurora.admin.service.RoleResourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/7/14
 * @Description：
 */
@Service
@Transactional
public class RoleResourcesServiceImpl implements RoleResourcesService {

    @Autowired
    private RoleResourcesMapper roleResourcesMapper;

    @Override
    public void deleteRoleResById(Integer role_id, Integer res_id) {
        roleResourcesMapper.deleteRoleResById(role_id, res_id);
    }
}
