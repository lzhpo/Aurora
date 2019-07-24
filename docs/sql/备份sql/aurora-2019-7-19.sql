/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : aurora

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-07-19 09:55:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `blog_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '博客标题',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '博客封面图',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '博客内容',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '博客描述',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '博客标签',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '博客分类',
  `create_date` datetime NOT NULL COMMENT '博客创建时间',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '作者',
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='博客文章';

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES ('1', '文章1', 'http://cdn.liuzhaopo.top/tx.jpg', 0xE69687E7ABA031, '文章1', '标签1', '分类1', '2019-07-05 13:45:36', '文章1');
INSERT INTO `blog_article` VALUES ('2', '文章2', 'http://cdn.liuzhaopo.top/tx.jpg', 0xE69687E7ABA032, '文章2', '标签2', '分类2', '2019-07-05 13:45:55', '文章2');
INSERT INTO `blog_article` VALUES ('3', '文章3', 'http://cdn.liuzhaopo.top/tx.jpg', 0xE69687E7ABA033E69687E7ABA033E69687E7ABA033E69687E7ABA033E69687E7ABA033E69687E7ABA033E69687E7ABA033E69687E7ABA033E69687E7ABA033E69687E7ABA033E69687E7ABA033E69687E7ABA033, '文章3', '标签1', '分类1', '2019-07-06 14:50:12', '文章3');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标签名字',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='博客标签';

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('1', '标签1');
INSERT INTO `blog_tag` VALUES ('2', '标签2');

-- ----------------------------
-- Table structure for blog_type
-- ----------------------------
DROP TABLE IF EXISTS `blog_type`;
CREATE TABLE `blog_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客分类',
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '分类名字',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='博客分类';

-- ----------------------------
-- Records of blog_type
-- ----------------------------
INSERT INTO `blog_type` VALUES ('1', '分类1');
INSERT INTO `blog_type` VALUES ('2', '分类2');

