package com.lzhpo.aurora.redis;

import org.junit.Test;
import redis.clients.jedis.Jedis;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public class TestRedis {

    /**
     * 测试连接redis
     */
    @Test
    public void testConnect(){
        Jedis jedis = new Jedis("192.168.200.110");
        jedis.auth("123456");
        System.out.println(jedis);
        //查看服务是否允许
        System.out.println(jedis.ping());
    }

    @Test
    public void setData(){
        Jedis jedis = new Jedis("192.168.200.110");
        jedis.auth("123456");
        jedis.set("lzhpo","www.lzhpo.com");
        System.out.println(jedis.get("lzhpo"));
    }
}
