package com.lzhpo.aurora.admin.service;

import com.lzhpo.aurora.admin.entity.MyFile;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface MyFileService {

    //查询所有文件
    List<MyFile> findAllFile();

    /**
     * 根据文件名模糊查询
     */
    List<MyFile> findFileLikeName(String file_name, @Param("start") int start, @Param("limit") int limit);

    /**
     * 根据文件名模糊查询总条数
     */
    Integer countFileLikeName(String file_name);

    //修改文件（修改文件名）
    void updateFile(MyFile myFile);

    //分页查询
    List<MyFile> findFilePage(@Param("start") int start, @Param("limit") int limit);

    //根据id删除文件
    void deleteOne(Integer file_id);

    /**
     * 批量删除
     * @param ids
     */
    void batchDel(String[] ids);

    //统计条数
    int fileCount();

    //将文件信息保存到数据库
    void saveFile(MyFile file);
}
