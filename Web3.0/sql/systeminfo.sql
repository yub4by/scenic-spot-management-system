/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-12-22 11:25:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for systeminfo
-- ----------------------------
DROP TABLE IF EXISTS `systeminfo`;
CREATE TABLE `systeminfo` (
  `Webname` varchar(20) NOT NULL DEFAULT '',
  `WebYu` varchar(255) DEFAULT NULL,
  `Webdescribe` varchar(20) DEFAULT NULL,
  `copyright` varchar(20) DEFAULT NULL,
  `Num` varchar(20) DEFAULT NULL,
  `Tel` varchar(20) DEFAULT NULL,
  `Other` varchar(20) DEFAULT NULL,
  `id` int(10) DEFAULT '1',
  PRIMARY KEY (`Webname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systeminfo
-- ----------------------------
INSERT INTO `systeminfo` VALUES ('哈尔滨游玩网', 'http://localhost:8080/Web3.0/home', '哈尔滨游玩哈尔滨游玩', 'java15-4   一组', '110', '9876543210', '111', '1');
