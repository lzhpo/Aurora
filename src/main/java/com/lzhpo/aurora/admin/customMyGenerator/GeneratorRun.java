package com.lzhpo.aurora.admin.customMyGenerator;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 使用java代码运行mybatis-generator
 * </p>
 */
public class GeneratorRun {

    public static void main( String[] args ) throws Exception {

        List<String> warnings = new ArrayList<>();
        //generatorConfig.xml所在的位置，相对路径和绝对路径都可以。
        File configFile = new File("src/main/resources/generator/generatorConfig.xml");
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(true);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
        myBatisGenerator.generate(null);
    }

}
