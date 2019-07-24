package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Data
public class Role implements Serializable {

    private Integer role_id;

    private String role_name;

    private String description;

}