-- ----------------------------
-- Table structure for role_resources
-- ----------------------------
DROP TABLE IF EXISTS `role_resources`;
CREATE TABLE `role_resources` (
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of role_resources
-- ----------------------------
INSERT INTO `role_resources` VALUES ('1', '1');
INSERT INTO `role_resources` VALUES ('1', '2');
INSERT INTO `role_resources` VALUES ('1', '3');
INSERT INTO `role_resources` VALUES ('1', '4');
INSERT INTO `role_resources` VALUES ('1', '5');
INSERT INTO `role_resources` VALUES ('1', '6');
INSERT INTO `role_resources` VALUES ('1', '7');
INSERT INTO `role_resources` VALUES ('1', '8');
INSERT INTO `role_resources` VALUES ('1', '9');
INSERT INTO `role_resources` VALUES ('1', '10');
INSERT INTO `role_resources` VALUES ('1', '11');
INSERT INTO `role_resources` VALUES ('1', '12');
INSERT INTO `role_resources` VALUES ('1', '13');
INSERT INTO `role_resources` VALUES ('1', '14');
INSERT INTO `role_resources` VALUES ('1', '15');
INSERT INTO `role_resources` VALUES ('1', '16');
INSERT INTO `role_resources` VALUES ('1', '17');
INSERT INTO `role_resources` VALUES ('1', '18');
INSERT INTO `role_resources` VALUES ('1', '19');
INSERT INTO `role_resources` VALUES ('1', '20');
INSERT INTO `role_resources` VALUES ('5', '1');
INSERT INTO `role_resources` VALUES ('5', '2');
INSERT INTO `role_resources` VALUES ('5', '3');
INSERT INTO `role_resources` VALUES ('5', '4');
INSERT INTO `role_resources` VALUES ('5', '5');
INSERT INTO `role_resources` VALUES ('5', '6');
INSERT INTO `role_resources` VALUES ('5', '7');
INSERT INTO `role_resources` VALUES ('5', '8');
INSERT INTO `role_resources` VALUES ('5', '9');
INSERT INTO `role_resources` VALUES ('5', '10');
INSERT INTO `role_resources` VALUES ('5', '11');
INSERT INTO `role_resources` VALUES ('5', '12');
INSERT INTO `role_resources` VALUES ('5', '13');
INSERT INTO `role_resources` VALUES ('2', '3');
INSERT INTO `role_resources` VALUES ('2', '4');
INSERT INTO `role_resources` VALUES ('2', '5');
INSERT INTO `role_resources` VALUES ('2', '7');
INSERT INTO `role_resources` VALUES ('2', '8');
INSERT INTO `role_resources` VALUES ('2', '9');
INSERT INTO `role_resources` VALUES ('2', '11');
INSERT INTO `role_resources` VALUES ('2', '12');
INSERT INTO `role_resources` VALUES ('2', '13');
INSERT INTO `role_resources` VALUES ('2', '2');
INSERT INTO `role_resources` VALUES ('2', '6');
INSERT INTO `role_resources` VALUES ('2', '10');
INSERT INTO `role_resources` VALUES ('2', '1');
INSERT INTO `role_resources` VALUES ('2', '3');
INSERT INTO `role_resources` VALUES ('2', '4');
INSERT INTO `role_resources` VALUES ('2', '5');
INSERT INTO `role_resources` VALUES ('2', '7');
INSERT INTO `role_resources` VALUES ('2', '8');
INSERT INTO `role_resources` VALUES ('2', '9');
INSERT INTO `role_resources` VALUES ('2', '11');
INSERT INTO `role_resources` VALUES ('2', '12');
INSERT INTO `role_resources` VALUES ('2', '13');
INSERT INTO `role_resources` VALUES ('2', '2');
INSERT INTO `role_resources` VALUES ('2', '6');
INSERT INTO `role_resources` VALUES ('2', '10');
INSERT INTO `role_resources` VALUES ('2', '1');
INSERT INTO `role_resources` VALUES ('2', '3');
INSERT INTO `role_resources` VALUES ('2', '4');
INSERT INTO `role_resources` VALUES ('2', '5');
INSERT INTO `role_resources` VALUES ('2', '7');
INSERT INTO `role_resources` VALUES ('2', '8');
INSERT INTO `role_resources` VALUES ('2', '9');
INSERT INTO `role_resources` VALUES ('2', '11');
INSERT INTO `role_resources` VALUES ('2', '12');
INSERT INTO `role_resources` VALUES ('2', '13');
INSERT INTO `role_resources` VALUES ('2', '16');
INSERT INTO `role_resources` VALUES ('2', '18');
INSERT INTO `role_resources` VALUES ('2', '19');
INSERT INTO `role_resources` VALUES ('2', '20');
INSERT INTO `role_resources` VALUES ('2', '2');
INSERT INTO `role_resources` VALUES ('2', '6');
INSERT INTO `role_resources` VALUES ('2', '10');
INSERT INTO `role_resources` VALUES ('2', '15');
INSERT INTO `role_resources` VALUES ('2', '17');
INSERT INTO `role_resources` VALUES ('2', '1');
INSERT INTO `role_resources` VALUES ('2', '14');
INSERT INTO `role_resources` VALUES ('9', '3');
INSERT INTO `role_resources` VALUES ('9', '4');
INSERT INTO `role_resources` VALUES ('9', '5');
INSERT INTO `role_resources` VALUES ('9', '7');
INSERT INTO `role_resources` VALUES ('9', '8');
INSERT INTO `role_resources` VALUES ('9', '9');
INSERT INTO `role_resources` VALUES ('9', '11');
INSERT INTO `role_resources` VALUES ('9', '12');
INSERT INTO `role_resources` VALUES ('9', '13');
INSERT INTO `role_resources` VALUES ('9', '16');
INSERT INTO `role_resources` VALUES ('9', '18');
INSERT INTO `role_resources` VALUES ('9', '19');
INSERT INTO `role_resources` VALUES ('9', '20');
INSERT INTO `role_resources` VALUES ('9', '2');
INSERT INTO `role_resources` VALUES ('9', '6');
INSERT INTO `role_resources` VALUES ('9', '10');
INSERT INTO `role_resources` VALUES ('9', '15');
INSERT INTO `role_resources` VALUES ('9', '17');
INSERT INTO `role_resources` VALUES ('9', '1');
INSERT INTO `role_resources` VALUES ('9', '14');
INSERT INTO `role_resources` VALUES ('5', '3');
INSERT INTO `role_resources` VALUES ('5', '4');
INSERT INTO `role_resources` VALUES ('5', '5');
INSERT INTO `role_resources` VALUES ('5', '7');
INSERT INTO `role_resources` VALUES ('5', '8');
INSERT INTO `role_resources` VALUES ('5', '9');
INSERT INTO `role_resources` VALUES ('5', '11');
INSERT INTO `role_resources` VALUES ('5', '12');
INSERT INTO `role_resources` VALUES ('5', '13');
INSERT INTO `role_resources` VALUES ('5', '2');
INSERT INTO `role_resources` VALUES ('5', '6');
INSERT INTO `role_resources` VALUES ('5', '10');
INSERT INTO `role_resources` VALUES ('5', '1');
INSERT INTO `role_resources` VALUES ('5', '3');
INSERT INTO `role_resources` VALUES ('5', '4');
INSERT INTO `role_resources` VALUES ('5', '5');
INSERT INTO `role_resources` VALUES ('5', '7');
INSERT INTO `role_resources` VALUES ('5', '8');
INSERT INTO `role_resources` VALUES ('5', '9');
INSERT INTO `role_resources` VALUES ('5', '11');
INSERT INTO `role_resources` VALUES ('5', '12');
INSERT INTO `role_resources` VALUES ('5', '13');
INSERT INTO `role_resources` VALUES ('5', '2');
INSERT INTO `role_resources` VALUES ('5', '6');
INSERT INTO `role_resources` VALUES ('5', '10');
INSERT INTO `role_resources` VALUES ('5', '1');

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `resources_id` int(11) NOT NULL AUTO_INCREMENT,
  `resources_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '无',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '无' COMMENT '资源所需的权限，绝对不能为空！',
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`resources_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES ('1', '权限管理', '无', '目录', '无', '1', '0');
INSERT INTO `sys_resources` VALUES ('2', '角色管理', '/admin/system/role', '菜单', 'role:look', '101', '1');
INSERT INTO `sys_resources` VALUES ('3', '添加', '无', '按钮', 'role:add', '10101', '101');
INSERT INTO `sys_resources` VALUES ('4', '删除', '无', '按钮', 'role:delete', '10102', '101');
INSERT INTO `sys_resources` VALUES ('5', '修改', '无', '按钮', 'role:update', '10103', '101');
INSERT INTO `sys_resources` VALUES ('6', '用户管理', '/admin/system/user', '菜单', 'user:look', '102', '1');
INSERT INTO `sys_resources` VALUES ('7', '添加', '无', '按钮', 'user:add', '10201', '102');
INSERT INTO `sys_resources` VALUES ('8', '删除', '无', '按钮', 'user:delete', '10202', '102');
INSERT INTO `sys_resources` VALUES ('9', '修改', '无', '按钮', 'user:update', '10203', '102');
INSERT INTO `sys_resources` VALUES ('10', '资源管理', '/admin/system/resources', '菜单', 'resources:look', '103', '1');
INSERT INTO `sys_resources` VALUES ('11', '添加', '无', '按钮', 'resources:add', '10301', '103');
INSERT INTO `sys_resources` VALUES ('12', '删除', '无', '按钮', 'resources:delete', '10302', '103');
INSERT INTO `sys_resources` VALUES ('13', '修改', '无', '按钮', 'resources:update', '10303', '103');
INSERT INTO `sys_resources` VALUES ('14', '系统管理', '无', '目录', '无', '2', '0');
INSERT INTO `sys_resources` VALUES ('15', 'Druid监控', '无', '菜单', '无', '201', '2');
INSERT INTO `sys_resources` VALUES ('16', '查看', '/admin/tool/druid', '菜单', 'druid:look', '20101', '201');
INSERT INTO `sys_resources` VALUES ('17', '更新日志', '/admin/tool/updatelog', '菜单', 'updatelog:look', '202', '2');
INSERT INTO `sys_resources` VALUES ('18', '添加', '无', '按钮', 'updatelog:add', '20201', '202');
INSERT INTO `sys_resources` VALUES ('19', '删除', '无', '按钮', 'updatelog:delete', '20202', '202');
INSERT INTO `sys_resources` VALUES ('20', '修改', '无', '按钮', 'updatelog:update', '20203', '202');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '管理员');
INSERT INTO `sys_role` VALUES ('2', 'user', '用户');
INSERT INTO `sys_role` VALUES ('5', '222', '222');
INSERT INTO `sys_role` VALUES ('8', '333', '333');
INSERT INTO `sys_role` VALUES ('9', 'test6', 'test6');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '邮箱，可用于找回密码',
  `sex` int(1) NOT NULL COMMENT '性别，1表示男，0表示女',
  `status` int(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'lzhpo', '0a9dd183174bf25bc06ae63663aa2381', '760613041@qq.com', '1', '1');
