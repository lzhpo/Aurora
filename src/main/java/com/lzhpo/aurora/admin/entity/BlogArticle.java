package com.lzhpo.aurora.admin.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.DateFormat;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author：lzhpo
 * @Date：2019/06/16
 * @Description：博客文章
 */
@Data
@Document(indexName = "aurora_blog", type = "article")
public class BlogArticle implements Serializable {
    /**
     * 博客id
     */
    @Id
    @Field(type = FieldType.Integer, store = true)
    private Integer blogId;

    /**
     * 博客标题
     */
    @Field(type = FieldType.Text, store = true)
    private String title;

    /**
     * 博客封面图链接
     */
    @Field(type = FieldType.Text, store = true)
    private String coverImg;

    /**
     * 博客描述
     */
    @Field(type = FieldType.Text, store = true, analyzer = "ik_smart")
    private String description;

    /**
     * 博客标签
     */
    @Field(type = FieldType.Text, store = true)
    private String tags;

    /**
     * 博客分类
     */
    @Field(type = FieldType.Text, store = true)
    private String type;

    /**
     * 博客创建时间
     */
    @Field(type = FieldType.Date, format = DateFormat.custom,pattern = "yyyy-MM-dd HH:mm:ss", store = true)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern ="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createDate;

    /**
     * 作者
     */
    @Field(type = FieldType.Text, store = true)
    private String author;

    /**
     * 博客内容
     */
    @Field(type = FieldType.Text, store = true, analyzer = "ik_smart")
    private String content;

}