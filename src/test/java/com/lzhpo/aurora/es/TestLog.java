package com.lzhpo.aurora.es;

import com.lzhpo.aurora.admin.entity.Log;
import com.lzhpo.aurora.admin.es.repository.LogRepository;
import com.lzhpo.aurora.admin.service.LogService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/7/22
 * @Description：
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class TestLog {

    @Autowired
    private LogRepository logRepository;

    @Autowired
    private LogService logService;

    /**
     * 查询ES中索引为aurora，类型为log的全部数据--->日志数据
     */
    @Test
    public void selectESAll(){
        Iterable<Log> logIterable = logRepository.findAll();
        logIterable.forEach(System.out::println);
    }

    /**
     * 统计ES中的日志条数
     */
    @Test
    public void selectESCount(){
        long count = logRepository.count();
        System.out.println(count);
    }

    /**
     * 根据操作名称分页查询
     */
    @Test
    public void findByOperation1(){
        Pageable pageable = PageRequest.of(0, (int) logRepository.count());
        logRepository.findByOperation("查询", pageable)
                .forEach(System.out::println);
    }

    /**
     * 分页查询全部
     */
    @Test
    public void findAll(){
        Sort sort = new Sort(Sort.Direction.ASC, "log_id"); //排序
        Pageable pageable = PageRequest.of(1, 10, sort);
        int pageSize = pageable.getPageSize();
        System.out.println("getPageSize: " +pageSize);
        int pageNumber = pageable.getPageNumber();
        System.out.println("pageNumber: " +pageNumber);
        Page<Log> logs = logRepository.findAll(pageable);
        System.out.println("查询总条数：" +logs.getSize());
        logs.forEach(System.out::println);
    }

    /**
     * 查询MySQL中的日志数据
     */
    @Test
    public void selectMySQLAll(){
        List<Log> logs = logService.logFindAll(1, logService.logCount());
        logs.forEach(System.out::println);
    }



    /**
     * 插入数据到ES
     */
    @Test
    public void insertLog(){
        Log log = new Log();
        log.setUsername("测试1");
        log.setOperation("测试1");
        log.setCreate_time(new Date());
        log.setParams("测试1");
        log.setIp("0.0.0.0");
        log.setDotime("10");
        log.setMethod("测试1");
        logRepository.save(log);
    }
}
