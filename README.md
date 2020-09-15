<p>
  <a href="http://www.lzhpo.com"><img src="https://img.shields.io/badge/author-会打篮球的程序猿-red" alt="作者"></a>
  <a href="http://cdn.lzhpo.com/aboutme/wechat-wxgzh/8cm.jpg"><img src="https://img.shields.io/badge/微信公众号-会打篮球的程序猿-blueviolet" alt="公众号"></a>
  <a href="#"><img src="https://img.shields.io/badge/license-GPL%20v3-success.svg" alt="开源协议"></a>
</p>

<hr>

## 页面截图

![](docs/images/后台-资源管理-1.png)
![](docs/images/后台-资源管理-2.png)
![](docs/images/后台-首页.png)
![](docs/images/后台-用户管理.png)
![](docs/images/后台-用户管理-分配角色.png)
![](docs/images/后台-操作记录.png)
![](docs/images/后台-在线用户.png)
![](docs/images/后台-发布博客.png)
![](docs/images/ES-aurora_log.png)
![](docs/images/ES-aurora_blog.png)
![](docs/images/aurora-rabbitmq.png)

## 技术栈
1. Thymeleaf
2. SpringBoot
3. Mybatis
4. Lombok
5. MySQL
6. Druid
7. fastjson
8. shiro
9. Redis
10. jsoup
11. kaptcha
12. swagger2
13. ELK（ElasticSearch、Logstash、Kibana）
14. RabbitMQ

## 启动项目
1. 安装MySQL，导入docs下的sql文件。
2. 安装Redis，并且在`application.yml`文件下配置Redis的连接信息。
3. 安装ElasticSearch，并且在`application.yml`文件下配置ElasticSearch的连接信息。（不使用ElasticSearch，设置`ES.Enable`为false即可，默认flase）
4. 【此步非必须，用于学习的，可以不配置】安装RabbitMQ、Logstash、Kibana/ElasticSearch Head，在`logback-spring.xml`文件下配置RabbitMQ的连接信息，Logstash的配置信息在`ELK+MQ收集日志.md`。（Spring集成Rabbitmq收集Logback日志，利用进行Logstash数据整理存储到Elasticsearch中）
5. 启动`com.lzhpo.aurora.AuroraApplication`。

访问：[localhost:8080/admin](localhost:8080/admin)
账号：lzhpo
密码：123456

## 项目说明
### 日志收集（仅仅是学习一下）
内置了日志可以存储在MySQL或ElasticSearch中。
额外：使用Spring继承RabbitMQ，将SpringBoot的Logback的日志发送到RabbitMQ，再使用Logstash将日志存储到Elasticsearch中。

## 碎碎念
由于要准备工作了，此项目先放置了。

如果有什么问题，请发送邮件lzhpo@qq.com联系我！或者提Issue！

## 开源地址

GitHub：[https://github.com/lzhpo/Aurora](https://github.com/lzhpo/Aurora)

码云：[https://gitee.com/lzhpo/Aurora](https://gitee.com/lzhpo/Aurora)

## 请本人喝杯咖啡
### 支付宝
![](http://cdn.lzhpo.com/Aurora-%E6%94%AF%E4%BB%98%E5%AE%9D%E6%94%B6%E6%AC%BE%E7%A0%81.png)
### 微信
![](http://cdn.lzhpo.com/Aurora-%E5%BE%AE%E4%BF%A1%E6%94%B6%E6%AC%BE%E7%A0%81.png)
