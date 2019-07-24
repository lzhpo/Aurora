/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : aurora

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-06-07 02:22:55
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `role_resources` VALUES ('2', '1');
INSERT INTO `role_resources` VALUES ('2', '2');
INSERT INTO `role_resources` VALUES ('2', '3');
INSERT INTO `role_resources` VALUES ('2', '4');
INSERT INTO `role_resources` VALUES ('2', '5');
INSERT INTO `role_resources` VALUES ('2', '6');
INSERT INTO `role_resources` VALUES ('2', '7');
INSERT INTO `role_resources` VALUES ('2', '8');
INSERT INTO `role_resources` VALUES ('2', '9');
INSERT INTO `role_resources` VALUES ('2', '10');

-- ----------------------------
-- Table structure for sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `sys_resources`;
CREATE TABLE `sys_resources` (
  `resources_id` int(11) NOT NULL AUTO_INCREMENT,
  `resources_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `permission` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '0' COMMENT '资源所需的权限，绝对不能为空！',
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`resources_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_resources
-- ----------------------------
INSERT INTO `sys_resources` VALUES ('1', '权限管理', null, '目录', '0', '1', '0');
INSERT INTO `sys_resources` VALUES ('2', '角色管理', '/admin/system/role', '菜单', 'role:look', '101', '1');
INSERT INTO `sys_resources` VALUES ('3', '添加', null, '按钮', 'role:add', '10101', '101');
INSERT INTO `sys_resources` VALUES ('4', '删除', null, '按钮', 'role:delete', '10102', '101');
INSERT INTO `sys_resources` VALUES ('5', '修改', null, '按钮', 'role:update', '10103', '101');
INSERT INTO `sys_resources` VALUES ('6', '用户管理', '/admin/system/user', '菜单', 'user:look', '102', '1');
INSERT INTO `sys_resources` VALUES ('7', '添加', null, '按钮', 'user:add', '10201', '102');
INSERT INTO `sys_resources` VALUES ('8', '删除', null, '按钮', 'user:delete', '10202', '102');
INSERT INTO `sys_resources` VALUES ('9', '修改', null, '按钮', 'user:update', '10203', '102');
INSERT INTO `sys_resources` VALUES ('10', '资源管理', '/admin/system/resources', '菜单', 'resources:look', '103', '1');
INSERT INTO `sys_resources` VALUES ('11', '添加', null, '按钮', 'resources:add', '10301', '103');
INSERT INTO `sys_resources` VALUES ('12', '删除', null, '按钮', 'resources:delete', '10302', '103');
INSERT INTO `sys_resources` VALUES ('13', '修改', null, '按钮', 'resources:update', '10303', '103');
INSERT INTO `sys_resources` VALUES ('14', '系统管理', '', '目录', '0', '2', '0');
INSERT INTO `sys_resources` VALUES ('15', 'Druid监控', '/admin/tool/druid', '菜单', 'druid:look', '201', '2');
INSERT INTO `sys_resources` VALUES ('16', '更新日志', '/admin/tool/updatelog', '菜单', 'updatelog:look', '202', '2');
INSERT INTO `sys_resources` VALUES ('17', '添加', null, '按钮', 'updatelog:add', '20201', '202');
INSERT INTO `sys_resources` VALUES ('18', '删除', null, '按钮', 'updatelog:delete', '20202', '202');
INSERT INTO `sys_resources` VALUES ('19', '修改', null, '按钮', 'updatelog:update', '20203', '202');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'admin', '管理员');
INSERT INTO `sys_role` VALUES ('2', 'user', '用户');
INSERT INTO `sys_role` VALUES ('3', 'test', '测试用户');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` int(1) NOT NULL COMMENT '性别，1表示男，0表示女',
  `status` int(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'lzhpo', '0a9dd183174bf25bc06ae63663aa2381', '1', '1');
INSERT INTO `sys_user` VALUES ('2', 'test', '92fcea46c827b63cdf98419b2ae4c19e', '0', '0');

-- ----------------------------
-- Table structure for tool_updatelog
-- ----------------------------
DROP TABLE IF EXISTS `tool_updatelog`;
CREATE TABLE `tool_updatelog` (
  `updatelog_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `description` varchar(30) COLLATE utf8mb4_bin NOT NULL COMMENT '更新描述',
  PRIMARY KEY (`updatelog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of tool_updatelog
-- ----------------------------
INSERT INTO `tool_updatelog` VALUES ('11', '2019-06-04 11:52:13', '177777777777777777777777777');
INSERT INTO `tool_updatelog` VALUES ('13', '2019-06-04 11:53:03', '22222222222222222222222');
INSERT INTO `tool_updatelog` VALUES ('14', '2019-06-04 11:53:09', '4444444444444444444444');
INSERT INTO `tool_updatelog` VALUES ('16', '2019-06-04 11:53:20', '6666666666666666666666');
INSERT INTO `tool_updatelog` VALUES ('17', '2019-06-04 11:53:25', '7777777777777777777777777');
INSERT INTO `tool_updatelog` VALUES ('18', '2019-06-04 11:53:32', '88888888888888888888888888');
INSERT INTO `tool_updatelog` VALUES ('25', '2019-06-05 14:38:30', '00000000000000000000000000000');
INSERT INTO `tool_updatelog` VALUES ('26', '2019-06-07 02:07:19', '更新内容更新内容更新内容更新内容更新内容更');
INSERT INTO `tool_updatelog` VALUES ('27', '2019-06-07 02:07:38', '=====================');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '2');
