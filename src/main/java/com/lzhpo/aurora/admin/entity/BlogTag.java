package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author：lzhpo
 * @Date：2019/06/16
 * @Description：博客标签
 */
@Data
public class BlogTag implements Serializable {
    /**
     * 标签id
     */
    private Integer tagId;

    /**
     * 标签名字
     */
    private String tagName;

}