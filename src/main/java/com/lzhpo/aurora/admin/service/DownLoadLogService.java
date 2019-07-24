package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.DownLoadLog;
import com.lzhpo.aurora.admin.entity.MyFile;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface DownLoadLogService {
    /**
     * 查看所有下载记录，分页查询。
     * @param start
     * @param limit
     * @return
     */
    List<DownLoadLog> findAll(@Param("start") int start, @Param("limit") int limit);

    /**
     * 根据文件名模糊查询
     * @param file_name
     * @return
     */
    List<MyFile> findFileLikeName(String file_name);

    /**
     * 统计条数
     * @return
     */
    int dllogCount();

    /**
     * 新增下载记录，下载之后自动保存在数据库中的内容。
     * @param downLoadLog
     */
    void addDlLog(DownLoadLog downLoadLog);

    /**
     * 单个删除
     * @param dllog_id
     */
    void delDllog(Integer dllog_id);

    /**
     * 批量删除
     * @param dllogIds
     */
    void batchDelDllog(String[] dllogIds);
}
