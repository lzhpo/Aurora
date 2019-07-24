package com.lzhpo.aurora.admin.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author：lzhpo
 * @Date：2019/06/16
 * @Description：博客分类
 */
@Data
public class BlogType implements Serializable {
    /**
     * 博客分类
     */
    private Integer typeId;

    /**
     * 分类名字
     */
    private String typeName;

}