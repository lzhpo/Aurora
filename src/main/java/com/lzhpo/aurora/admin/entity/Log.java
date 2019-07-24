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
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 日志记录实体类
 *
 -@Document：
         indexName： 索引名称
         type：索引类型
         shards：分片的数量
         replicas：副本的数量
         refreshInterval： 刷新间隔
         indexStoreType：索引文件存储类型
 -@Field：
         analyzer：指定分词器，es中默认使用的标准分词器，比如我们需要指定中文IK分词器，可以指定值为ik_max_word
         type： 指定该属性在es中的类型，其中的值是FileType类型的值，比如FileType.Text类型对应es中的text类型
         index：指定该词是否需要索引，默认为true
         store：指定该属性内容是否需要存储，默认为false
         fielddata ：指定该属性能否进行排序，因为es中的text类型是不能进行排序（已经分词了）
         searchAnalyzer ： 指定搜索使用的分词器
 -@Id：主键注解，标识一个属性为主键

 * </p>
 */
@Data
@Document(indexName = "aurora_log", type = "log") //必须小写
public class Log implements Serializable {

    /**
     * 日志的主键id
     */
    @Id
    @Field(type = FieldType.Integer, store = true)
    private Integer log_id;

    /**
     * 用户名
     */
    @Field(type = FieldType.Text, store = true, analyzer = "ik_smart")
    private String username;

    /**
     * 操作名称
     */
    @Field(type = FieldType.Text, store = true, analyzer = "ik_smart")
    private String operation;

    /**
     * 方法名
     */
    @Field(type = FieldType.Text, store = true, analyzer = "ik_smart")
    private String method;

    /**
     * 参数
     */
    @Field(type = FieldType.Text, store = true, analyzer = "ik_smart")
    private String params;

    /**
     * 耗时
     */
    @Field(type = FieldType.Text, store = true)
    private String dotime;

    /**
     * ip地址
     */
    @Field(type = FieldType.Text, store = true)
    private String ip;

    /**
     * 日期格式化，不然存入的ES的时间就是："createDate": 1562691952469 这种格式。
     * jackson库在转换为json的时候，将Date类型转为为了long型的字符串表示。我们使用@JsonFormat注解改变格式化的结果
     */
    @Field(type = FieldType.Date, format = DateFormat.custom,pattern = "yyyy-MM-dd HH:mm:ss", store = true)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern ="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date create_time; //操作时间

}
