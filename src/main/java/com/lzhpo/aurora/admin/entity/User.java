package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Data
public class User implements Serializable {

    private Integer user_id;

    private String username;

    private String password;

    private String email;

    private Integer sex; //性别，1表示男，0表示女

    private Integer status; //用户状态，0为禁用，1为正常使用

}
