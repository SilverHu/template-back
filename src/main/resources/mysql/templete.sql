/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : templete

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-04-09 17:11:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '保留字符 0-删除 1-存在',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user(admin 123456)
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '4280d89a5a03f812751f504cc10ee8a5', null, null, '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';



-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '资源名称',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父资源id',
  `link` varchar(255) DEFAULT NULL COMMENT '链接',
  `permission` varchar(255) NOT NULL COMMENT '权限标识',
  `urlpattern` varchar(255) DEFAULT NULL COMMENT '可访问路径',
  `description` varchar(255) DEFAULT NULL COMMENT '资源描述',
  `type` tinyint(4) DEFAULT NULL COMMENT '资源类型 1-菜单 2-按钮',
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_permission` (`permission`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统权限';



-- ----------------------------
-- Table structure for `sys_relation_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation_role_permission`;
CREATE TABLE `sys_relation_role_permission` (
  `roleid` int(20) NOT NULL COMMENT '角色id',
  `permissionid` int(20) NOT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色权限';

-- ----------------------------
-- Table structure for `sys_relation_user_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation_user_permission`;
CREATE TABLE `sys_relation_user_permission` (
  `userid` int(20) NOT NULL COMMENT '用户id',
  `permissionid` int(20) NOT NULL COMMENT '权限id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户权限表';

-- ----------------------------
-- Table structure for `sys_relation_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation_user_role`;
CREATE TABLE `sys_relation_user_role` (
  `userid` int(20) NOT NULL COMMENT '用户id',
  `roleid` int(20) NOT NULL COMMENT '角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色';
