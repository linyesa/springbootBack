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

 Date: 02/11/2022 09:44:43
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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, '沈阳', '123456');
INSERT INTO `t_admin` VALUES (2, 'lys', '123456');
INSERT INTO `t_admin` VALUES (3, 'lysaa', '123');
INSERT INTO `t_admin` VALUES (4, 'tqn', '123456');
INSERT INTO `t_admin` VALUES (6, 'ofjhfgh', '123456');
INSERT INTO `t_admin` VALUES (7, 'adfasdf', '123456');
INSERT INTO `t_admin` VALUES (8, 'adfasdf', '123456');
INSERT INTO `t_admin` VALUES (9, 'asdfasdf', '123456');
INSERT INTO `t_admin` VALUES (10, 'adfadsfasdfdsa', '123456');
INSERT INTO `t_admin` VALUES (11, 'adsfasdfasdf', '123456');
INSERT INTO `t_admin` VALUES (12, 'dafsadf', '123456');
INSERT INTO `t_admin` VALUES (16, 'lysdafdafd', '123456');

-- ----------------------------
-- Table structure for t_line
-- ----------------------------
DROP TABLE IF EXISTS `t_line`;
CREATE TABLE `t_line`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键(雪花算法)',
  `line_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '线路名称',
  `line_category` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '线路分类',
  `sort` int(0) NULL DEFAULT NULL COMMENT '线路分类排序',
  `line_amount` decimal(10, 2) NOT NULL COMMENT '线路价格',
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '线路图片',
  `remark` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '线路备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '景点线路表（初始化数据）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_line
-- ----------------------------
INSERT INTO `t_line` VALUES (1, '线路1', '十日游', 1, 200.00, '天安门.jpg', '这是一日游');
INSERT INTO `t_line` VALUES (2, '线路2', '一日游', 1, 220.00, '天安门.jpg', '这是一日游');
INSERT INTO `t_line` VALUES (3, '线路3', '一日游', 1, 300.00, '天安门.jpg', '这是一日游');
INSERT INTO `t_line` VALUES (4, '线路21', '两日游', 2, 350.00, '天安门.jpg', '这是两日游');
INSERT INTO `t_line` VALUES (5, '线路22', '两日游', 2, 400.00, '天安门.jpg', '这是两日游');
INSERT INTO `t_line` VALUES (6, '线路23', '两日游', 2, 370.00, '天安门.jpg', '这是两日游');
INSERT INTO `t_line` VALUES (7, '线路31', '三日游', 3, 450.00, '天安门.jpg', '这是三日游');
INSERT INTO `t_line` VALUES (8, '线路32', '三日游', 3, 500.00, '天安门.jpg', '这是三日游');
INSERT INTO `t_line` VALUES (9, '线路41', '四日游', 4, 550.00, '天安门.jpg', '这是三日游');
INSERT INTO `t_line` VALUES (10, 'test', 'cato', 2, 100.00, 'img', 'remark');

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
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键(雪花算法)',
  `amount` decimal(10, 0) NOT NULL COMMENT '订单金额',
  `together_number` int(0) NOT NULL COMMENT '同行人数',
  `reservation_time` datetime(0) NOT NULL COMMENT '预定时间',
  `status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单状态(未支付，已支付，已完成)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单表（业务数据）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (1, 199, 10, '2022-10-19 08:57:48', '未支付', '2022-09-22 09:58:52', '2022-10-19 09:58:56', '1', '1');
