/*
Navicat MySQL Data Transfer

Source Server         : cloudgate
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : bluemix

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2014-03-31 17:07:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', 'SALES');
INSERT INTO `dept` VALUES ('2', 'R&D');
INSERT INTO `dept` VALUES ('3', 'FINANCE');
INSERT INTO `dept` VALUES ('4', 'MARKETING');
INSERT INTO `dept` VALUES ('5', 'PRODUCTION');
INSERT INTO `dept` VALUES ('6', 'PERSONNEL');

-- ----------------------------
-- Table structure for `ee`
-- ----------------------------
DROP TABLE IF EXISTS `ee`;
CREATE TABLE `ee` (
  `cty` varchar(3) NOT NULL DEFAULT '',
  `sn` varchar(6) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`cty`,`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='compound pks test';

-- ----------------------------
-- Records of ee
-- ----------------------------
INSERT INTO `ee` VALUES ('111', '123456', 'cyper', '1000');
INSERT INTO `ee` VALUES ('222', '123456', 'john', '2000');

-- ----------------------------
-- Table structure for `emp`
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL,
  `emp_type_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `pspace_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', 'cyper', '1000', '1', '1', '1');
INSERT INTO `emp` VALUES ('2', 'John', '2000', '2', '2', '2');
INSERT INTO `emp` VALUES ('3', 'Jimmy', '1500', '1', '1', '1');
INSERT INTO `emp` VALUES ('4', 'John', '1200', '2', '3', null);

-- ----------------------------
-- Table structure for `emp_proj`
-- ----------------------------
DROP TABLE IF EXISTS `emp_proj`;
CREATE TABLE `emp_proj` (
  `emp_id` int(11) NOT NULL,
  `proj_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`,`proj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_proj
-- ----------------------------
INSERT INTO `emp_proj` VALUES ('1', '1');
INSERT INTO `emp_proj` VALUES ('1', '2');
INSERT INTO `emp_proj` VALUES ('2', '6');
INSERT INTO `emp_proj` VALUES ('3', '1');
INSERT INTO `emp_proj` VALUES ('3', '5');

-- ----------------------------
-- Table structure for `emp_type`
-- ----------------------------
DROP TABLE IF EXISTS `emp_type`;
CREATE TABLE `emp_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_type
-- ----------------------------
INSERT INTO `emp_type` VALUES ('1', 'regular');
INSERT INTO `emp_type` VALUES ('2', 'contractor');

-- ----------------------------
-- Table structure for `parking_space`
-- ----------------------------
DROP TABLE IF EXISTS `parking_space`;
CREATE TABLE `parking_space` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lot` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parking_space
-- ----------------------------
INSERT INTO `parking_space` VALUES ('1', 'A', 'A1');
INSERT INTO `parking_space` VALUES ('2', 'A', 'A2');
INSERT INTO `parking_space` VALUES ('3', 'B', 'B1');

-- ----------------------------
-- Table structure for `profile`
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('2', 'cyper');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'PSP');
INSERT INTO `project` VALUES ('2', 'APV');
INSERT INTO `project` VALUES ('3', 'FMS');
INSERT INTO `project` VALUES ('4', 'TOP');
INSERT INTO `project` VALUES ('5', 'VARICENT');
INSERT INTO `project` VALUES ('6', 'K');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'cyper', 'xxxxx');
INSERT INTO `user` VALUES ('2', 'aaaa', 'xxxxxx');
INSERT INTO `user` VALUES ('3', 'single', 'xxxxxx');
INSERT INTO `user` VALUES ('4', 'single', 'zzz2');
INSERT INTO `user` VALUES ('5', 'single', 'xxxxxx');
INSERT INTO `user` VALUES ('6', 'single2', 'xxxxxx');
