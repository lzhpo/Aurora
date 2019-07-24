package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.Log;
import com.lzhpo.aurora.admin.es.repository.LogRepository;
import com.lzhpo.aurora.admin.service.LogService;
import com.lzhpo.aurora.admin.util.LayuiData;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.security.DeclareRoles;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Controller
@RequestMapping("/admin/tool")
public class LogController {

    private Logger logger = LoggerFactory.getLogger(Log.class);

    @Autowired
    private LogService logService;

    @Autowired
    private LogRepository logRepository;

    @Value("${ES.Enable}")
    private Boolean ESEnable;

    @RequestMapping("/log")
    @RequiresPermissions(value = "log:look")
    @Operation(value = "进入操作记录页面")
    public String log(){
        return "admin/tool/log";
    }

    /**
     * 查询全部，根据操作名称查询
     * @param request
     * @return
     */
    @RequestMapping("/log/list")
    @ResponseBody
    @Operation(value = "查询操作记录列表")
    public LayuiData logFindAll(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        //当前页数
        int page = Integer.parseInt(request.getParameter("page"));
        //显示条数
        int limit = Integer.parseInt(request.getParameter("limit"));
        //作为sql语句的限制条件
        int start = limit * (page - 1);
        String operation = request.getParameter("operation");
        /** 是否启用ES **/
        if (ESEnable){ //如果启用ES
            logger.info("【已启用ElasticSearch，将使用ElasticSearch检索操作记录！】");
            Sort sort = new Sort(Sort.Direction.ASC, "log_id"); //排序
            //注意PageRequest.of(page - 1, limit, sort)中的：第一个参数是当前页数！！！，第二个参数是每页显示的数量，第三个参数是排序规则。
            Pageable pageable = PageRequest.of(page - 1, limit, sort);
            if (operation == null || operation == ""){
                long esLogCount = logRepository.count();
                layuiData.setCount((int) esLogCount);
                ArrayList<Log> logArrayList = new ArrayList<>(); //创建ArrayList集合，储存ES数据
                Page<Log> logPage = logRepository.findAll(pageable); //从ES中分页查询出数据
                logPage.forEach(logArrayList::add); //将数据添加到ArrayList集合
                layuiData.setData(logArrayList);
            } else {
                List<Log> logList = logRepository.findByOperation(operation, pageable);
                Integer countByOperation = logRepository.countByOperation(operation);
                layuiData.setCount(countByOperation);
                layuiData.setData(logList);
            }
        } else { //如果不启用ES，则从MySQL中查询数据
            logger.info("【未启用ES，将使用默认的MySQL检索操作记录！】");
            if (operation == null || operation == ""){
                List<Log> data = logService.logFindAll(start, limit);
                layuiData.setData(data);
                layuiData.setCount(logService.logCount());
            } else {
                List<Log> data = logService.logFindByOprt(operation, start, limit);
                layuiData.setData(data);
                layuiData.setCount(logService.countFindByOprt(operation));
            }
        }
        return layuiData;
    }

    /**
     * 单个删除
     */
    @RequestMapping("/log/deleteById")
    @ResponseBody
    @Operation(value = "删除操作记录")
    public LayuiData deleteById(String log_id){
        LayuiData layuiData = new LayuiData();
        try {
            logService.deleteById(Integer.parseInt(log_id));
            layuiData.setMsg("删除成功！");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 批量删除
     */
    @RequestMapping("/log/batchDel")
    @ResponseBody
    @Operation(value = "批量删除操作记录")
    public LayuiData batchDel(String ids){
        LayuiData layuiData = new LayuiData();
        String[] split = ids.split(",");
        try {
            logService.batchDel(split);
            layuiData.setMsg("删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }
}
