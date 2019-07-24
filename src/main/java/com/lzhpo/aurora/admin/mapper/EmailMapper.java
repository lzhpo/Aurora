package com.lzhpo.aurora.admin.mapper;


import com.lzhpo.aurora.admin.entity.Email;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmailMapper {

    /**
     * 分页查询全部数据
     * @param start
     * @param limit
     * @return
     */
    List<Email> findEmailByPage(@Param("start") int start, @Param("limit") int limit);

    /**
     * 根据邮件内容模糊查询
     */
    List<Email> findEmailLikeContent(String content, @Param("start") int start, @Param("limit") int limit);

    /**
     * 根据邮件内容模糊查询总条数
     */
    Integer countEmailLikeContent(String content);

    /**
     * 统计条数
     * @return
     */
    int emailCount();

    /**
     * 添加
     */
    void addEmail(Email email);

    /**
     * 删除一条
     */
    void delEmail(Integer emailId);

    /**
     * 批量删除
     */
    void batchDelEmail(String[] emailIds);

}