INSERT INTO `t_order` VALUES (2, 100, 20, '2022-10-19 10:01:17', '未支付', '2022-10-19 09:05:12', '2022-10-19 10:01:17', '1', '1');
INSERT INTO `t_order` VALUES (3, 199, 10, '2022-10-19 10:01:57', '已退款', '2022-10-19 10:01:57', '2022-10-19 10:01:57', '1', 'lys');
INSERT INTO `t_order` VALUES (4, 199, 10, '2022-10-19 10:17:05', '已完成', '2022-10-19 10:17:05', '2022-10-19 10:17:05', 'lysa', 'lys');
INSERT INTO `t_order` VALUES (6, 343, 12343, '2022-10-20 00:00:00', '已退款', '2022-10-19 11:31:39', '2022-10-19 11:31:39', 'lys', 'lys');
INSERT INTO `t_order` VALUES (9, 452, 245, '2022-10-30 00:00:00', '已支付', '2022-11-01 11:30:11', '2022-11-01 11:30:11', 'lys', NULL);
INSERT INTO `t_order` VALUES (10, 425, 245, '2022-10-31 00:00:00', '已支付', '2022-11-01 11:30:32', '2022-11-01 11:30:32', 'lys', NULL);
INSERT INTO `t_order` VALUES (11, 343, 432, '2022-10-30 00:00:00', '已支付', '2022-11-01 11:34:12', '2022-11-01 11:34:12', 'lys', NULL);
INSERT INTO `t_order` VALUES (12, 234, 465, '2022-10-31 00:00:00', '已支付', '2022-11-01 11:34:24', '2022-11-01 11:34:24', 'lys', NULL);
INSERT INTO `t_order` VALUES (13, 97, 908, '2022-11-01 00:00:00', '已支付', '2022-11-01 11:34:34', '2022-11-01 11:34:34', 'lys', NULL);
INSERT INTO `t_order` VALUES (14, 48, 987, '2022-11-02 00:00:00', '已支付', '2022-11-01 11:34:45', '2022-11-01 11:34:45', 'lys', NULL);
INSERT INTO `t_order` VALUES (15, 879, 780, '2022-11-03 00:00:00', '已支付', '2022-11-01 11:35:01', '2022-11-01 11:35:01', 'lys', NULL);
INSERT INTO `t_order` VALUES (16, 214, 54, '2022-11-04 00:00:00', '已支付', '2022-11-01 11:35:10', '2022-11-01 11:35:10', 'lys', NULL);
INSERT INTO `t_order` VALUES (17, 989, 7869, '2022-11-05 00:00:00', '已支付', '2022-11-01 11:35:22', '2022-11-01 11:35:22', 'lys', NULL);
INSERT INTO `t_order` VALUES (18, 796, 3, '2022-10-30 00:00:00', '已退款', '2022-11-01 11:35:42', '2022-11-01 11:35:42', 'lys', NULL);
INSERT INTO `t_order` VALUES (19, 675, 12, '2022-10-31 00:00:00', '已退款', '2022-11-01 11:35:53', '2022-11-01 11:35:53', 'lys', NULL);
INSERT INTO `t_order` VALUES (20, 65, 1, '2022-11-01 00:00:00', '已退款', '2022-11-01 11:36:04', '2022-11-01 11:36:04', 'lys', NULL);
INSERT INTO `t_order` VALUES (21, 76, 32, '2022-11-02 00:00:00', '已退款', '2022-11-01 11:36:16', '2022-11-01 11:36:16', 'lys', NULL);
INSERT INTO `t_order` VALUES (22, 12, 45, '2022-11-02 00:00:00', '已退款', '2022-11-01 11:36:28', '2022-11-01 11:36:28', 'lys', NULL);
INSERT INTO `t_order` VALUES (23, 768, 2, '2022-11-03 00:00:00', '已退款', '2022-11-01 11:36:38', '2022-11-01 11:36:38', 'lys', NULL);
INSERT INTO `t_order` VALUES (24, 856, 4, '2022-11-04 00:00:00', '已退款', '2022-11-01 11:36:51', '2022-11-01 11:36:51', 'lys', NULL);
INSERT INTO `t_order` VALUES (25, 354, 21, '2022-11-05 00:00:00', '已支付', '2022-11-24 11:44:02', '2022-11-01 11:43:26', 'lys', NULL);
INSERT INTO `t_order` VALUES (26, 324, 345, '2022-10-30 00:00:00', '已完成', '2022-11-02 09:07:38', '2022-11-02 09:07:38', 'lys', NULL);
INSERT INTO `t_order` VALUES (27, 345, 13, '2022-10-31 00:00:00', '已完成', '2022-11-02 09:07:52', '2022-11-02 09:07:52', 'lys', NULL);
INSERT INTO `t_order` VALUES (28, 234, 13, '2022-11-01 00:00:00', '已支付', '2022-11-02 09:07:58', '2022-11-02 09:07:58', 'lys', NULL);
INSERT INTO `t_order` VALUES (29, 34, 1234, '2022-10-31 00:00:00', '已完成', '2022-11-02 09:08:05', '2022-11-02 09:08:05', 'lys', NULL);
INSERT INTO `t_order` VALUES (30, 343, 134, '2022-11-01 00:00:00', '已完成', '2022-11-02 09:08:16', '2022-11-02 09:08:16', 'lys', NULL);
INSERT INTO `t_order` VALUES (31, 324, 34, '2022-11-02 00:00:00', '已完成', '2022-11-02 09:08:23', '2022-11-02 09:08:23', 'lys', NULL);
INSERT INTO `t_order` VALUES (32, 214, 14, '2022-11-03 00:00:00', '已完成', '2022-11-02 09:08:30', '2022-11-02 09:08:30', 'lys', NULL);
INSERT INTO `t_order` VALUES (33, 234, 14, '2022-11-04 00:00:00', '已完成', '2022-11-02 09:08:39', '2022-11-02 09:08:39', 'lys', NULL);
INSERT INTO `t_order` VALUES (34, 523, 45, '2022-11-04 00:00:00', '已完成', '2022-11-02 09:08:51', '2022-11-02 09:08:51', 'lys', NULL);
INSERT INTO `t_order` VALUES (35, 254, 1, '2022-11-04 00:00:00', '已完成', '2022-11-02 09:08:59', '2022-11-02 09:08:59', 'lys', NULL);
INSERT INTO `t_order` VALUES (36, 454, 54, '2022-11-05 00:00:00', '已完成', '2022-11-02 09:09:05', '2022-11-02 09:09:05', 'lys', NULL);
INSERT INTO `t_order` VALUES (37, 345, 24, '2022-10-30 00:00:00', '已退款', '2022-11-02 09:12:14', '2022-11-02 09:12:14', 'lys', NULL);
INSERT INTO `t_order` VALUES (38, 345, 34, '2022-11-05 00:00:00', '已退款', '2022-11-02 09:12:54', '2022-11-02 09:12:54', 'lys', NULL);

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
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键(雪花算法)',
  `scenic_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '景点名称',
  `scenic_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '景点详细地址',
  `scenic_describe` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '景点描述',
  `scenic_image` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '景点图片名称',
  `longitude` decimal(10, 7) NOT NULL COMMENT '地理经度',
  `latitude` decimal(10, 7) NOT NULL COMMENT '地理纬度',
  `prov` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属省份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95839783787429899 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '景点表（初始化数据）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_scenic_spot
