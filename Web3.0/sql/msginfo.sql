/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-12-22 11:24:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for msginfo
-- ----------------------------
DROP TABLE IF EXISTS `msginfo`;
CREATE TABLE `msginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `leaveTime` datetime DEFAULT NULL,
  `replayTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `replayMsg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1242 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msginfo
-- ----------------------------
INSERT INTO `msginfo` VALUES ('1', '1', '11111111111111', '2017-12-01 11:24:08', '2017-12-14 09:31:54', '1', '11111111111111');
INSERT INTO `msginfo` VALUES ('2', '2', '22222222222222222222222', '2017-12-01 14:07:12', '2017-12-08 10:30:21', '2', '222222222222222');
INSERT INTO `msginfo` VALUES ('3', '3', '333333333333333333333333333333', '2017-12-01 14:07:12', '2017-12-08 10:30:11', '2', '33333333333333');
INSERT INTO `msginfo` VALUES ('4', '4', '留言测试4', '2017-12-01 14:07:12', '2017-12-11 13:20:00', '0', 'test4');
INSERT INTO `msginfo` VALUES ('5', '11', '11', '2017-12-21 09:31:44', null, '2', null);
