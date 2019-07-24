package com.lzhpo.aurora.admin.config;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.util.Properties;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * 验证码
 * </p>
 */
@Configuration
public class KaptchaConfig {

    @Bean
    public DefaultKaptcha getDefaultKaptcha() {
        com.google.code.kaptcha.impl.DefaultKaptcha defaultKaptcha = new com.google.code.kaptcha.impl.DefaultKaptcha();
        Properties properties = new Properties();
        // 是否有图片边框
        properties.setProperty("kaptcha.border", "no");
        // 边框颜色
        properties.setProperty("kaptcha.border.color", "105,179,90");
        // 字体颜色
        properties.setProperty("kaptcha.textproducer.font.color", "blue");
        // 图片宽
        properties.setProperty("kaptcha.image.width", "120");
        // 图片高
        properties.setProperty("kaptcha.image.height", "50");
        // 字体大小
        properties.setProperty("kaptcha.textproducer.font.size", "35");
        // session key
        properties.setProperty("kaptcha.session.key", "kaptchaCode");
        // 验证码长度
        properties.setProperty("kaptcha.textproducer.char.length", "5");
        // 使用那些字符生成验证码
        properties.setProperty("kaptcha.textproducer.char.string", "ACDEFHKPRSTWX345679");
        // 使用哪些字体
        properties.setProperty("kaptcha.textproducer.font.names", "Arial");
        // 干扰线颜色
        properties.setProperty("kaptcha.noise.color", "black");
        // 图片样式阴影
        //properties.setProperty("kaptcha.obscurificator.impl", "com.google.code.kaptcha.impl.ShadowGimpy");
        // 验证码背景
        properties.setProperty("kaptcha.background.clear.from", "185,56,213");
        properties.setProperty("kaptcha.background.clear.to", "white");
        Config config = new Config(properties);
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }
}
