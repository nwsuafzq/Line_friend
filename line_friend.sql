/*
Navicat MySQL Data Transfer

Source Server         : remote1
Source Server Version : 50628
Source Host           : 172.29.17.32:3306
Source Database       : ls

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2017-07-06 18:54:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456');
INSERT INTO `admin` VALUES ('2', 'only', '123456');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `product_count` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_id` (`product_id`),
  KEY `fk_user_id` (`user_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('79', '57', '1', '25');
INSERT INTO `cart` VALUES ('116', '57', '1', '28');
INSERT INTO `cart` VALUES ('120', '76', '1', '106');
INSERT INTO `cart` VALUES ('130', '559', '1', '3');
INSERT INTO `cart` VALUES ('144', '78', '1', '43');
INSERT INTO `cart` VALUES ('145', '78', '1', '108');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) NOT NULL DEFAULT '0',
  `turn` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '2', ' 果干', ' 啊哈哈哈', '4');
INSERT INTO `category` VALUES ('2', '3', ' 果干', ' 啊哈哈哈', '5');
INSERT INTO `category` VALUES ('3', '1', ' 果干', ' 啊哈哈哈', '4');
INSERT INTO `category` VALUES ('4', '5', ' 果干', ' 啊哈哈哈', '4');
INSERT INTO `category` VALUES ('5', '1', ' 果干', ' 啊哈哈哈', '4');
INSERT INTO `category` VALUES ('6', '3', ' 果干', ' 啊哈哈哈', '4');
INSERT INTO `category` VALUES ('7', '2', ' 果干', ' 啊哈哈哈', '1');
INSERT INTO `category` VALUES ('8', '6', ' 果干', ' 啊哈哈哈', '1');
INSERT INTO `category` VALUES ('9', '1', ' 果干', ' 啊哈哈哈', '6');
INSERT INTO `category` VALUES ('10', '4', ' 果干', ' 啊哈哈哈', '1');
INSERT INTO `category` VALUES ('11', '3', ' 果干', ' 啊哈哈哈', '2');
INSERT INTO `category` VALUES ('12', '2', ' 果干', ' 啊哈哈哈', '4');
INSERT INTO `category` VALUES ('13', '1', ' 果干', ' 啊哈哈哈', '4');
INSERT INTO `category` VALUES ('14', '4', ' 果干', ' 啊哈哈哈', '2');
INSERT INTO `category` VALUES ('15', '2', ' 果干', ' 啊哈哈哈', '3');
INSERT INTO `category` VALUES ('16', '1', ' 果干', ' 啊哈哈哈', '1');
INSERT INTO `category` VALUES ('17', '6', ' 果干', ' 啊哈哈哈', '1');
INSERT INTO `category` VALUES ('18', '3', ' 果干', ' 啊哈哈哈', '2');
INSERT INTO `category` VALUES ('19', '1', ' 果干', ' 啊哈哈哈', '3');

-- ----------------------------
-- Table structure for `category_product`
-- ----------------------------
DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` int(10) NOT NULL DEFAULT '0',
  `cat_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_category_id_fk` (`cat_id`),
  KEY `category_product_product_id_fk` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category_product
-- ----------------------------
INSERT INTO `category_product` VALUES ('1', '2', '3');
INSERT INTO `category_product` VALUES ('2', '2', '4');
INSERT INTO `category_product` VALUES ('3', '1', '6');
INSERT INTO `category_product` VALUES ('4', '6', '6');
INSERT INTO `category_product` VALUES ('5', '3', '4');
INSERT INTO `category_product` VALUES ('6', '6', '4');
INSERT INTO `category_product` VALUES ('7', '5', '5');
INSERT INTO `category_product` VALUES ('8', '2', '4');
INSERT INTO `category_product` VALUES ('9', '3', '3');
INSERT INTO `category_product` VALUES ('10', '5', '2');
INSERT INTO `category_product` VALUES ('11', '1', '1');
INSERT INTO `category_product` VALUES ('12', '6', '3');
INSERT INTO `category_product` VALUES ('13', '4', '4');
INSERT INTO `category_product` VALUES ('14', '1', '2');
INSERT INTO `category_product` VALUES ('15', '4', '1');
INSERT INTO `category_product` VALUES ('16', '3', '1');
INSERT INTO `category_product` VALUES ('17', '5', '2');
INSERT INTO `category_product` VALUES ('18', '4', '2');
INSERT INTO `category_product` VALUES ('19', '2', '4');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL COMMENT '发评论的用户的email',
  `upvote` varchar(10) DEFAULT NULL,
  `send_time` varchar(20) DEFAULT NULL COMMENT '评论时间',
  `product_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('32', '发送到发送到', '804****om', '赞', '2017-06-27 10:58:45', '104');
INSERT INTO `comment` VALUES ('33', '回复回复', '804194244@qq.com', '踩', '2017-06-27 10:59:41', '104');
INSERT INTO `comment` VALUES ('34', '真垃圾！！！！', '804194244@qq.com', '踩', '2017-06-27 10:59:56', '36');
INSERT INTO `comment` VALUES ('35', '苟？？？', '804194244@qq.com', '赞', '2017-06-27 11:00:13', '105');
INSERT INTO `comment` VALUES ('36', '发送到丰富的涨幅达', '804****om', '赞', '2017-06-27 11:01:11', '105');
INSERT INTO `comment` VALUES ('37', 'sbsbsb', '804194244@qq.com', '赞', '2017-06-27 11:01:42', '37');
INSERT INTO `comment` VALUES ('38', '好吃！！！！的', '804****om', '赞', '2017-06-27 11:02:12', '2');
INSERT INTO `comment` VALUES ('39', 'da', '804194244@qq.com', '赞', '2017-06-27 18:21:12', '38');
INSERT INTO `comment` VALUES ('40', 'ewaewaea', '804****om', '踩', '2017-06-27 18:21:20', '38');
INSERT INTO `comment` VALUES ('41', 'gdfg', '804194244@qq.com', '赞', '2017-06-28 08:41:08', '107');
INSERT INTO `comment` VALUES ('42', '放屁', '804194244@qq.com', '赞', '2017-06-29 15:59:56', '6');
INSERT INTO `comment` VALUES ('43', '杨所长sb', '804****om', '踩', '2017-06-29 17:15:48', '39');
INSERT INTO `comment` VALUES ('44', '', '804****om', '赞', '2017-07-03 09:28:00', '25');
INSERT INTO `comment` VALUES ('45', 'good', '804****om', '赞', '2017-07-03 17:49:16', '108');
INSERT INTO `comment` VALUES ('46', '44', '2056366070@qq.com', '赞', '2017-07-04 14:33:25', '105');
INSERT INTO `comment` VALUES ('47', '好吃', '205****om', '赞', '2017-07-04 14:33:47', '105');
INSERT INTO `comment` VALUES ('48', '很喜欢，哈哈哈哈', '2056366070@qq.com', '踩', '2017-07-04 14:34:15', '105');
INSERT INTO `comment` VALUES ('49', '喜欢', '2056366070@qq.com', '赞', '2017-07-04 14:40:35', '36');
INSERT INTO `comment` VALUES ('50', '', '2056366070@qq.com', '赞', '2017-07-04 17:48:46', '32');
INSERT INTO `comment` VALUES ('51', '', '2056366070@qq.com', '踩', '2017-07-04 17:48:56', '32');
INSERT INTO `comment` VALUES ('52', '', '2056366070@qq.com', '赞', '2017-07-05 15:43:38', '24');
INSERT INTO `comment` VALUES ('53', '杨笑天撒打算', '854****om', '踩', '2017-07-06 10:03:34', '14');
INSERT INTO `comment` VALUES ('54', '真好吃？？？？！！！！', '804194244@qq.com', '赞', '2017-07-06 10:42:35', '1');
INSERT INTO `comment` VALUES ('55', '真好吃啊啊啊啊啊啊啊哈哈哈哈哈哈哈哈', '804****om', '赞', '2017-07-06 16:43:16', '34');
INSERT INTO `comment` VALUES ('56', 'oo', '205****om', '赞', '2017-07-06 16:45:02', '14');
INSERT INTO `comment` VALUES ('57', '好好好', '205****om', '赞', '2017-07-06 18:42:58', '154');

-- ----------------------------
-- Table structure for `favourite`
-- ----------------------------
DROP TABLE IF EXISTS `favourite`;
CREATE TABLE `favourite` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_price` double(20,0) DEFAULT NULL,
  `product_pic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favourite
-- ----------------------------
INSERT INTO `favourite` VALUES ('8', '8', '804194244@qq.com', '熊猫有礼什锦果蔬干脆片酥脆', '36', 'assets/upload/什锦果干.png');
INSERT INTO `favourite` VALUES ('9', '21', '804194244@qq.com', '炎亭渔夫鱼豆腐', '20', 'assets/upload/鱼豆腐.jpg');
INSERT INTO `favourite` VALUES ('10', '12', '804194244@qq.com', '张君雅小妹妹干脆面', '6', 'assets/upload/干吃面.png');
INSERT INTO `favourite` VALUES ('11', '1', '804194244@qq.com', '布尔本什锦奶油巧克力曲奇饼干礼盒', '27', 'assets/upload/夹心曲奇.png');
INSERT INTO `favourite` VALUES ('12', '12', '804194244@qq.com', '张君雅小妹妹干脆面', '6', 'assets/upload/干吃面.png');
INSERT INTO `favourite` VALUES ('13', '5', '804194244@qq.com', 'U100牌蔓越莓干', '18', 'assets/upload/蔓越莓干.png');
INSERT INTO `favourite` VALUES ('14', '25', '2056366070@qq.com', '小老板原味海苔', '16', 'assets/upload/海苔.jpg');
INSERT INTO `favourite` VALUES ('15', '23', '2056366070@qq.com', '即食干脆虾', '21', 'assets/upload/烤虾.jpg');
INSERT INTO `favourite` VALUES ('16', '38', '2056366070@qq.com', '母亲牌牛肉棒', '2', 'assets/upload/ss8.jpg');
INSERT INTO `favourite` VALUES ('17', '29', '2056366070@qq.com', '黑米蒸蛋糕小面包', '9', 'assets/upload/蒸蛋糕.png');
INSERT INTO `favourite` VALUES ('18', '21', '2056366070@qq.com', '炎亭渔夫鱼豆腐', '20', 'assets/upload/鱼豆腐.jpg');
INSERT INTO `favourite` VALUES ('19', '15', '', '软馅夹心曲奇', '9', 'assets/upload/夹心曲奇.png');
INSERT INTO `favourite` VALUES ('20', '17', '', 'å¥¥è±æ¼æ¤°å­æ±é¸¡èå·', '8', 'assets/upload/é¸¡èå·.png');
INSERT INTO `favourite` VALUES ('21', '4', '2056366070@qq.com', 'U100牌菠萝干', '18', 'assets/upload/菠萝干.png');

-- ----------------------------
-- Table structure for `food`
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `producer` varchar(50) DEFAULT NULL COMMENT '生产商',
  `produce_date` varchar(50) DEFAULT NULL COMMENT '生产日期',
  `expiration_date` int(20) DEFAULT NULL COMMENT '保质期',
  `storge` int(10) DEFAULT NULL COMMENT '库存',
  `category` varchar(20) DEFAULT NULL COMMENT '零食分类',
  `specification` varchar(50) DEFAULT NULL COMMENT '容量，大、中、小，毫升 之类的',
  `product_id` int(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', '大工厂1', '20160303', '32', '100', '坚果炒货', '11g', '1');
INSERT INTO `food` VALUES ('2', '益民食品厂', '20170118', '30', '100', '坚果炒货', '80g', '2');
INSERT INTO `food` VALUES ('3', '垃圾食品厂', '20170110', '30', '55', '坚果炒货', '80g', '3');
INSERT INTO `food` VALUES ('4', '苟食品厂', '20170109', '30', '100', '坚果炒货', '80g', '4');
INSERT INTO `food` VALUES ('5', '二厂', '20170118', '30', '100', '果干蜜饯', '20g', '5');
INSERT INTO `food` VALUES ('6', '啊啊厂', '20170116', '30', '11', '果干蜜饯', '80g', '6');
INSERT INTO `food` VALUES ('7', '给他哥哥厂', '20170120', '30', '100', '果干蜜饯', '80g', '7');
INSERT INTO `food` VALUES ('8', '益民食品厂', '20170119', '30', '100', '果干蜜饯', '80g', '8');
INSERT INTO `food` VALUES ('9', '益民食品厂', '20170116', '30', '100', '果干蜜饯', '80g', '9');
INSERT INTO `food` VALUES ('10', '益民食品厂', '20170110', '30', '100', '肉类熟食', '80g', '10');
INSERT INTO `food` VALUES ('11', '益民食品厂', '20170119', '30', '222', '肉类熟食', '80g', '11');
INSERT INTO `food` VALUES ('12', '益民食品厂', '20170116', '30', '100', '肉类熟食', '80g', '12');
INSERT INTO `food` VALUES ('13', '益民食品厂', '20170114', '30', '100', '饼干膨化', '80g', '13');
INSERT INTO `food` VALUES ('14', '益民食品厂', '20170121', '30', '100', '饼干膨化', '80g', '14');
INSERT INTO `food` VALUES ('15', '益民食品厂', '20170102', '30', '100', '饼干膨化', '80g', '15');
INSERT INTO `food` VALUES ('16', '益民食品厂', '20170105', '30', '100', '饼干膨化', '80g', '16');
INSERT INTO `food` VALUES ('17', '益民食品厂', '20170113', '30', '100', '饼干膨化', '80g', '17');
INSERT INTO `food` VALUES ('18', '益民食品厂', '20170120', '30', '100', '饼干膨化', '80g', '18');
INSERT INTO `food` VALUES ('19', '益民食品厂', '20170109', '30', '100', '饼干膨化', '80g', '19');
INSERT INTO `food` VALUES ('20', '益民食品厂', '20170111', '30', '100', '饼干膨化', '80g', '20');
INSERT INTO `food` VALUES ('21', '益民食品厂', '20170111', '30', '100', '饼干膨化', '80g', '21');
INSERT INTO `food` VALUES ('22', '益民食品厂', '20170117', '30', '100', '饼干膨化', '80g', '22');
INSERT INTO `food` VALUES ('23', '益民食品厂', '20170120', '30', '100', '饼干膨化', '80g', '23');
INSERT INTO `food` VALUES ('24', '益民食品厂', '20170109', '30', '100', '饼干膨化', '80g', '24');
INSERT INTO `food` VALUES ('25', '益民食品厂', '20170112', '30', '100', '肉类熟食', '80g', '25');
INSERT INTO `food` VALUES ('26', '益民食品厂', '20170104', '30', '100', '', '80g', '26');
INSERT INTO `food` VALUES ('27', '益民食品厂', '20170120', '30', '100', '', '80g', '27');
INSERT INTO `food` VALUES ('28', '益民食品厂', '20170110', '30', '100', '', '80g', '28');
INSERT INTO `food` VALUES ('29', '益民食品厂', '20170115', '30', '100', '', '80g', '29');
INSERT INTO `food` VALUES ('30', '益民食品厂', '20170107', '30', '100', '', '80g', '30');
INSERT INTO `food` VALUES ('31', '益民食品厂', '20170116', '30', '100', '', '80g', '31');
INSERT INTO `food` VALUES ('32', '益民食品厂', '20170120', '30', '100', '', '80g', '32');
INSERT INTO `food` VALUES ('33', '益民食品厂', '20170109', '30', '100', '', '80g', '33');
INSERT INTO `food` VALUES ('34', '益民食品厂', '20170114', '30', '100', '', '80g', '34');
INSERT INTO `food` VALUES ('35', '益民食品厂', '20170117', '30', '100', '', '80g', '35');
INSERT INTO `food` VALUES ('36', '益民食品厂', '20170119', '30', '100', '果脯', '80g', '36');
INSERT INTO `food` VALUES ('37', '益民食品厂', '20170104', '30', '100', '果脯', '80g', '37');
INSERT INTO `food` VALUES ('38', '益民食品厂', '20170121', '30', '100', '果脯', '80g', '38');
INSERT INTO `food` VALUES ('39', '益民食品厂', '20170118', '30', '100', '肉类熟食', '80g', '39');
INSERT INTO `food` VALUES ('40', '益民食品厂', '20170118', '30', '100', '果脯', '80g', '40');
INSERT INTO `food` VALUES ('41', '益民食品厂', '20170111', '30', '100', '果脯', '80g', '41');
INSERT INTO `food` VALUES ('42', '益民食品厂', '20170116', '30', '100', '果脯', '80g', '42');
INSERT INTO `food` VALUES ('43', '益民食品厂', '20170108', '30', '100', '果脯', '80g', '43');
INSERT INTO `food` VALUES ('44', '益民食品厂', '20170112', '30', '100', '果脯', '80g', '44');
INSERT INTO `food` VALUES ('45', '益民食品厂', '20170120', '30', '100', '果脯', '80g', '45');
INSERT INTO `food` VALUES ('46', '益民食品厂', '20170111', '30', '100', '果脯', '80g', '46');
INSERT INTO `food` VALUES ('47', '益民食品厂', '20170114', '30', '100', '果脯', '80g', '47');
INSERT INTO `food` VALUES ('48', '益民食品厂', '20170106', '30', '100', '果脯', '80g', '48');
INSERT INTO `food` VALUES ('49', '益民食品厂', '20170118', '30', '100', '果脯', '80g', '49');
INSERT INTO `food` VALUES ('50', '益民食品厂', '20170119', '30', '100', '果脯', '80g', '50');
INSERT INTO `food` VALUES ('51', '益民食品厂', '20170116', '30', '100', '果脯', '80g', '51');
INSERT INTO `food` VALUES ('52', '益民食品厂', '20170107', '30', '100', '果脯', '80g', '52');
INSERT INTO `food` VALUES ('53', '益民食品厂', '20170104', '30', '100', '果脯', '80g', '53');
INSERT INTO `food` VALUES ('54', '益民食品厂', '20170114', '30', '100', '果脯', '80g', '54');
INSERT INTO `food` VALUES ('55', '益民食品厂', '20170120', '30', '100', '果脯', '80g', '55');
INSERT INTO `food` VALUES ('56', '益民食品厂', '20170113', '30', '100', '果脯', '80g', '56');
INSERT INTO `food` VALUES ('57', '益民食品厂', '20170120', '30', '100', '果脯', '80g', '57');
INSERT INTO `food` VALUES ('58', '益民食品厂', '20170116', '30', '100', '果脯', '80g', '58');
INSERT INTO `food` VALUES ('59', '益民食品厂', '20170108', '30', '100', '果脯', '80g', '59');
INSERT INTO `food` VALUES ('60', '益民食品厂', '20170103', '30', '100', '果脯', '80g', '60');
INSERT INTO `food` VALUES ('61', '益民食品厂', '20170103', '30', '100', '果脯', '80g', '61');
INSERT INTO `food` VALUES ('62', '益民食品厂', '20170106', '30', '100', '果脯', '80g', '62');
INSERT INTO `food` VALUES ('63', '益民食品厂', '20170118', '30', '100', '果脯', '80g', '63');
INSERT INTO `food` VALUES ('64', '益民食品厂', '20170116', '30', '100', '果脯', '80g', '64');
INSERT INTO `food` VALUES ('65', '益民食品厂', '20170120', '30', '100', '果脯', '80g', '65');
INSERT INTO `food` VALUES ('66', '益民食品厂', '20170114', '30', '100', '果脯', '80g', '66');
INSERT INTO `food` VALUES ('67', '益民食品厂', '20170113', '30', '100', '果脯', '80g', '67');
INSERT INTO `food` VALUES ('68', '益民食品厂', '20170116', '30', '100', '果脯', '80g', '68');
INSERT INTO `food` VALUES ('69', '益民食品厂', '20170111', '30', '100', '果脯', '80g', '69');
INSERT INTO `food` VALUES ('70', '益民食品厂', '20170105', '30', '100', '果脯', '80g', '70');
INSERT INTO `food` VALUES ('71', '益民食品厂', '20170112', '30', '100', '果脯', '80g', '71');
INSERT INTO `food` VALUES ('72', '益民食品厂', '20170115', '30', '100', '果脯', '80g', '72');
INSERT INTO `food` VALUES ('73', '益民食品厂', '20170102', '30', '100', '果脯', '80g', '73');
INSERT INTO `food` VALUES ('74', '益民食品厂', '20170121', '30', '100', '果脯', '80g', '74');
INSERT INTO `food` VALUES ('75', '益民食品厂', '20170116', '30', '100', '果脯', '80g', '75');
INSERT INTO `food` VALUES ('76', '益民食品厂', '20170104', '30', '100', '果脯', '80g', '76');
INSERT INTO `food` VALUES ('77', '益民食品厂', '20170120', '30', '100', '果脯', '80g', '77');
INSERT INTO `food` VALUES ('78', '益民食品厂', '20170111', '30', '100', '果脯', '80g', '78');
INSERT INTO `food` VALUES ('79', '益民食品厂', '20170121', '30', '100', '果脯', '80g', '79');
INSERT INTO `food` VALUES ('80', '益民食品厂', '20170108', '30', '100', '果脯', '80g', '80');
INSERT INTO `food` VALUES ('81', '益民食品厂', '20170119', '30', '100', '果脯', '80g', '81');
INSERT INTO `food` VALUES ('82', '益民食品厂', '20170112', '30', '100', '果脯', '80g', '82');
INSERT INTO `food` VALUES ('83', '益民食品厂', '20170108', '30', '100', '果脯', '80g', '83');
INSERT INTO `food` VALUES ('84', '益民食品厂', '20170102', '30', '100', '果脯', '80g', '84');
INSERT INTO `food` VALUES ('85', '益民食品厂', '20170107', '30', '100', '果脯', '80g', '85');
INSERT INTO `food` VALUES ('86', '益民食品厂', '20170102', '30', '100', '果脯', '80g', '86');
INSERT INTO `food` VALUES ('87', '益民食品厂', '20170111', '30', '100', '果脯', '80g', '87');
INSERT INTO `food` VALUES ('88', '益民食品厂', '20170109', '30', '100', '果脯', '80g', '88');
INSERT INTO `food` VALUES ('89', '益民食品厂', '20170118', '30', '100', '果脯', '80g', '89');
INSERT INTO `food` VALUES ('90', '益民食品厂', '20170115', '30', '100', '果脯', '80g', '90');
INSERT INTO `food` VALUES ('91', '益民食品厂', '20170116', '30', '100', '果脯', '80g', '91');
INSERT INTO `food` VALUES ('92', '益民食品厂', '20170119', '30', '100', '果脯', '80g', '92');
INSERT INTO `food` VALUES ('93', '益民食品厂', '20170108', '30', '100', '果脯', '80g', '92');
INSERT INTO `food` VALUES ('94', '益民食品厂', '20170120', '30', '100', '果脯', '80g', '94');
INSERT INTO `food` VALUES ('95', '益民食品厂', '20170107', '30', '100', '果脯', '80g', '103');
INSERT INTO `food` VALUES ('96', '益民食品厂', '20170108', '30', '100', '鱿鱼海味', '80g', '108');
INSERT INTO `food` VALUES ('97', '益民食品厂', '20170118', '30', '100', '坚果炒货', '80g', '104');
INSERT INTO `food` VALUES ('98', '益民食品厂', '20170105', '30', '100', '素食豆类', '80g', '105');
INSERT INTO `food` VALUES ('99', '益民食品厂', '20170121', '30', '100', '饼干膨化', '80g', '106');
INSERT INTO `food` VALUES ('100', '益民食品厂', '20170120', '30', '100', '糕点点心', '80g', '107');
INSERT INTO `food` VALUES ('116', '反倒是', '20111111', '20', '100', '肉类熟食', '23g', '147');
INSERT INTO `food` VALUES ('117', '必胜客集团', '20111111', '20', '100', '糕点点心', '23g', '148');
INSERT INTO `food` VALUES ('118', '111', '11', '11', '11', '1', '11g', '149');
INSERT INTO `food` VALUES ('119', '西班牙第一食品厂', '20170105', '18', '290', '果干蜜饯', '22g', '150');
INSERT INTO `food` VALUES ('120', '神有限公司', '20170101', '12', '10', '糕点点心', '23g', '151');
INSERT INTO `food` VALUES ('121', '盼盼', '2017/1/18', '80', '165', '肉类素食', '55g', '153');
INSERT INTO `food` VALUES ('122', '1', '1', '1', '1', '1', '11g', '154');

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `price` double(22,0) DEFAULT NULL,
  `product_num` int(10) DEFAULT NULL,
  `amount` double(22,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_order_id_fk` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '1', '3', 'ff', '45', '4', '144');
INSERT INTO `item` VALUES ('2', '1', '4', '55', '66', '66', '66');
INSERT INTO `item` VALUES ('3', '2', '66', '66', '66', '66', '66');
INSERT INTO `item` VALUES ('4', '2', '66', '66', '66', null, '66');
INSERT INTO `item` VALUES ('5', '15', '19', '55', '77', '55', '555');
INSERT INTO `item` VALUES ('6', '20170705120758', '14', '螺状元螺蛳粉', '23', '1', '23');
INSERT INTO `item` VALUES ('7', '20170705120758', '42', '靖江猪肉脯X4', '31', '3', '93');
INSERT INTO `item` VALUES ('8', '20170705121306', '14', '螺状元螺蛳粉', '23', '1', '23');
INSERT INTO `item` VALUES ('9', '20170705121306', '42', '靖江猪肉脯X4', '31', '3', '93');
INSERT INTO `item` VALUES ('10', '20170705121607', '14', '螺状元螺蛳粉', '23', '1', '23');
INSERT INTO `item` VALUES ('11', '20170705121607', '42', '靖江猪肉脯X4', '31', '3', '93');
INSERT INTO `item` VALUES ('12', '20170705121855', '14', '螺状元螺蛳粉', '23', '1', '23');
INSERT INTO `item` VALUES ('13', '20170705121855', '42', '靖江猪肉脯X4', '31', '3', '93');
INSERT INTO `item` VALUES ('14', '20170705122231', '14', '螺状元螺蛳粉', '23', '1', '23');
INSERT INTO `item` VALUES ('15', '20170705122231', '42', '靖江猪肉脯X4', '31', '3', '93');
INSERT INTO `item` VALUES ('16', '20170705140446', '14', '螺状元螺蛳粉', '23', '1', '23');
INSERT INTO `item` VALUES ('17', '20170705140446', '42', '靖江猪肉脯X4', '31', '3', '93');
INSERT INTO `item` VALUES ('18', '20170705140446', '14', '螺状元螺蛳粉', '23', '1', '23');
INSERT INTO `item` VALUES ('19', '20170705140446', '42', '靖江猪肉脯X4', '31', '3', '93');
INSERT INTO `item` VALUES ('20', '20170705140511', '14', '螺状元螺蛳粉', '23', '1', '23');
INSERT INTO `item` VALUES ('21', '20170705140511', '42', '靖江猪肉脯X4', '31', '3', '93');
INSERT INTO `item` VALUES ('22', '20170705143721', '14', '螺状元螺蛳粉', '23', '1', '23');
INSERT INTO `item` VALUES ('23', '20170705143721', '42', '靖江猪肉脯X4', '31', '3', '93');
INSERT INTO `item` VALUES ('24', '20170705144639', '36', '鸡蛋干', '11', '1', '11');
INSERT INTO `item` VALUES ('25', '20170705144653', '36', '鸡蛋干', '11', '1', '11');
INSERT INTO `item` VALUES ('26', '20170705151652', '25', '小老板原味海苔', '16', '1', '16');
INSERT INTO `item` VALUES ('27', '20170705151652', '27', '凤梨酥', '15', '1', '15');
INSERT INTO `item` VALUES ('28', '20170705151652', '28', '早餐食品糯米糍', '16', '1', '16');
INSERT INTO `item` VALUES ('29', '20170705163643', '36', '鸡蛋干', '11', '1', '11');
INSERT INTO `item` VALUES ('30', '20170705163643', '11', '小贱牛板筋', '25', '1', '25');
INSERT INTO `item` VALUES ('31', '20170705165050', '25', '小老板原味海苔', '16', '1', '16');
INSERT INTO `item` VALUES ('32', '20170705165050', '27', '凤梨酥', '15', '1', '15');
INSERT INTO `item` VALUES ('33', '20170705165050', '28', '早餐食品糯米糍', '16', '1', '16');
INSERT INTO `item` VALUES ('34', '20170705180739', '147', '大时代', '22', '3', '66');
INSERT INTO `item` VALUES ('35', '20170705180823', '147', '大时代', '22', '3', '66');
INSERT INTO `item` VALUES ('36', '20170705180823', '41', '靖江猪肉脯X2', '43', '9999', '429957');
INSERT INTO `item` VALUES ('37', '20170705211435', '108', '大神鱿鱼丝', '3', '1', '3');
INSERT INTO `item` VALUES ('38', '20170706103538', '36', '鸡蛋干', '11', '1', '11');
INSERT INTO `item` VALUES ('39', '20170706103538', '11', '小贱牛板筋', '25', '1', '25');
INSERT INTO `item` VALUES ('40', '20170706103538', '24', '奥嘉莱蟹片', '15', '1', '15');
INSERT INTO `item` VALUES ('41', '20170706103538', '108', '大神鱿鱼丝', '3', '1', '3');
INSERT INTO `item` VALUES ('42', '20170706143856', '25', '小老板原味海苔', '16', '4', '64');
INSERT INTO `item` VALUES ('43', '20170706143856', '27', '凤梨酥', '15', '1', '15');
INSERT INTO `item` VALUES ('44', '20170706143856', '28', '早餐食品糯米糍', '16', '1', '16');
INSERT INTO `item` VALUES ('45', '20170706145538', '6', 'U100牌蜜桃干', '18', '1', '18');
INSERT INTO `item` VALUES ('46', '20170706145538', '21', '炎亭渔夫鱼豆腐', '20', '2', '40');
INSERT INTO `item` VALUES ('47', '20170706145538', '27', '凤梨酥', '15', '1', '15');
INSERT INTO `item` VALUES ('48', '20170706154203', '35', '卤藕藕片莲藕', '8', '2', '16');
INSERT INTO `item` VALUES ('49', '20170706154632', '39', '牛笔牛肉干', '1', '2', '2');
INSERT INTO `item` VALUES ('50', '20170706154948', '39', '牛笔牛肉干', '1', '1', '1');
INSERT INTO `item` VALUES ('51', '20170706155239', '9', '西冷菲力肉眼牛排', '159', '1', '159');
INSERT INTO `item` VALUES ('52', '20170706155452', '15', '软馅夹心曲奇', '9', '4', '36');
INSERT INTO `item` VALUES ('53', '20170706155928', '30', '肉松饼', '45', '1', '45');
INSERT INTO `item` VALUES ('54', '20170706160914', '19', '布尔蛋卷夹心饼干', '16', '1', '16');
INSERT INTO `item` VALUES ('55', '20170706161029', '43', '靖江猪肉脯X5', '4', '1', '4');
INSERT INTO `item` VALUES ('56', '20170706161646', '12', '张君雅小妹妹干脆面', '6', '1', '6');
INSERT INTO `item` VALUES ('57', '20170706163521', '39', '牛笔牛肉干', '1', '1', '1');
INSERT INTO `item` VALUES ('58', '20170706163539', '147', '大时代', '22', '1', '22');
INSERT INTO `item` VALUES ('59', '20170706164739', '14', '螺状元螺蛳粉', '23', '1', '23');
INSERT INTO `item` VALUES ('60', '20170706170345', '7', 'U100炭烧梅饼', '20', '1', '20');
INSERT INTO `item` VALUES ('61', '20170706170345', '42', '靖江猪肉脯X4', '31', '1', '31');
INSERT INTO `item` VALUES ('62', '20170706170948', '1', '布尔本什锦奶油巧克力曲奇饼干礼盒', '20', '1', '20');
INSERT INTO `item` VALUES ('63', '20170706170948', '38', '母亲牌牛肉棒', '2', '1', '2');
INSERT INTO `item` VALUES ('64', '20170706170948', '21', '炎亭渔夫鱼豆腐', '20', '1', '20');
INSERT INTO `item` VALUES ('65', '20170706170950', '1', '布尔本什锦奶油巧克力曲奇饼干礼盒', '20', '1', '20');
INSERT INTO `item` VALUES ('66', '20170706170950', '38', '母亲牌牛肉棒', '2', '1', '2');
INSERT INTO `item` VALUES ('67', '20170706170950', '21', '炎亭渔夫鱼豆腐', '20', '1', '20');
INSERT INTO `item` VALUES ('68', '20170706172811', '24', '奥嘉莱蟹片', '15', '1', '15');
INSERT INTO `item` VALUES ('69', '20170706175056', '12', '张君雅小妹妹干脆面', '6', '4', '24');
INSERT INTO `item` VALUES ('70', '20170706175346', '42', '靖江猪肉脯X4', '31', '1', '31');
INSERT INTO `item` VALUES ('71', '20170706175711', '41', '靖江猪肉脯X2', '43', '1', '43');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` varchar(100) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `order_time` varchar(50) DEFAULT NULL,
  `address_id` varchar(255) DEFAULT NULL,
  `price_amount` varchar(50) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('20170705180739', '76', '未处理', '2017/07/05', '82', '66.0', '2323232');
INSERT INTO `order` VALUES ('20170705180823', '76', '1', '2017/07/05', '85', '430023.0', '');
INSERT INTO `order` VALUES ('20170705211435', '78', '1', '2017/07/05', '75', '3.0', '');
INSERT INTO `order` VALUES ('20170706031891', '154', '未处理', '2017/07/05', '82', '83.5', null);
INSERT INTO `order` VALUES ('20170706103538', '78', '已接单', '2017/07/06', '75', '54.0', '');
INSERT INTO `order` VALUES ('20170706143856', '57', '1', '2017/07/06', '21', '95.0', '');
INSERT INTO `order` VALUES ('20170706145538', '559', '1', '2017/07/06', '86', '73.0', '233333');
INSERT INTO `order` VALUES ('20170706163539', '557', '1', '2017/07/06', '81', '22.0', '');
INSERT INTO `order` VALUES ('20170706164739', '78', '1', '2017/07/06', '87', '23.0', '快快快');
INSERT INTO `order` VALUES ('20170706170948', '560', '1', '2017/07/06', '88', '42.0', '问问');
INSERT INTO `order` VALUES ('20170706170950', '560', '1', '2017/07/06', '88', '42.0', '问问');
INSERT INTO `order` VALUES ('20170706172811', '560', '1', '2017/07/06', '88', '15.0', 'yyy');
INSERT INTO `order` VALUES ('20170706175346', '557', '1', '2017/07/06', '89', '31.0', '');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `add_time` bigint(19) DEFAULT NULL,
  `fixed_price` double(10,0) DEFAULT NULL,
  `dangqian_price` double(10,0) DEFAULT NULL,
  `keywords` varchar(20) DEFAULT NULL,
  `has_deleted` int(11) DEFAULT NULL,
  `product_pic` varchar(250) DEFAULT NULL,
  `product_pic1` varchar(40) DEFAULT NULL,
  `product_pic2` varchar(40) DEFAULT NULL,
  `product_pic3` varchar(40) DEFAULT NULL,
  `product_pic4` varchar(40) DEFAULT NULL,
  `product_pic5` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '布尔本什锦奶油巧克力曲奇饼干礼盒', '坚果干果休闲食品', '20170336', '14', '20', '坚果炒货', '0', 'assets/upload/夹心曲奇.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('2', '原味洽洽香瓜子', '坚果干果休闲食品', '20170336', '14', '11', '坚果炒货', '0', 'assets/upload/瓜子.png', '瓜子1.png', '瓜子2.png', '', '', '');
INSERT INTO `product` VALUES ('3', '马鲁斯坚果杏仁即食小吃', '坚果干果休闲食品', '20170330', '16', '13', '坚果炒货', '0', 'assets/upload/杏仁.png', '杏仁1.png', '杏仁2.png', null, null, null);
INSERT INTO `product` VALUES ('4', 'U100牌菠萝干', '坚果干果休闲食品', '20170342', '18', '18', '果干蜜饯', '0', 'assets/upload/菠萝干.png', '菠萝干1.png', '菠萝干2.png', null, null, null);
INSERT INTO `product` VALUES ('5', 'U100牌蔓越莓干', '办公室休闲零食小吃什么玩意', '20170326', '18', '18', '果干蜜饯', '0', 'assets/upload/蔓越莓干.png', '蔓越莓干1.png', '蔓越莓干2.png', null, null, null);
INSERT INTO `product` VALUES ('6', 'U100牌蜜桃干', '这是个蜜桃。。', '20170328', '18', '45', '果干蜜饯', '0', 'assets/upload/蜜桃干.png', '蜜桃干1.png', '蜜桃干2.png', null, null, null);
INSERT INTO `product` VALUES ('7', 'U100炭烧梅饼', '办公室休闲零食小吃', '20170333', '20', '20', '果干蜜饯', '0', 'assets/upload/话梅.png', '话梅1.png', '话梅2.png', null, null, null);
INSERT INTO `product` VALUES ('8', '熊猫有礼什锦果蔬干脆片酥脆', '办公室休闲零食小吃', '20170329', '36', '36', '果干蜜饯', '0', 'assets/upload/什锦果干.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('9', '西冷菲力肉眼牛排', '原切非腌制儿童新鲜牛肉牛扒', '20170328', '159', '159', '肉类熟食', '0', 'assets/upload/牛排.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('10', '灯影牛肉丝', '休闲零食特产小吃四川麻辣牛肉干', '20170331', '68', '28', '肉类熟食', '0', 'assets/upload/灯影牛肉.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('11', '小贱牛板筋', '四川特产小吃麻辣零食小包装', '20170328', '48', '25', '肉类熟食', '0', 'assets/upload/牛板筋.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('12', '张君雅小妹妹干脆面', '捏碎面即食干吃方便面', '20170425', '8', '6', '饼干膨化', '0', 'assets/upload/干吃面.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('13', '番茄豚骨拉面', '速食面方便面', '20170425', '26', '23', '饼干膨化', '0', 'assets/upload/豚骨拉面.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('14', '螺状元螺蛳粉', '正宗广西柳州特产小吃', '20170425', '26', '23', '饼干膨化', '0', 'assets/upload/螺蛳粉.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('15', '软馅夹心曲奇', '饼干糕点心进口小吃零食小包装', '20170425', '13', '9', '饼干膨化', '0', 'assets/upload/夹心曲奇.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('16', '曲奇饼干礼盒', '布尔本什锦奶油巧克力', '20170324', '45', '28', '饼干膨化', '0', 'assets/upload/什锦曲奇.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('17', '奥莱曼椰子汁鸡蛋卷', '酥脆饼干水果味', '20170425', '13', '8', '饼干膨化', '0', 'assets/upload/鸡蛋卷.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('18', '莱家榛子威化饼', '粒粒装膨化夹心饼', '20170325', '16', '16', '饼干膨化', '0', 'assets/upload/威化饼.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('19', '布尔蛋卷夹心饼干', '糕点休闲小吃', '20170425', '16', '16', '饼干膨化', '0', 'assets/upload/蛋卷夹心饼干.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('20', '啪啪通鲜虾片', '休闲膨化小吃薯', '20170425', '13', '13', '饼干膨化', '0', 'assets/upload/虾片.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('21', '炎亭渔夫鱼豆腐', '麻辣休闲零食小吃', '20170323', '20', '20', '鱿鱼海味', '0', 'assets/upload/鱼豆腐.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('22', 'bento拌多乐鳕鱼丝', '海鲜零食辣烤鱿鱼丝', '20170336', '18', '18', '鱿鱼海味', '0', 'assets/upload/鳕鱼丝.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('23', '即食干脆虾', '休闲零食小吃海鲜干货烤虾', '20170323', '21', '21', '鱿鱼海味', '0', 'assets/upload/烤虾.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('24', '奥嘉莱蟹片', '膨化食品小吃多口味', '20170425', '15', '15', '鱿鱼海味', '0', 'assets/upload/蟹片.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('25', '小老板原味海苔', '即食寿司海苔片香脆烤紫菜', '20170425', '16', '16', '鱿鱼海味', '0', 'assets/upload/海苔.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('26', '马鲁斯熏制鱿鱼丝', '原味鱿鱼条海鲜小吃', '20170425', '19', '18', '鱿鱼海味', '0', 'assets/upload/鱿鱼丝.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('27', '凤梨酥', '零食小吃美食糕点特产点心独立包装', '20170425', '15', '15', '糕点点心', '0', 'assets/upload/凤梨酥.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('28', '早餐食品糯米糍', '糕点特产美食小吃零食大礼包 组合', '20170323', '16', '16', '糕点点心', '0', 'assets/upload/糯米糍.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('29', '黑米蒸蛋糕小面包', '早餐食品糕点黑米小蛋糕', '20170425', '9', '9', '糕点点心', '0', 'assets/upload/蒸蛋糕.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('30', '肉松饼', '办公室零食小吃糕点点心', '20170323', '45', '45', '糕点点心', '0', 'assets/upload/肉松饼.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('31', '椰丝球椰蓉球椰子球', '早餐糕点点心零食甜点小吃小包装', '20170327', '13', '13', '糕点点心', '0', 'assets/upload/椰丝球.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('32', '华夫饼', '原味早餐食品饼干糕点点心零食小吃袋装', '20170325', '15', '15', '糕点点心', '0', 'assets/upload/威化饼.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('33', '蚕豆蟹黄味', '休闲零食特产炒货小吃', '20170425', '16', '16', '素食豆类', '0', 'assets/upload/蚕豆.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('34', '黄金豆玉米豆', '奶香奶油味爆米花休闲零食', '20170321', '14', '14', '素食豆类', '0', 'assets/upload/玉米豆.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('35', '卤藕藕片莲藕', '卤藕藕片莲藕', '20170321', '8', '8', '素食豆类', '0', 'assets/upload/莲藕.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('36', '鸡蛋干', '麻辣零食特产小吃素食干子小包装', '20170321', '11', '11', '素食豆类', '0', 'assets/upload/鸡蛋干.png', null, null, null, null, null);
INSERT INTO `product` VALUES ('37', '草莓干', '啊啊啊啊撒点我去', '20101212', '11', '10', '果干蜜饯', '0', 'assets/upload/ss4.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('38', '母亲牌牛肉棒', '23第三方的手', '20111111', '22', '2', '肉类熟食', '0', 'assets/upload/ss8.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('39', '牛笔牛肉干', '侯大大大神', '20120211', '3', '1', '肉类熟食', '0', 'assets/upload/ss4.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('40', '靖江猪肉脯', '发生了空间发链接', '20120303', '31', '11', '肉类熟食', '0', 'assets/upload/yy6.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('41', '靖江猪肉脯X2', '豪车次数啊暗示', '20111112', '54', '43', '肉类熟食', '0', 'assets/upload/ss8.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('42', '靖江猪肉脯X4', '神他妈', '20150302', '32', '31', '肉类熟食', '0', 'assets/upload/yy5.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('43', '靖江猪肉脯X5', '打算的撒大神2', '20171222', '34', '4', '肉类熟食', '0', 'assets/upload/yy3.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('104', '牛逼碧根果', '打算的撒大神2', '20161111', '23', '21', '坚果炒货', '0', 'assets/upload/ss8.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('105', '卫龙小面筋', '吼啊!!!!', '20170101', '65', '34', '素食豆类', '0', 'assets/upload/ss7.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('106', '奥利奥巧克力饼干', '噢噢噢噢', '20120204', '23', '12', '饼干膨化', '0', 'assets/upload/ss7.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('107', '厉害的绿豆糕', '噢噢噢噢', '20101212', '32', '6', '糕点点心', '0', 'assets/upload/yy5.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('108', '大神鱿鱼丝', 'naive!', '20150205', '34', '3', '鱿鱼海味', '0', 'assets/upload/yy2.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('147', '大时代', 'naive!', '20170703', '223', '22', '肉类熟食', '0', 'assets/upload/yy2.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('148', '必胜客雪糕黑天使', 'naive!', '20170704', '22', '11', '糕点点心', null, 'assets/upload/yy2.jpg', null, null, null, null, null);
INSERT INTO `product` VALUES ('151', '松塔千层酥饼', '台湾进口零食77松塔千层酥饼', '20170706', '22', '19', '糕点点心', null, 'assets/upload/20170706172220\\TB2ZCIFcCFjpuFjSspbXXXagVXa_!!725677994.png', null, null, null, null, null);

-- ----------------------------
-- Table structure for `receive_address`
-- ----------------------------
DROP TABLE IF EXISTS `receive_address`;
CREATE TABLE `receive_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `receive_name` varchar(55) DEFAULT NULL,
  `province` varchar(10) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `district` varchar(20) DEFAULT NULL,
  `full_address` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `postal_code` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receive_address_user_id_fk` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of receive_address
-- ----------------------------
INSERT INTO `receive_address` VALUES ('1', '8', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('2', '20', '张琼1', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('3', '16', '张琼2', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('4', '8', '张琼3', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('5', '2', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('6', '18', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('7', '15', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('8', '6', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('9', '7', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('10', '19', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('11', '8', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('12', '12', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('13', '14', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('14', '6', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('15', '20', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('16', '17', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('17', '10', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('18', '17', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('19', '4', '张琼', null, null, null, '陕西省咸阳市杨凌区西农路222号', '18392000001', '712100');
INSERT INTO `receive_address` VALUES ('20', '57', '马学倩', '陕西', '咸阳', '杨凌', '陕西省咸阳市杨凌区西北农林科技大学8号楼', '18329961028', '712100');
INSERT INTO `receive_address` VALUES ('21', '57', '刘佳妮', '陕西', '咸阳', '杨凌', '陕西省咸阳市杨凌区西北农林科技大学', '18329696022', '712100');
INSERT INTO `receive_address` VALUES ('72', '53', '刘志伟', '河南', '信阳', '平桥', '潍坊科技会', '1541', '131');
INSERT INTO `receive_address` VALUES ('73', '53', '刘志伟', '河南', '西安', '杨凌', '西北农林科技', '156465', '1354165');
INSERT INTO `receive_address` VALUES ('80', '53', '刘志伟3', '河南', '信阳', 'haskfh', '事发后', '金凤凰', '水电费h');
INSERT INTO `receive_address` VALUES ('81', '557', '刘志伟', '河南', '信阳', '平桥', '西北农林科技大学', '1564654', '154165');
INSERT INTO `receive_address` VALUES ('85', '76', 'jty', 'yyyyy4', 'yyyy', 'yyyy', '34534', '543535', '5435');
INSERT INTO `receive_address` VALUES ('86', '559', '张琼', '陕西', '咸阳', '杨凌', '西北农林科技大学', '12345644665', '34545');
INSERT INTO `receive_address` VALUES ('87', '78', '哇哈哈哈', '陕西', '咸阳', '杨凌', '西北农林科技大学', '18392499125', '712100');
INSERT INTO `receive_address` VALUES ('88', '560', '哇啊啊', '陕西', '咸阳', '杨凌', '西北农林科技大学北校', '18392496289', '712100');
INSERT INTO `receive_address` VALUES ('89', '557', 'Tom', 'Earth', 'China', 'xian', 'NWSUAF', '18392533494', '712100');
INSERT INTO `receive_address` VALUES ('91', '561', '黄嘎嘎', '陕西', '咸阳', '杨凌', '西北农林科技大学', '18888888', '55555555');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `user_integral` int(10) DEFAULT NULL,
  `last_login_IP` varchar(55) DEFAULT NULL,
  `last_login_time` bigint(19) DEFAULT NULL,
  `is_email_verify` varchar(50) DEFAULT NULL,
  `email_verify_code` varchar(55) DEFAULT NULL,
  `nickName` varchar(20) DEFAULT NULL,
  `trueName` varchar(20) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `cardId` varchar(18) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `mouth` varchar(10) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `head_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=563 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('56', '1300476003@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '0:0:0:0:0:0:0:1', '20170705160746', 'y', 'f25d60f1-3238-4d01-87bc-1b7c61b5ea15', 'More123', '月来吗', '女', '641234200010221234', '1996', '1', '1', null);
INSERT INTO `user` VALUES ('57', '1131533158@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '0:0:0:0:0:0:0:1', '20170706140428', 'y', '824c66e2-e253-4a71-8420-fab99fbb60a2', 'QianOnly', '马学倩', '男', '642222199610282222', '1996', '1', '1', null);
INSERT INTO `user` VALUES ('77', '1104112847@qq.com', 'JfnnlDI7RTiF9RgfG2JNCw==', '1', '0:0:0:0:0:0:0:1', '20170627180118', 'n', '379a9977-8485-4b8c-8712-5b9c9947788b', 'TOTwo', '', '男', '641234200010221234', '1996', '10', '22', null);
INSERT INTO `user` VALUES ('557', '1768020298@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '0:0:0:0:0:0:0:1', '20170706174015', 'y', '32df777e-94f8-4bb9-a90d-4c3802c646a6', ' 小小', '', null, '641234200010221234', '2000', '10', '22', '20170705154822FSLogo.png');
INSERT INTO `user` VALUES ('558', '854511214@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '0:0:0:0:0:0:0:1', '20170706100103', 'y', '30b0e838-269c-4a5e-89d4-4ce393a14fdd', '哈哈', '阳所', '', '641234200010221234', '2000', '10', '22', '20170706100510无标题.png');
INSERT INTO `user` VALUES ('559', '804194244@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '0:0:0:0:0:0:0:1', '20170706182122', 'y', '278dca26-c485-4b9d-9caf-b6bfc85acf6b', ' 撒飒飒', '大撒打算', '', '12121212121', '18', '2802', '2840', '20170706164512u=3465463446,2707518567&fm=26&gp=0.jpg');
INSERT INTO `user` VALUES ('562', '2056366070@qq.com', '4QrcOUm6Wau+VuBX8g+IPg==', '1', '0:0:0:0:0:0:0:1', '20170706185346', 'n', '2e27f77b-338a-43bc-bea0-c5add0acf493', null, null, null, null, null, null, null, 'morentouxiang.jpg');
