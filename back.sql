/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : back

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 14/10/2022 10:09:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `admin_id` int(0) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, '沈阳', '123456');
INSERT INTO `t_admin` VALUES (2, 'lys', '123456');
INSERT INTO `t_admin` VALUES (3, 'lysaa', '123');

-- ----------------------------
-- Table structure for t_line
-- ----------------------------
DROP TABLE IF EXISTS `t_line`;
CREATE TABLE `t_line`  (
  `id` bigint(0) NOT NULL COMMENT '主键(雪花算法)',
  `line_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '线路名称',
  `line_category` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '线路分类',
  `sort` int(0) NULL DEFAULT NULL COMMENT '线路分类排序',
  `line_amount` decimal(10, 2) NOT NULL COMMENT '线路价格',
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '线路图片',
  `remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '线路备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '景点线路表（初始化数据）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_line
-- ----------------------------
INSERT INTO `t_line` VALUES (1, '线路1', '一日游', 1, 200.00, '天安门.jpg', '这是一日游');
INSERT INTO `t_line` VALUES (2, '线路2', '一日游', 1, 220.00, '天安门.jpg', '这是一日游');
INSERT INTO `t_line` VALUES (3, '线路3', '一日游', 1, 300.00, '天安门.jpg', '这是一日游');
INSERT INTO `t_line` VALUES (4, '线路21', '两日游', 2, 350.00, '天安门.jpg', '这是两日游');
INSERT INTO `t_line` VALUES (5, '线路22', '两日游', 2, 400.00, '天安门.jpg', '这是两日游');
INSERT INTO `t_line` VALUES (6, '线路23', '两日游', 2, 370.00, '天安门.jpg', '这是两日游');
INSERT INTO `t_line` VALUES (7, '线路31', '三日游', 3, 450.00, '天安门.jpg', '这是三日游');
INSERT INTO `t_line` VALUES (8, '线路32', '三日游', 3, 500.00, '天安门.jpg', '这是三日游');
INSERT INTO `t_line` VALUES (9, '线路41', '四日游', 4, 550.00, '天安门.jpg', '这是三日游');

-- ----------------------------
-- Table structure for t_line_scenic
-- ----------------------------
DROP TABLE IF EXISTS `t_line_scenic`;
CREATE TABLE `t_line_scenic`  (
  `id` bigint(0) NOT NULL COMMENT '主键(雪花算法)',
  `line_id` bigint(0) NOT NULL COMMENT '线路id',
  `scenic_id` bigint(0) NOT NULL COMMENT '景点id',
  `sort` int(0) NULL DEFAULT NULL COMMENT '景点次序',
  `go_time` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '前往时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `un_line_rule`(`line_id`, `scenic_id`, `sort`) USING BTREE COMMENT '线路规则唯一索引'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '线路景点关系表（初始化数据）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_line_scenic
-- ----------------------------
INSERT INTO `t_line_scenic` VALUES (1, 1, 1, 1, '07:30');
INSERT INTO `t_line_scenic` VALUES (2, 1, 2, 2, '09:30');
INSERT INTO `t_line_scenic` VALUES (3, 1, 3, 3, '14:30');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` bigint(0) NOT NULL COMMENT '主键(雪花算法)',
  `amount` decimal(10, 0) NOT NULL COMMENT '订单金额',
  `together_number` int(0) NOT NULL COMMENT '同行人数',
  `reservation_time` datetime(0) NOT NULL COMMENT '预定时间',
  `status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单状态(未支付，已支付，已完成)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单表（业务数据）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_payment
-- ----------------------------
DROP TABLE IF EXISTS `t_payment`;
CREATE TABLE `t_payment`  (
  `id` bigint(0) NOT NULL COMMENT '主键(雪花算法)',
  `order_id` bigint(0) NOT NULL COMMENT '订单id',
  `pay_amount` decimal(10, 2) NOT NULL COMMENT '支付金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '支付表（业务数据）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_payment
-- ----------------------------

-- ----------------------------
-- Table structure for t_scenic_spot
-- ----------------------------
DROP TABLE IF EXISTS `t_scenic_spot`;
CREATE TABLE `t_scenic_spot`  (
  `id` bigint(0) NOT NULL COMMENT '主键(雪花算法)',
  `scenic_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '景点名称',
  `scenic_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '景点详细地址',
  `scenic_describe` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '景点描述',
  `scenic_image` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '景点图片名称',
  `longitude` decimal(10, 7) NOT NULL COMMENT '地理经度',
  `latitude` decimal(10, 7) NOT NULL COMMENT '地理纬度',
  `prov` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属省份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '景点表（初始化数据）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_scenic_spot
-- ----------------------------
INSERT INTO `t_scenic_spot` VALUES (1, '重庆工程学院', '重庆市巴南区白鹤路16号', '人美、山美、风景美', 'cqgcxy.webp', 106.5953520, 29.4223980, '重庆');
INSERT INTO `t_scenic_spot` VALUES (2, '刘伯承故居', '重庆市开州区', '开国元帅之乡', '刘伯承故居.jpeg', 108.3931100, 31.1609800, '重庆');
INSERT INTO `t_scenic_spot` VALUES (3, '天安门', '北京市东城区长安街（天安门和正阳门之间）', '天安门是明清两代北京皇城的正门，始建于明朝永乐十五年（1417年），最初名“承天门”，寓“承天启运、受命于天”之意。设计者为明代御用建筑匠师蒯祥。清朝顺治八年（1651年）更名为天安门。由城台和城楼两部分组成，有汉白玉石的须弥座，总高34.7米。天安门城楼长66米、宽37米。城台下有券门五阙，中间的券门最大，位于北京市皇城中轴线上，过去只有皇帝才可以由此出入。', '天安门.jpg', 116.3971280, 39.9165270, '北京');
INSERT INTO `t_scenic_spot` VALUES (5, '重庆磁器口', '重庆市沙坪坝区磁南街1号', '磁器口古镇，曾经“白日里千人拱手，入夜后万盏明灯”繁盛一时。巴渝文化、宗教文化、沙磁文化、红岩文化和民间文化，各具特色。一条石板路，千年磁器口，是重庆古城的缩影和象征，被赞誉为“小重庆”，磁器口古镇开发有榨油、抽丝、制糖、捏面人、川戏等传统表演项目和各种传统小吃、茶馆等，每年春节举办的磁器口庙会是最具特色的传统活动，吸引数万市民前往参与。', '磁器口.jpg', 106.5404100, 29.4026800, NULL);
INSERT INTO `t_scenic_spot` VALUES (6, '重庆朝天门', '重庆市渝中区渝中半岛的嘉陵江与长江交汇处', '重庆朝天门位于重庆市渝中区渝中半岛的嘉陵江与长江交汇处，城门原题有“古渝雄关”四个大字，是重庆以前的十七座古城门之一。南宋（1127——1279）宋朝偏安临安（即今杭州）后，时有钦差自长江经该城门传来圣旨，所以才有了朝天门这个名字。', '朝天门.jpg', 106.5881810, 29.5669330, NULL);
INSERT INTO `t_scenic_spot` VALUES (95839783787429888, '北京', '北京故宫', '版本', '111', 111.0000000, 111.0000000, NULL);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(0) NOT NULL COMMENT '主键(雪花算法)',
  `nick_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '昵称',
  `openid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '微信openid',
  `head_portrait` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '头像url',
  `gender` bit(1) NULL DEFAULT NULL COMMENT '性别',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表（业务数据）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (95441036616138752, 'ㅤㅤㅤㅤㅤㅤㅤㅤ', 'op_di5Hgk7V5MEO0gXVLQwEm_YVE', 'https://thirdwx.qlogo.cn/mmopen/vi_32/gVosEHqCWOEpp5nJwZXH1OkrLYMmr4cZwJOXiaiaPCGAXicibavwlibe0p1TvCsRT89icKbTKt9Vn5arpGWQYmSqgF9g/132', b'0', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (95441494499917824, '冰@~', 'ouF6D5cX-OZd1ElBM-IWdl8DzUE0', 'https://thirdwx.qlogo.cn/mmopen/vi_32/z65lnygfJyouOJgWRecnZdttnLeibwdPd1aYmicRET4JEdZxlPTBE4LsXapy4vibW4qSbvYMVlhBv7I8IElvibVUBw/132', b'0', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (95455608341266432, 'Host-梦琪', 'o8uZC5LtTaQQV-BnWyJywmgXAF7k', 'https://thirdwx.qlogo.cn/mmopen/vi_32/fib7RWUDhp6Dpz92KXemBxNjpFKYWuf6SMbzy0gcuHrQTibIjVqwj4pXa1j8jeD5W2mDmOgzVmibk6CfG1RsGWgdA/132', b'0', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (95459073129971712, '雪橙', 'oud3r5BjyB6oO9MYZBPyGi0n6I2Q', 'https://thirdwx.qlogo.cn/mmopen/vi_32/uGOeNuw7ln6TM6lCYrhme1DocB6Wvv0usPEVlpM2MSXk4NlPj9vUVA0TzGSFVdYAmYh4hGCibibQo1eDGja8Pbsw/132', b'0', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (95472430830583808, '不念', 'o2PS95BuWQKmIJudEzntrKvHrh78', 'https://thirdwx.qlogo.cn/mmopen/vi_32/hd4ribEql1tVibZ9Crib2IMgRtibaAnictKISDU18OED28O2ot3AiakmxW0shLicuIHpgDtZYnkVRu466Yf00lqEg60SA/132', b'0', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (95819845618106368, '山山而川', 'oqJJW5T1uN13wqakDULiXN2wHIpU', 'https://thirdwx.qlogo.cn/mmopen/vi_32/4Q377Fz5nMDP47Inq6JQ8mRSRibwmaaxOFZmum7viaolT1rSnFBPygCbmuBPgYK45X7TCx5aHibyxzlmgPj9WibkTw/132', b'0', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (96895973028003840, 'YY', 'oAUJD43YtmBQJBeiuoI2HoQeLoYc', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJC8lQbwDLtet5nZkX2yE8alknodM2ZXypGiay99rBJqHX9lgmAdicw95Zob10pgEYQWJnw2QjOID0Q/132', b'0', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
