package com.lzhpo.aurora.admin.mapper;

import com.lzhpo.aurora.admin.entity.Resources;

import java.util.List;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：</p>
 */
public interface ResourcesMapper {

    /**
     * 查找全部
     * @return
     */
    List<Resources> resourcesFindAll();

    /**
     * 根据资源名字模糊查询
     * @param resourcee_name
     * @return
     */
    List<Resources> resourcesFindLikeName(String resourcee_name);

    /**
     * 根据id删除
     * @param resources_id
     */
    void resourcesDelOne(Integer resources_id);

    /**
     * 统计所有条数
     * @return
     */
    int resourcesCount();

    /**
     * 查询权限树
     * @return
     */
    List<Resources> resourcesTree();

    /**
     * role_id：角色id
     * res_id：资源id
     * role_id 关联一个 res_id  就是给角色权限
     * 所以只要在role_resources数据库中插入一条数据就是给权限了
     * @param role_id
     * @param res_id
     */
    void addRoleRes(Integer role_id, Integer res_id);

    /**
     * 根据叶子节点的id查询对应的resources的主键id
     */
    int findResIdByLeafId(Integer id);

    /**
     * 根据角色id查询此角色拥有的所有的权限
     */
    List<Resources> findPowerByRoleId(Integer role_id);

    /**
     * 删除资源节点，如果存在下级节点则一并删除，根据在MySQL中创建的函数getChildList，查询出节点的id(非主键id)
     */
    void batchDelNodeId(String[] ids);

    /**
     * 根据在MySQL中创建的函数getChildList，查询出节点的id(非主键id)
     */
    String findNodeIdByFunc(Integer id);

    /**
     * 修改资源
     */
    void updateResources(Resources resources);

    /**
     * 添加资源
     */
    void addResources(Resources resources);

    /**
     * 选取父节点之后自动设置此节点的id：
     * 根据父节点的pid查询此条资源的节点id(DESC降序排列，取最后一条，加1)，然后在查询出来的此条资源的节点id的基础上+1，就是我们设置的id了。
     */
    Integer setNodeId(Integer pid);

    /**
     * 根据主键resources_id批量删除
     */
    void batchDelByResourcesId(String[] ResourcesIds);

    /**
     * 根据主键resources_id查询
     */
    List<Resources> findAllResByResId(Integer resources_name);

    /**
     * 知道父节点pid查询资源的名称，也就是查询id=pid的资源名称
     */
    String findResNameById(Integer id);
}
