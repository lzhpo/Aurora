package com.lzhpo.aurora.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.lzhpo.aurora.admin.annotation.Operation;
import com.lzhpo.aurora.admin.entity.Resources;
import com.lzhpo.aurora.admin.mapper.ResourcesMapper;
import com.lzhpo.aurora.admin.service.ResourcesService;
import com.lzhpo.aurora.admin.service.RoleResourcesService;
import com.lzhpo.aurora.admin.service.RoleService;
import com.lzhpo.aurora.admin.util.AuthorTree;
import com.lzhpo.aurora.admin.util.LayuiData;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
@Controller
@RequestMapping("/admin/system")
public class ResourcesController {

    private Logger logger = LoggerFactory.getLogger(ResourcesController.class);

    @Autowired
    private ResourcesService resourcesService;

    @Autowired
    private RoleResourcesService roleResourcesService;

    @Autowired
    private ResourcesMapper resourcesMapper;


    /**
     * 视图跳转
     * @return
     */
    @RequiresPermissions(value = "resources:look")
    @RequestMapping("/resources")
    @Operation(value = "进入资源管理页面")
    public String resources(Model model){
        List resourcesFindAll = resourcesService.resourcesFindAll();
        model.addAttribute("resourcesFindAll", resourcesFindAll);
        return "admin/system/resources";
    }

    /**
     * 查询全部
     */
    @RequestMapping("/resources/list")
    @ResponseBody
    @Operation(value = "查询资源管理列表")
    public LayuiData resourcesFindAll(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String resources_name = request.getParameter("resources_name");
        /** 没有传入参数，查询全部 **/
        if (resources_name == null || resources_name == ""){
            //查询所有数据
            List data = resourcesService.resourcesFindAll();
            layuiData.setData(data);
        } else {    /** 传入description参数，模糊查询**/
            //根据description查询
            List data = resourcesService.resourcesFindLikeName(resources_name);
            layuiData.setData(data);
        }
        return layuiData;
    }

    /**
     * 查询权限树
     */
    @RequestMapping("/resources/roleTree")
    @ResponseBody
    @Operation(value = "查询资源权限树")
    public AuthorTree roleTree(HttpServletRequest request){
        AuthorTree authorTree = new AuthorTree();

        /**
         * list
         */
        List list = resourcesService.resourcesTree();

        /**
         * checkedAlias：选中
         * 权限树加载勾选的权限思路：
         * 根据role_id(角色id)在role_res(角色_权限)表中查询此角色(role_id)的所有权限(res_id),
         * 再根据权限(res_id)和实体类Resources获取对应的Resources的节点id(不是主键id)。
         */
        Integer role_id = Integer.parseInt(request.getParameter("role_id"));
        List<Resources> powerByRoleId = resourcesService.findPowerByRoleId(role_id);
        logger.info("【角色id为：" +role_id +"拥有的所有权限id为：" +powerByRoleId +"】");
        int[] checkedId = new int[powerByRoleId.size()];
        if (powerByRoleId.size() > 1){  //查询为空是一条空记录结果，所以是大于1
            for (int i = 0; i < powerByRoleId.size(); i++) {
                checkedId[i] = powerByRoleId.get(i).getId(); //sys_resources的id
            }
        }
        logger.info("【角色id为：" +role_id +"，checkedId: " +Arrays.toString(checkedId) +"】");

        /**
         * disabledAlias
         */
        int[] disabledAlias = new int[]{};

        /**
         * authore--->data
         */
        JSONObject data = new JSONObject();
        data.put("list",list);
        data.put("checkedId",checkedId);
        data.put("disabledAlias",disabledAlias);
        authorTree.setMsg("获取成功！");
        authorTree.setData(data);
        return authorTree;
    }