-- ----------------------------
INSERT INTO `t_scenic_spot` VALUES (1, '重庆工程学院', '重庆市巴南区白鹤路16号', '人美、山美、风景美', 'cqgcxy.webp', 106.5953520, 29.4223980, '重庆');
INSERT INTO `t_scenic_spot` VALUES (2, '刘伯承故居', '重庆市开州区', '开国元帅之乡', '刘伯承故居.jpeg', 108.3931100, 31.1609800, '重庆');
INSERT INTO `t_scenic_spot` VALUES (3, '天安门', '北京市东城区长安街（天安门和正阳门之间）', 'balaball', '天安门.jpg', 116.3971280, 39.9165270, '北京');
INSERT INTO `t_scenic_spot` VALUES (5, '重庆磁器口', '重庆市沙坪坝区磁南街1号', 'balabaldjakfjd', '磁器口.jpg', 106.5404100, 29.4026800, '四川');
INSERT INTO `t_scenic_spot` VALUES (6, '重庆朝天门', '重庆市渝中区渝中半岛的嘉陵江与长江交汇处', '传统朝天门', '朝天门.jpg', 106.5881810, 29.5669330, '潼南');
INSERT INTO `t_scenic_spot` VALUES (95839783787429888, 'name', 'cq', 'bz', 'img', 456.0000000, 123.0000000, 'bn');
INSERT INTO `t_scenic_spot` VALUES (95839783787429889, 'name', 'cq', 'bz', 'img', 456.0000000, 123.0000000, 'bn');
INSERT INTO `t_scenic_spot` VALUES (95839783787429890, 'a', 'a', 'a', 'a', 2.0000000, 23.0000000, 'a');
INSERT INTO `t_scenic_spot` VALUES (95839783787429891, 'aaa', '1', '1', '1', 1.0000000, 1.0000000, '1');

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
