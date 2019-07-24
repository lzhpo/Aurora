package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface UserService {
    //查询全部
    List userFindAll(@Param("start") int start, @Param("limit") int limit);
    //根据用户名查询(登录)
    User userFindByName(String username);
    //根据用户名称模糊查询
    List userFindLikeName(String username);
    //统计所有条数
    int userCount();

    /**
     * 批量删除
     */
    void batchDel(String[] ids);

    /**
     * 单个删除
     */
    void deleteById(Integer user_id);

    /**
     * 添加
     */
    void userAdd(User user);

    /**
     * 修改
     */
    void userEdit(User user);

    /**
     * 修改性别和状态
     */
    void updateSexAndStatus(Integer user_id, Integer sex, Integer status);

}
