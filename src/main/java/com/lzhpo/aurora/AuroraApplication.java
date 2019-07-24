package com.lzhpo.aurora;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@SpringBootApplication
@MapperScan("com.lzhpo.aurora.admin.mapper")
@EnableTransactionManagement //开启事务管理器
public class AuroraApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuroraApplication.class, args);
        System.out.println("【【【启动成功】】】");
    }

}
