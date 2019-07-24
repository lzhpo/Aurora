package com.lzhpo.aurora.admin.mapper;


import com.lzhpo.aurora.admin.entity.Resources;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface UserResourcesMapper {

    //查询用户权限
    List<Resources> findByUserName(String username);
}
