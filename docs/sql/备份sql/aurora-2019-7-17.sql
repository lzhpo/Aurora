/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : aurora

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-07-17 00:44:43
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'lzhpo', 'f7cfd63c0650f63ffb17abe139aaaed7', '760613041@qq.com', '1', '1');
INSERT INTO `sys_user` VALUES ('2', 'test', '92fcea46c827b63cdf98419b2ae4c19e', '760613041@qq.com', '0', '0');
INSERT INTO `sys_user` VALUES ('7', 'test2', 'aea7f64d34cb1dc9edd47519696a4679', 'test2.qq.com', '1', '1');
INSERT INTO `sys_user` VALUES ('8', 'test3', 'a09e6802bffeeb74d0186bb80b3e4866', 'test3.qq.com', '0', '1');
INSERT INTO `sys_user` VALUES ('9', 'test4', 'ecddb5189390ee64a0e371210fef2dca', 'test4', '1', '0');
INSERT INTO `sys_user` VALUES ('10', 'test5', '862bb4afdbb0e7bc539bbb4fb25f981e', 'test5', '1', '1');
INSERT INTO `sys_user` VALUES ('11', 'test6', '2aeb546292f8223a63a76c06a9cdfd59', 'test6', '0', '0');
INSERT INTO `sys_user` VALUES ('12', 'test7', 'a14497c9dbb07084e29a399ed35ee5b4', 'test7', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of tool_log
-- ----------------------------
INSERT INTO `tool_log` VALUES ('7', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.196559ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:03:53');
INSERT INTO `tool_log` VALUES ('8', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.050689ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:03:54');
INSERT INTO `tool_log` VALUES ('9', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.051054ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:03:55');
INSERT INTO `tool_log` VALUES ('10', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.066735ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:03:57');
INSERT INTO `tool_log` VALUES ('11', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.061994ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:03:58');
INSERT INTO `tool_log` VALUES ('12', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.048866ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:03:59');
INSERT INTO `tool_log` VALUES ('13', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.048137ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:04:00');
INSERT INTO `tool_log` VALUES ('14', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.071111ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:04:26');
INSERT INTO `tool_log` VALUES ('15', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.784846ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:27:28');
INSERT INTO `tool_log` VALUES ('16', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.282986ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:27:31');
INSERT INTO `tool_log` VALUES ('17', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.057253ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:27:33');
INSERT INTO `tool_log` VALUES ('18', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '3.940285ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:28:36');
INSERT INTO `tool_log` VALUES ('19', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.248342ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:28:37');
INSERT INTO `tool_log` VALUES ('20', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.052148ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:28:42');
INSERT INTO `tool_log` VALUES ('21', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.115111ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:40:23');
INSERT INTO `tool_log` VALUES ('22', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.384729ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:40:24');
INSERT INTO `tool_log` VALUES ('23', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '16.301922ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:48:28');
INSERT INTO `tool_log` VALUES ('24', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '16.023312ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:49:20');
INSERT INTO `tool_log` VALUES ('25', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.471520ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:49:21');
INSERT INTO `tool_log` VALUES ('26', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '14.463612ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:50:31');
INSERT INTO `tool_log` VALUES ('27', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.355191ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:50:32');
INSERT INTO `tool_log` VALUES ('28', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.048136ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:53:57');
INSERT INTO `tool_log` VALUES ('29', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.043032ms', '0:0:0:0:0:0:0:1', '2019-06-12 01:53:58');
INSERT INTO `tool_log` VALUES ('30', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '14.416933ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:11:27');
INSERT INTO `tool_log` VALUES ('31', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.404785ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:11:28');
INSERT INTO `tool_log` VALUES ('32', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.230108ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:12:50');
INSERT INTO `tool_log` VALUES ('33', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.092991ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:13:56');
INSERT INTO `tool_log` VALUES ('34', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.077310ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:14:04');
INSERT INTO `tool_log` VALUES ('35', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.081687ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:14:05');
INSERT INTO `tool_log` VALUES ('36', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.269128ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:14:33');
INSERT INTO `tool_log` VALUES ('37', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.266575ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:14:53');
INSERT INTO `tool_log` VALUES ('38', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.242143ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:15:10');
INSERT INTO `tool_log` VALUES ('39', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.077310ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:15:24');
INSERT INTO `tool_log` VALUES ('40', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.077311ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:15:28');
INSERT INTO `tool_log` VALUES ('41', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.177959ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:15:52');
INSERT INTO `tool_log` VALUES ('42', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.231932ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:16:09');
INSERT INTO `tool_log` VALUES ('43', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.080228ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:17:40');
INSERT INTO `tool_log` VALUES ('44', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.105265ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:19:31');
INSERT INTO `tool_log` VALUES ('45', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.285538ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:19:37');
INSERT INTO `tool_log` VALUES ('46', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.353367ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:19:52');
INSERT INTO `tool_log` VALUES ('47', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.263293ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:21:02');
INSERT INTO `tool_log` VALUES ('48', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '7.591737ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:21:49');
INSERT INTO `tool_log` VALUES ('49', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.126220ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:23:30');
INSERT INTO `tool_log` VALUES ('50', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.476261ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:23:37');
INSERT INTO `tool_log` VALUES ('51', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '15.005514ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:24:19');
INSERT INTO `tool_log` VALUES ('52', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '1.337981ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:24:20');
INSERT INTO `tool_log` VALUES ('53', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.358837ms', '0:0:0:0:0:0:0:1', '2019-06-12 02:24:28');
INSERT INTO `tool_log` VALUES ('54', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '16.516349ms', '0:0:0:0:0:0:0:1', '2019-06-12 10:53:57');
INSERT INTO `tool_log` VALUES ('55', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.274598ms', '0:0:0:0:0:0:0:1', '2019-06-12 10:54:04');
INSERT INTO `tool_log` VALUES ('56', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.099555ms', '0:0:0:0:0:0:0:1', '2019-06-12 10:54:06');
INSERT INTO `tool_log` VALUES ('57', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.143035ms', '0:0:0:0:0:0:0:1', '2019-06-12 10:57:06');
INSERT INTO `tool_log` VALUES ('58', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.291008ms', '0:0:0:0:0:0:0:1', '2019-06-12 10:57:07');
INSERT INTO `tool_log` VALUES ('59', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '15.765125ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:02:35');
INSERT INTO `tool_log` VALUES ('60', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.747213ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:02:36');
INSERT INTO `tool_log` VALUES ('61', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.232661ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:03:57');
INSERT INTO `tool_log` VALUES ('62', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.286268ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:04:02');
INSERT INTO `tool_log` VALUES ('63', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.209322ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:04:03');
INSERT INTO `tool_log` VALUES ('64', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '16.682275ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:05:45');
INSERT INTO `tool_log` VALUES ('65', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.390563ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:05:46');
INSERT INTO `tool_log` VALUES ('66', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.082416ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:05:51');
INSERT INTO `tool_log` VALUES ('67', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '14.502267ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:14:52');
INSERT INTO `tool_log` VALUES ('68', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.667224ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:19:52');
INSERT INTO `tool_log` VALUES ('69', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.611919ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:19:53');
INSERT INTO `tool_log` VALUES ('70', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '7.690199ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:20:54');
INSERT INTO `tool_log` VALUES ('71', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '145.727578ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:39:05');
INSERT INTO `tool_log` VALUES ('72', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.340238ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:39:12');
INSERT INTO `tool_log` VALUES ('73', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.272410ms', '0:0:0:0:0:0:0:1', '2019-06-12 11:46:08');
INSERT INTO `tool_log` VALUES ('74', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '8.520921ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:38:09');
INSERT INTO `tool_log` VALUES ('75', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '14.572648ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:01');
INSERT INTO `tool_log` VALUES ('76', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.602803ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:05');
INSERT INTO `tool_log` VALUES ('77', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.235214ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:15');
INSERT INTO `tool_log` VALUES ('78', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.201299ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:15');
INSERT INTO `tool_log` VALUES ('79', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.211509ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:16');
INSERT INTO `tool_log` VALUES ('80', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.424842ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:17');
INSERT INTO `tool_log` VALUES ('81', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.255999ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:19');
INSERT INTO `tool_log` VALUES ('82', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.202393ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:24');
INSERT INTO `tool_log` VALUES ('83', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.173219ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:25');
INSERT INTO `tool_log` VALUES ('84', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.173219ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:34');
INSERT INTO `tool_log` VALUES ('85', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.234484ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:35');
INSERT INTO `tool_log` VALUES ('86', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.148057ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:36');
INSERT INTO `tool_log` VALUES ('87', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.106485ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:41:38');
INSERT INTO `tool_log` VALUES ('88', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.140034ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:42:44');
INSERT INTO `tool_log` VALUES ('89', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.080957ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:42:45');
INSERT INTO `tool_log` VALUES ('90', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.118518ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:42:45');
INSERT INTO `tool_log` VALUES ('91', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.083510ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:42:45');
INSERT INTO `tool_log` VALUES ('92', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.076581ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:42:45');
INSERT INTO `tool_log` VALUES ('93', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087521ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:42:45');
INSERT INTO `tool_log` VALUES ('94', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.142222ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:42:46');
INSERT INTO `tool_log` VALUES ('95', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.137117ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:42:46');
INSERT INTO `tool_log` VALUES ('96', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.119977ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:42:46');
INSERT INTO `tool_log` VALUES ('97', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.079499ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:43:19');
INSERT INTO `tool_log` VALUES ('98', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087521ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:43:30');
INSERT INTO `tool_log` VALUES ('99', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.144046ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:43:31');
INSERT INTO `tool_log` VALUES ('100', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.075852ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:43:31');
INSERT INTO `tool_log` VALUES ('101', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.077311ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:43:32');
INSERT INTO `tool_log` VALUES ('102', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.075122ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:43:33');
INSERT INTO `tool_log` VALUES ('103', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.073664ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:43:33');
INSERT INTO `tool_log` VALUES ('104', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.109036ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:43:34');
INSERT INTO `tool_log` VALUES ('105', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '20.708616ms', '127.0.0.1', '2019-06-12 12:54:04');
INSERT INTO `tool_log` VALUES ('106', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.543361ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:54:06');
INSERT INTO `tool_log` VALUES ('107', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.343885ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:54:08');
INSERT INTO `tool_log` VALUES ('108', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.304865ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:54:17');
INSERT INTO `tool_log` VALUES ('109', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.260375ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:54:24');
INSERT INTO `tool_log` VALUES ('110', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.445994ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:54:26');
INSERT INTO `tool_log` VALUES ('111', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.301948ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:54:43');
INSERT INTO `tool_log` VALUES ('112', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.398222ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:01');
INSERT INTO `tool_log` VALUES ('113', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.216615ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:05');
INSERT INTO `tool_log` VALUES ('114', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.177231ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:06');
INSERT INTO `tool_log` VALUES ('115', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.179054ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:06');
INSERT INTO `tool_log` VALUES ('116', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.239225ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:07');
INSERT INTO `tool_log` VALUES ('117', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.155715ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:07');
INSERT INTO `tool_log` VALUES ('118', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.385458ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:07');
INSERT INTO `tool_log` VALUES ('119', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.197288ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:07');
INSERT INTO `tool_log` VALUES ('120', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.286268ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:07');
INSERT INTO `tool_log` VALUES ('121', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.140399ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:08');
INSERT INTO `tool_log` VALUES ('122', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.207863ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:08');
INSERT INTO `tool_log` VALUES ('123', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.229743ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:08');
INSERT INTO `tool_log` VALUES ('124', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.152433ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:08');
INSERT INTO `tool_log` VALUES ('125', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.316535ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:08');
INSERT INTO `tool_log` VALUES ('126', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.152797ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:08');
INSERT INTO `tool_log` VALUES ('127', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.181241ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:09');
INSERT INTO `tool_log` VALUES ('128', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.115601ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:09');
INSERT INTO `tool_log` VALUES ('129', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.204216ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:09');
INSERT INTO `tool_log` VALUES ('130', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.107578ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:09');
INSERT INTO `tool_log` VALUES ('131', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.097367ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:09');
INSERT INTO `tool_log` VALUES ('132', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.121436ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:10');
INSERT INTO `tool_log` VALUES ('133', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.117424ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:10');
INSERT INTO `tool_log` VALUES ('134', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.098096ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:10');
INSERT INTO `tool_log` VALUES ('135', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.097732ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:10');
INSERT INTO `tool_log` VALUES ('136', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.119977ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:10');
INSERT INTO `tool_log` VALUES ('137', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.161185ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:11');
INSERT INTO `tool_log` VALUES ('138', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.115601ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:15');
INSERT INTO `tool_log` VALUES ('139', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.083510ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:16');
INSERT INTO `tool_log` VALUES ('140', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.094085ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:17');
INSERT INTO `tool_log` VALUES ('141', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.132376ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:39');
INSERT INTO `tool_log` VALUES ('142', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.109037ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:55:40');
INSERT INTO `tool_log` VALUES ('143', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.106120ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:56:02');
INSERT INTO `tool_log` VALUES ('144', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.085333ms', '0:0:0:0:0:0:0:1', '2019-06-12 12:56:03');
INSERT INTO `tool_log` VALUES ('145', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '14.642301ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:03:34');
INSERT INTO `tool_log` VALUES ('146', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.005149ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:31:21');
INSERT INTO `tool_log` VALUES ('147', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.337321ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:31:30');
INSERT INTO `tool_log` VALUES ('148', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103931ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:31:31');
INSERT INTO `tool_log` VALUES ('149', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.086428ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:31:35');
INSERT INTO `tool_log` VALUES ('150', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.101379ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:31:37');
INSERT INTO `tool_log` VALUES ('151', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.118883ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:31:43');
INSERT INTO `tool_log` VALUES ('152', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.096274ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:05');
INSERT INTO `tool_log` VALUES ('153', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.106484ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:06');
INSERT INTO `tool_log` VALUES ('154', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.082051ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:06');
INSERT INTO `tool_log` VALUES ('155', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.075122ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:06');
INSERT INTO `tool_log` VALUES ('156', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.078769ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:06');
INSERT INTO `tool_log` VALUES ('157', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.126176ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:07');
INSERT INTO `tool_log` VALUES ('158', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.152797ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:07');
INSERT INTO `tool_log` VALUES ('159', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.129458ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:07');
INSERT INTO `tool_log` VALUES ('160', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.127999ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:07');
INSERT INTO `tool_log` VALUES ('161', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.085698ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:07');
INSERT INTO `tool_log` VALUES ('162', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.096273ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:08');
INSERT INTO `tool_log` VALUES ('163', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.143681ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:32:09');
INSERT INTO `tool_log` VALUES ('164', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '136.335457ms', '127.0.0.1', '2019-06-12 13:37:19');
INSERT INTO `tool_log` VALUES ('165', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.518198ms', '127.0.0.1', '2019-06-12 13:37:22');
INSERT INTO `tool_log` VALUES ('166', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.380353ms', '127.0.0.1', '2019-06-12 13:37:23');
INSERT INTO `tool_log` VALUES ('167', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.519293ms', '127.0.0.1', '2019-06-12 13:37:24');
INSERT INTO `tool_log` VALUES ('168', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.273504ms', '127.0.0.1', '2019-06-12 13:37:25');
INSERT INTO `tool_log` VALUES ('169', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.314347ms', '127.0.0.1', '2019-06-12 13:37:26');
INSERT INTO `tool_log` VALUES ('170', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.348262ms', '127.0.0.1', '2019-06-12 13:37:27');
INSERT INTO `tool_log` VALUES ('171', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.192546ms', '127.0.0.1', '2019-06-12 13:37:27');
INSERT INTO `tool_log` VALUES ('172', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.202393ms', '127.0.0.1', '2019-06-12 13:37:27');
INSERT INTO `tool_log` VALUES ('173', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.192182ms', '127.0.0.1', '2019-06-12 13:37:27');
INSERT INTO `tool_log` VALUES ('174', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.310336ms', '127.0.0.1', '2019-06-12 13:37:27');
INSERT INTO `tool_log` VALUES ('175', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.222814ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:37:27');
INSERT INTO `tool_log` VALUES ('176', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '1.325581ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:37:28');
INSERT INTO `tool_log` VALUES ('177', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.189629ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:37:28');
INSERT INTO `tool_log` VALUES ('178', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.336592ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:37:28');
INSERT INTO `tool_log` VALUES ('179', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.386188ms', '127.0.0.1', '2019-06-12 13:37:28');
INSERT INTO `tool_log` VALUES ('180', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.259281ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:37:29');
INSERT INTO `tool_log` VALUES ('181', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '14.226210ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:28');
INSERT INTO `tool_log` VALUES ('182', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.505435ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:29');
INSERT INTO `tool_log` VALUES ('183', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.290279ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:30');
INSERT INTO `tool_log` VALUES ('184', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.326017ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:51');
INSERT INTO `tool_log` VALUES ('185', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.432501ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:51');
INSERT INTO `tool_log` VALUES ('186', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.138940ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:51');
INSERT INTO `tool_log` VALUES ('187', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.361754ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:52');
INSERT INTO `tool_log` VALUES ('188', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.182335ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:52');
INSERT INTO `tool_log` VALUES ('189', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.137846ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:52');
INSERT INTO `tool_log` VALUES ('190', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.197288ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:52');
INSERT INTO `tool_log` VALUES ('191', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.316900ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:52');
INSERT INTO `tool_log` VALUES ('192', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.246883ms', '0:0:0:0:0:0:0:1', '2019-06-12 13:41:52');
INSERT INTO `tool_log` VALUES ('193', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '13.912592ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:31');
INSERT INTO `tool_log` VALUES ('194', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.354825ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:35');
INSERT INTO `tool_log` VALUES ('195', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.097367ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:44');
INSERT INTO `tool_log` VALUES ('196', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.081321ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:44');
INSERT INTO `tool_log` VALUES ('197', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.101379ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:44');
INSERT INTO `tool_log` VALUES ('198', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.215886ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:45');
INSERT INTO `tool_log` VALUES ('199', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.114507ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:45');
INSERT INTO `tool_log` VALUES ('200', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087157ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:45');
INSERT INTO `tool_log` VALUES ('201', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.108308ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:45');
INSERT INTO `tool_log` VALUES ('202', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.120341ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:45');
INSERT INTO `tool_log` VALUES ('203', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.097003ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:46');
INSERT INTO `tool_log` VALUES ('204', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.177596ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:46');
INSERT INTO `tool_log` VALUES ('205', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.105390ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:46');
INSERT INTO `tool_log` VALUES ('206', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.075852ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:46');
INSERT INTO `tool_log` VALUES ('207', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.083875ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:46');
INSERT INTO `tool_log` VALUES ('208', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.123989ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:47');
INSERT INTO `tool_log` VALUES ('209', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.095179ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:47');
INSERT INTO `tool_log` VALUES ('210', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.133469ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:47');
INSERT INTO `tool_log` VALUES ('211', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.106848ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:47');
INSERT INTO `tool_log` VALUES ('212', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.095908ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:47');
INSERT INTO `tool_log` VALUES ('213', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.102837ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:48');
INSERT INTO `tool_log` VALUES ('214', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.088980ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:48');
INSERT INTO `tool_log` VALUES ('215', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.121801ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:48');
INSERT INTO `tool_log` VALUES ('216', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087157ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:48');
INSERT INTO `tool_log` VALUES ('217', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.082051ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:48');
INSERT INTO `tool_log` VALUES ('218', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.107578ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:48');
INSERT INTO `tool_log` VALUES ('219', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.136752ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:49');
INSERT INTO `tool_log` VALUES ('220', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.073664ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:49');
INSERT INTO `tool_log` VALUES ('221', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.080957ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:50');
INSERT INTO `tool_log` VALUES ('222', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.076216ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:58');
INSERT INTO `tool_log` VALUES ('223', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.071840ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:58');
INSERT INTO `tool_log` VALUES ('224', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.115236ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:58');
INSERT INTO `tool_log` VALUES ('225', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.078405ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:59');
INSERT INTO `tool_log` VALUES ('226', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.142952ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:59');
INSERT INTO `tool_log` VALUES ('227', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.095909ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:59');
INSERT INTO `tool_log` VALUES ('228', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.086792ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:59');
INSERT INTO `tool_log` VALUES ('229', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.099556ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:59');
INSERT INTO `tool_log` VALUES ('230', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087886ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:14:59');
INSERT INTO `tool_log` VALUES ('231', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.130917ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:00');
INSERT INTO `tool_log` VALUES ('232', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.074758ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:00');
INSERT INTO `tool_log` VALUES ('233', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.136752ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:00');
INSERT INTO `tool_log` VALUES ('234', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.080957ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:00');
INSERT INTO `tool_log` VALUES ('235', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.084604ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:00');
INSERT INTO `tool_log` VALUES ('236', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.072205ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:01');
INSERT INTO `tool_log` VALUES ('237', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.075123ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:01');
INSERT INTO `tool_log` VALUES ('238', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.080593ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:01');
INSERT INTO `tool_log` VALUES ('239', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.138575ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:01');
INSERT INTO `tool_log` VALUES ('240', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.073664ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:01');
INSERT INTO `tool_log` VALUES ('241', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.144410ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:02');
INSERT INTO `tool_log` VALUES ('242', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.157538ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:02');
INSERT INTO `tool_log` VALUES ('243', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.071111ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:02');
INSERT INTO `tool_log` VALUES ('244', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.076945ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:02');
INSERT INTO `tool_log` VALUES ('245', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.068194ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:02');
INSERT INTO `tool_log` VALUES ('246', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.071476ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:02');
INSERT INTO `tool_log` VALUES ('247', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.163008ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:03');
INSERT INTO `tool_log` VALUES ('248', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.096638ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:03');
INSERT INTO `tool_log` VALUES ('249', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.078040ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:03');
INSERT INTO `tool_log` VALUES ('250', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.119248ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:03');
INSERT INTO `tool_log` VALUES ('251', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.090074ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:03');
INSERT INTO `tool_log` VALUES ('252', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.094814ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:03');
INSERT INTO `tool_log` VALUES ('253', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.086791ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:03');
INSERT INTO `tool_log` VALUES ('254', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.118519ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:04');
INSERT INTO `tool_log` VALUES ('255', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.254905ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:04');
INSERT INTO `tool_log` VALUES ('256', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.107943ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:04');
INSERT INTO `tool_log` VALUES ('257', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.117789ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:04');
INSERT INTO `tool_log` VALUES ('258', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.072569ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:04');
INSERT INTO `tool_log` VALUES ('259', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.123624ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:05');
INSERT INTO `tool_log` VALUES ('260', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.093721ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:15:59');
INSERT INTO `tool_log` VALUES ('261', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.081322ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:00');
INSERT INTO `tool_log` VALUES ('262', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.067100ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:01');
INSERT INTO `tool_log` VALUES ('263', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.128729ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:01');
INSERT INTO `tool_log` VALUES ('264', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.074028ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:02');
INSERT INTO `tool_log` VALUES ('265', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.067464ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:03');
INSERT INTO `tool_log` VALUES ('266', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.076946ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:08');
INSERT INTO `tool_log` VALUES ('267', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.114872ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:08');
INSERT INTO `tool_log` VALUES ('268', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.079134ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:08');
INSERT INTO `tool_log` VALUES ('269', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.094085ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:09');
INSERT INTO `tool_log` VALUES ('270', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.101379ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:09');
INSERT INTO `tool_log` VALUES ('271', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.157173ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:09');
INSERT INTO `tool_log` VALUES ('272', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.107943ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:09');
INSERT INTO `tool_log` VALUES ('273', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.146233ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:09');
INSERT INTO `tool_log` VALUES ('274', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.125083ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:10');
INSERT INTO `tool_log` VALUES ('275', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.089709ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:10');
INSERT INTO `tool_log` VALUES ('276', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103202ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:10');
INSERT INTO `tool_log` VALUES ('277', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.142222ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:10');
INSERT INTO `tool_log` VALUES ('278', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.096638ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:10');
INSERT INTO `tool_log` VALUES ('279', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.089709ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:10');
INSERT INTO `tool_log` VALUES ('280', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.080228ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:11');
INSERT INTO `tool_log` VALUES ('281', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.082051ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:20');
INSERT INTO `tool_log` VALUES ('282', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.083875ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:20');
INSERT INTO `tool_log` VALUES ('283', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.066370ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:21');
INSERT INTO `tool_log` VALUES ('284', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.081322ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:21');
INSERT INTO `tool_log` VALUES ('285', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.106119ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:21');
INSERT INTO `tool_log` VALUES ('286', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.081322ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:21');
INSERT INTO `tool_log` VALUES ('287', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.074393ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:21');
INSERT INTO `tool_log` VALUES ('288', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.084239ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:22');
INSERT INTO `tool_log` VALUES ('289', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.112319ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:22');
INSERT INTO `tool_log` VALUES ('290', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.089709ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:22');
INSERT INTO `tool_log` VALUES ('291', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103202ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:22');
INSERT INTO `tool_log` VALUES ('292', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.178324ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:22');
INSERT INTO `tool_log` VALUES ('293', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087521ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:22');
INSERT INTO `tool_log` VALUES ('294', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.094450ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:23');
INSERT INTO `tool_log` VALUES ('295', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.160820ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:23');
INSERT INTO `tool_log` VALUES ('296', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.093721ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:23');
INSERT INTO `tool_log` VALUES ('297', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.105755ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:23');
INSERT INTO `tool_log` VALUES ('298', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.097732ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:24');
INSERT INTO `tool_log` VALUES ('299', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.068194ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:48');
INSERT INTO `tool_log` VALUES ('300', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.126541ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:16:49');
INSERT INTO `tool_log` VALUES ('301', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '14.444284ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:30:26');
INSERT INTO `tool_log` VALUES ('302', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.718769ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:30:31');
INSERT INTO `tool_log` VALUES ('303', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.238860ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:30:33');
INSERT INTO `tool_log` VALUES ('304', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.314712ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:30:35');
INSERT INTO `tool_log` VALUES ('305', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.477355ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:30:37');
INSERT INTO `tool_log` VALUES ('306', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.531326ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:30:39');
INSERT INTO `tool_log` VALUES ('307', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.413902ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:31:20');
INSERT INTO `tool_log` VALUES ('308', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '14.765560ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:00');
INSERT INTO `tool_log` VALUES ('309', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.264387ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:08');
INSERT INTO `tool_log` VALUES ('310', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.128000ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:09');
INSERT INTO `tool_log` VALUES ('311', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.105390ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:10');
INSERT INTO `tool_log` VALUES ('312', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.160820ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:24');
INSERT INTO `tool_log` VALUES ('313', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.147328ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:24');
INSERT INTO `tool_log` VALUES ('314', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.187077ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:24');
INSERT INTO `tool_log` VALUES ('315', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.108672ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:24');
INSERT INTO `tool_log` VALUES ('316', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.095179ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:25');
INSERT INTO `tool_log` VALUES ('317', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.118518ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:25');
INSERT INTO `tool_log` VALUES ('318', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.156445ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:25');
INSERT INTO `tool_log` VALUES ('319', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.130188ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:25');
INSERT INTO `tool_log` VALUES ('320', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087157ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:26');
INSERT INTO `tool_log` VALUES ('321', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.137117ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:26');
INSERT INTO `tool_log` VALUES ('322', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.127635ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:26');
INSERT INTO `tool_log` VALUES ('323', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.156809ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:26');
INSERT INTO `tool_log` VALUES ('324', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.226462ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:27');
INSERT INTO `tool_log` VALUES ('325', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.151703ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:27');
INSERT INTO `tool_log` VALUES ('326', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.147327ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:38');
INSERT INTO `tool_log` VALUES ('327', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.075487ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:55');
INSERT INTO `tool_log` VALUES ('328', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.074758ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:58');
INSERT INTO `tool_log` VALUES ('329', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.138575ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:34:58');
INSERT INTO `tool_log` VALUES ('330', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.273504ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:35:34');
INSERT INTO `tool_log` VALUES ('331', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.194735ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:35:35');
INSERT INTO `tool_log` VALUES ('332', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.074757ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:35:39');
INSERT INTO `tool_log` VALUES ('333', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.101379ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:35:54');
INSERT INTO `tool_log` VALUES ('334', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.078040ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:35:55');
INSERT INTO `tool_log` VALUES ('335', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.284852ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:38:06');
INSERT INTO `tool_log` VALUES ('336', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.340968ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:38:11');
INSERT INTO `tool_log` VALUES ('337', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087521ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:38:12');
INSERT INTO `tool_log` VALUES ('338', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.136022ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:38:12');
INSERT INTO `tool_log` VALUES ('339', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.102472ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:38:14');
INSERT INTO `tool_log` VALUES ('340', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.097732ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:38:21');
INSERT INTO `tool_log` VALUES ('341', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '14.026006ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:51');
INSERT INTO `tool_log` VALUES ('342', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.256729ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:55');
INSERT INTO `tool_log` VALUES ('343', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.134564ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:56');
INSERT INTO `tool_log` VALUES ('344', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.119977ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:56');
INSERT INTO `tool_log` VALUES ('345', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.122530ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:56');
INSERT INTO `tool_log` VALUES ('346', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.214427ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:56');
INSERT INTO `tool_log` VALUES ('347', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.100284ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:57');
INSERT INTO `tool_log` VALUES ('348', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.100285ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:57');
INSERT INTO `tool_log` VALUES ('349', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.080957ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:57');
INSERT INTO `tool_log` VALUES ('350', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.108307ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:57');
INSERT INTO `tool_log` VALUES ('351', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.180512ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:57');
INSERT INTO `tool_log` VALUES ('352', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.075123ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:57');
INSERT INTO `tool_log` VALUES ('353', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.097732ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:58');
INSERT INTO `tool_log` VALUES ('354', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087521ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:58');
INSERT INTO `tool_log` VALUES ('355', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.082415ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:58');
INSERT INTO `tool_log` VALUES ('356', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.092991ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:40:59');
INSERT INTO `tool_log` VALUES ('357', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.116695ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:41:07');
INSERT INTO `tool_log` VALUES ('358', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.079134ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:41:19');
INSERT INTO `tool_log` VALUES ('359', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '15.358516ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:44:33');
INSERT INTO `tool_log` VALUES ('360', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '1.045149ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:44:34');
INSERT INTO `tool_log` VALUES ('361', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.393481ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:44:44');
INSERT INTO `tool_log` VALUES ('362', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.864273ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:44:54');
INSERT INTO `tool_log` VALUES ('363', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.437242ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:44:59');
INSERT INTO `tool_log` VALUES ('364', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.207863ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:45:01');
INSERT INTO `tool_log` VALUES ('365', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.258917ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:45:02');
INSERT INTO `tool_log` VALUES ('366', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.223179ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:45:07');
INSERT INTO `tool_log` VALUES ('367', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '15.480681ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:21');
INSERT INTO `tool_log` VALUES ('368', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.657139ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:22');
INSERT INTO `tool_log` VALUES ('369', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.257458ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:26');
INSERT INTO `tool_log` VALUES ('370', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.265481ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:27');
INSERT INTO `tool_log` VALUES ('371', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.266940ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:27');
INSERT INTO `tool_log` VALUES ('372', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.237036ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:28');
INSERT INTO `tool_log` VALUES ('373', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.536796ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:37');
INSERT INTO `tool_log` VALUES ('374', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.273139ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:40');
INSERT INTO `tool_log` VALUES ('375', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.264022ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:41');
INSERT INTO `tool_log` VALUES ('376', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.218439ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:41');
INSERT INTO `tool_log` VALUES ('377', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.226097ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:47:42');
INSERT INTO `tool_log` VALUES ('378', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.214836ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:25');
INSERT INTO `tool_log` VALUES ('379', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.632706ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:29');
INSERT INTO `tool_log` VALUES ('380', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.268763ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:30');
INSERT INTO `tool_log` VALUES ('381', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.321640ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:31');
INSERT INTO `tool_log` VALUES ('382', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.243601ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:32');
INSERT INTO `tool_log` VALUES ('383', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.638176ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:32');
INSERT INTO `tool_log` VALUES ('384', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.303043ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:33');
INSERT INTO `tool_log` VALUES ('385', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.428489ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:34');
INSERT INTO `tool_log` VALUES ('386', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.211509ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:35');
INSERT INTO `tool_log` VALUES ('387', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.235943ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:36');
INSERT INTO `tool_log` VALUES ('388', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.202029ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:36');
INSERT INTO `tool_log` VALUES ('389', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.297937ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:38');
INSERT INTO `tool_log` VALUES ('390', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '1.534174ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:51:59');
INSERT INTO `tool_log` VALUES ('391', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.237037ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:52:01');
INSERT INTO `tool_log` VALUES ('392', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.191088ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:55:23');
INSERT INTO `tool_log` VALUES ('393', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.622174ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:56:42');
INSERT INTO `tool_log` VALUES ('394', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.723874ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:56:46');
INSERT INTO `tool_log` VALUES ('395', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.430677ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:56:47');
INSERT INTO `tool_log` VALUES ('396', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.282985ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:56:48');
INSERT INTO `tool_log` VALUES ('397', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.311065ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:56:50');
INSERT INTO `tool_log` VALUES ('398', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.237766ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:56:51');
INSERT INTO `tool_log` VALUES ('399', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.332216ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:56:51');
INSERT INTO `tool_log` VALUES ('400', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.274598ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:56:51');
INSERT INTO `tool_log` VALUES ('401', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.273504ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:56:51');
INSERT INTO `tool_log` VALUES ('402', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.736637ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:56:59');
INSERT INTO `tool_log` VALUES ('403', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.178689ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:57:02');
INSERT INTO `tool_log` VALUES ('404', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.191453ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:57:05');
INSERT INTO `tool_log` VALUES ('405', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '14.479292ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:58:33');
INSERT INTO `tool_log` VALUES ('406', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '1.128660ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:58:50');
INSERT INTO `tool_log` VALUES ('407', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.296478ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:58:56');
INSERT INTO `tool_log` VALUES ('408', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.307419ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:59:16');
INSERT INTO `tool_log` VALUES ('409', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.297572ms', '0:0:0:0:0:0:0:1', '2019-06-12 14:59:34');
INSERT INTO `tool_log` VALUES ('410', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '14.756443ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:00:39');
INSERT INTO `tool_log` VALUES ('411', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.424113ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:00:44');
INSERT INTO `tool_log` VALUES ('412', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.113413ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:01:36');
INSERT INTO `tool_log` VALUES ('413', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.119248ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:01:50');
INSERT INTO `tool_log` VALUES ('414', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.192911ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:02:05');
INSERT INTO `tool_log` VALUES ('415', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.083145ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:02:14');
INSERT INTO `tool_log` VALUES ('416', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.086428ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:02:53');
INSERT INTO `tool_log` VALUES ('417', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.121800ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:02:54');
INSERT INTO `tool_log` VALUES ('418', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.089344ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:02:55');
INSERT INTO `tool_log` VALUES ('419', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.076216ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:00');
INSERT INTO `tool_log` VALUES ('420', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.080228ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:06');
INSERT INTO `tool_log` VALUES ('421', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.114871ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:06');
INSERT INTO `tool_log` VALUES ('422', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.095908ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:06');
INSERT INTO `tool_log` VALUES ('423', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.202758ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:06');
INSERT INTO `tool_log` VALUES ('424', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.129094ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:07');
INSERT INTO `tool_log` VALUES ('425', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.104661ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:07');
INSERT INTO `tool_log` VALUES ('426', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.154620ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:07');
INSERT INTO `tool_log` VALUES ('427', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087886ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:07');
INSERT INTO `tool_log` VALUES ('428', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.088980ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:07');
INSERT INTO `tool_log` VALUES ('429', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.164467ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:07');
INSERT INTO `tool_log` VALUES ('430', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.092627ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:07');
INSERT INTO `tool_log` VALUES ('431', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.080957ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:08');
INSERT INTO `tool_log` VALUES ('432', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.095179ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:08');
INSERT INTO `tool_log` VALUES ('433', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.191453ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:08');
INSERT INTO `tool_log` VALUES ('434', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.167749ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:08');
INSERT INTO `tool_log` VALUES ('435', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.092626ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:08');
INSERT INTO `tool_log` VALUES ('436', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.092262ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:09');
INSERT INTO `tool_log` VALUES ('437', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.080228ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:09');
INSERT INTO `tool_log` VALUES ('438', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.110131ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:09');
INSERT INTO `tool_log` VALUES ('439', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.081322ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:09');
INSERT INTO `tool_log` VALUES ('440', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.097732ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:09');
INSERT INTO `tool_log` VALUES ('441', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.123259ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:09');
INSERT INTO `tool_log` VALUES ('442', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.099920ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:10');
INSERT INTO `tool_log` VALUES ('443', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.118518ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:10');
INSERT INTO `tool_log` VALUES ('444', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.072570ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:10');
INSERT INTO `tool_log` VALUES ('445', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.114142ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:10');
INSERT INTO `tool_log` VALUES ('446', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.092992ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:10');
INSERT INTO `tool_log` VALUES ('447', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.144775ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:11');
INSERT INTO `tool_log` VALUES ('448', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.124353ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:11');
INSERT INTO `tool_log` VALUES ('449', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.093356ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:11');
INSERT INTO `tool_log` VALUES ('450', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.070747ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:11');
INSERT INTO `tool_log` VALUES ('451', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.083145ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:03:12');
INSERT INTO `tool_log` VALUES ('452', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '14.760819ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:14:14');
INSERT INTO `tool_log` VALUES ('453', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.966380ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:14:37');
INSERT INTO `tool_log` VALUES ('454', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '16.290252ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:15:56');
INSERT INTO `tool_log` VALUES ('455', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.524763ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:15:57');
INSERT INTO `tool_log` VALUES ('456', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.321276ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:15:59');
INSERT INTO `tool_log` VALUES ('457', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.170302ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:15:59');
INSERT INTO `tool_log` VALUES ('458', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.219533ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:00');
INSERT INTO `tool_log` VALUES ('459', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.140034ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:01');
INSERT INTO `tool_log` VALUES ('460', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.203487ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:01');
INSERT INTO `tool_log` VALUES ('461', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.326746ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:02');
INSERT INTO `tool_log` VALUES ('462', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.122894ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:17');
INSERT INTO `tool_log` VALUES ('463', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.108672ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:17');
INSERT INTO `tool_log` VALUES ('464', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.094450ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:18');
INSERT INTO `tool_log` VALUES ('465', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.199840ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:18');
INSERT INTO `tool_log` VALUES ('466', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.115601ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:19');
INSERT INTO `tool_log` VALUES ('467', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.093356ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:20');
INSERT INTO `tool_log` VALUES ('468', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.100649ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:42');
INSERT INTO `tool_log` VALUES ('469', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087156ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:55');
INSERT INTO `tool_log` VALUES ('470', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103567ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:56');
INSERT INTO `tool_log` VALUES ('471', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.107943ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:57');
INSERT INTO `tool_log` VALUES ('472', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.088251ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:57');
INSERT INTO `tool_log` VALUES ('473', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.084604ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:58');
INSERT INTO `tool_log` VALUES ('474', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.095544ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:59');
INSERT INTO `tool_log` VALUES ('475', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.099191ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:16:59');
INSERT INTO `tool_log` VALUES ('476', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.082780ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:03');
INSERT INTO `tool_log` VALUES ('477', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.071476ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:06');
INSERT INTO `tool_log` VALUES ('478', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.123623ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:06');
INSERT INTO `tool_log` VALUES ('479', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.122165ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:06');
INSERT INTO `tool_log` VALUES ('480', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.171031ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:06');
INSERT INTO `tool_log` VALUES ('481', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.197652ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:07');
INSERT INTO `tool_log` VALUES ('482', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.124717ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:07');
INSERT INTO `tool_log` VALUES ('483', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.072570ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:07');
INSERT INTO `tool_log` VALUES ('484', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.133105ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:07');
INSERT INTO `tool_log` VALUES ('485', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.082416ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:07');
INSERT INTO `tool_log` VALUES ('486', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.196558ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:07');
INSERT INTO `tool_log` VALUES ('487', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087886ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:08');
INSERT INTO `tool_log` VALUES ('488', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.266210ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:08');
INSERT INTO `tool_log` VALUES ('489', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.070747ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:08');
INSERT INTO `tool_log` VALUES ('490', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.079134ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:08');
INSERT INTO `tool_log` VALUES ('491', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.094450ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:08');
INSERT INTO `tool_log` VALUES ('492', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.125447ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:08');
INSERT INTO `tool_log` VALUES ('493', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.328569ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:09');
INSERT INTO `tool_log` VALUES ('494', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.133470ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:09');
INSERT INTO `tool_log` VALUES ('495', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.078769ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:09');
INSERT INTO `tool_log` VALUES ('496', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.074758ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:09');
INSERT INTO `tool_log` VALUES ('497', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.096273ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:09');
INSERT INTO `tool_log` VALUES ('498', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.098461ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:09');
INSERT INTO `tool_log` VALUES ('499', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.189994ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:10');
INSERT INTO `tool_log` VALUES ('500', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.145139ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:10');
INSERT INTO `tool_log` VALUES ('501', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.073299ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:10');
INSERT INTO `tool_log` VALUES ('502', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.096638ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:10');
INSERT INTO `tool_log` VALUES ('503', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103931ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:10');
INSERT INTO `tool_log` VALUES ('504', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.146598ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:10');
INSERT INTO `tool_log` VALUES ('505', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.125082ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:11');
INSERT INTO `tool_log` VALUES ('506', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.142586ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:11');
INSERT INTO `tool_log` VALUES ('507', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.099191ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:11');
INSERT INTO `tool_log` VALUES ('508', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.070746ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:11');
INSERT INTO `tool_log` VALUES ('509', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.098097ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:11');
INSERT INTO `tool_log` VALUES ('510', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087521ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:12');
INSERT INTO `tool_log` VALUES ('511', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.126176ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:12');
INSERT INTO `tool_log` VALUES ('512', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.075122ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:12');
INSERT INTO `tool_log` VALUES ('513', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.072934ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:12');
INSERT INTO `tool_log` VALUES ('514', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.128000ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:12');
INSERT INTO `tool_log` VALUES ('515', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.070017ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:12');
INSERT INTO `tool_log` VALUES ('516', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.066370ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:13');
INSERT INTO `tool_log` VALUES ('517', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.083510ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:13');
INSERT INTO `tool_log` VALUES ('518', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.071840ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:13');
INSERT INTO `tool_log` VALUES ('519', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.136752ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:16');
INSERT INTO `tool_log` VALUES ('520', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.160456ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:27');
INSERT INTO `tool_log` VALUES ('521', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.102473ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:17:35');
INSERT INTO `tool_log` VALUES ('522', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.816544ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:18');
INSERT INTO `tool_log` VALUES ('523', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.729344ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:24');
INSERT INTO `tool_log` VALUES ('524', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.198746ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:25');
INSERT INTO `tool_log` VALUES ('525', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.221720ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:25');
INSERT INTO `tool_log` VALUES ('526', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.417549ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:25');
INSERT INTO `tool_log` VALUES ('527', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.295749ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:25');
INSERT INTO `tool_log` VALUES ('528', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.338051ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:26');
INSERT INTO `tool_log` VALUES ('529', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.164102ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:26');
INSERT INTO `tool_log` VALUES ('530', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.274963ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:26');
INSERT INTO `tool_log` VALUES ('531', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.083875ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:26');
INSERT INTO `tool_log` VALUES ('532', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.087156ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:27');
INSERT INTO `tool_log` VALUES ('533', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103567ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:27');
INSERT INTO `tool_log` VALUES ('534', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.183794ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:27');
INSERT INTO `tool_log` VALUES ('535', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.137845ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:27');
INSERT INTO `tool_log` VALUES ('536', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.105025ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:27');
INSERT INTO `tool_log` VALUES ('537', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.111589ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:27');
INSERT INTO `tool_log` VALUES ('538', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.091533ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:28');
INSERT INTO `tool_log` VALUES ('539', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.135293ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:28');
INSERT INTO `tool_log` VALUES ('540', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.076217ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:28');
INSERT INTO `tool_log` VALUES ('541', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.086792ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:28');
INSERT INTO `tool_log` VALUES ('542', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.119977ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:28');
INSERT INTO `tool_log` VALUES ('543', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.109766ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:28');
INSERT INTO `tool_log` VALUES ('544', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.100285ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:29');
INSERT INTO `tool_log` VALUES ('545', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.074393ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:29');
INSERT INTO `tool_log` VALUES ('546', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.110495ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:29');
INSERT INTO `tool_log` VALUES ('547', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.144775ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:29');
INSERT INTO `tool_log` VALUES ('548', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.130188ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:29');
INSERT INTO `tool_log` VALUES ('549', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.126541ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:30');
INSERT INTO `tool_log` VALUES ('550', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.140763ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:30');
INSERT INTO `tool_log` VALUES ('551', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.094450ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:30');
INSERT INTO `tool_log` VALUES ('552', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.079863ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:31');
INSERT INTO `tool_log` VALUES ('553', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.123259ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:31');
INSERT INTO `tool_log` VALUES ('554', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.087521ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:20:32');
INSERT INTO `tool_log` VALUES ('555', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.813262ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:40');
INSERT INTO `tool_log` VALUES ('556', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.609731ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:43');
INSERT INTO `tool_log` VALUES ('557', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.234483ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:43');
INSERT INTO `tool_log` VALUES ('558', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.265481ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:44');
INSERT INTO `tool_log` VALUES ('559', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.365766ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:44');
INSERT INTO `tool_log` VALUES ('560', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.245060ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:44');
INSERT INTO `tool_log` VALUES ('561', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.364672ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:44');
INSERT INTO `tool_log` VALUES ('562', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.356648ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:45');
INSERT INTO `tool_log` VALUES ('563', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.595874ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:45');
INSERT INTO `tool_log` VALUES ('564', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.313982ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:45');
INSERT INTO `tool_log` VALUES ('565', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.245059ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:46');
INSERT INTO `tool_log` VALUES ('566', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.197288ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:46');
INSERT INTO `tool_log` VALUES ('567', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.532786ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:46');
INSERT INTO `tool_log` VALUES ('568', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.306325ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:46');
INSERT INTO `tool_log` VALUES ('569', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.490119ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:47');
INSERT INTO `tool_log` VALUES ('570', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.181242ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:47');
INSERT INTO `tool_log` VALUES ('571', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.243601ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:47');
INSERT INTO `tool_log` VALUES ('572', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.133105ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:47');
INSERT INTO `tool_log` VALUES ('573', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.150245ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:47');
INSERT INTO `tool_log` VALUES ('574', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.147327ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:48');
INSERT INTO `tool_log` VALUES ('575', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.120342ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:48');
INSERT INTO `tool_log` VALUES ('576', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.119247ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:48');
INSERT INTO `tool_log` VALUES ('577', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.153162ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:21:50');
INSERT INTO `tool_log` VALUES ('578', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.160091ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:00');
INSERT INTO `tool_log` VALUES ('579', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.133105ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:01');
INSERT INTO `tool_log` VALUES ('580', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.116695ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:01');
INSERT INTO `tool_log` VALUES ('581', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.144045ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:01');
INSERT INTO `tool_log` VALUES ('582', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.163373ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:01');
INSERT INTO `tool_log` VALUES ('583', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.171031ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:01');
INSERT INTO `tool_log` VALUES ('584', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.163008ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:01');
INSERT INTO `tool_log` VALUES ('585', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.176136ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:02');
INSERT INTO `tool_log` VALUES ('586', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.186712ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:02');
INSERT INTO `tool_log` VALUES ('587', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.166655ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:02');
INSERT INTO `tool_log` VALUES ('588', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.100285ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:02');
INSERT INTO `tool_log` VALUES ('589', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.098461ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:03');
INSERT INTO `tool_log` VALUES ('590', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.143316ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:03');
INSERT INTO `tool_log` VALUES ('591', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.105025ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:03');
INSERT INTO `tool_log` VALUES ('592', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.128729ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:03');
INSERT INTO `tool_log` VALUES ('593', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.142587ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:03');
INSERT INTO `tool_log` VALUES ('594', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.155714ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:04');
INSERT INTO `tool_log` VALUES ('595', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.121436ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:04');
INSERT INTO `tool_log` VALUES ('596', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.249436ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:04');
INSERT INTO `tool_log` VALUES ('597', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.073299ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:04');
INSERT INTO `tool_log` VALUES ('598', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.079863ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:04');
INSERT INTO `tool_log` VALUES ('599', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.105025ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:04');
INSERT INTO `tool_log` VALUES ('600', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.110496ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:05');
INSERT INTO `tool_log` VALUES ('601', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.070017ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:05');
INSERT INTO `tool_log` VALUES ('602', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.115236ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:05');
INSERT INTO `tool_log` VALUES ('603', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.110860ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:05');
INSERT INTO `tool_log` VALUES ('604', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.115237ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:05');
INSERT INTO `tool_log` VALUES ('605', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.114143ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:05');
INSERT INTO `tool_log` VALUES ('606', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.123259ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:06');
INSERT INTO `tool_log` VALUES ('607', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.128000ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:06');
INSERT INTO `tool_log` VALUES ('608', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.130552ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:06');
INSERT INTO `tool_log` VALUES ('609', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.128364ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:06');
INSERT INTO `tool_log` VALUES ('610', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.095909ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:06');
INSERT INTO `tool_log` VALUES ('611', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103202ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:07');
INSERT INTO `tool_log` VALUES ('612', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.079134ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:07');
INSERT INTO `tool_log` VALUES ('613', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.073299ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:07');
INSERT INTO `tool_log` VALUES ('614', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.085333ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:07');
INSERT INTO `tool_log` VALUES ('615', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.066370ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:07');
INSERT INTO `tool_log` VALUES ('616', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.088616ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:08');
INSERT INTO `tool_log` VALUES ('617', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.134199ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:08');
INSERT INTO `tool_log` VALUES ('618', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.117060ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:08');
INSERT INTO `tool_log` VALUES ('619', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.130188ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:08');
INSERT INTO `tool_log` VALUES ('620', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.236672ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:08');
INSERT INTO `tool_log` VALUES ('621', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.084239ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:09');
INSERT INTO `tool_log` VALUES ('622', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.132740ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:26');
INSERT INTO `tool_log` VALUES ('623', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.263293ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:35');
INSERT INTO `tool_log` VALUES ('624', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.097367ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:39');
INSERT INTO `tool_log` VALUES ('625', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.077311ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:44');
INSERT INTO `tool_log` VALUES ('626', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.162279ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:56');
INSERT INTO `tool_log` VALUES ('627', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.139305ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:56');
INSERT INTO `tool_log` VALUES ('628', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.163738ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:56');
INSERT INTO `tool_log` VALUES ('629', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.085698ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:56');
INSERT INTO `tool_log` VALUES ('630', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.148421ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:56');
INSERT INTO `tool_log` VALUES ('631', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.124353ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:56');
INSERT INTO `tool_log` VALUES ('632', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.152433ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:57');
INSERT INTO `tool_log` VALUES ('633', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.117425ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:57');
INSERT INTO `tool_log` VALUES ('634', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.117424ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:57');
INSERT INTO `tool_log` VALUES ('635', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.133835ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:57');
INSERT INTO `tool_log` VALUES ('636', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.081687ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:57');
INSERT INTO `tool_log` VALUES ('637', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.114506ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:58');
INSERT INTO `tool_log` VALUES ('638', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103567ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:22:59');
INSERT INTO `tool_log` VALUES ('639', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.070017ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:00');
INSERT INTO `tool_log` VALUES ('640', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.083510ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:02');
INSERT INTO `tool_log` VALUES ('641', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.064546ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:02');
INSERT INTO `tool_log` VALUES ('642', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.067100ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:03');
INSERT INTO `tool_log` VALUES ('643', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.077675ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:03');
INSERT INTO `tool_log` VALUES ('644', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.063088ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:04');
INSERT INTO `tool_log` VALUES ('645', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.062359ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:05');
INSERT INTO `tool_log` VALUES ('646', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.102838ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:05');
INSERT INTO `tool_log` VALUES ('647', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.063818ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:06');
INSERT INTO `tool_log` VALUES ('648', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.064547ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:14');
INSERT INTO `tool_log` VALUES ('649', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.076216ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:15');
INSERT INTO `tool_log` VALUES ('650', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.070746ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:15');
INSERT INTO `tool_log` VALUES ('651', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.067829ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:16');
INSERT INTO `tool_log` VALUES ('652', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.075122ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:16');
INSERT INTO `tool_log` VALUES ('653', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.134564ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:17');
INSERT INTO `tool_log` VALUES ('654', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.077675ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:17');
INSERT INTO `tool_log` VALUES ('655', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.066735ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:18');
INSERT INTO `tool_log` VALUES ('656', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.086427ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:18');
INSERT INTO `tool_log` VALUES ('657', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.100650ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:19');
INSERT INTO `tool_log` VALUES ('658', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.086792ms', '0:0:0:0:0:0:0:1', '2019-06-12 15:23:20');
INSERT INTO `tool_log` VALUES ('659', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.696243ms', '0:0:0:0:0:0:0:1', '2019-06-12 16:00:30');
INSERT INTO `tool_log` VALUES ('660', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.235578ms', '0:0:0:0:0:0:0:1', '2019-06-12 16:00:31');
INSERT INTO `tool_log` VALUES ('661', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.142951ms', '0:0:0:0:0:0:0:1', '2019-06-12 16:00:32');
INSERT INTO `tool_log` VALUES ('662', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.098097ms', '0:0:0:0:0:0:0:1', '2019-06-12 16:00:56');
INSERT INTO `tool_log` VALUES ('663', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.150245ms', '0:0:0:0:0:0:0:1', '2019-06-12 16:00:57');
INSERT INTO `tool_log` VALUES ('664', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.291781ms', '0:0:0:0:0:0:0:1', '2019-06-12 17:00:50');
INSERT INTO `tool_log` VALUES ('665', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '15.433274ms', '0:0:0:0:0:0:0:1', '2019-06-12 17:07:43');
INSERT INTO `tool_log` VALUES ('666', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.773469ms', '0:0:0:0:0:0:0:1', '2019-06-12 17:07:45');
INSERT INTO `tool_log` VALUES ('667', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '16.181580ms', '0:0:0:0:0:0:0:1', '2019-06-12 17:10:35');
INSERT INTO `tool_log` VALUES ('668', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '16.142196ms', '0:0:0:0:0:0:0:1', '2019-06-12 17:11:57');
INSERT INTO `tool_log` VALUES ('669', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.604261ms', '0:0:0:0:0:0:0:1', '2019-06-12 17:11:58');
INSERT INTO `tool_log` VALUES ('670', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '15.758926ms', '0:0:0:0:0:0:0:1', '2019-06-12 17:12:30');
INSERT INTO `tool_log` VALUES ('671', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '58.704496ms', '0:0:0:0:0:0:0:1', '2019-06-12 22:05:47');
INSERT INTO `tool_log` VALUES ('672', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.537891ms', '0:0:0:0:0:0:0:1', '2019-06-12 22:05:49');
INSERT INTO `tool_log` VALUES ('673', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.397857ms', '0:0:0:0:0:0:0:1', '2019-06-12 22:07:15');
INSERT INTO `tool_log` VALUES ('674', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.410256ms', '0:0:0:0:0:0:0:1', '2019-06-12 22:07:16');
INSERT INTO `tool_log` VALUES ('675', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '7.599395ms', '0:0:0:0:0:0:0:1', '2019-06-12 23:07:27');
INSERT INTO `tool_log` VALUES ('676', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '1.021081ms', '0:0:0:0:0:0:0:1', '2019-06-12 23:32:02');
INSERT INTO `tool_log` VALUES ('677', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.867555ms', '0:0:0:0:0:0:0:1', '2019-06-12 23:43:16');
INSERT INTO `tool_log` VALUES ('678', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '17.572439ms', '0:0:0:0:0:0:0:1', '2019-06-12 23:59:24');
INSERT INTO `tool_log` VALUES ('679', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.169251ms', '0:0:0:0:0:0:0:1', '2019-06-13 00:46:59');
INSERT INTO `tool_log` VALUES ('680', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.571440ms', '0:0:0:0:0:0:0:1', '2019-06-13 00:47:03');
INSERT INTO `tool_log` VALUES ('681', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '7.328809ms', '0:0:0:0:0:0:0:1', '2019-06-13 01:55:46');
INSERT INTO `tool_log` VALUES ('682', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.999201ms', '0:0:0:0:0:0:0:1', '2019-06-13 01:55:54');
INSERT INTO `tool_log` VALUES ('683', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '7.459726ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:22:17');
INSERT INTO `tool_log` VALUES ('684', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.303042ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:25:52');
INSERT INTO `tool_log` VALUES ('685', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.086792ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:25:53');
INSERT INTO `tool_log` VALUES ('686', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.084604ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:25');
INSERT INTO `tool_log` VALUES ('687', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.081686ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:25');
INSERT INTO `tool_log` VALUES ('688', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.073664ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:26');
INSERT INTO `tool_log` VALUES ('689', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.121071ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:26');
INSERT INTO `tool_log` VALUES ('690', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.109037ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:26');
INSERT INTO `tool_log` VALUES ('691', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103202ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:26');
INSERT INTO `tool_log` VALUES ('692', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.074029ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:26');
INSERT INTO `tool_log` VALUES ('693', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.114507ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:26');
INSERT INTO `tool_log` VALUES ('694', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.080957ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:27');
INSERT INTO `tool_log` VALUES ('695', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.076581ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:27');
INSERT INTO `tool_log` VALUES ('696', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.107578ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:27');
INSERT INTO `tool_log` VALUES ('697', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.082781ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:27');
INSERT INTO `tool_log` VALUES ('698', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.095544ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:28');
INSERT INTO `tool_log` VALUES ('699', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.106484ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:28');
INSERT INTO `tool_log` VALUES ('700', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.089709ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:26:28');
INSERT INTO `tool_log` VALUES ('701', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.075487ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:15');
INSERT INTO `tool_log` VALUES ('702', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.115236ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:15');
INSERT INTO `tool_log` VALUES ('703', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.092627ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:15');
INSERT INTO `tool_log` VALUES ('704', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.143681ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:16');
INSERT INTO `tool_log` VALUES ('705', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.072935ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:16');
INSERT INTO `tool_log` VALUES ('706', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.157538ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:16');
INSERT INTO `tool_log` VALUES ('707', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.124353ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:16');
INSERT INTO `tool_log` VALUES ('708', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.180148ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:16');
INSERT INTO `tool_log` VALUES ('709', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.104296ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:17');
INSERT INTO `tool_log` VALUES ('710', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.071111ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:17');
INSERT INTO `tool_log` VALUES ('711', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.125447ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:17');
INSERT INTO `tool_log` VALUES ('712', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.097732ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:17');
INSERT INTO `tool_log` VALUES ('713', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.082780ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:17');
INSERT INTO `tool_log` VALUES ('714', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.122894ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:17');
INSERT INTO `tool_log` VALUES ('715', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.125447ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:18');
INSERT INTO `tool_log` VALUES ('716', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.089345ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:18');
INSERT INTO `tool_log` VALUES ('717', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.073664ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:27:19');
INSERT INTO `tool_log` VALUES ('718', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.072935ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:33:40');
INSERT INTO `tool_log` VALUES ('719', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.075487ms', '0:0:0:0:0:0:0:1', '2019-06-13 02:33:41');
INSERT INTO `tool_log` VALUES ('720', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '26.858441ms', '0:0:0:0:0:0:0:1', '2019-06-13 13:50:16');
INSERT INTO `tool_log` VALUES ('721', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '4.161999ms', '0:0:0:0:0:0:0:1', '2019-06-13 14:01:47');
INSERT INTO `tool_log` VALUES ('722', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.289549ms', '0:0:0:0:0:0:0:1', '2019-06-13 14:01:55');
INSERT INTO `tool_log` VALUES ('723', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '7.023578ms', '0:0:0:0:0:0:0:1', '2019-06-13 14:07:43');
INSERT INTO `tool_log` VALUES ('724', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.383720ms', '0:0:0:0:0:0:0:1', '2019-06-13 18:12:04');
INSERT INTO `tool_log` VALUES ('725', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.271191ms', '0:0:0:0:0:0:0:1', '2019-06-13 21:03:31');
INSERT INTO `tool_log` VALUES ('726', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '9.908497ms', '0:0:0:0:0:0:0:1', '2019-06-13 23:29:39');
INSERT INTO `tool_log` VALUES ('727', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.509321ms', '0:0:0:0:0:0:0:1', '2019-06-14 01:29:39');
INSERT INTO `tool_log` VALUES ('728', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.109766ms', '0:0:0:0:0:0:0:1', '2019-06-14 01:30:57');
INSERT INTO `tool_log` VALUES ('729', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '8.769262ms', '0:0:0:0:0:0:0:1', '2019-06-14 03:27:47');
INSERT INTO `tool_log` VALUES ('730', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '8.054141ms', '0:0:0:0:0:0:0:1', '2019-06-14 03:31:05');
INSERT INTO `tool_log` VALUES ('731', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '8.459291ms', '0:0:0:0:0:0:0:1', '2019-06-14 13:57:07');
INSERT INTO `tool_log` VALUES ('732', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '6.838325ms', '0:0:0:0:0:0:0:1', '2019-06-14 14:04:56');
INSERT INTO `tool_log` VALUES ('733', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '8.276955ms', '0:0:0:0:0:0:0:1', '2019-06-14 14:06:27');
INSERT INTO `tool_log` VALUES ('734', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '16.522913ms', '0:0:0:0:0:0:0:1', '2019-06-14 14:14:29');
INSERT INTO `tool_log` VALUES ('735', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.313253ms', '0:0:0:0:0:0:0:1', '2019-06-14 14:15:00');
INSERT INTO `tool_log` VALUES ('736', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.222085ms', '0:0:0:0:0:0:0:1', '2019-06-14 14:15:03');
INSERT INTO `tool_log` VALUES ('737', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.086062ms', '0:0:0:0:0:0:0:1', '2019-06-14 14:15:04');
INSERT INTO `tool_log` VALUES ('738', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.079863ms', '0:0:0:0:0:0:0:1', '2019-06-14 14:15:05');
INSERT INTO `tool_log` VALUES ('739', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.079499ms', '0:0:0:0:0:0:0:1', '2019-06-14 14:15:10');
INSERT INTO `tool_log` VALUES ('740', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '54.441119ms', '0:0:0:0:0:0:0:1', '2019-06-14 14:57:39');
INSERT INTO `tool_log` VALUES ('741', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.256085ms', '0:0:0:0:0:0:0:1', '2019-06-14 15:38:04');
INSERT INTO `tool_log` VALUES ('742', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.387281ms', '0:0:0:0:0:0:0:1', '2019-06-14 15:38:05');
INSERT INTO `tool_log` VALUES ('743', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.021236ms', '0:0:0:0:0:0:0:1', '2019-06-14 15:40:40');
INSERT INTO `tool_log` VALUES ('744', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.461310ms', '0:0:0:0:0:0:0:1', '2019-06-14 15:40:40');
INSERT INTO `tool_log` VALUES ('745', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.106484ms', '0:0:0:0:0:0:0:1', '2019-06-14 15:40:42');
INSERT INTO `tool_log` VALUES ('746', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '6.563727ms', '0:0:0:0:0:0:0:1', '2019-06-14 15:52:29');
INSERT INTO `tool_log` VALUES ('747', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.327476ms', '0:0:0:0:0:0:0:1', '2019-06-14 15:52:29');
INSERT INTO `tool_log` VALUES ('748', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.341782ms', '0:0:0:0:0:0:0:1', '2019-06-14 15:56:57');
INSERT INTO `tool_log` VALUES ('749', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.144130ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:07:30');
INSERT INTO `tool_log` VALUES ('750', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.320182ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:07:32');
INSERT INTO `tool_log` VALUES ('751', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.074028ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:07:38');
INSERT INTO `tool_log` VALUES ('752', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.097367ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:07:40');
INSERT INTO `tool_log` VALUES ('753', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '3.977840ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:22:56');
INSERT INTO `tool_log` VALUES ('754', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '4.432950ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:50:13');
INSERT INTO `tool_log` VALUES ('755', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.329664ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:50:14');
INSERT INTO `tool_log` VALUES ('756', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.070017ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:50:39');
INSERT INTO `tool_log` VALUES ('757', 'test', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.089345ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:51:10');
INSERT INTO `tool_log` VALUES ('758', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.091533ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:51:13');
INSERT INTO `tool_log` VALUES ('759', 'test', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.148786ms', '0:0:0:0:0:0:0:1', '2019-06-14 16:51:40');
INSERT INTO `tool_log` VALUES ('760', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '141.889773ms', '0:0:0:0:0:0:0:1', '2019-06-14 18:57:09');
INSERT INTO `tool_log` VALUES ('761', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.334040ms', '0:0:0:0:0:0:0:1', '2019-06-14 18:57:10');
INSERT INTO `tool_log` VALUES ('762', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '4.591218ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:08:28');
INSERT INTO `tool_log` VALUES ('763', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.395024ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:15:00');
INSERT INTO `tool_log` VALUES ('764', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.123624ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:15:03');
INSERT INTO `tool_log` VALUES ('765', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.095544ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:15:36');
INSERT INTO `tool_log` VALUES ('766', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.123259ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:16:04');
INSERT INTO `tool_log` VALUES ('767', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.074393ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:16:20');
INSERT INTO `tool_log` VALUES ('768', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.073664ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:16:21');
INSERT INTO `tool_log` VALUES ('769', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '3.812643ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:21:12');
INSERT INTO `tool_log` VALUES ('770', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.296479ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:21:18');
INSERT INTO `tool_log` VALUES ('771', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.085697ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:23:46');
INSERT INTO `tool_log` VALUES ('772', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.222450ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:23:47');
INSERT INTO `tool_log` VALUES ('773', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.107213ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:24:33');
INSERT INTO `tool_log` VALUES ('774', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.498016ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:27:44');
INSERT INTO `tool_log` VALUES ('775', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.324558ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:27:45');
INSERT INTO `tool_log` VALUES ('776', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '9.053341ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:30:10');
INSERT INTO `tool_log` VALUES ('777', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.181242ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:32:48');
INSERT INTO `tool_log` VALUES ('778', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.078769ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:33:15');
INSERT INTO `tool_log` VALUES ('779', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.078405ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:33:16');
INSERT INTO `tool_log` VALUES ('780', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.091897ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:33:19');
INSERT INTO `tool_log` VALUES ('781', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.078769ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:33:33');
INSERT INTO `tool_log` VALUES ('782', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.090803ms', '0:0:0:0:0:0:0:1', '2019-06-14 20:33:54');
INSERT INTO `tool_log` VALUES ('783', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.090803ms', '0:0:0:0:0:0:0:1', '2019-06-14 21:02:02');
INSERT INTO `tool_log` VALUES ('784', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.145139ms', '0:0:0:0:0:0:0:1', '2019-06-14 21:02:02');
INSERT INTO `tool_log` VALUES ('785', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.089345ms', '0:0:0:0:0:0:0:1', '2019-06-14 21:02:06');
INSERT INTO `tool_log` VALUES ('786', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.092262ms', '0:0:0:0:0:0:0:1', '2019-06-14 21:07:55');
INSERT INTO `tool_log` VALUES ('787', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.079499ms', '0:0:0:0:0:0:0:1', '2019-06-14 21:07:57');
INSERT INTO `tool_log` VALUES ('788', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '14.094563ms', '0:0:0:0:0:0:0:1', '2019-06-15 00:50:36');
INSERT INTO `tool_log` VALUES ('789', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.464592ms', '0:0:0:0:0:0:0:1', '2019-06-15 00:50:38');
INSERT INTO `tool_log` VALUES ('790', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.107943ms', '0:0:0:0:0:0:0:1', '2019-06-15 00:50:39');
INSERT INTO `tool_log` VALUES ('791', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.044210ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:06:32');
INSERT INTO `tool_log` VALUES ('792', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.366860ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:06:33');
INSERT INTO `tool_log` VALUES ('793', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.083509ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:06:36');
INSERT INTO `tool_log` VALUES ('794', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '8.811199ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:10:44');
INSERT INTO `tool_log` VALUES ('795', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.429583ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:10:45');
INSERT INTO `tool_log` VALUES ('796', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.131282ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:12:31');
INSERT INTO `tool_log` VALUES ('797', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.081686ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:12:32');
INSERT INTO `tool_log` VALUES ('798', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.083145ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:12:33');
INSERT INTO `tool_log` VALUES ('799', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.080592ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:12:34');
INSERT INTO `tool_log` VALUES ('800', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.082051ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:12:34');
INSERT INTO `tool_log` VALUES ('801', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.095179ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:12:35');
INSERT INTO `tool_log` VALUES ('802', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.085333ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:12:35');
INSERT INTO `tool_log` VALUES ('803', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.107213ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:12:35');
INSERT INTO `tool_log` VALUES ('804', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.099191ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:12:36');
INSERT INTO `tool_log` VALUES ('805', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.105390ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:12:46');
INSERT INTO `tool_log` VALUES ('806', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '16.220235ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:14:42');
INSERT INTO `tool_log` VALUES ('807', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.412808ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:15:39');
INSERT INTO `tool_log` VALUES ('808', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.086063ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:15:40');
INSERT INTO `tool_log` VALUES ('809', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.092992ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:16:07');
INSERT INTO `tool_log` VALUES ('810', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.197287ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:18:17');
INSERT INTO `tool_log` VALUES ('811', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.078769ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:18:27');
INSERT INTO `tool_log` VALUES ('812', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.083510ms', '0:0:0:0:0:0:0:1', '2019-06-15 01:19:03');
INSERT INTO `tool_log` VALUES ('813', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '120.418994ms', '0:0:0:0:0:0:0:1', '2019-06-15 10:50:25');
INSERT INTO `tool_log` VALUES ('814', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.346803ms', '0:0:0:0:0:0:0:1', '2019-06-15 10:51:19');
INSERT INTO `tool_log` VALUES ('815', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103567ms', '0:0:0:0:0:0:0:1', '2019-06-15 10:51:20');
INSERT INTO `tool_log` VALUES ('816', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '15.573307ms', '0:0:0:0:0:0:0:1', '2019-06-15 14:03:16');
INSERT INTO `tool_log` VALUES ('817', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.464466ms', '0:0:0:0:0:0:0:1', '2019-06-15 15:54:33');
INSERT INTO `tool_log` VALUES ('818', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '7.302188ms', '0:0:0:0:0:0:0:1', '2019-06-15 17:17:02');
INSERT INTO `tool_log` VALUES ('819', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '11.387605ms', '0:0:0:0:0:0:0:1', '2019-06-16 00:32:54');
INSERT INTO `tool_log` VALUES ('820', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.029413ms', '0:0:0:0:0:0:0:1', '2019-06-16 01:15:03');
INSERT INTO `tool_log` VALUES ('821', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.469053ms', '0:0:0:0:0:0:0:1', '2019-06-16 01:19:49');
INSERT INTO `tool_log` VALUES ('822', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.345709ms', '0:0:0:0:0:0:0:1', '2019-06-16 01:19:50');
INSERT INTO `tool_log` VALUES ('823', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.098097ms', '0:0:0:0:0:0:0:1', '2019-06-16 01:21:32');
INSERT INTO `tool_log` VALUES ('824', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.080592ms', '0:0:0:0:0:0:0:1', '2019-06-16 01:21:56');
INSERT INTO `tool_log` VALUES ('825', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.079498ms', '0:0:0:0:0:0:0:1', '2019-06-16 01:21:57');
INSERT INTO `tool_log` VALUES ('826', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.081322ms', '0:0:0:0:0:0:0:1', '2019-06-16 01:22:11');
INSERT INTO `tool_log` VALUES ('827', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '7.183304ms', '0:0:0:0:0:0:0:1', '2019-06-16 01:44:56');
INSERT INTO `tool_log` VALUES ('828', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '7.341572ms', '0:0:0:0:0:0:0:1', '2019-06-16 02:03:02');
INSERT INTO `tool_log` VALUES ('829', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '1.048431ms', '0:0:0:0:0:0:0:1', '2019-06-16 02:04:21');
INSERT INTO `tool_log` VALUES ('830', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.326746ms', '0:0:0:0:0:0:0:1', '2019-06-16 02:04:24');
INSERT INTO `tool_log` VALUES ('831', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.103567ms', '0:0:0:0:0:0:0:1', '2019-06-16 02:04:31');
INSERT INTO `tool_log` VALUES ('832', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.069288ms', '0:0:0:0:0:0:0:1', '2019-06-16 02:04:56');
INSERT INTO `tool_log` VALUES ('833', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '1.444101ms', '0:0:0:0:0:0:0:1', '2019-06-16 02:09:33');
INSERT INTO `tool_log` VALUES ('834', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.311065ms', '0:0:0:0:0:0:0:1', '2019-06-16 02:09:38');
INSERT INTO `tool_log` VALUES ('835', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.172489ms', '0:0:0:0:0:0:0:1', '2019-06-16 02:09:39');
INSERT INTO `tool_log` VALUES ('836', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '20.587544ms', '0:0:0:0:0:0:0:1', '2019-06-16 11:23:58');
INSERT INTO `tool_log` VALUES ('837', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.329663ms', '0:0:0:0:0:0:0:1', '2019-06-16 11:23:59');
INSERT INTO `tool_log` VALUES ('838', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.892226ms', '0:0:0:0:0:0:0:1', '2019-06-16 16:22:20');
INSERT INTO `tool_log` VALUES ('839', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '12.033439ms', '0:0:0:0:0:0:0:1', '2019-06-16 17:47:59');
INSERT INTO `tool_log` VALUES ('840', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.277880ms', '0:0:0:0:0:0:0:1', '2019-06-16 17:48:00');
INSERT INTO `tool_log` VALUES ('841', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.104660ms', '0:0:0:0:0:0:0:1', '2019-06-16 17:48:00');
INSERT INTO `tool_log` VALUES ('842', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.327924ms', '0:0:0:0:0:0:0:1', '2019-06-16 21:30:56');
INSERT INTO `tool_log` VALUES ('843', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.267669ms', '0:0:0:0:0:0:0:1', '2019-06-16 21:30:58');
INSERT INTO `tool_log` VALUES ('844', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.099190ms', '0:0:0:0:0:0:0:1', '2019-06-16 21:31:02');
INSERT INTO `tool_log` VALUES ('845', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '7.316409ms', '0:0:0:0:0:0:0:1', '2019-06-16 21:53:13');
INSERT INTO `tool_log` VALUES ('846', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.284079ms', '0:0:0:0:0:0:0:1', '2019-06-16 21:53:15');
INSERT INTO `tool_log` VALUES ('847', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.081321ms', '0:0:0:0:0:0:0:1', '2019-06-16 21:53:17');
INSERT INTO `tool_log` VALUES ('848', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '5.347182ms', '0:0:0:0:0:0:0:1', '2019-06-16 22:36:10');
INSERT INTO `tool_log` VALUES ('849', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.309971ms', '0:0:0:0:0:0:0:1', '2019-06-16 22:36:11');
INSERT INTO `tool_log` VALUES ('850', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.088615ms', '0:0:0:0:0:0:0:1', '2019-06-16 22:36:12');
INSERT INTO `tool_log` VALUES ('851', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '3.901988ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:26:59');
INSERT INTO `tool_log` VALUES ('852', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.367954ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:27:00');
INSERT INTO `tool_log` VALUES ('853', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.087156ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:27:03');
INSERT INTO `tool_log` VALUES ('854', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.397942ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:35:45');
INSERT INTO `tool_log` VALUES ('855', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.455840ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:35:47');
INSERT INTO `tool_log` VALUES ('856', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.090438ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:35:48');
INSERT INTO `tool_log` VALUES ('857', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.772614ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:47:36');
INSERT INTO `tool_log` VALUES ('858', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.106484ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:48:17');
INSERT INTO `tool_log` VALUES ('859', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.127635ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:48:18');
INSERT INTO `tool_log` VALUES ('860', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '5.066749ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:58:54');
INSERT INTO `tool_log` VALUES ('861', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.273504ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:58:56');
INSERT INTO `tool_log` VALUES ('862', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.080957ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:58:59');
INSERT INTO `tool_log` VALUES ('863', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.167749ms', '0:0:0:0:0:0:0:1', '2019-06-16 23:59:17');
INSERT INTO `tool_log` VALUES ('864', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.307503ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:04:50');
INSERT INTO `tool_log` VALUES ('865', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.323100ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:04:51');
INSERT INTO `tool_log` VALUES ('866', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.181241ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:04:53');
INSERT INTO `tool_log` VALUES ('867', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.141128ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:05:08');
INSERT INTO `tool_log` VALUES ('868', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '3.987321ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:10:11');
INSERT INTO `tool_log` VALUES ('869', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.296842ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:10:12');
INSERT INTO `tool_log` VALUES ('870', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.094085ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:10:14');
INSERT INTO `tool_log` VALUES ('871', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.196558ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:12:05');
INSERT INTO `tool_log` VALUES ('872', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.076216ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:12:21');
INSERT INTO `tool_log` VALUES ('873', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.072205ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:12:22');
INSERT INTO `tool_log` VALUES ('874', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.073664ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:12:24');
INSERT INTO `tool_log` VALUES ('875', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.720676ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:20:49');
INSERT INTO `tool_log` VALUES ('876', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.292832ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:20:50');
INSERT INTO `tool_log` VALUES ('877', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.192911ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:20:52');
INSERT INTO `tool_log` VALUES ('878', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.440972ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:33:53');
INSERT INTO `tool_log` VALUES ('879', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.308512ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:33:54');
INSERT INTO `tool_log` VALUES ('880', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.092262ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:33:56');
INSERT INTO `tool_log` VALUES ('881', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.117789ms', '0:0:0:0:0:0:0:1', '2019-06-17 00:38:52');
INSERT INTO `tool_log` VALUES ('882', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '14.750608ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:21:47');
INSERT INTO `tool_log` VALUES ('883', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.328570ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:21:49');
INSERT INTO `tool_log` VALUES ('884', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.092626ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:21:52');
INSERT INTO `tool_log` VALUES ('885', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.072570ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:21:57');
INSERT INTO `tool_log` VALUES ('886', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.082416ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:22:44');
INSERT INTO `tool_log` VALUES ('887', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.071476ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:22:47');
INSERT INTO `tool_log` VALUES ('888', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.131282ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:22:49');
INSERT INTO `tool_log` VALUES ('889', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.131281ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:22:50');
INSERT INTO `tool_log` VALUES ('890', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.135293ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:22:53');
INSERT INTO `tool_log` VALUES ('891', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.083874ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:23:08');
INSERT INTO `tool_log` VALUES ('892', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.080957ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:23:18');
INSERT INTO `tool_log` VALUES ('893', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.076946ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:23:20');
INSERT INTO `tool_log` VALUES ('894', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.077310ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:23:23');
INSERT INTO `tool_log` VALUES ('895', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.073664ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:23:29');
INSERT INTO `tool_log` VALUES ('896', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.069287ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:23:30');
INSERT INTO `tool_log` VALUES ('897', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.101014ms', '0:0:0:0:0:0:0:1', '2019-06-17 15:25:01');
INSERT INTO `tool_log` VALUES ('898', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '14.536911ms', '0:0:0:0:0:0:0:1', '2019-06-18 13:39:23');
INSERT INTO `tool_log` VALUES ('899', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '12.549085ms', '0:0:0:0:0:0:0:1', '2019-06-18 13:55:09');
INSERT INTO `tool_log` VALUES ('900', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.286997ms', '0:0:0:0:0:0:0:1', '2019-06-18 13:55:17');
INSERT INTO `tool_log` VALUES ('901', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.095544ms', '0:0:0:0:0:0:0:1', '2019-06-18 13:55:22');
INSERT INTO `tool_log` VALUES ('902', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.103202ms', '0:0:0:0:0:0:0:1', '2019-06-18 13:56:21');
INSERT INTO `tool_log` VALUES ('903', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.154257ms', '0:0:0:0:0:0:0:1', '2019-06-18 13:56:24');
INSERT INTO `tool_log` VALUES ('904', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '12.427284ms', '0:0:0:0:0:0:0:1', '2019-06-18 13:56:52');
INSERT INTO `tool_log` VALUES ('905', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.321276ms', '0:0:0:0:0:0:0:1', '2019-06-18 13:56:57');
INSERT INTO `tool_log` VALUES ('906', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.081687ms', '0:0:0:0:0:0:0:1', '2019-06-18 13:57:03');
INSERT INTO `tool_log` VALUES ('907', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.098096ms', '0:0:0:0:0:0:0:1', '2019-06-18 13:57:38');
INSERT INTO `tool_log` VALUES ('908', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '13.439614ms', '0:0:0:0:0:0:0:1', '2019-06-18 14:22:48');
INSERT INTO `tool_log` VALUES ('909', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '8.843290ms', '0:0:0:0:0:0:0:1', '2019-06-18 15:52:48');
INSERT INTO `tool_log` VALUES ('910', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.100284ms', '0:0:0:0:0:0:0:1', '2019-06-18 15:52:50');
INSERT INTO `tool_log` VALUES ('911', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.020142ms', '0:0:0:0:0:0:0:1', '2019-06-18 15:57:42');
INSERT INTO `tool_log` VALUES ('912', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.138940ms', '0:0:0:0:0:0:0:1', '2019-06-18 15:57:49');
INSERT INTO `tool_log` VALUES ('913', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '68.169552ms', '0:0:0:0:0:0:0:1', '2019-06-18 21:55:07');
INSERT INTO `tool_log` VALUES ('914', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.366130ms', '0:0:0:0:0:0:0:1', '2019-06-18 21:57:27');
INSERT INTO `tool_log` VALUES ('915', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '27.602371ms', '0:0:0:0:0:0:0:1', '2019-06-19 11:01:55');
INSERT INTO `tool_log` VALUES ('916', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.337321ms', '0:0:0:0:0:0:0:1', '2019-06-19 11:01:56');
INSERT INTO `tool_log` VALUES ('917', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.213698ms', '0:0:0:0:0:0:0:1', '2019-06-19 11:02:38');
INSERT INTO `tool_log` VALUES ('918', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.083874ms', '0:0:0:0:0:0:0:1', '2019-06-19 11:06:12');
INSERT INTO `tool_log` VALUES ('919', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '13.130007ms', '0:0:0:0:0:0:0:1', '2019-06-19 11:09:50');
INSERT INTO `tool_log` VALUES ('920', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.296113ms', '0:0:0:0:0:0:0:1', '2019-06-19 11:10:17');
INSERT INTO `tool_log` VALUES ('921', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '6.814986ms', '0:0:0:0:0:0:0:1', '2019-06-19 11:45:07');
INSERT INTO `tool_log` VALUES ('922', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '7.237275ms', '0:0:0:0:0:0:0:1', '2019-06-19 12:38:15');
INSERT INTO `tool_log` VALUES ('923', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '9.044589ms', '0:0:0:0:0:0:0:1', '2019-06-19 16:42:32');
INSERT INTO `tool_log` VALUES ('924', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.874119ms', '0:0:0:0:0:0:0:1', '2019-06-19 16:50:28');
INSERT INTO `tool_log` VALUES ('925', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.312159ms', '0:0:0:0:0:0:0:1', '2019-06-19 16:50:28');
INSERT INTO `tool_log` VALUES ('926', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.844090ms', '0:0:0:0:0:0:0:1', '2019-06-19 19:15:13');
INSERT INTO `tool_log` VALUES ('927', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.294290ms', '0:0:0:0:0:0:0:1', '2019-06-19 19:15:14');
INSERT INTO `tool_log` VALUES ('928', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.089709ms', '0:0:0:0:0:0:0:1', '2019-06-19 19:28:11');
INSERT INTO `tool_log` VALUES ('929', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '3.944655ms', '0:0:0:0:0:0:0:1', '2019-06-19 20:15:16');
INSERT INTO `tool_log` VALUES ('930', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.374518ms', '0:0:0:0:0:0:0:1', '2019-06-19 20:15:17');
INSERT INTO `tool_log` VALUES ('931', 'test3', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '7.564386ms', '0:0:0:0:0:0:0:1', '2019-06-19 22:41:09');
INSERT INTO `tool_log` VALUES ('932', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '9.993465ms', '0:0:0:0:0:0:0:1', '2019-06-21 13:01:32');
INSERT INTO `tool_log` VALUES ('933', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.297207ms', '0:0:0:0:0:0:0:1', '2019-06-21 13:01:33');
INSERT INTO `tool_log` VALUES ('934', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.104296ms', '0:0:0:0:0:0:0:1', '2019-06-21 13:01:35');
INSERT INTO `tool_log` VALUES ('935', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.072935ms', '0:0:0:0:0:0:0:1', '2019-06-21 13:01:43');
INSERT INTO `tool_log` VALUES ('936', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.892445ms', '0:0:0:0:0:0:0:1', '2019-06-23 03:41:30');
INSERT INTO `tool_log` VALUES ('937', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '4.901923ms', '0:0:0:0:0:0:0:1', '2019-06-25 21:16:01');
INSERT INTO `tool_log` VALUES ('938', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '8.305409ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:08:05');
INSERT INTO `tool_log` VALUES ('939', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.270952ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:08:10');
INSERT INTO `tool_log` VALUES ('940', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.097367ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:08:11');
INSERT INTO `tool_log` VALUES ('941', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.184524ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:08:15');
INSERT INTO `tool_log` VALUES ('942', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.070747ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:08:17');
INSERT INTO `tool_log` VALUES ('943', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.079498ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:08:32');
INSERT INTO `tool_log` VALUES ('944', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.132012ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:08:34');
INSERT INTO `tool_log` VALUES ('945', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.084969ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:08:37');
INSERT INTO `tool_log` VALUES ('946', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.113778ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:14:43');
INSERT INTO `tool_log` VALUES ('947', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.099555ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:14:44');
INSERT INTO `tool_log` VALUES ('948', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.140763ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:14:45');
INSERT INTO `tool_log` VALUES ('949', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.109767ms', '0:0:0:0:0:0:0:1', '2019-06-30 13:14:55');
INSERT INTO `tool_log` VALUES ('950', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '9.152171ms', '0:0:0:0:0:0:0:1', '2019-07-04 00:12:06');
INSERT INTO `tool_log` VALUES ('951', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.152798ms', '0:0:0:0:0:0:0:1', '2019-07-04 00:12:13');
INSERT INTO `tool_log` VALUES ('952', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.099190ms', '0:0:0:0:0:0:0:1', '2019-07-04 00:12:17');
INSERT INTO `tool_log` VALUES ('953', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '20.746184ms', '0:0:0:0:0:0:0:1', '2019-07-04 02:30:27');
INSERT INTO `tool_log` VALUES ('954', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.822422ms', '0:0:0:0:0:0:0:1', '2019-07-04 11:34:45');
INSERT INTO `tool_log` VALUES ('955', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.323828ms', '0:0:0:0:0:0:0:1', '2019-07-04 11:34:45');
INSERT INTO `tool_log` VALUES ('956', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '206.304010ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:23:58');
INSERT INTO `tool_log` VALUES ('957', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.236308ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:23:59');
INSERT INTO `tool_log` VALUES ('958', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.115236ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:24:02');
INSERT INTO `tool_log` VALUES ('959', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.184160ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:24:53');
INSERT INTO `tool_log` VALUES ('960', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.145139ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:24:54');
INSERT INTO `tool_log` VALUES ('961', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.129459ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:24:55');
INSERT INTO `tool_log` VALUES ('962', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.105754ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:24:59');
INSERT INTO `tool_log` VALUES ('963', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.131282ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:25:00');
INSERT INTO `tool_log` VALUES ('964', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.102108ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:25:01');
INSERT INTO `tool_log` VALUES ('965', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.117789ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:28:00');
INSERT INTO `tool_log` VALUES ('966', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.143681ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:28:01');
INSERT INTO `tool_log` VALUES ('967', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.105755ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:30:50');
INSERT INTO `tool_log` VALUES ('968', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.198381ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:33:06');
INSERT INTO `tool_log` VALUES ('969', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.118154ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:33:08');
INSERT INTO `tool_log` VALUES ('970', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.140034ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:57:11');
INSERT INTO `tool_log` VALUES ('971', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.101378ms', '0:0:0:0:0:0:0:1', '2019-07-05 13:57:14');
INSERT INTO `tool_log` VALUES ('972', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '28.274836ms', '0:0:0:0:0:0:0:1', '2019-07-06 00:24:43');
INSERT INTO `tool_log` VALUES ('973', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.293926ms', '0:0:0:0:0:0:0:1', '2019-07-06 00:24:44');
INSERT INTO `tool_log` VALUES ('974', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.124718ms', '0:0:0:0:0:0:0:1', '2019-07-06 00:24:45');
INSERT INTO `tool_log` VALUES ('975', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.530597ms', '0:0:0:0:0:0:0:1', '2019-07-06 00:50:53');
INSERT INTO `tool_log` VALUES ('976', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.203122ms', '0:0:0:0:0:0:0:1', '2019-07-06 00:51:21');
INSERT INTO `tool_log` VALUES ('977', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '12.917773ms', '0:0:0:0:0:0:0:1', '2019-07-06 01:05:28');
INSERT INTO `tool_log` VALUES ('978', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '23.839331ms', '0:0:0:0:0:0:0:1', '2019-07-06 01:34:30');
INSERT INTO `tool_log` VALUES ('979', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '14.913986ms', '0:0:0:0:0:0:0:1', '2019-07-06 02:03:01');
INSERT INTO `tool_log` VALUES ('980', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.203123ms', '0:0:0:0:0:0:0:1', '2019-07-06 02:03:58');
INSERT INTO `tool_log` VALUES ('981', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.108672ms', '0:0:0:0:0:0:0:1', '2019-07-06 02:04:22');
INSERT INTO `tool_log` VALUES ('982', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.069529ms', '0:0:0:0:0:0:0:1', '2019-07-06 08:56:01');
INSERT INTO `tool_log` VALUES ('983', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '6.775968ms', '0:0:0:0:0:0:0:1', '2019-07-06 10:27:54');
INSERT INTO `tool_log` VALUES ('984', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '6.859478ms', '0:0:0:0:0:0:0:1', '2019-07-06 10:51:18');
INSERT INTO `tool_log` VALUES ('985', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '7.342304ms', '0:0:0:0:0:0:0:1', '2019-07-06 10:54:36');
INSERT INTO `tool_log` VALUES ('986', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.308148ms', '0:0:0:0:0:0:0:1', '2019-07-06 10:54:43');
INSERT INTO `tool_log` VALUES ('987', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '7.162156ms', '0:0:0:0:0:0:0:1', '2019-07-06 15:38:32');
INSERT INTO `tool_log` VALUES ('988', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.413173ms', '0:0:0:0:0:0:0:1', '2019-07-06 15:38:33');
INSERT INTO `tool_log` VALUES ('989', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.110131ms', '0:0:0:0:0:0:0:1', '2019-07-06 15:38:36');
INSERT INTO `tool_log` VALUES ('990', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.186069ms', '0:0:0:0:0:0:0:1', '2019-07-06 21:42:42');
INSERT INTO `tool_log` VALUES ('991', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.270222ms', '0:0:0:0:0:0:0:1', '2019-07-06 21:42:46');
INSERT INTO `tool_log` VALUES ('992', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.155715ms', '0:0:0:0:0:0:0:1', '2019-07-06 21:42:48');
INSERT INTO `tool_log` VALUES ('993', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '6.675338ms', '0:0:0:0:0:0:0:1', '2019-07-11 14:25:10');
INSERT INTO `tool_log` VALUES ('994', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '4.385192ms', '0:0:0:0:0:0:0:1', '2019-07-11 15:14:39');
INSERT INTO `tool_log` VALUES ('995', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '7.383879ms', '0:0:0:0:0:0:0:1', '2019-07-14 14:49:00');
INSERT INTO `tool_log` VALUES ('996', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '4.290731ms', '0:0:0:0:0:0:0:1', '2019-07-16 19:33:28');
INSERT INTO `tool_log` VALUES ('997', 'lzhpo', '查看日志记录', 'com.lzhpo.aurora.admin.controller.UpdateLogController.updateLog', '[]', '0.260011ms', '0:0:0:0:0:0:0:1', '2019-07-16 19:33:31');
INSERT INTO `tool_log` VALUES ('998', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '0.150609ms', '0:0:0:0:0:0:0:1', '2019-07-16 19:35:23');
INSERT INTO `tool_log` VALUES ('999', 'lzhpo', '查看swagger页面', 'com.lzhpo.aurora.admin.controller.SwaggerController.Swagger', '[]', '0.079134ms', '0:0:0:0:0:0:0:1', '2019-07-16 19:35:25');
INSERT INTO `tool_log` VALUES ('1000', 'lzhpo', '查看Druid', 'com.lzhpo.aurora.admin.controller.DruidController.druid', '[]', '26.920819ms', '0:0:0:0:0:0:0:1', '2019-07-17 00:42:33');

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
INSERT INTO `user_role` VALUES ('12', '1');
