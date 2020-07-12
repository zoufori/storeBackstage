/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 12/07/2020 17:55:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for a_admin
-- ----------------------------
DROP TABLE IF EXISTS `a_admin`;
CREATE TABLE `a_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleid` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL COMMENT '加入时间',
  `is_ban` smallint(2) NULL DEFAULT NULL COMMENT '是否被禁 1、是 2、否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_admin
-- ----------------------------
INSERT INTO `a_admin` VALUES (1, 'admin', '$2a$10$uf81yjt.jk6Oz6e/V7Gs8eEeWJ9/2Q9IgiWHMxMv9wYP1l3P.R6jm', '1', '2020-04-20 20:36:52', 2);
INSERT INTO `a_admin` VALUES (5, 'jimmy', '$2a$10$gKkR/MQ0VHXUdK/PLICekOMafazY49muQBA.yucrFjZ.nGqfymRim', '2', '2020-04-23 19:33:06', 2);
INSERT INTO `a_admin` VALUES (7, 'Vincent', '$2a$10$2LQQpeRKoVQYerofZ0VAnuTb.AOkvU2st/nU/.vEwvhQfWtWy87a.', '3', '2020-04-23 19:37:38', 2);
INSERT INTO `a_admin` VALUES (9, 'test', '$2a$10$IcdLHkN528B/EK7mZo2wCu1.XOQqQDawb3yvj9Z13ILHVphkMqkmO', '1', '2020-05-09 17:11:33', 2);
INSERT INTO `a_admin` VALUES (10, 'yj66', '$2a$10$55tU4NXKbBZGsNpfw5lPnO1W2PWtZ4JvigmnCC8DrwWMre4IvqMf6', '2', '2020-05-09 18:58:24', 2);

-- ----------------------------
-- Table structure for a_nav
-- ----------------------------
DROP TABLE IF EXISTS `a_nav`;
CREATE TABLE `a_nav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导航栏选项名称（**管理之类的）',
  `parent` int(11) NULL DEFAULT NULL COMMENT '导航类的父类（如果没有就为0）',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for a_roles
-- ----------------------------
DROP TABLE IF EXISTS `a_roles`;
CREATE TABLE `a_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_roles
-- ----------------------------
INSERT INTO `a_roles` VALUES (1, 'ADMIN');
INSERT INTO `a_roles` VALUES (2, 'MANAGER');
INSERT INTO `a_roles` VALUES (3, 'SELLER');
INSERT INTO `a_roles` VALUES (4, 'USER');

-- ----------------------------
-- Table structure for u_comment
-- ----------------------------
DROP TABLE IF EXISTS `u_comment`;
CREATE TABLE `u_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `replyid` int(11) NULL DEFAULT NULL COMMENT '回复某人的信息（id为那个人的id）如果是层主或者楼主的话就为0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for u_goods
-- ----------------------------
DROP TABLE IF EXISTS `u_goods`;
CREATE TABLE `u_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typeid` int(11) NULL DEFAULT NULL,
  `discount` decimal(10, 0) NULL DEFAULT NULL COMMENT '打折后价格（无折扣时与price价格一样）',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述',
  `thumb_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `big_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品详情页的详情图(可有多张，用逗号隔开)',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commentid` int(100) NULL DEFAULT NULL COMMENT '评论id',
  `inventory` int(100) NULL DEFAULT NULL,
  `clicked` int(255) NULL DEFAULT NULL COMMENT '商品点击次数（用于做热门商品）',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家地址',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '上架时间',
  `is_recommend` smallint(2) NULL DEFAULT NULL COMMENT '是否被推荐商品（1、是   2、否）',
  `month_sellid` int(10) NULL DEFAULT NULL COMMENT '月销',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_goods
-- ----------------------------
INSERT INTO `u_goods` VALUES (8, '又一条裤子', 2, 99, 110.00, 'kkkkkkzzzzzz', 'f9bf7553-aaf2-4480-a9b6-d18ac75b9c63.jpg', '14da9c02-c190-485a-a9d6-b00f2918881320200509.jpg', '5f127ff0-a22c-4d76-af92-07921a510daa.', 'asdcasdcasdcasdc', NULL, 5115, 5, '阿U盾上课迟技能点计科技是的你', '2020-05-09 10:37:52', 1, NULL);
INSERT INTO `u_goods` VALUES (9, '上衣', 3, 90, 100.00, 'sdcasasdclasjdnca', '46d9ee80-f0c6-4241-8662-37782d5b2d8a.jpg', '728e6977-c37e-429b-9f14-3911efeb1e1620200509.jpg', 'e32f272a-c39c-4fc7-9bcb-93d48419c10a.', 'dfvsdfvsdfjjncasdkjc', NULL, 1000, 21, 'oaisdncksldncasdc', '2020-05-09 10:39:01', 1, NULL);
INSERT INTO `u_goods` VALUES (10, '一件上衣', 3, 99, 110.00, '阿萨德擦拭的擦拭多彩三', 'c92f90d6-fa92-4e7e-8b82-416ab772458d.jpg', '9eea93a5-05d3-498b-9409-145b3bb0831c20200509.jpg', '233ec8ce-a6d2-4252-8e24-34bbe448e065.', '阿萨德擦拭的擦拭多彩', NULL, 1000, 13, '广州', '2020-05-09 15:04:55', 1, NULL);
INSERT INTO `u_goods` VALUES (11, '1', 2, 1, 1.00, '1', '986cbda9-0119-44d9-949e-e82f1bb9f9b7.', '6a40a433-efa0-4c77-82cd-7f5830c0efb520200509.', '5c1c765c-068a-4d80-95d1-cae3a40a1342.', '', NULL, 1, 0, '1', '2020-05-09 18:41:07', 2, NULL);

