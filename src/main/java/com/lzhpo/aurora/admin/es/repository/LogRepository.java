package com.lzhpo.aurora.admin.es.repository;

import com.lzhpo.aurora.admin.entity.Log;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchCrudRepository;

import java.util.List;

/**
 * @Author：lzhpo
 * @Date：2019/7/22
 * @Description：
 * 继承SpringData封装的ElasticsearchCrudRepository接口即可，里面封装了常用的一些方法。
 * 自己封装方法需要遵循SpringData的命名规范，它将会自动配置好方法。
 */
public interface LogRepository extends ElasticsearchCrudRepository<Log, Integer> {

    /**
     * 分页查询全部
     * @return
     */
    Page<Log> findAll(Pageable pageable);

    /**
     * 根据operation(操作名称)分页查询
     */
    List<Log> findByOperation(String operation, Pageable pageable);

    /**
     * 根据operation(操作名称)分页查询出来的总数
     */
    Integer countByOperation(String operation);

}
