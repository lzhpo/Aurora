
## 前提
将`docs/logback/logback-spring.xml`文件放在`resources`目录下。

## Logstash配置
配置文件：`/home/logstash/logstash-6.8.1/config/aurora-logstash-rabbitmq.conf`
```
[root@elk config]# cat aurora-logstash-rabbitmq.conf 
input { 
   rabbitmq {
       type =>"all"
       durable => true
       exchange => "logs"
	   exchange_type => "topic"
	   key => "aurora"
	   host => "192.168.200.110"
	   port => 5672
	   user => "guest"
	   password => "guest"
	   queue => "aurora-mq"
       auto_delete => false
    
  }	
 }
 
output {
  elasticsearch { 
       hosts => ["192.168.200.110:9200"] 
	   index => "aurora_log_mq"
	   }
}
[root@elk config]# 
```

## logback-spring.xml
```
<configuration>
    <!-- STDOUT -->
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%-4relative [%thread] %-5level %logger{35} - %msg %n</pattern>
        </encoder>
    </appender>

    <!--logback日志写入rabbitmq -->
    <appender name="RabbitMQ" class="org.springframework.amqp.rabbit.logback.AmqpAppender">
        <layout>
            <pattern><![CDATA[ %d %p %t [%c] - <%m>%n ]]></pattern>
        </layout>
        <!--rabbitmq地址 -->
        <addresses>192.168.200.152:5672</addresses>
        <abbreviation>36</abbreviation>
        <includeCallerData>true</includeCallerData>
        <applicationId>aurora</applicationId>
        <username>guest</username>
        <password>guest</password>
        <!--路由键 -->
        <!--{applicationId}  -->
        <!--%property{applicationId}.%c.%p 收集不到日志  -->
        <!--最后改为精确匹配了  非常重要 -->
        <routingKeyPattern>aurora</routingKeyPattern>
        <generateId>true</generateId>
        <charset>UTF-8</charset>
        <durable>true</durable>
        <deliveryMode>NON_PERSISTENT</deliveryMode>
        <declareExchange>true</declareExchange>
        <autoDelete>false</autoDelete>
    </appender>

    <!-- root配置 -->
    <root level="info">
        <appender-ref ref="STDOUT" />
<!--        <appender-ref ref="INFO_FILE" />-->
<!--        <appender-ref ref="WARN_FILE" />-->
<!--        <appender-ref ref="ERROR_FILE" />-->
        <!-- logback日志写入rabbitmq -->
        <appender-ref ref="RabbitMQ" />
    </root>
</configuration>
```