INSERT INTO `sys_user` VALUES ('2', 'test', '961d57c148288830a4834e53191bdfaa', '760613041@qq.com', '0', '0');
INSERT INTO `sys_user` VALUES ('7', 'test2', 'aea7f64d34cb1dc9edd47519696a4679', 'test2.qq.com', '1', '1');
INSERT INTO `sys_user` VALUES ('8', 'test3', 'a09e6802bffeeb74d0186bb80b3e4866', 'test3.qq.com', '0', '1');
INSERT INTO `sys_user` VALUES ('9', 'test4', 'ecddb5189390ee64a0e371210fef2dca', 'test4', '1', '0');
INSERT INTO `sys_user` VALUES ('10', 'test5', '862bb4afdbb0e7bc539bbb4fb25f981e', 'test5', '1', '1');
INSERT INTO `sys_user` VALUES ('11', 'test6', '2aeb546292f8223a63a76c06a9cdfd59', 'test6', '0', '0');

-- ----------------------------
-- Table structure for tool_dllog
-- ----------------------------
DROP TABLE IF EXISTS `tool_dllog`;
CREATE TABLE `tool_dllog` (
  `dllog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '下载id',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '下载文件名',
  `dllog_date` datetime NOT NULL COMMENT '下载时间',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '下载人',
  PRIMARY KEY (`dllog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of tool_dllog
-- ----------------------------
INSERT INTO `tool_dllog` VALUES ('1', 'tx.jpg', '2019-06-14 13:04:22', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('2', 'loading.gif', '2019-06-14 13:04:30', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('3', 'bg.png', '2019-06-14 13:04:32', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('4', 'lzhpo.png', '2019-06-14 13:04:38', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('5', 'loading.gif', '2019-06-14 13:04:45', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('6', 'thumbnail-10.jpg', '2019-06-14 13:44:29', 'test');
INSERT INTO `tool_dllog` VALUES ('7', 'BG23.jpg', '2019-06-14 13:44:33', 'test');
INSERT INTO `tool_dllog` VALUES ('8', 'tx.jpg', '2019-06-14 13:46:03', 'test');
INSERT INTO `tool_dllog` VALUES ('9', 'loading.gif', '2019-06-14 13:46:06', 'test');
INSERT INTO `tool_dllog` VALUES ('10', 'BG6.jpg', '2019-06-14 13:46:23', 'test');
INSERT INTO `tool_dllog` VALUES ('11', 'BG5.jpg', '2019-06-14 13:46:26', 'test');
INSERT INTO `tool_dllog` VALUES ('12', 'BG9.jpg', '2019-06-14 13:46:29', 'test');
INSERT INTO `tool_dllog` VALUES ('13', 'tx.jpg', '2019-06-14 13:47:30', 'test');
INSERT INTO `tool_dllog` VALUES ('14', 'tx.jpg', '2019-06-14 13:48:19', 'test');
INSERT INTO `tool_dllog` VALUES ('15', 'loading.gif', '2019-06-14 13:48:22', 'test');
INSERT INTO `tool_dllog` VALUES ('16', 'tx.jpg', '2019-06-14 15:40:53', 'test');
INSERT INTO `tool_dllog` VALUES ('17', 'loading.gif', '2019-06-14 21:12:07', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('18', 'tx.jpg', '2019-06-14 21:19:35', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('19', 'tx.jpg', '2019-06-14 21:21:35', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('20', 'tx.jpg', '2019-06-14 21:25:28', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('21', 'tx.jpg', '2019-06-14 21:26:29', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('22', 'tx.jpg', '2019-06-14 21:26:32', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('23', 'loading.gif', '2019-06-14 21:35:35', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('24', 'tx.jpg', '2019-06-14 21:37:43', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('25', 'tx.jpg', '2019-06-14 21:45:17', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('26', 'BG6.jpg', '2019-06-15 00:50:54', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('27', 'tx.jpg', '2019-06-15 10:53:05', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('28', 'BG3.jpg', '2019-06-16 21:53:32', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('29', 'BG18.jpg', '2019-06-17 01:04:33', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('30', 'tx.jpg', '2019-06-18 14:00:49', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('31', 'BG6.jpg', '2019-06-18 15:05:16', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('32', 'BG6.jpg', '2019-06-18 15:05:17', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('33', 'BG6.jpg', '2019-06-18 15:05:18', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('34', 'BG6.jpg', '2019-06-18 15:05:19', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('35', 'BG6.jpg', '2019-06-18 15:06:38', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('36', 'BG6.jpg', '2019-06-18 15:07:15', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('37', 'BG6.jpg', '2019-06-18 15:11:09', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('38', 'BG5.jpg', '2019-06-18 15:11:14', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('39', 'BG6.jpg', '2019-06-18 15:11:24', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('40', 'BG6.jpg', '2019-06-18 15:13:47', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('41', 'BG6.jpg', '2019-06-18 15:14:14', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('42', 'BG2.jpg', '2019-06-19 16:52:28', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('43', 'BG2.jpg', '2019-06-23 03:41:46', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('44', 'BG2.jpg', '2019-07-04 11:35:44', 'lzhpo');
INSERT INTO `tool_dllog` VALUES ('45', 'BG4.jpg', '2019-07-16 19:33:40', 'lzhpo');

-- ----------------------------
-- Table structure for tool_log
-- ----------------------------
DROP TABLE IF EXISTS `tool_log`;
CREATE TABLE `tool_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `operation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '操作',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dotime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '耗时ms',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of tool_log
-- ----------------------------
INSERT INTO `tool_log` VALUES ('1', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '30.050799ms', '0:0:0:0:0:0:0:1', '2019-07-17 22:24:41');

-- ----------------------------
-- Table structure for tool_myfile
-- ----------------------------
DROP TABLE IF EXISTS `tool_myfile`;
CREATE TABLE `tool_myfile` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件的id',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '文件的名字',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '文件保存的路径',
  `file_size` decimal(10,6) NOT NULL COMMENT '文件大小，单位MB',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of tool_myfile
-- ----------------------------
INSERT INTO `tool_myfile` VALUES ('1', 'BG4.jpg', 'http://localhost:8080/upLoadFile/BG4.jpg', '0.476591');
INSERT INTO `tool_myfile` VALUES ('2', 'BG3.jpg', 'http://localhost:8080/upLoadFile/BG3.jpg', '0.277394');
INSERT INTO `tool_myfile` VALUES ('3', 'BG5.jpg', 'http://localhost:8080/upLoadFile/BG5.jpg', '0.176901');
INSERT INTO `tool_myfile` VALUES ('4', 'BG2.jpg', 'http://localhost:8080/upLoadFile/BG2.jpg', '0.362096');
INSERT INTO `tool_myfile` VALUES ('5', 'BG1.jpg', 'http://localhost:8080/upLoadFile/BG1.jpg', '0.595821');

-- ----------------------------
-- Table structure for tool_updatelog
-- ----------------------------
DROP TABLE IF EXISTS `tool_updatelog`;
CREATE TABLE `tool_updatelog` (
  `updatelog_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `description` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '更新描述',
  PRIMARY KEY (`updatelog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of tool_updatelog
-- ----------------------------
INSERT INTO `tool_updatelog` VALUES ('14', '2019-06-04 11:53:09', '我是');
INSERT INTO `tool_updatelog` VALUES ('17', '2019-06-04 11:53:25', '7777777777777777777777777');
INSERT INTO `tool_updatelog` VALUES ('18', '2019-06-04 11:53:32', '88888888888888888888888888');
INSERT INTO `tool_updatelog` VALUES ('25', '2019-06-05 14:38:30', '00000000000000000000000000000');
INSERT INTO `tool_updatelog` VALUES ('26', '2019-06-07 02:07:19', '更新内容更新内容更新内容更新内容更新内容更');
INSERT INTO `tool_updatelog` VALUES ('29', '2019-06-12 02:14:51', 'aaaaaaaaaaaaaaaaaaa');
INSERT INTO `tool_updatelog` VALUES ('30', '2019-06-12 02:15:08', 'bbbbbbbbbbbbbbbbbb');
INSERT INTO `tool_updatelog` VALUES ('31', '2019-06-12 02:16:07', '2');
INSERT INTO `tool_updatelog` VALUES ('32', '2019-06-12 13:37:35', '11111111111111');
INSERT INTO `tool_updatelog` VALUES ('33', '2019-06-12 14:57:19', '33');
INSERT INTO `tool_updatelog` VALUES ('34', '2019-06-12 14:58:48', 'lzhpo');
INSERT INTO `tool_updatelog` VALUES ('35', '2019-06-12 15:01:48', 'llllllllllllllllllllllllll');
INSERT INTO `tool_updatelog` VALUES ('36', '2019-06-12 15:14:35', 'eeeeeeeeeee');
INSERT INTO `tool_updatelog` VALUES ('37', '2019-06-12 15:17:25', '8888888888888888888888');
INSERT INTO `tool_updatelog` VALUES ('38', '2019-06-12 15:22:32', '123456789');
INSERT INTO `tool_updatelog` VALUES ('39', '2019-06-13 01:55:52', '111');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户id，为主键的原因主要是因为一个用户只有一个角色！',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '2');
INSERT INTO `user_role` VALUES ('7', '1');
INSERT INTO `user_role` VALUES ('8', '2');
INSERT INTO `user_role` VALUES ('9', '5');
INSERT INTO `user_role` VALUES ('10', '1');
INSERT INTO `user_role` VALUES ('11', '5');
INSERT INTO `user_role` VALUES ('12', '9');

-- ----------------------------
-- Function structure for getChildList
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getChildList`(rootId VARCHAR(100)) RETURNS varchar(1000) CHARSET utf8mb4 COLLATE utf8mb4_bin
    DETERMINISTIC
    COMMENT '查询指定根节点下的所有叶子节点(包括根节点)的函数'
BEGIN
    DECLARE pTemp VARCHAR(1000);  
    DECLARE cTemp VARCHAR(1000);
       
    SET pTemp = '';  
    SET cTemp = rootId;
       
    WHILE cTemp is not null DO  
       if (pTemp = '') then
         SET pTemp = cTemp;
         elseif(pTemp <> '') then
         SET pTemp = concat(pTemp,',',cTemp);
         end if;
         SELECT group_concat(id) INTO cTemp FROM sys_resources
         WHERE FIND_IN_SET(pId,cTemp)>0; 
     END WHILE;  
     RETURN pTemp;  
END
;;
DELIMITER ;
