package com.lzhpo.aurora.admin.controller.swagger;

import com.lzhpo.aurora.admin.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p> Author：lzhpo </p>
 * <p> Title：</p>
 * <p> Description：
 * swagger的RESTful风格测试的UserController
 *

 *
 * ############################Spring Boot中包含了一些注解，对应于HTTP协议中的方法############################
 *
 *  * @GetMapping对应HTTP中的GET方法；
 *  *
 *  * @PostMapping对应HTTP中的POST方法；
 *  *
 *  * @PutMapping对应HTTP中的PUT方法；
 *  *
 *  * @DeleteMapping对应HTTP中的DELETE方法；
 *  *
 *  * @PatchMapping对应HTTP中的PATCH方法。
 * </p>
 */
@Api(value = "用户Controller")
@Controller
@RequestMapping("user")
public class SWUserController {

    @ApiIgnore
    @GetMapping("hello")
    public @ResponseBody String hello() {
        return "hello";
    }

    @ApiOperation(value = "获取用户信息", notes = "根据用户id获取用户信息")
    @ApiImplicitParam(name = "id", value = "用户id", required = true, dataType = "Long", paramType = "path")
    @GetMapping("/{id}")
    public @ResponseBody User getUserById(@PathVariable(value = "id") Integer id) {
        User user = new User();
        user.setUser_id(id);
        user.setUsername("lzhpo");
        user.setPassword("123456");
        user.setSex(1);
        user.setStatus(1);
        return user;
    }

    @ApiOperation(value = "获取用户列表", notes = "获取用户列表")
    @GetMapping("/list")
    public @ResponseBody
    List<User> getUserList() {
        List<User> list = new ArrayList<>();
        User user1 = new User();
        user1.setUser_id(1);
        user1.setUsername("lzhpo");
        user1.setPassword("123456");
        user1.setSex(1);
        user1.setStatus(1);
        list.add(user1);
        User user2 = new User();
        user2.setUser_id(2);
        user2.setUsername("lzhpo");
        user2.setPassword("123456");
        user2.setSex(1);
        user2.setStatus(1);
        list.add(user2);
        return list;
    }

    @ApiOperation(value = "新增用户", notes = "根据用户实体创建用户")
    @ApiImplicitParam(name = "user", value = "用户实体", required = true, dataType = "User")
    @PostMapping("/add")
    public @ResponseBody
    Map<String, Object> addUser(@RequestBody User user) {
        Map<String, Object> map = new HashMap<>();
        map.put("result", "success");
        return map;
    }

    @ApiOperation(value = "删除用户", notes = "根据用户id删除用户")
    @ApiImplicitParam(name = "id", value = "用户id", required = true, dataType = "Long", paramType = "path")
    @DeleteMapping("/{id}")
    public @ResponseBody Map<String, Object> deleteUser(@PathVariable(value = "id") Long id) {
        Map<String, Object> map = new HashMap<>();
        map.put("result", "success");
        return map;
    }

    @ApiOperation(value = "更新用户", notes = "根据用户id更新用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户id", required = true, dataType = "Long", paramType = "path"),
            @ApiImplicitParam(name = "user", value = "用户实体", required = true, dataType = "User") })
    @PutMapping("/{id}")
    public @ResponseBody Map<String, Object> updateUser(@PathVariable(value = "id") Long id, @RequestBody User user) {
        Map<String, Object> map = new HashMap<>();
        map.put("result", "success");
        return map;
    }

}
