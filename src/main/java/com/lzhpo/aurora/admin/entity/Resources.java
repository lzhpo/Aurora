package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Data
public class Resources implements Serializable {

    private Integer resources_id;

    private String resources_name;

    private String url;

    private String type;

    private String permission;

    private Integer id;

    private Integer pid;

}
