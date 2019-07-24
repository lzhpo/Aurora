package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author：lzhpo
 * @Date：2019/07/20
 * @Description：
 */
@Data
public class Email implements Serializable {
    /**
     * 邮件id
     */
    private Integer emailId;

    /**
     * 标题
     */
    private String title;

    /**
     * 发送时间
     */
    private Date sendDate;

    /**
     * 发送人
     */
    private String username;

    /**
     * 邮件内容
     */
    private String content;

}