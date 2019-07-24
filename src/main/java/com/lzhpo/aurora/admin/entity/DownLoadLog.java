package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 下载记录实体类
 * </p>
 */
@Data
public class DownLoadLog implements Serializable {

    private Integer dllog_id; //下载id
    private String file_name; //下载文件名
    private Date dllog_date; //下载时间
    private String username; //谁下载的

}