    /**
     * 给角色赋予权限、给角色取消权限。
     * 给角色赋予权限思路：
     * role_id(角色id)，countLeaf(叶子节点)，getMaxDept(权限树的最大深度)
     * 目的是插入role_res权限表中对应的权限数据，也就是role_id，res_id。
     * Resources的权限节点(id) ---> Resources权限节点(id)对应的Resources主键(Resources_id)，Resources_id也就是Res_id ---> 插入Role_Resources(role_id,res_id)数据。
     *
     *
     * 给角色取消权限思路：
     *
     */
    @RequestMapping("/role/power/add")
    @ResponseBody
    @Operation(value = "给角色赋予权限")
    public LayuiData powerAdd(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        //获取前端的所选叶子节点的id
        String countLeaf = request.getParameter("countLeaf");
        //获取前端所选中的权限树的最大深度
        String getMaxDept = request.getParameter("getMaxDept");
        //获取角色id
        String role_id = request.getParameter("role_id");
        //获取未选中的节点，需要删除的节点
        String countNotChecked = request.getParameter("countNotChecked");

        //删除节点
        if (countNotChecked == null || countNotChecked.equals("")){ //如果countNotChecked为空不做任何操作

        } else {
            //给角色取消权限
            //取消选中，未选中的，删除权限
            logger.info("【countNotCheckedSplit：" +countNotChecked +"】");
            String[] countNotCheckedSplit = countNotChecked.split(",");
            Integer[] countNotCheckedInt = new Integer[countNotCheckedSplit.length];
            for (int i = 0; i < countNotCheckedSplit.length; i++) {
                countNotCheckedInt[i] = Integer.parseInt(countNotCheckedSplit[i]);
            }
            for (int i = 0; i < countNotCheckedInt.length; i++) {
                int res_id = resourcesService.findResIdByLeafId(countNotCheckedInt[i]); //查询结果为resources的主键id
                roleResourcesService.deleteRoleResById(Integer.parseInt(role_id), res_id);
            }
        }

        //如果没有，说明是没有做任何操作，没有勾选节点
        if (countLeaf == null || countLeaf == ""){
            layuiData.setCode(1);
            layuiData.setMsg("未做任何操作！");
            return layuiData;
        } else {
            //前端的所选叶子节点的id
            logger.info("【原始countLeaf：" +countLeaf +"】");
            String[] countLeafSplit = countLeaf.split(",");
            logger.info("【切分的countLeaf：" + Arrays.toString(countLeafSplit) +"】");
            //转Integer
            Integer[] countLeafToInt = new Integer[countLeafSplit.length];
            for (int i = 0; i < countLeafSplit.length; i++) {
                countLeafToInt[i] = Integer.parseInt(countLeafSplit[i]);
            }
            //添加子节点的父节点，才能勾选
            List<Integer> countLeafList = Arrays.asList(countLeafToInt);
            ArrayList<Integer> countLeafToArrayList = new ArrayList<>(); //countLeafToArrayList存放需要插入到数据库中的节点id
            countLeafList.forEach(s -> {
                countLeafToArrayList.add(s);
            });
            //获取前端所选中的权限树的最大深度
            int getMaxDeptToInt = Integer.parseInt(getMaxDept);
            logger.info("【权限树(getMaxDeptToInt)的最大深度为：" +getMaxDeptToInt +"】");
            //添加子节点对应的所有父节点到集合中去
            for (int i = 0; i < countLeafToArrayList.size(); i++) {
                if (countLeafToArrayList.get(i) > 100){
                    int addParent = countLeafToArrayList.get(i) / 100;
                    countLeafToArrayList.add(addParent); //添加叶子节点的父节点
                    int k = 0;
                    while (k > getMaxDeptToInt){ //使用权限树的最大深度控制循环的停止
                        addParent = countLeafToArrayList.get(i) / 100;
                        countLeafToArrayList.add(addParent); //循环添加叶子节点的父节点
                        k++;
                    }
                }
            }
            //去重（Java8）
            List<Integer> countLeafToArrayListDistinct = countLeafToArrayList.stream().distinct().collect(Collectors.toList());
            logger.info("【countLeafToArrayListDistinct：" +countLeafToArrayListDistinct);

            //给角色赋予权限
            //获取前端所选的角色id
            logger.info("【所选中的角色id：" +role_id +"】");
            for (int i = 0; i < countLeafToArrayListDistinct.size(); i++) {
                //根据叶子节点的id查询数据表sys_resources的主键resources_id
                int resources_id = resourcesService.findResIdByLeafId(countLeafToArrayListDistinct.get(i));
                //插入role_res权限表中
                try {
                    resourcesService.addRoleRes(Integer.parseInt(role_id), resources_id);
                    layuiData.setMsg("提交成功！");
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    layuiData.setCode(-1);
                    layuiData.setMsg("提交失败！");
                }
            }

        }
        return layuiData;
    }

