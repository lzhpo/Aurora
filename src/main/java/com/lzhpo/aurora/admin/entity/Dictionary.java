package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Data
public class Dictionary implements Serializable {

    private String schemaeName; //数据库名称
    private String tableName; //数据表名称
    private String columName; //字段名字
    private String columType; //类型
    private String culumComment; //注释

}
