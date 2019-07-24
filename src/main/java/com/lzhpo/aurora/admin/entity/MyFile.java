package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Data
public class MyFile implements Serializable {

    private Integer file_id; //文件id
    private String file_name; //文件名
    private String file_path; //文件路径
    private double file_size; //文件大小

}