    /**
     * 删除资源节点，如果存在下级节点则一并删除：
     * 主要是要在MySQL中创建函数getChildrenList获取此节点下的所有叶子节点的id(包括此节点)
     */
    @RequestMapping("/resources/batchDelNodeId")
    @ResponseBody
    @Operation(value = "删除资源节点")
    public LayuiData batchDelNodeId(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String id = request.getParameter("id");
        logger.info("【删除节点id为：" +id +"及其子节点(如果存在)】");
        String ids = resourcesMapper.findNodeIdByFunc(Integer.parseInt(id));
        logger.info("【ids：" +ids +"】");
        String[] idsSplit = ids.split(",");
        try {
            resourcesService.batchDelNodeId(idsSplit);
            layuiData.setMsg("删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 更新资源
     */
    @RequestMapping("/resources/update")
    @ResponseBody
    @Operation(value = "更新资源")
    public LayuiData update(Resources resources){
        LayuiData layuiData = new LayuiData();
        try {
            resourcesService.updateResources(resources);
            layuiData.setMsg("修改成功！");
            logger.info("【修改后的值：" +resources +"】");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("修改失败！");
        }
        return layuiData;
    }

    /**
     * 添加资源
     */
    @RequestMapping("/resources/addResources")
    @ResponseBody
    @Operation(value = "添加资源")
    public LayuiData addResources(Resources resources, HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String pid = request.getParameter("pid");
        logger.info("【pid：" +pid +"】");
        Integer id = resourcesMapper.setNodeId(Integer.parseInt(pid));
        try {
            resources.setId(id + 1);
            resourcesService.addResources(resources);
            layuiData.setMsg("添加成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("添加失败！");
        }
        return layuiData;
    }

    /**
     * 根据主键resources_id批量删除
     */
    @RequestMapping("/resources/batchDelByResourcesId")
    @ResponseBody
    @Operation(value = "删除资源")
    public LayuiData batchDelByResourcesId(HttpServletRequest request){
        LayuiData layuiData = new LayuiData();
        String resourcesIds = request.getParameter("ResourcesIds");
        String[] ResourcesIdsSplit = resourcesIds.split(",");
        try {
            resourcesService.batchDelByResourcesId(ResourcesIdsSplit);
            layuiData.setMsg("删除成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("删除失败！");
        }
        return layuiData;
    }

    /**
     * 加载下拉框的节点
     */
    @RequestMapping("/resources/initResSelects")
    @ResponseBody
    @Operation(value = "加载下拉框的节点")
    public LayuiData initResSelects(){
        LayuiData layuiData = new LayuiData();
        List<Resources> resourcesList = null;
        try {
            resourcesList = resourcesService.resourcesFindAll();
            layuiData.setMsg("加载父节点数据成功！");
        } catch (Exception e) {
            e.printStackTrace();
            layuiData.setCode(-1);
            layuiData.setMsg("加载父节点数据失败！");
        }
        logger.info("【resourcesList：" +resourcesList +"】");
        layuiData.setData(resourcesList);
        return layuiData;
    }

    /**
     * 修改资源的视图跳转
     */
    @RequestMapping("/resources/updateResources/view")
    @Operation(value = "进入修改资源页面")
    public String editResView(){
        return "admin/system/updateResources";
    }

    /**
     * 回显数据
     */
    @RequestMapping("/resources/updateResources/editData")
    @Operation(value = "资源回显")
    public String editData(HttpSession session, HttpServletRequest request){
        String resources_id = request.getParameter("resources_id");
        logger.info("【resources_id：" +resources_id +"】");
        List<Resources> allResByResId = resourcesMapper.findAllResByResId(Integer.parseInt(resources_id));
        String pid = request.getParameter("pid");
        logger.info("【pid：" +pid +"】");
        String resNameById = resourcesMapper.findResNameById(Integer.parseInt(pid));
        session.setAttribute("resNameById", resNameById);
        session.setAttribute("allResByResId", allResByResId);
        return "redirect:/admin/system/resources/updateResources/view";
    }
}
