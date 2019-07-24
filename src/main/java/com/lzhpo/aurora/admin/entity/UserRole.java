package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author：lzhpo
 * @Date：2019/7/14
 * @Description：
 * 用户对应的角色：一对一
 */
@Data
public class UserRole implements Serializable {
    private Integer user_id;
    private Integer role_id;
}
