package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Data
public class UpdateLog implements Serializable {

    private Integer updatelog_id;

    private Date create_date;

    private String description;
}
