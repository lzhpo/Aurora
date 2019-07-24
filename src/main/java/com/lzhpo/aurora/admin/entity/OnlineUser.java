package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 在线用户实体类
 * </p>
 */
@Data
public class OnlineUser implements Serializable {

    // session id
    private String id;
    // 用户id
    private String userId;
    // 用户名称
    private String username;
    // 用户主机地址
    private String host;
    // 用户登录时系统IP
    private String systemHost;
    // 状态
    private String status;
    // session创建时间
    private Date startTimestamp;
    // session最后访问时间
    private Date lastAccessTime;
    // 超时时间
    private Long timeout;

}
