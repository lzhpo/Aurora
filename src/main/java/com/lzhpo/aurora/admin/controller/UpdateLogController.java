package com.lzhpo.aurora.admin.controller;

import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.UpdateLog;
import com.lzhpo.aurora.admin.service.UpdateLogService;
import com.lzhpo.aurora.admin.util.LayuiData;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Controller
@RequestMapping("/admin/tool")
public class UpdateLogController {

    @Autowired
    private UpdateLogService updateLogService;

    /**
     * 视图跳转
     */
    @RequestMapping("/updatelog")
    //@RequiresRoles(value = {"admin"})
    @RequiresPermissions(value = {"updatelog:look"}) //需要的权限
    @Operation(value = "进入更新日志页面")
    public String updateLog(){
        return "admin/tool/updatelog";
    }

    /**
     * 查询：根据id查询、查询全部
     * @param request
     * @return
     */
    @RequestMapping("/updatelog/list")
    @ResponseBody
    @Operation(value = "查询更新日志列表")
    public LayuiData blogList(HttpServletRequest request){
        //当前页数
        int page = Integer.parseInt(request.getParameter("page"));
        //显示条数
        int limit = Integer.parseInt(request.getParameter("limit"));
        //作为sql语句的限制条件
        int start = limit * (page - 1);
        int count = updateLogService.UpdateLogCount();
        LayuiData layuiData = new LayuiData();
        String description = request.getParameter("description");
        /** 没有传入参数，查询全部 **/
        if (description == null || description == ""){
            //查询所有数据
            List data = updateLogService.getUpdateLog(start,limit);
            layuiData.setCount(count);
            layuiData.setData(data);
        } else {    /** 传入description参数，模糊查询**/
            //根据description查询
            List data = updateLogService.getUpdateLogByDesc(description);
            layuiData.setCount(count);
            layuiData.setData(data);
        }
        return layuiData;
    }

    /**
     * 删除单个
     * @param id
     * @return
     */
    @RequestMapping("/updatelog/delete")
    @ResponseBody
    @Operation(value = "删除更新日志")
    public LayuiData delete(@RequestParam("id") String id){
        LayuiData layuiData = new LayuiData();
        try {
            updateLogService.deleteUpdateLogByID(Integer.parseInt(id));
            layuiData.setMsg("删除成功！");
            return layuiData;
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 批量删除
     * @param request
     * @return
     */
    @PostMapping("/updatelog/batchDelete")
    @ResponseBody
    @Operation(value = "批量删除更新日志")
    public LayuiData batchDelete(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String str = request.getParameter("ids");
        String a[] = str.split(",");
        String arr[] = new String[a.length];
        for (int i = 0 ; i < a.length ; i++){
            arr[i]=a[i];
        }
        try {
            updateLogService.batchDelete(arr);
            layuiData.setMsg("删除成功！");
            return layuiData;
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 新增
     * @param updateLog
     * @param request
     * @return
     */
    @RequestMapping(value = "/updatelog/add", method = RequestMethod.POST)
    @ResponseBody
    @Operation(value = "新增更新日志")
    public LayuiData add(UpdateLog updateLog, HttpServletRequest request){
        //接收前台传入的description，判断是否为空
        String description = request.getParameter("description");
        LayuiData layuiData = new LayuiData();
        if (description != null && description != ""){
            //表单验证规则，后端实现，description字符长度不能超过30个
            if (description.length() >= 30){
                layuiData.setCode(-1);
                layuiData.setMsg("添加失败，更新描述最长为30个字符！");
            } else {
                try {
                    updateLog.setCreate_date(new Date()); //选择现在的时间
                    updateLogService.addUpdateLogData(updateLog);
                    layuiData.setMsg("添加成功！");
                    return layuiData;
                } catch (Exception e) {
                    e.printStackTrace();
                    //添加失败设置状态码为-1
                    layuiData.setCode(-1);
                    layuiData.setMsg("添加失败！");
                }
            }
        } else {
            layuiData.setCode(-1);
            layuiData.setMsg("添加失败，请输入需要添加的数据！");
        }
        return layuiData;
    }

    /**
     * 表单提交后台直接将字符串转成日期类型
     * 因为前台传过来的日期是String类型的，所以需要转换一下。
     *
     * @param binder
     */
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));//第二个参数是控制是否支持传入的值是空，这个值很关键，如果指定为false，那么如果前台没有传值的话就会报错
    }

    /**
     * 编辑
     * @param updateLog
     * @return
     */
    @RequestMapping(value = "/updatelog/edit", method = RequestMethod.POST)
    @ResponseBody
    @Operation(value = "修改更新日志")
    public LayuiData edit(UpdateLog updateLog, HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String description = request.getParameter("description");
        if (description.length() >= 30){
            layuiData.setCode(-1);
            layuiData.setMsg("添加失败，更新描述最长为30个字符！");
        } else {
            try {
                updateLogService.editUpdateLogById(updateLog);
                layuiData.setMsg("更新成功！");
                return layuiData;
            } catch (Exception e) {
                e.printStackTrace();
                layuiData.setCode(-1);
                layuiData.setMsg("更新失败！");
            }
        }
        return layuiData;
    }
}
