/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : gameaccount_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2020-03-13 11:32:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `commentId` int(11) NOT NULL auto_increment COMMENT '评论id',
  `productObj` int(11) NOT NULL COMMENT '被评商品',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `userObj` varchar(30) NOT NULL COMMENT '评论用户',
  `commentTime` varchar(20) default NULL COMMENT '评论时间',
  PRIMARY KEY  (`commentId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1', '很好玩！', 'user1', '2020-03-12 14:15:13');
INSERT INTO `t_comment` VALUES ('2', '1', '非常好玩，效果不错！', 'user1', '2020-03-12 22:31:11');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(30) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '111', '222', 'user1', '2020-03-12 23:46:29', '333', '2020-03-12 23:46:33');
INSERT INTO `t_leaveword` VALUES ('2', 'aa', 'bb', 'user1', '2020-03-12 23:08:02', '很好', '2020-03-12 23:28:01');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', 'aaaa', '<p>bbbb</p>', '2020-03-12 23:47:02');

-- ----------------------------
-- Table structure for `t_orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderinfo`;
CREATE TABLE `t_orderinfo` (
  `orderNo` varchar(30) NOT NULL COMMENT 'orderNo',
  `userObj` varchar(30) NOT NULL COMMENT '下单用户',
  `totalMoney` float NOT NULL COMMENT '订单总金额',
  `payWay` varchar(20) NOT NULL COMMENT '支付方式',
  `orderStateObj` varchar(20) NOT NULL COMMENT '订单状态',
  `orderTime` varchar(20) default NULL COMMENT '下单时间',
  `receiveName` varchar(20) NOT NULL COMMENT '收货人',
  `telephone` varchar(20) NOT NULL COMMENT '收货人电话',
  `address` varchar(80) NOT NULL COMMENT '收货人地址',
  `orderMemo` varchar(500) default NULL COMMENT '订单备注',
  PRIMARY KEY  (`orderNo`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_orderinfo_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderinfo
-- ----------------------------
INSERT INTO `t_orderinfo` VALUES ('14433334433', 'user1', '180', '支付宝', '已付款', '2020-02-19 15:13:14', '马云林', '13958398343', '四川成都万年场13号', 'test');
INSERT INTO `t_orderinfo` VALUES ('user120180122225749', 'user1', '92.5', '支付宝', '已发货', '2020-01-22 22:57:49', '双鱼林', '13598308394', '四川成都红星路13号', '尽快发货哦！');
INSERT INTO `t_orderinfo` VALUES ('user120180123234311', 'user1', '99.5', '支付宝', '已付款', '2020-01-23 23:43:11', '王忠强', '13598308394', '四川成都红星路13号', 'test333');
INSERT INTO `t_orderinfo` VALUES ('user120180124170109', 'user1', '102.1', '支付宝', '已付款', '2020-01-24 17:01:09', '李明霞', '13598308394', '四川成都红星路13号', '测试订单');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `itemId` int(11) NOT NULL auto_increment COMMENT '条目id',
  `orderObj` varchar(30) NOT NULL COMMENT '所属订单',
  `productObj` int(11) NOT NULL COMMENT '订单商品',
  `price` float NOT NULL COMMENT '商品单价',
  `orderNumer` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`itemId`),
  KEY `orderObj` (`orderObj`),
  KEY `productObj` (`productObj`),
  CONSTRAINT `t_orderitem_ibfk_1` FOREIGN KEY (`orderObj`) REFERENCES `t_orderinfo` (`orderNo`),
  CONSTRAINT `t_orderitem_ibfk_2` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('1', '14433334433', '1', '28.5', '2');
INSERT INTO `t_orderitem` VALUES ('2', 'user120180122225749', '1', '28.5', '2');
INSERT INTO `t_orderitem` VALUES ('3', 'user120180122225749', '2', '35.5', '1');
INSERT INTO `t_orderitem` VALUES ('4', 'user120180123234311', '2', '35.5', '2');
INSERT INTO `t_orderitem` VALUES ('5', 'user120180123234311', '1', '28.5', '1');
INSERT INTO `t_orderitem` VALUES ('6', 'user120180124170109', '5', '36.8', '2');
INSERT INTO `t_orderitem` VALUES ('7', 'user120180124170109', '1', '28.5', '1');

-- ----------------------------
-- Table structure for `t_product`
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `productId` int(11) NOT NULL auto_increment COMMENT '商品id',
  `productClassObj` int(11) NOT NULL COMMENT '商品类别',
  `productName` varchar(50) NOT NULL COMMENT '商品名称',
  `mainPhoto` varchar(60) NOT NULL COMMENT '商品图片',
  `productNum` int(11) NOT NULL COMMENT '商品库存',
  `price` float NOT NULL COMMENT '商品价格',
  `recommandFlag` varchar(20) NOT NULL COMMENT '是否推荐',
  `recipeFlag` varchar(20) NOT NULL COMMENT '是否处方药',
  `productDesc` varchar(5000) NOT NULL COMMENT '商品描述',
  `addTime` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`productId`),
  KEY `productClassObj` (`productClassObj`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`productClassObj`) REFERENCES `t_productclass` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES ('1', '1', '末世鼠疫2', 'upload/32ea9434-91b8-4038-9bfc-63420adb45ec.jpg', '100', '28.5', '是', '否', '<p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(204, 0, 0);\">战锤:末世鼠疫2 Warhammer: Vermintide 2</span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(204, 0, 0);\">steam平台 PC正版游戏</span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\">发行日期:2018年3月8日</span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); font-family: tahoma, arial, 宋体, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"></span></p><p><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(204, 0, 0);\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\">【标准版】</span>：代激活 Warhammer: Vermintide 2（游戏本体）</span></span></span></p><p><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(204, 0, 0);\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\">【普通版】</span>：礼物 Warhammer: Vermintide 2（游戏本体）</span></span></span></p><p><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(204, 0, 0);\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\">【典藏版】</span>：礼物 Warhammer: Vermintide 2 - Collector&#39;s Edition包含 2 件物品： Warhammer: Vermintide 2, Warhammer: Vermintide 2 - Collector&#39;s Edition</span></span></span></p><p><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><span style=\"margin: 0px; padding: 0px; font-size: 18px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(204, 0, 0);\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 255);\">【DLC拓展1】</span>：礼物 此游戏的 DLC Warhammer: Vermintide 2 - Collector&#39;s Edition（需要拥有游戏本体才可购买使用）</span></span></span></p><p><br/></p>', '2020-03-12 23:43:22');
INSERT INTO `t_product` VALUES ('2', '2', '孤岛惊魂5', 'upload/f81b0e12-c538-4696-bcc3-3d0dd5d32821.jpg', '100', '35.5', '是', '否', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>游戏名称:&nbsp;孤岛惊魂5</p></li><li><p>生产企业:&nbsp;steam</p></li><li><p>游戏类型:&nbsp;AVG冒险游戏</p></li><li><p>语种分类:&nbsp;简体中文</p></li><li><p>游戏版本:&nbsp;标准版&nbsp;豪华版&nbsp;黄金版</p></li></ul><p><br/></p>', '2020-03-12 22:57:14');
INSERT INTO `t_product` VALUES ('3', '1', '鬼泣5', 'upload/a7760c0a-c83b-4764-9313-c09d6b79e40a.jpg', '200', '41', '是', '否', '<p>……世界自黑暗而生，无尽的黑暗与荒凉的土地。</p><p>但是…在那个世界里是有一缕光照耀着。世界之后分成了两个部分，暗之区域是魔界(Demon World)，光之区域是人界(Human World)。</p><p>在这很长的一段时光里，这两个世界一直互相平衡，并存着，原本应该这样下来。</p><p>但是，暗界的王却说“世界原来是一体的，那么将其完整有什么不好”。</p><p>于是从那次起，黑暗预要笼罩光明，光明则抗争着要从黑暗的魔爪逃脱。但光之界的居民--人类，他们的身躯是脆弱的，无法与魔界居民--<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%81%B6%E9%AD%94\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">恶魔</a>的力量对抗，就在光中的生气要被深沉黑暗即将啃噬殆尽之时，命运之轮启动了……</p><p><br/></p>', '2020-03-12 16:47:30');
INSERT INTO `t_product` VALUES ('4', '3', '地下城与勇士', 'upload/6ed19169-f24f-421c-97de-b9b8b1998cc1.jpg', '240', '268', '是', '否', '<p>《地下城与勇士》是一款韩国网络游戏公司NEOPLE开发的免费角色扮演<a target=\"_blank\" href=\"https://baike.baidu.com/item/2D%E6%B8%B8%E6%88%8F\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">2D游戏</a>，由<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%B8%89%E6%98%9F%E7%94%B5%E5%AD%90\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">三星电子</a>发行，并于2005年8月在<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%9F%A9%E5%9B%BD/6009333\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">韩国</a>正式发布。中国则由腾讯游戏代理发行。</p><p>该游戏是一款2D卷轴式横版格斗过关网络游戏，大量继承了众多家用机、街机2D格斗游戏的特色。以任务引导角色成长为中心，结合副本、<a target=\"_blank\" href=\"https://baike.baidu.com/item/PVP\" style=\"color: rgb(19, 110, 194); text-decoration: none;\">PVP</a>、PVE为辅，与其他网络游戏同样具有装备与等级的改变，并拥有共500多种装备道具。每个人物有8个道具装备位置，在游戏中可以允许最多4个玩家进行组队挑战关卡，同样也可以进行4对4的PK。</p><p><br/></p>', '2020-03-12 16:52:54');
INSERT INTO `t_product` VALUES ('5', '4', 'qq仙侠传', 'upload/a44ac2b0-4481-4ac9-a3d7-b4e1fc002f62.jpg', '260', '36.8', '是', '是', '<p>基本信息编辑</p><p>仙侠传</p><p>游戏类别：角色扮演</p><p>资费提示：完全免费</p><p>语言类型：中文</p><p>更新时间：2013-08-17</p><p>支持平台：JAVA</p><p>软件格式：jar</p><p><br/></p><p>故事背景编辑</p><p>楚氏史籍大事记年表</p><p>仙魔决战，天下倾覆。</p><p>延续千万年的战争，唱响最终华章。青铜色天穹被血与火染红，仙界陨落，大地分裂，中州裂谷吞噬了人类的王城，天下陷于人、仙、魔并立的时代！</p><p>玄·天授十三年，这个王朝最后的落日余晖涂抹在剑门之下的战场边缘。楚氏史官楚无忌从战场的尘埃中拾回他的青史书册，其中，记叙了一切的缘起…</p><p><br/><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">《QQ仙侠传》是腾讯游戏历时五年研发的3D MMORPG。以“爱在仙侠浪漫时”为主题，人、仙、魔三族的千年战争为背景，设计了五大门派、十五流派、上万种装备、上千类宠物，给予玩家独树一帜的游戏体验！</span></p>', '2020-03-12 16:55:19');

-- ----------------------------
-- Table structure for `t_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_productclass`;
CREATE TABLE `t_productclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `className` varchar(40) NOT NULL COMMENT '类别名称',
  `classDesc` varchar(500) NOT NULL COMMENT '类别描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_productclass
-- ----------------------------
INSERT INTO `t_productclass` VALUES ('1', '动作游戏', '动作游戏');
INSERT INTO `t_productclass` VALUES ('2', '冒险游戏', '冒险游戏');
INSERT INTO `t_productclass` VALUES ('3', '格斗游戏', '格斗游戏');
INSERT INTO `t_productclass` VALUES ('4', '角色扮演游戏', '角色扮演游戏');

-- ----------------------------
-- Table structure for `t_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `t_recharge`;
CREATE TABLE `t_recharge` (
  `rechargeId` int(11) NOT NULL auto_increment COMMENT '充值id',
  `userObj` varchar(30) NOT NULL COMMENT '充值用户',
  `rechargeMoney` float NOT NULL COMMENT '充值金额',
  `rechargeMemo` varchar(500) default NULL COMMENT '充值备注',
  `rechargeTime` varchar(20) default NULL COMMENT '充值时间',
  PRIMARY KEY  (`rechargeId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recharge_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recharge
-- ----------------------------
INSERT INTO `t_recharge` VALUES ('1', 'user1', '100', 'test', '2020-03-12 23:46:49');
INSERT INTO `t_recharge` VALUES ('2', 'user1', '50', 'test22', '2020-03-12 23:31:50');
INSERT INTO `t_recharge` VALUES ('3', 'user1', '50', '333', '2020-03-12 23:33:05');

-- ----------------------------
-- Table structure for `t_recipel`
-- ----------------------------
DROP TABLE IF EXISTS `t_recipel`;
CREATE TABLE `t_recipel` (
  `recipelId` int(11) NOT NULL auto_increment COMMENT '处方id',
  `recipelPhoto` varchar(60) NOT NULL COMMENT '处方照片',
  `userObj` varchar(30) NOT NULL COMMENT '上传用户',
  `recipelMemo` varchar(500) default NULL COMMENT '处方备注',
  `handState` varchar(20) NOT NULL COMMENT '处理状态',
  `addTime` varchar(20) default NULL COMMENT '上传时间',
  PRIMARY KEY  (`recipelId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_recipel_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_recipel
-- ----------------------------
INSERT INTO `t_recipel` VALUES ('1', 'upload/NoImage.jpg', 'user1', 'aaaa', '待处理', '2020-03-12 23:46:00');
INSERT INTO `t_recipel` VALUES ('2', 'upload/NoImage.jpg', 'user1', 'bbb', '已处理', '2020-03-12 22:51:44');

-- ----------------------------
-- Table structure for `t_shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `t_shopcart`;
CREATE TABLE `t_shopcart` (
  `cartId` int(11) NOT NULL auto_increment COMMENT '购物车id',
  `productObj` int(11) NOT NULL COMMENT '商品',
  `userObj` varchar(30) NOT NULL COMMENT '用户',
  `price` float NOT NULL COMMENT '单价',
  `buyNum` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY  (`cartId`),
  KEY `productObj` (`productObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_shopcart_ibfk_1` FOREIGN KEY (`productObj`) REFERENCES `t_product` (`productId`),
  CONSTRAINT `t_shopcart_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `userMoney` float NOT NULL COMMENT '账户余额',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2020-01-02', 'upload/2a4f0e05-2407-44d0-b510-0b04a8cfa620.jpg', '13598308394', 'dashen@163.com', '四川成都红星路13号', '98.4', '2020-03-12 23:41:53');
