package com.lzhpo.aurora.admin.customMyGenerator;

import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.dom.java.Field;
import org.mybatis.generator.api.dom.java.TopLevelClass;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 继承我自定义的MyCommentGenerator方法，获取数据库的表注释以及字段注释。
 * </p>
 */
public class MySQLCommentGenerator extends MyCommentGenerator {

    private Properties properties;

    public MySQLCommentGenerator() {
        properties = new Properties();
    }

    @Override
    public void addConfigurationProperties(Properties properties) {
        // 获取自定义的 properties
        this.properties.putAll(properties);
    }

    /**
     * 自定义实体类的主注释
     * @param topLevelClass
     * @param introspectedTable
     */
    @Override
    public void addModelClassComment(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        String author = properties.getProperty("author");
        String dateFormat = properties.getProperty("dateFormat", "yyyy-MM-dd");
        SimpleDateFormat dateFormatter = new SimpleDateFormat(dateFormat);

        // 获取表注释
        String remarks = introspectedTable.getRemarks();

        topLevelClass.addJavaDocLine("/**");
        topLevelClass.addJavaDocLine(" * @Author：" + author);
        topLevelClass.addJavaDocLine(" * @Date：" + dateFormatter.format(new Date()));
        topLevelClass.addJavaDocLine(" * @Description：" + remarks);
        topLevelClass.addJavaDocLine(" */");
    }

    /**
     * 自定义实体类的列注释
     * @param field
     * @param introspectedTable
     * @param introspectedColumn
     */
    @Override
    public void addFieldComment(Field field, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn) {
        // 获取列注释
        String remarks = introspectedColumn.getRemarks();
        field.addJavaDocLine("/**");
        field.addJavaDocLine(" * " + remarks);
        field.addJavaDocLine(" */");
    }
}