-- ----------------------------
-- Table structure for u_goodssell
-- ----------------------------
DROP TABLE IF EXISTS `u_goodssell`;
CREATE TABLE `u_goodssell`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NULL DEFAULT NULL,
  `date` datetime(0) NULL DEFAULT NULL COMMENT '时间（平均每日或每月算一次）',
  `sell` int(20) NULL DEFAULT NULL COMMENT '销量\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_goodssell
-- ----------------------------
INSERT INTO `u_goodssell` VALUES (1, NULL, '2020-05-09 11:23:50', 0);
INSERT INTO `u_goodssell` VALUES (2, NULL, '2020-05-09 11:26:01', 0);
INSERT INTO `u_goodssell` VALUES (3, NULL, '2020-05-09 11:26:10', 0);
INSERT INTO `u_goodssell` VALUES (4, NULL, '2020-05-09 11:26:57', 0);
INSERT INTO `u_goodssell` VALUES (5, NULL, '2020-05-09 11:28:12', 0);
INSERT INTO `u_goodssell` VALUES (6, NULL, '2020-05-09 11:29:53', 0);
INSERT INTO `u_goodssell` VALUES (7, NULL, '2020-05-09 11:29:56', 0);
INSERT INTO `u_goodssell` VALUES (8, NULL, '2020-05-09 11:30:54', 0);
INSERT INTO `u_goodssell` VALUES (9, NULL, '2020-05-09 11:31:00', 0);
INSERT INTO `u_goodssell` VALUES (10, NULL, '2020-05-09 11:32:42', 0);
INSERT INTO `u_goodssell` VALUES (11, NULL, '2020-05-09 11:33:51', 0);
INSERT INTO `u_goodssell` VALUES (12, NULL, '2020-05-09 11:35:23', 0);
INSERT INTO `u_goodssell` VALUES (13, NULL, '2020-05-09 11:43:22', 0);
INSERT INTO `u_goodssell` VALUES (14, 9, '2020-05-09 11:46:19', 0);
INSERT INTO `u_goodssell` VALUES (15, 8, '2020-05-09 13:26:42', 0);
INSERT INTO `u_goodssell` VALUES (16, 7, '2020-05-09 13:28:25', 0);
INSERT INTO `u_goodssell` VALUES (17, 10, '2020-05-09 15:07:51', 0);

-- ----------------------------
-- Table structure for u_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `u_goodstype`;
CREATE TABLE `u_goodstype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '此种类的父类（如果是最大父类就为0）',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用于导航栏点击',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_goodstype
-- ----------------------------
INSERT INTO `u_goodstype` VALUES (2, '裤子', NULL, '/pants');
INSERT INTO `u_goodstype` VALUES (3, '上衣', NULL, '/clothes');
INSERT INTO `u_goodstype` VALUES (4, '首饰', NULL, '/accessory');
INSERT INTO `u_goodstype` VALUES (5, '鞋子', NULL, '/shoes');
INSERT INTO `u_goodstype` VALUES (6, '直筒裤', '裤子', '/longPants');
INSERT INTO `u_goodstype` VALUES (7, '短裤', '裤子', '/shorts');
INSERT INTO `u_goodstype` VALUES (8, '中筒裤', '裤子', '/midPants');
INSERT INTO `u_goodstype` VALUES (9, '睡裤', '裤子', '/pajarma');
INSERT INTO `u_goodstype` VALUES (10, '衬衫', '上衣', '/suit');
INSERT INTO `u_goodstype` VALUES (11, '短袖', '上衣', '/t-shirt');
INSERT INTO `u_goodstype` VALUES (12, '长袖', '上衣', '/longSleeves');
INSERT INTO `u_goodstype` VALUES (13, '睡衣', '上衣', '/nightDress');
INSERT INTO `u_goodstype` VALUES (14, '手表', '首饰', '/watch');
INSERT INTO `u_goodstype` VALUES (15, '手环', '首饰', '/wristRing');
INSERT INTO `u_goodstype` VALUES (16, '项链', '首饰', '/necklace');
INSERT INTO `u_goodstype` VALUES (17, '戒指', '首饰', '/ring');
INSERT INTO `u_goodstype` VALUES (18, '拖鞋', '鞋子', '/slipper');
INSERT INTO `u_goodstype` VALUES (19, '运动鞋', '鞋子', '/sneaker');
INSERT INTO `u_goodstype` VALUES (20, '休闲鞋', '鞋子', '/leisure');
INSERT INTO `u_goodstype` VALUES (21, '凉鞋', '鞋子', '/sandals');
INSERT INTO `u_goodstype` VALUES (22, '外套', '', 'dfjaldf');
INSERT INTO `u_goodstype` VALUES (23, '外套', '外套', 'fdaljdfs');

-- ----------------------------
-- Table structure for u_orders
-- ----------------------------
DROP TABLE IF EXISTS `u_orders`;
CREATE TABLE `u_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `count` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '收货时间',
  `is_cart` smallint(2) NULL DEFAULT NULL COMMENT '是否在购物车中 1、是  0、否',
  `is_paid` smallint(2) NULL DEFAULT NULL COMMENT '是否已付款 1、已付 0、未付',
  `is_cancel` smallint(2) NULL DEFAULT NULL COMMENT '订单是否已取消 1、是  0、否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_orders
