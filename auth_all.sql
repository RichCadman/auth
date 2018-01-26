/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : auth

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-11 11:10:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_admin
-- ----------------------------
DROP TABLE IF EXISTS `auth_admin`;
CREATE TABLE `auth_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_admin
-- ----------------------------
INSERT INTO `auth_admin` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70');
INSERT INTO `auth_admin` VALUES ('2', '刘全明', '202cb962ac59075b964b07152d234b70');
INSERT INTO `auth_admin` VALUES ('3', '高红祥', '202cb962ac59075b964b07152d234b70');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组表',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `rules` char(80) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id， 多个规则","隔开',
  `menu_id` varchar(255) DEFAULT NULL COMMENT '菜单权限组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '超级管理员', '1', '2,3,5,6,7,8,9,10,12,13,14,15,22,23,24,25,17,18,19,20', '1,4,11,16');
INSERT INTO `auth_group` VALUES ('2', '经理', '1', '2,3,5,6,7,8,9,10,12,17,18,19,20', '1,4,11,16');
INSERT INTO `auth_group` VALUES ('3', '普通员工', '1', '7', '4');
INSERT INTO `auth_group` VALUES ('6', '测试', '1', '2,3,5,6,7,8,17', '1,4,16');

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户组明细表   ',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1');
INSERT INTO `auth_group_access` VALUES ('2', '2');
INSERT INTO `auth_group_access` VALUES ('3', '3');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则表',
  `p_id` int(11) DEFAULT NULL COMMENT '父级规则id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `nav` varchar(255) DEFAULT NULL COMMENT '导航',
  `is_visible` tinyint(1) unsigned DEFAULT '2' COMMENT '是否可显示 默认2不显示   1显示',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单小图标',
  `controller` varchar(255) DEFAULT NULL COMMENT '控制器标识',
  `function` varchar(255) DEFAULT NULL COMMENT '方法标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', '0', 'Admin/User/', '用户管理', '1', '1', '', '用户管理', '1', 'icon-group', 'User', '');
INSERT INTO `auth_rule` VALUES ('2', '1', 'Admin/User/user_index', '用户列表', '1', '1', '', '用户管理', '1', '', 'User', 'user_index');
INSERT INTO `auth_rule` VALUES ('3', '1', 'Admin/User/user_editor', '用户编辑', '1', '1', '', '用户管理', '2', '', 'User', 'user_editor');
INSERT INTO `auth_rule` VALUES ('4', '0', 'Admin/Item/', '项目管理', '1', '1', '', '项目管理', '1', 'icon-th-list', 'Item', null);
INSERT INTO `auth_rule` VALUES ('5', '1', 'Admin/User/add_user', '用户添加', '1', '1', '', '用户管理', '2', null, 'User', 'add_user');
INSERT INTO `auth_rule` VALUES ('6', '1', 'Admin/User/delete_user', '用户删除', '1', '1', '', '用户管理', '2', null, 'User', 'delete_user');
INSERT INTO `auth_rule` VALUES ('7', '4', 'Admin/Item/item_index', '项目列表', '1', '1', '', '项目管理', '1', null, 'Item', 'item_index');
INSERT INTO `auth_rule` VALUES ('8', '4', 'Admin/Item/item_editor', '项目编辑', '1', '1', '', '项目管理', '2', null, 'Item', 'item_editor');
INSERT INTO `auth_rule` VALUES ('9', '4', 'Admin/Item/add_item', '项目添加', '1', '1', '', '项目管理', '2', null, 'Item', 'add_item');
INSERT INTO `auth_rule` VALUES ('10', '4', 'Admin/Item/delete_item', '项目删除', '1', '1', '', '项目管理', '2', null, 'Item', 'delete_item');
INSERT INTO `auth_rule` VALUES ('11', '0', 'Admin/Auth/', '权限管理', '1', '1', '', '权限管理', '1', 'icon-thumbs-up', 'Auth', null);
INSERT INTO `auth_rule` VALUES ('12', '11', 'Admin/Auth/rule_index', '规则列表', '1', '1', '', '权限管理', '1', '', 'Auth', 'rule_index');
INSERT INTO `auth_rule` VALUES ('13', '11', 'Admin/Auth/rule_editor', '规则编辑', '1', '1', '', '权限管理', '2', '', 'Auth', 'auth_editor');
INSERT INTO `auth_rule` VALUES ('14', '11', 'Admin/Auth/add_rule', '规则添加', '1', '1', '', '权限管理', '1', '', 'Auth', 'add_rule');
INSERT INTO `auth_rule` VALUES ('15', '11', 'Admin/Auth/delete_rule', '规则删除', '1', '1', '', '权限管理', '2', '', 'Auth', 'delete_auth');
INSERT INTO `auth_rule` VALUES ('16', '0', 'Admin/Work/', '考勤管理', '1', '1', '', '考勤管理', '1', 'icon-calendar', 'Work', null);
INSERT INTO `auth_rule` VALUES ('17', '16', 'Admin/Work/work_index', '考勤列表', '1', '1', '', '考勤列表', '1', null, 'Work', 'work_index');
INSERT INTO `auth_rule` VALUES ('18', '16', 'Admin/Work/work_editor', '考勤编辑', '1', '1', '', '考勤管理', '2', null, 'Work', 'work_editor');
INSERT INTO `auth_rule` VALUES ('19', '16', 'Admin/Work/add_work', '考勤添加', '1', '1', '', '考勤管理', '2', null, 'Work', 'add_work');
INSERT INTO `auth_rule` VALUES ('20', '16', 'Admin/Work/delete_work', '考勤删除', '1', '1', '', '考勤管理', '2', null, 'Work', 'delete_work');
INSERT INTO `auth_rule` VALUES ('22', '11', 'Admin/Auth/add_group', '添加权限组', '1', '1', '', '规则管理', '1', '', 'Auth', 'add_group');
INSERT INTO `auth_rule` VALUES ('23', '11', 'Admin/Auth/group_index', '权限组列表', '1', '1', '', '用户组管理', '1', '', 'Auth', 'group_index');
INSERT INTO `auth_rule` VALUES ('24', '11', 'Admin/Auth/editor_user_auth', '编辑员工权限', '1', '1', '', '权限组管理', '2', '', 'Auth', 'editor_user_auth');
INSERT INTO `auth_rule` VALUES ('25', '11', 'Admin/Auth/group_editor', '修改权限组', '1', '1', '', '权限管理', '2', '', 'Auth', 'group_editor');
