package com.lzhpo.aurora.admin.util;

import lombok.Data;

import java.io.Serializable;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * authortree权限树格式化
 * </p>
 */
@Data
public class AuthorTree {

    private Integer code = 0;
    private Object data;
    private String msg = "";

}