-- ----------------------------
INSERT INTO `u_orders` VALUES (5, 4, 9, '2020-05-09 13:21:38', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (6, 4, 9, '2020-05-09 13:23:18', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (7, 4, 8, '2020-05-09 13:26:43', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (8, 4, 7, '2020-05-09 13:28:26', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (9, 4, 8, '2020-05-09 13:31:11', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (10, 4, 7, '2020-05-09 13:34:47', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (11, 6, 9, '2020-05-09 13:41:16', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (12, 6, 7, '2020-05-09 13:44:30', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (13, 6, 7, '2020-05-09 13:57:14', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (14, 6, 9, '2020-05-09 14:01:27', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (15, 6, 8, '2020-05-09 14:11:09', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (16, 8, 8, '2020-05-09 14:16:44', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (17, 8, 7, '2020-05-09 14:21:43', 1, NULL, 1, 0, 0);
INSERT INTO `u_orders` VALUES (18, 9, 10, '2020-05-09 15:08:18', 1, NULL, 1, 0, 0);

-- ----------------------------
-- Table structure for u_users
-- ----------------------------
DROP TABLE IF EXISTS `u_users`;
CREATE TABLE `u_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` smallint(2) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SELLER:商家  USER:用户',
  `money` double(65, 0) NULL DEFAULT NULL COMMENT '账户余额',
  `date` datetime(0) NULL DEFAULT NULL COMMENT '加入时间',
  `is_ban` smallint(2) NULL DEFAULT NULL COMMENT '是否被禁 1、是 2、否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of u_users
-- ----------------------------
INSERT INTO `u_users` VALUES (4, 'test', '$2a$10$4TwxX/aEGEq9tgxESaiK..wzEqkEpHuWEH6zYg9//Xm3quNpQc9cG', '18127253521', 'test@163.com', '186fc545-7a78-4a5e-b358-7b341a11a874.jpg', 3, 'asdcasd', 'USER', 3333, '2020-05-08 20:23:19', 2);
INSERT INTO `u_users` VALUES (5, 'tesded', '$2a$10$gswRfpzLkC/MV.71IJ7be.aVrStyim3MXP5p63YygkXU8Qp5ruI6S', '1353515151515', 'abc@163.com', 'ba7b11cd-6fe4-4342-ba78-2f186c5b8fde.jpg', 3, 'asdcasdc', 'USER', 9999, '2020-05-08 22:10:19', 2);
INSERT INTO `u_users` VALUES (6, '870613777@qq.com', '$2a$10$ty0ZiPN6XGoh6MISa0Tdd.P/3pGnWqxRuRaGfg0xa.0Q7ec/K6sz.', '18676571647', '870613777@qq.com', '186fc545-7a78-4a5e-b358-7b341a11a874.jpg', 3, NULL, 'USER', 0, '2020-05-09 00:45:37', 2);
INSERT INTO `u_users` VALUES (8, '123@qq.com', '$2a$10$8jgX4zhwWp.UrDwoMYi./.PAohOIzR4LUmS9sHbR1H9bBIAaLrDXG', '123456789', '123@qq.com', '186fc545-7a78-4a5e-b358-7b341a11a874.jpg', 3, NULL, 'USER', 0, '2020-05-09 14:16:26', 2);
INSERT INTO `u_users` VALUES (9, 'jimmychow@126.com', '$2a$10$Z9WG89XtWNQV9shxBY2Gn.wczMxEw3pVApPapJgRL53pmt86dQqXK', '135859945512', 'jimmychow@126.com', '186fc545-7a78-4a5e-b358-7b341a11a874.jpg', 3, NULL, 'USER', 0, '2020-05-09 15:07:28', 2);
INSERT INTO `u_users` VALUES (10, '222@qq.com', '$2a$10$HsIXtjAz/Sy0FT.oe16KhuQEEoPvII0kHCjDitJWPUuKt2Vmq2Gp.', '13110202021', '222@qq.com', '186fc545-7a78-4a5e-b358-7b341a11a874.jpg', 3, NULL, 'USER', 0, '2020-05-09 18:49:16', 2);

SET FOREIGN_KEY_CHECKS = 1;
