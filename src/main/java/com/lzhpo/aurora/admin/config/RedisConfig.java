package com.lzhpo.aurora.admin.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.serializer.*;

import java.time.Duration;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 *  Redis缓存配置
 * </p>
 */
@Configuration
@EnableCaching
public class RedisConfig extends CachingConfigurerSupport {

    private static final Logger logger = LoggerFactory.getLogger(RedisConfig.class);

    /**
     * 自定义key生成器
     * @return
     */
    @Bean
    public KeyGenerator keyGenerator(){
        return (o, method, params) ->{
            StringBuilder sb = new StringBuilder();
            sb.append(o.getClass().getName()); // 类目
            sb.append(method.getName()); // 方法名
            for(Object param: params){
                sb.append(param.toString()); // 参数名
            }
            return sb.toString();
        };
    }

    /**
     * 配置缓存管理器
     * @param connectionFactory
     * @return
     */
    @Bean
    public RedisCacheManager cacheManager(RedisConnectionFactory connectionFactory) {
        RedisCacheConfiguration config = RedisCacheConfiguration.defaultCacheConfig()
                // 缓存过期时间
                .entryTtl(Duration.ofSeconds(20)) // 20s缓存失效
                // 设置key的序列化方式
                .serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(keySerializer()))
                // 设置value的序列化方式
                .serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(valueSerializer()))
                // 不缓存null值
                .disableCachingNullValues();

        RedisCacheManager redisCacheManager = RedisCacheManager.builder(connectionFactory)
                .cacheDefaults(config)
                .transactionAware()
                .build();

        logger.info("【自定义RedisCacheManager加载完成】");
        return redisCacheManager;
    }

    /**
     * key键序列化方式
     * @return
     */
    private RedisSerializer<String> keySerializer() {
        return new StringRedisSerializer();
    }

    /**
     * value值序列化方式
     * @return
     */
    private GenericJackson2JsonRedisSerializer valueSerializer(){
        return new GenericJackson2JsonRedisSerializer();
    }
}
