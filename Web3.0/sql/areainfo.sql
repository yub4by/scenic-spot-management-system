/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-12-25 09:26:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for areainfo
-- ----------------------------
DROP TABLE IF EXISTS `areainfo`;
CREATE TABLE `areainfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of areainfo
-- ----------------------------
INSERT INTO `areainfo` VALUES ('1', '南岗区', '喜欢历史、钟爱建筑的朋友更是无法自拔，因为哈尔滨最珍贵的宝贝都在这了。', '1');
INSERT INTO `areainfo` VALUES ('2', '呼兰区', '呼兰离市区比较远，且景点不多。比较吸引人的有“东方巴黎圣母院”之称的呼兰天主教堂和近代著名女作家萧红的故居。', '1');
INSERT INTO `areainfo` VALUES ('3', '道里区', '无论你怀揣着何种心愿来到哈尔滨，这个区域都会是你最主要的活动范围。', '1');
INSERT INTO `areainfo` VALUES ('4', '老城区', '哈尔滨的老城区，也就是人们常说的道里、道外和南岗这三个片区。圣·索菲亚大教堂、中央大街、果戈里大街和老道外这些哈尔滨最广为人知的景点都聚集在此处。', '0');
INSERT INTO `areainfo` VALUES ('5', '道外区', '道外区位于黑龙江哈尔滨市区中东部，是历史悠久的老城区，地域广阔，位置适中，是全市八区十县（市）的区位中心，与呼兰、松北两个行政区隔江相望，与道里、南岗、香坊、阿城四个行政区接壤。', '1');
INSERT INTO `areainfo` VALUES ('6', '松北区', '哈尔滨比较新的城区，虽然历史底蕴比不上老城区，但冰雪大世界、太阳岛雪博会等冰雪相关项目都在这儿了。极地馆、虎林园、科技馆等寓教于乐的场所，是亲子出游的绝佳之选。', '1');
INSERT INTO `areainfo` VALUES ('7', '香坊区', '香坊区是哈尔滨市的开埠地和最早的市政区之一，位于哈尔滨市东南部，是四个中心城区之一，区划面积339.55平方公里，其中，建城区面积96.29平方公里，辖20个街道办事处，3镇1乡，总人口约92万人。香坊区的景点有：黑龙江省森林植物园、哈尔滨烈士陵园等。', '1');
