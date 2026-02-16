/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : asiapest

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 16/02/2026 22:19:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access_log
-- ----------------------------
DROP TABLE IF EXISTS `access_log`;
CREATE TABLE `access_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of access_log
-- ----------------------------
INSERT INTO `access_log` VALUES (1, NULL, '::1', '/contracts', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:41:25');
INSERT INTO `access_log` VALUES (2, NULL, '::1', '/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:41:25');
INSERT INTO `access_log` VALUES (3, NULL, '::1', '/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:41:38');
INSERT INTO `access_log` VALUES (4, 15, '::1', '/dashboard', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:41:38');
INSERT INTO `access_log` VALUES (5, 15, '::1', '/contracts', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:41:43');
INSERT INTO `access_log` VALUES (6, 15, '::1', '/contracts/timeline/11', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:41:46');
INSERT INTO `access_log` VALUES (7, NULL, '::1', '/contracts/timeline/11', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:24');
INSERT INTO `access_log` VALUES (8, NULL, '::1', '/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:24');
INSERT INTO `access_log` VALUES (9, NULL, '::1', '/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:25');
INSERT INTO `access_log` VALUES (10, 15, '::1', '/dashboard', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:25');
INSERT INTO `access_log` VALUES (11, 15, '::1', '/logs/access', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:31');
INSERT INTO `access_log` VALUES (12, 15, '::1', '/logs/action', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:37');
INSERT INTO `access_log` VALUES (13, 15, '::1', '/warehouses', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:43');
INSERT INTO `access_log` VALUES (14, 15, '::1', '/warehouses/edit/1', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:51');
INSERT INTO `access_log` VALUES (15, 15, '::1', '/warehouses', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:52');
INSERT INTO `access_log` VALUES (16, 15, '::1', '/logs/action', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:56');
INSERT INTO `access_log` VALUES (17, 15, '::1', '/logs/action', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:45:58');
INSERT INTO `access_log` VALUES (18, 15, '::1', '/warehouses', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:46:09');
INSERT INTO `access_log` VALUES (19, 15, '::1', '/logs/action', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:46:53');
INSERT INTO `access_log` VALUES (20, NULL, '::1', '/logs/action', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:49:37');
INSERT INTO `access_log` VALUES (21, NULL, '::1', '/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:49:37');
INSERT INTO `access_log` VALUES (22, NULL, '::1', '/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:49:39');
INSERT INTO `access_log` VALUES (23, 15, '::1', '/dashboard', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:49:39');
INSERT INTO `access_log` VALUES (24, 15, '::1', '/warehouses', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:49:45');
INSERT INTO `access_log` VALUES (25, 15, '::1', '/warehouses/edit/1', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:49:50');
INSERT INTO `access_log` VALUES (26, 15, '::1', '/warehouses', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:49:50');
INSERT INTO `access_log` VALUES (27, 15, '::1', '/logs/action', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 14:49:54');
INSERT INTO `access_log` VALUES (28, NULL, '::1', '/import-master', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:11:49');
INSERT INTO `access_log` VALUES (29, NULL, '::1', '/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:11:49');
INSERT INTO `access_log` VALUES (30, NULL, '::1', '/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:11:51');
INSERT INTO `access_log` VALUES (31, 15, '::1', '/dashboard', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:11:51');
INSERT INTO `access_log` VALUES (32, 15, '::1', '/dashboard/find-event', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:11:55');
INSERT INTO `access_log` VALUES (33, 15, '::1', '/import-master', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:12:07');
INSERT INTO `access_log` VALUES (34, NULL, '::1', '/import-master', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:16:03');
INSERT INTO `access_log` VALUES (35, NULL, '::1', '/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:16:03');
INSERT INTO `access_log` VALUES (36, NULL, '::1', '/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:16:05');
INSERT INTO `access_log` VALUES (37, 15, '::1', '/dashboard', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:16:05');
INSERT INTO `access_log` VALUES (38, 15, '::1', '/import-master', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:16:08');
INSERT INTO `access_log` VALUES (39, 15, '::1', '/import-master/export-product-pattern', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:16:12');
INSERT INTO `access_log` VALUES (40, 15, '::1', '/reports/stock-movement', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:20:32');
INSERT INTO `access_log` VALUES (41, 15, '::1', '/quotations', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:20:39');
INSERT INTO `access_log` VALUES (42, 15, '::1', '/contracts', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:20:41');
INSERT INTO `access_log` VALUES (43, 15, '::1', '/contracts/timeline/11', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:20:44');
INSERT INTO `access_log` VALUES (44, 15, '::1', '/job-cards', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:20:56');
INSERT INTO `access_log` VALUES (45, 15, '::1', '/job-cards/edit/6', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 15:21:00');
INSERT INTO `access_log` VALUES (46, NULL, '::1', '/', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:32:55');
INSERT INTO `access_log` VALUES (47, NULL, '::1', '/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:32:55');
INSERT INTO `access_log` VALUES (48, NULL, '::1', '/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:32:57');
INSERT INTO `access_log` VALUES (49, 15, '::1', '/dashboard', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:32:57');
INSERT INTO `access_log` VALUES (50, 15, '::1', '/logs/action', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:33:22');
INSERT INTO `access_log` VALUES (51, 15, '::1', '/user-groups', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:33:24');
INSERT INTO `access_log` VALUES (52, 15, '::1', '/car-types', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:33:26');
INSERT INTO `access_log` VALUES (53, 15, '::1', '/positions', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:33:34');
INSERT INTO `access_log` VALUES (54, NULL, '::1', '/positions', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:35:45');
INSERT INTO `access_log` VALUES (55, NULL, '::1', '/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:35:45');
INSERT INTO `access_log` VALUES (56, NULL, '::1', '/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:35:47');
INSERT INTO `access_log` VALUES (57, 15, '::1', '/dashboard', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:35:47');
INSERT INTO `access_log` VALUES (58, 15, '::1', '/logout', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:35:52');
INSERT INTO `access_log` VALUES (59, NULL, '::1', '/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:35:52');
INSERT INTO `access_log` VALUES (60, NULL, '::1', '/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:35:54');
INSERT INTO `access_log` VALUES (61, 15, '::1', '/dashboard', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:35:54');
INSERT INTO `access_log` VALUES (62, 15, '::1', '/dashboard/find-event', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:36:03');
INSERT INTO `access_log` VALUES (63, NULL, '::1', '/import-master', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:38:55');
INSERT INTO `access_log` VALUES (64, NULL, '::1', '/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:38:55');
INSERT INTO `access_log` VALUES (65, NULL, '::1', '/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:38:57');
INSERT INTO `access_log` VALUES (66, 15, '::1', '/dashboard', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:38:57');
INSERT INTO `access_log` VALUES (67, 15, '::1', '/dashboard/find-event', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:39:00');
INSERT INTO `access_log` VALUES (68, 15, '::1', '/dashboard/find-event', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:39:06');
INSERT INTO `access_log` VALUES (69, 15, '::1', '/dashboard/find-event', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:39:10');
INSERT INTO `access_log` VALUES (70, 15, '::ffff:127.0.0.1', '/backup', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:39:26');
INSERT INTO `access_log` VALUES (71, 15, '::ffff:127.0.0.1', '/backup/run', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:39:37');
INSERT INTO `access_log` VALUES (72, 15, '::ffff:127.0.0.1', '/backup?error=%E0%B9%80%E0%B8%81%E0%B8%B4%E0%B8%94%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%9C%E0%B8%B4%E0%B8%94%E0%B8%9E%E0%B8%A5%E0%B8%B2%E0%B8%94%E0%B9%83%E0%B8%99%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:39:37');
INSERT INTO `access_log` VALUES (73, 15, '::1', '/backup/settings', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:42:49');
INSERT INTO `access_log` VALUES (74, 15, '::1', '/backup?msg=%E0%B8%9A%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%B6%E0%B8%81%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%95%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B3%E0%B9%80%E0%B8%A3%E0%B9%87%E0%B8%88', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:42:49');
INSERT INTO `access_log` VALUES (75, 15, '::1', '/backup/settings', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:42:56');
INSERT INTO `access_log` VALUES (76, 15, '::1', '/backup?msg=%E0%B8%9A%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%B6%E0%B8%81%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%95%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B3%E0%B9%80%E0%B8%A3%E0%B9%87%E0%B8%88', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:42:56');
INSERT INTO `access_log` VALUES (77, NULL, '::1', '/backup/delete/backup_asiapest_1770802777.sql', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:44:09');
INSERT INTO `access_log` VALUES (78, NULL, '::1', '/login', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:44:09');
INSERT INTO `access_log` VALUES (79, NULL, '::1', '/login', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:44:10');
INSERT INTO `access_log` VALUES (80, 15, '::1', '/dashboard', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:44:10');
INSERT INTO `access_log` VALUES (81, 15, '::1', '/backup', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:44:16');
INSERT INTO `access_log` VALUES (82, 15, '::1', '/backup/delete/backup_asiapest_1770802777.sql', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:44:18');
INSERT INTO `access_log` VALUES (83, 15, '::1', '/backup?msg=%E0%B8%A5%E0%B8%9A%E0%B9%84%E0%B8%9F%E0%B8%A5%E0%B9%8C%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%9A%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A2', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:44:18');
INSERT INTO `access_log` VALUES (84, 15, '::1', '/backup/run', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:44:35');
INSERT INTO `access_log` VALUES (85, 15, '::1', '/backup?msg=%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%AA%E0%B9%88%E0%B8%87%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B9%84%E0%B8%9B%E0%B8%A2%E0%B8%B1%E0%B8%87%20NAS%20%E0%B9%81', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:44:39');
INSERT INTO `access_log` VALUES (86, 15, '::1', '/backup/settings', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:45:22');
INSERT INTO `access_log` VALUES (87, 15, '::1', '/backup?msg=%E0%B8%9A%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%B6%E0%B8%81%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%95%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B3%E0%B9%80%E0%B8%A3%E0%B9%87%E0%B8%88', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:45:22');
INSERT INTO `access_log` VALUES (88, 15, '::1', '/backup/delete/backup_asiapest_1770803100.sql', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:45:30');
INSERT INTO `access_log` VALUES (89, 15, '::1', '/backup?msg=%E0%B8%A5%E0%B8%9A%E0%B9%84%E0%B8%9F%E0%B8%A5%E0%B9%8C%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%9A%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A2', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:45:30');
INSERT INTO `access_log` VALUES (90, 15, '::1', '/backup/delete/backup_asiapest_1770803075.sql', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:45:32');
INSERT INTO `access_log` VALUES (91, 15, '::1', '/backup?msg=%E0%B8%A5%E0%B8%9A%E0%B9%84%E0%B8%9F%E0%B8%A5%E0%B9%8C%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%9A%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A2', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:45:32');
INSERT INTO `access_log` VALUES (92, 15, '::1', '/backup/settings', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:47:35');
INSERT INTO `access_log` VALUES (93, 15, '::1', '/backup?msg=%E0%B8%9A%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%B6%E0%B8%81%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%95%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B3%E0%B9%80%E0%B8%A3%E0%B9%87%E0%B8%88', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:47:35');
INSERT INTO `access_log` VALUES (94, 15, '::1', '/backup/delete/backup_asiapest_1770803220.sql', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:47:39');
INSERT INTO `access_log` VALUES (95, 15, '::1', '/backup?msg=%E0%B8%A5%E0%B8%9A%E0%B9%84%E0%B8%9F%E0%B8%A5%E0%B9%8C%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%9A%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A2', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:47:39');
INSERT INTO `access_log` VALUES (96, 15, '::1', '/backup/run', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:47:41');
INSERT INTO `access_log` VALUES (97, 15, '::1', '/backup?msg=%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%AA%E0%B9%88%E0%B8%87%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B9%84%E0%B8%9B%E0%B8%A2%E0%B8%B1%E0%B8%87%20NAS%20%E0%B9%81', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:47:41');
INSERT INTO `access_log` VALUES (98, 15, '::1', '/backup/settings', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:49:06');
INSERT INTO `access_log` VALUES (99, 15, '::1', '/backup?msg=%E0%B8%9A%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%B6%E0%B8%81%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%95%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B3%E0%B9%80%E0%B8%A3%E0%B9%87%E0%B8%88', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:49:06');
INSERT INTO `access_log` VALUES (100, 15, '::1', '/backup/delete/backup_asiapest_1770803261.sql', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:49:09');
INSERT INTO `access_log` VALUES (101, 15, '::1', '/backup?msg=%E0%B8%A5%E0%B8%9A%E0%B9%84%E0%B8%9F%E0%B8%A5%E0%B9%8C%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%9A%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A2', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:49:09');
INSERT INTO `access_log` VALUES (102, 15, '::1', '/backup/run', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:49:10');
INSERT INTO `access_log` VALUES (103, 15, '::1', '/backup?msg=%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%AA%E0%B9%88%E0%B8%87%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B9%84%E0%B8%9B%E0%B8%A2%E0%B8%B1%E0%B8%87%20NAS%20%E0%B9%81', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:49:11');
INSERT INTO `access_log` VALUES (104, 15, '::1', '/backup/settings', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:50:59');
INSERT INTO `access_log` VALUES (105, 15, '::1', '/backup?msg=%E0%B8%9A%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%B6%E0%B8%81%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%95%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B3%E0%B9%80%E0%B8%A3%E0%B9%87%E0%B8%88', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:50:59');
INSERT INTO `access_log` VALUES (106, 15, '::1', '/backup/run', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:51:03');
INSERT INTO `access_log` VALUES (107, 15, '::1', '/backup?msg=%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%AA%E0%B9%88%E0%B8%87%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B9%84%E0%B8%9B%E0%B8%A2%E0%B8%B1%E0%B8%87%20NAS%20%E0%B9%81', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:51:04');
INSERT INTO `access_log` VALUES (108, 15, '::1', '/backup/run', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:04');
INSERT INTO `access_log` VALUES (109, 15, '::1', '/backup?msg=%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%AA%E0%B9%88%E0%B8%87%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B9%84%E0%B8%9B%E0%B8%A2%E0%B8%B1%E0%B8%87%20NAS%20%E0%B9%81', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:06');
INSERT INTO `access_log` VALUES (110, 15, '::1', '/backup/settings', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:14');
INSERT INTO `access_log` VALUES (111, 15, '::1', '/backup?msg=%E0%B8%9A%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%B6%E0%B8%81%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%95%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B3%E0%B9%80%E0%B8%A3%E0%B9%87%E0%B8%88', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:14');
INSERT INTO `access_log` VALUES (112, 15, '::1', '/backup/delete/backup_asiapest_1770803584.sql', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:17');
INSERT INTO `access_log` VALUES (113, 15, '::1', '/backup?msg=%E0%B8%A5%E0%B8%9A%E0%B9%84%E0%B8%9F%E0%B8%A5%E0%B9%8C%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%9A%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A2', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:17');
INSERT INTO `access_log` VALUES (114, 15, '::1', '/backup/delete/backup_asiapest_1770803463.sql', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:19');
INSERT INTO `access_log` VALUES (115, 15, '::1', '/backup?msg=%E0%B8%A5%E0%B8%9A%E0%B9%84%E0%B8%9F%E0%B8%A5%E0%B9%8C%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%9A%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A2', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:19');
INSERT INTO `access_log` VALUES (116, 15, '::1', '/backup/delete/backup_asiapest_1770803350.sql', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:21');
INSERT INTO `access_log` VALUES (117, 15, '::1', '/backup?msg=%E0%B8%A5%E0%B8%9A%E0%B9%84%E0%B8%9F%E0%B8%A5%E0%B9%8C%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%9A%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%A2', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:21');
INSERT INTO `access_log` VALUES (118, 15, '::1', '/backup/run', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:22');
INSERT INTO `access_log` VALUES (119, 15, '::1', '/backup?msg=%E0%B8%AA%E0%B8%B3%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%AA%E0%B9%88%E0%B8%87%E0%B8%AD%E0%B8%AD%E0%B8%81%E0%B9%84%E0%B8%9B%E0%B8%A2%E0%B8%B1%E0%B8%87%20NAS%20%E0%B9%81', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:23');
INSERT INTO `access_log` VALUES (120, 15, '::1', '/backup/settings', 'POST', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:57');
INSERT INTO `access_log` VALUES (121, 15, '::1', '/backup?msg=%E0%B8%9A%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%B6%E0%B8%81%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%95%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B3%E0%B9%80%E0%B8%A3%E0%B9%87%E0%B8%88', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:53:57');
INSERT INTO `access_log` VALUES (122, 15, '::1', '/backup?msg=%E0%B8%9A%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%B6%E0%B8%81%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%95%E0%B8%B1%E0%B9%89%E0%B8%87%E0%B8%84%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B3%E0%B9%80%E0%B8%A3%E0%B9%87%E0%B8%88', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:56:41');
INSERT INTO `access_log` VALUES (123, 15, '::1', '/tasks', 'GET', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', '2026-02-11 16:57:43');

-- ----------------------------
-- Table structure for action_log
-- ----------------------------
DROP TABLE IF EXISTS `action_log`;
CREATE TABLE `action_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `row_id` int NULL DEFAULT NULL,
  `data_before` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `data_after` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of action_log
-- ----------------------------
INSERT INTO `action_log` VALUES (1, 15, 'UPDATE', 'warehouse', 1, '{\"id\":1,\"code\":\"A5\",\"name\":\"A5\",\"description\":\"คลังทดสอบ\",\"photo\":\"\",\"status\":1,\"created_at\":1621782643,\"updated_at\":1770795952,\"created_by\":1,\"updated_by\":15}', '{\"code\":\"A5\",\"name\":\"A5\",\"description\":\"คลังทดสอบ2\"}', '::1', '2026-02-11 14:49:50');

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment`  (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`item_name`, `user_id`) USING BTREE,
  INDEX `idx-auth_assignment-user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('System Administrator', '12', 1654236883);

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `data` blob NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  INDEX `rule_name`(`rule_name` ASC) USING BTREE,
  INDEX `idx-auth_item-type`(`type` ASC) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('Academic', 1, 'งานวิชาการ รับข้อร้องเรียน รายละเอียดการจัดงาน รายละเอียดลูกค้า', NULL, NULL, 1651052314, 1651052630);
INSERT INTO `auth_item` VALUES ('Account', 1, 'ออกสัญญา การ์ดงาน ใบงาน วางบิล รับเช็ค / ผู้ขาย / จัดซื้อ / ภาษี', NULL, NULL, 1651052459, 1651052895);
INSERT INTO `auth_item` VALUES ('Admin service', 1, 'เช็คสต็อค เบิกสินค้า จัดงาน', NULL, NULL, 1651052527, 1651052527);
INSERT INTO `auth_item` VALUES ('authitem/create', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('authitem/delete', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('authitem/index', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('authitem/initpermission', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('authitem/managerule', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('authitem/test', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('authitem/update', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('authitem/view', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('calendarevent/create', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('calendarevent/delete', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('calendarevent/index', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('calendarevent/update', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('calendarevent/view', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('car/create', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('car/delete', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('car/deletephoto', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('car/index', 2, '', NULL, NULL, 1651015840, NULL);
INSERT INTO `auth_item` VALUES ('car/update', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('car/view', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('cartype/create', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('cartype/delete', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('cartype/index', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('cartype/update', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('cartype/view', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('company/create', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('company/delete', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('company/deletephoto', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('company/index', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('company/update', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('company/view', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('complain/create', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('complain/delete', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('complain/index', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('complain/update', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('complain/view', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('contract/create', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('contract/createplan', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('contract/delete', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('contract/index', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('contract/print', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('contract/update', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('contract/view', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('customer/create', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('customer/delete', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('customer/deletephoto', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('customer/index', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('customer/update', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('customer/view', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('customergroup/create', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('customergroup/delete', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('customergroup/index', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('customergroup/update', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('customergroup/view', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('customertype/create', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('customertype/delete', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('customertype/index', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('customertype/update', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('customertype/view', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('dbbackup/backuplist', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('dbbackup/bak', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('dbbackup/deletebak', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('dbbackup/downloadbak', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('dbbackup/exrestore', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('dbbackup/index', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('dbbackup/restoredb', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('dbbackup/restorepage', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('dbrestore/backuplist', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('dbrestore/bak', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('dbrestore/deletebak', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('dbrestore/downloadbak', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('dbrestore/exrestore', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('dbrestore/index', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('dbrestore/restoredb', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('dbrestore/restorepage', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('employee/create', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('employee/delete', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('employee/deletephoto', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('employee/index', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('employee/update', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('employee/view', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('estimatecomp/create', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('estimatecomp/delete', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('estimatecomp/index', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('estimatecomp/update', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('estimatecomp/view', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('estimateprice/approve', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('estimateprice/confirmtoservice', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('estimateprice/create', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('estimateprice/delete', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('estimateprice/index', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('estimateprice/update', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('estimateprice/view', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('jobcard/create', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('jobcard/delete', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('jobcard/index', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('jobcard/print', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('jobcard/update', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('jobcard/view', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('journalissue/confirmissue', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('journalissue/create', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('journalissue/delete', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('journalissue/index', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('journalissue/update', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('journalissue/view', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('location/create', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('location/delete', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('location/index', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('location/update', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('location/view', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('Office', 1, 'พนักงานสำนักงาน', NULL, NULL, 1651016112, 1651016112);
INSERT INTO `auth_item` VALUES ('paymentmethod/create', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('paymentmethod/delete', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('paymentmethod/index', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('paymentmethod/update', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('paymentmethod/view', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('paymentterm/create', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('paymentterm/delete', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('paymentterm/index', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('paymentterm/update', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('paymentterm/view', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('position/create', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('position/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('position/index', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('position/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('position/view', 2, '', NULL, NULL, 1651015841, NULL);
INSERT INTO `auth_item` VALUES ('product/create', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/delete', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/deleteline', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/deletephoto', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/export', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/findproductprice', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/importproduct', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/index', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/printdoc', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/productdata', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/productdata2', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/stockcount', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('product/update', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('product/view', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('productgroup/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('productgroup/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('productgroup/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('productgroup/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('productgroup/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('producttype/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('producttype/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('producttype/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('producttype/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('producttype/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('purch/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('purch/delete', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purch/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('purch/printpo', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purch/purchreceive', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purch/savereceive', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purch/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('purch/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('purchreq/approve', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purchreq/convertpo', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purchreq/create', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purchreq/delete', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purchreq/index', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purchreq/printpr', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purchreq/printprscreen', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('purchreq/testthai', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purchreq/update', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purchreq/view', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('purchreqapprove/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('purchreqapprove/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('purchreqapprove/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('purchreqforapprove/delete', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('purchreqforapprove/index', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('purchreqforapprove/view', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('quotation/approve', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('quotation/create', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('quotation/createcontract', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('quotation/createjob', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('quotation/createjobsave', 2, '', NULL, NULL, 1651015845, NULL);
INSERT INTO `auth_item` VALUES ('quotation/createplan', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('quotation/delete', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('quotation/gettaskmethod', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('quotation/gettaskmethoddetail', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('quotation/index', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('quotation/print', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('quotation/printjob', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('quotation/printquotation', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('quotation/update', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('quotation/view', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('Sale', 1, 'งานขาย สร้างลูกค้า ประเมินราคา ออกใบเสนอราคา และแก้ไข', NULL, NULL, 1651052250, 1651052250);
INSERT INTO `auth_item` VALUES ('serviceorder/create', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('serviceorder/createissue', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('serviceorder/delete', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('serviceorder/index', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('serviceorder/update', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('serviceorder/view', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('serviceplan/create', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('serviceplan/createissue', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('serviceplan/delete', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('serviceplan/index', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('serviceplan/update', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('serviceplan/view', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('servicetype/create', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('servicetype/delete', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('servicetype/index', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('servicetype/update', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('servicetype/view', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('site/', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/apilogin', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/changepassword', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/createadmin', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/findevent', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/forgetpassword', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/grab', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/index', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/login', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/logout', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/requestpasswordreset', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/resendverificationemail', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/resetpassword', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/s', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('site/verifyemail', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('standardprice/create', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('standardprice/delete', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('standardprice/index', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('standardprice/update', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('standardprice/view', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('stockcount/create', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('stockcount/delete', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('stockcount/index', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('stockcount/print', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('stockcount/update', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('stockcount/view', 2, '', NULL, NULL, 1652928966, NULL);
INSERT INTO `auth_item` VALUES ('stocksum/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('stocksum/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('stocksum/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('stocksum/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('stocksum/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('stocktrans/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('stocktrans/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('stocktrans/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('stocktrans/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('stocktrans/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('System Administrator', 1, 'ผู้ดูแลระบบ', NULL, NULL, 1651016130, 1652928990);
INSERT INTO `auth_item` VALUES ('task/create', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('task/delete', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('task/index', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('task/update', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('task/view', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('Team leader', 1, 'ตรวจเช็คคิวงาน เริ่มและจบงาน', NULL, NULL, 1651052588, 1651052588);
INSERT INTO `auth_item` VALUES ('unit/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('unit/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('unit/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('unit/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('unit/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('user/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('user/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('user/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('user/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('user/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('usergroup/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('usergroup/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('usergroup/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('usergroup/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('usergroup/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('utility/importcustomer', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('utility/importproduct', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('utility/importvendor', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('utility/index', 2, '', NULL, NULL, 1651015844, NULL);
INSERT INTO `auth_item` VALUES ('vendor/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('vendor/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('vendor/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('vendor/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('vendor/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('vendorgroup/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('vendorgroup/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('vendorgroup/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('vendorgroup/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('vendorgroup/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('warehouse/create', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('warehouse/delete', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('warehouse/findbranch', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('warehouse/index', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('warehouse/update', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('warehouse/view', 2, '', NULL, NULL, 1651015842, NULL);
INSERT INTO `auth_item` VALUES ('worktask/create', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('worktask/delete', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('worktask/index', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('worktask/update', 2, '', NULL, NULL, 1651015843, NULL);
INSERT INTO `auth_item` VALUES ('worktask/view', 2, '', NULL, NULL, 1651015843, NULL);

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child`  (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`, `child`) USING BTREE,
  INDEX `child`(`child` ASC) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('Academic', 'complain/create');
INSERT INTO `auth_item_child` VALUES ('Academic', 'complain/delete');
INSERT INTO `auth_item_child` VALUES ('Academic', 'complain/index');
INSERT INTO `auth_item_child` VALUES ('Academic', 'complain/update');
INSERT INTO `auth_item_child` VALUES ('Academic', 'complain/view');
INSERT INTO `auth_item_child` VALUES ('Academic', 'customer/index');
INSERT INTO `auth_item_child` VALUES ('Academic', 'customer/view');
INSERT INTO `auth_item_child` VALUES ('Account', 'customer/create');
INSERT INTO `auth_item_child` VALUES ('Account', 'customer/delete');
INSERT INTO `auth_item_child` VALUES ('Account', 'customer/deletephoto');
INSERT INTO `auth_item_child` VALUES ('Account', 'customer/index');
INSERT INTO `auth_item_child` VALUES ('Account', 'customer/update');
INSERT INTO `auth_item_child` VALUES ('Account', 'customer/view');
INSERT INTO `auth_item_child` VALUES ('Account', 'customergroup/create');
INSERT INTO `auth_item_child` VALUES ('Account', 'customergroup/delete');
INSERT INTO `auth_item_child` VALUES ('Account', 'customergroup/index');
INSERT INTO `auth_item_child` VALUES ('Account', 'customergroup/update');
INSERT INTO `auth_item_child` VALUES ('Account', 'customergroup/view');
INSERT INTO `auth_item_child` VALUES ('Account', 'purch/create');
INSERT INTO `auth_item_child` VALUES ('Account', 'purch/delete');
INSERT INTO `auth_item_child` VALUES ('Account', 'purch/index');
INSERT INTO `auth_item_child` VALUES ('Account', 'purch/printpo');
INSERT INTO `auth_item_child` VALUES ('Account', 'purch/purchreceive');
INSERT INTO `auth_item_child` VALUES ('Account', 'purch/savereceive');
INSERT INTO `auth_item_child` VALUES ('Account', 'purch/update');
INSERT INTO `auth_item_child` VALUES ('Account', 'purch/view');
INSERT INTO `auth_item_child` VALUES ('Office', 'product/create');
INSERT INTO `auth_item_child` VALUES ('Office', 'product/delete');
INSERT INTO `auth_item_child` VALUES ('Office', 'product/deleteline');
INSERT INTO `auth_item_child` VALUES ('Office', 'product/deletephoto');
INSERT INTO `auth_item_child` VALUES ('Office', 'product/index');
INSERT INTO `auth_item_child` VALUES ('Office', 'product/update');
INSERT INTO `auth_item_child` VALUES ('Office', 'product/view');
INSERT INTO `auth_item_child` VALUES ('Office', 'productgroup/create');
INSERT INTO `auth_item_child` VALUES ('Office', 'productgroup/delete');
INSERT INTO `auth_item_child` VALUES ('Office', 'vendor/create');
INSERT INTO `auth_item_child` VALUES ('Office', 'vendor/index');
INSERT INTO `auth_item_child` VALUES ('Office', 'vendor/update');
INSERT INTO `auth_item_child` VALUES ('Office', 'vendor/view');
INSERT INTO `auth_item_child` VALUES ('Office', 'vendorgroup/create');
INSERT INTO `auth_item_child` VALUES ('Office', 'vendorgroup/delete');
INSERT INTO `auth_item_child` VALUES ('Office', 'vendorgroup/index');
INSERT INTO `auth_item_child` VALUES ('Office', 'vendorgroup/update');
INSERT INTO `auth_item_child` VALUES ('Office', 'vendorgroup/view');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'authitem/create');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'authitem/delete');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'authitem/index');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'authitem/update');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'authitem/view');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'estimateprice/approve');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'Office');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'user/create');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'user/delete');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'user/index');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'user/update');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'user/view');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'usergroup/create');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'usergroup/delete');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'usergroup/index');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'usergroup/update');
INSERT INTO `auth_item_child` VALUES ('System Administrator', 'usergroup/view');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule`  (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` blob NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for bom
-- ----------------------------
DROP TABLE IF EXISTS `bom`;
CREATE TABLE `bom`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bom_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bom_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `is_approved` int NULL DEFAULT NULL,
  `is_activated` int NULL DEFAULT NULL,
  `approved_by` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bom
-- ----------------------------

-- ----------------------------
-- Table structure for bom_line
-- ----------------------------
DROP TABLE IF EXISTS `bom_line`;
CREATE TABLE `bom_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `bom_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bom_line
-- ----------------------------

-- ----------------------------
-- Table structure for calendar_event
-- ----------------------------
DROP TABLE IF EXISTS `calendar_event`;
CREATE TABLE `calendar_event`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_ref_id` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start` datetime NULL DEFAULT NULL,
  `backgroundColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `textColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `crated_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of calendar_event
-- ----------------------------
INSERT INTO `calendar_event` VALUES (1, 6, 'CT-2200004', '2022-05-21 00:00:00', 'green', 'white', 11, NULL, 1652948173, NULL, 1652948173, NULL);
INSERT INTO `calendar_event` VALUES (2, 7, 'CT-2200005', '2022-05-24 00:00:00', 'green', 'white', 24, NULL, 1652955004, NULL, 1652955004, NULL);
INSERT INTO `calendar_event` VALUES (3, 7, 'CT-2200005', '2022-06-15 00:00:00', 'green', 'white', 60, NULL, 1653028746, NULL, 1653028746, NULL);
INSERT INTO `calendar_event` VALUES (4, 10, 'CT-2200004', '2022-06-10 00:00:00', 'green', 'white', 96, NULL, 1654240556, NULL, 1654240556, NULL);
INSERT INTO `calendar_event` VALUES (5, 10, 'CT-2200004', '2022-06-13 00:00:00', 'green', 'white', 95, NULL, 1654255124, NULL, 1654255124, NULL);
INSERT INTO `calendar_event` VALUES (6, 10, 'CT-2200004', '2022-06-13 00:00:00', 'green', 'white', 95, NULL, 1654255639, NULL, 1654255639, NULL);
INSERT INTO `calendar_event` VALUES (7, NULL, 'vcccc', '2022-07-06 23:33:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `calendar_event` VALUES (8, NULL, 'dfdfdffd', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `calendar_event` VALUES (9, NULL, 'dfdsss', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `calendar_event` VALUES (10, NULL, 'bb', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `calendar_event` VALUES (11, NULL, 'xxx', '0000-00-00 00:00:00', NULL, 'blue', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `calendar_event` VALUES (12, NULL, 'dffd', '1970-01-01 00:00:00', 'yellow', 'blue', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `calendar_event` VALUES (13, NULL, 'dfffdfd', '2022-07-14 00:00:00', 'yellow', 'blue', NULL, 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `car_group_id` int NULL DEFAULT NULL,
  `plate_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `car_type_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES (1, '04', 'REVO ( ทีม 3 )', 'โตโยต้า สีขาว', NULL, '1ฒต - 7859', '', 1, 1622867321, 1, 1653008802, 11, 1);
INSERT INTO `car` VALUES (2, '01', 'NAVARA ( ทีม 2 )', 'รถยี่ห้อนิสสัน ', NULL, '1ฒย 987 กทม.', '', 1, 1622868172, 1, 1653008786, 11, 1);
INSERT INTO `car` VALUES (3, '02', 'VIGO CHAMP ( ส่วนกลาง )', 'โตโยต้า สีขาว', NULL, '1ฒท 9091 กทม', '', 1, 1622868223, 1, 1653008822, 11, 1);
INSERT INTO `car` VALUES (4, '03', 'REVO ( ทีม 1 )', 'รถยี่ห้อโตโยต้า สีขาว', NULL, '3ฒฆ - 7438 กทม.', '', 1, 1622868286, 1, 1653008765, 11, 1);

-- ----------------------------
-- Table structure for car_group
-- ----------------------------
DROP TABLE IF EXISTS `car_group`;
CREATE TABLE `car_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of car_group
-- ----------------------------

-- ----------------------------
-- Table structure for car_type
-- ----------------------------
DROP TABLE IF EXISTS `car_type`;
CREATE TABLE `car_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of car_type
-- ----------------------------
INSERT INTO `car_type` VALUES (1, '01', 'รถบริการ', 'รถยนต์ของบริษัท ใช้สำหรับเดินทางไปให้บริการลูกค้า', 1, 1622865086, 1622865086, 1, NULL);
INSERT INTO `car_type` VALUES (2, '02', 'รถยนต์ส่วนกลาง', 'รถยนต์สำหรับวิ่งงานทั่วไป หรือใช้ในงานของสำนักงาน', 1, 1622865158, 1622865158, 1, NULL);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eng_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tax_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_head` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, 'Asiapest Co.Ltd', 'เอเชียเพส จำกัด', NULL, '', '121212121', NULL, 1638279693, 1, 1770713370, 15, '001', 1, '', '0999999', '');

-- ----------------------------
-- Table structure for complain
-- ----------------------------
DROP TABLE IF EXISTS `complain`;
CREATE TABLE `complain`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `complain_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `complain_date` datetime NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `problem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `problem_cause` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taken_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of complain
-- ----------------------------
INSERT INTO `complain` VALUES (1, 'CP-2200001', '2022-01-06 00:00:00', 2, 'g', 1, 1654005181, NULL, 1654005181, NULL, 'dd', 'dd', 'ff');
INSERT INTO `complain` VALUES (2, 'CP-2200002', '2021-03-10 00:00:00', 1, 'g', 1, 1654005280, NULL, 1654005280, NULL, 'kkjj', 'hhhh', 'dd');
INSERT INTO `complain` VALUES (3, 'CP-2200003', '2020-07-15 00:00:00', 1, 'kk', 1, 1654005383, NULL, 1654005383, NULL, 'jkjk', 'gfgf', 'ddsds');
INSERT INTO `complain` VALUES (4, 'CP-2200004', '2021-02-26 00:00:00', 2, 'asada', 1, 1654007387, NULL, 1654007387, NULL, 'asa', 'dsa', 'ghhf');
INSERT INTO `complain` VALUES (5, 'CP-2200005', '2021-02-24 00:00:00', 2, 'gfgf', 1, 1654007453, NULL, 1654008636, NULL, 'hjhjh', 'lo', 'jhhj');
INSERT INTO `complain` VALUES (6, 'CP-2200006', '2022-05-01 00:00:00', 1, 'asada', 1, 1654008763, NULL, 1654009551, NULL, 'hh', 'jj', 'g');
INSERT INTO `complain` VALUES (7, 'CP-2200007', '2022-06-01 00:00:00', 2, 'lokloldp', 1, 1654068037, 1, 1654068037, NULL, 'df', 'ggg', 'kodhu');
INSERT INTO `complain` VALUES (8, 'CP-2200008', '2022-06-01 00:00:00', 1, 'hello', 1, 1654068278, 1, 1654068278, NULL, 'ddddsss', 'sds', 'az');
INSERT INTO `complain` VALUES (9, 'CP-2200009', '2022-06-01 00:00:00', 1, 'sawasdee', 1, 1654068396, 1, 1654068396, NULL, 'fd', '.dlsfkdj', 'dfdf');
INSERT INTO `complain` VALUES (10, 'CP-2200010', '2022-06-01 00:00:00', 2, 'vvvvvvvvv', 1, 1654069939, 1, 1654071858, 1, 'bbbbbbbbbb', 'nnn', 'dds');
INSERT INTO `complain` VALUES (11, 'CP-2200011', '2022-06-01 00:00:00', 1, 'cxc', 1, 1654091145, 1, 1654091145, NULL, 'vcvf', 'gfg', 'gf');
INSERT INTO `complain` VALUES (12, 'CP-2200012', '2022-05-31 00:00:00', 1, 'asada', 2, 1654091378, 1, 1654098460, NULL, 'cxcx', 'vcvcv', 'bvbhv');
INSERT INTO `complain` VALUES (13, 'CP-2200013', '2022-06-01 00:00:00', 2, 'dsdsf', 1, 1654156538, 1, 1654161679, 1, 'gggg', 'qqq', 'aa');
INSERT INTO `complain` VALUES (14, 'CP-2200014', '2022-06-11 00:00:00', 4, 'มีปลวก', 1, 1654240679, 1, 1654241877, 1, 'ปลวกขึ้น', 'ไม่หมด', 'เข้าซ้ำ');

-- ----------------------------
-- Table structure for complain_service_order
-- ----------------------------
DROP TABLE IF EXISTS `complain_service_order`;
CREATE TABLE `complain_service_order`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_date` datetime NULL DEFAULT NULL,
  `complain_id` int NULL DEFAULT NULL,
  `assign_user_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of complain_service_order
-- ----------------------------

-- ----------------------------
-- Table structure for complain_service_order_line
-- ----------------------------
DROP TABLE IF EXISTS `complain_service_order_line`;
CREATE TABLE `complain_service_order_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `com_service_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of complain_service_order_line
-- ----------------------------

-- ----------------------------
-- Table structure for complain_track
-- ----------------------------
DROP TABLE IF EXISTS `complain_track`;
CREATE TABLE `complain_track`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `complain_id` int NULL DEFAULT NULL,
  `track_date` datetime NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of complain_track
-- ----------------------------
INSERT INTO `complain_track` VALUES (1, 12, '2022-06-01 00:00:00', 'dddddf', NULL, NULL, NULL, NULL);
INSERT INTO `complain_track` VALUES (2, 12, '2022-06-01 00:00:00', 'lll', NULL, NULL, NULL, NULL);
INSERT INTO `complain_track` VALUES (3, 12, '2022-06-01 00:00:00', 'ooooo', NULL, NULL, NULL, NULL);
INSERT INTO `complain_track` VALUES (11, 13, '2022-05-10 00:00:00', 'ผ่านไปได้ด้วยดี', NULL, NULL, NULL, NULL);
INSERT INTO `complain_track` VALUES (12, 13, '2022-05-10 00:00:00', 'aassasa', NULL, NULL, NULL, NULL);
INSERT INTO `complain_track` VALUES (13, 14, '2022-06-11 00:00:00', 'ผ่านไปได้ด้วยดี', NULL, NULL, NULL, NULL);
INSERT INTO `complain_track` VALUES (14, 14, '2022-06-11 00:00:00', 'aaaaa', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract_date` datetime NULL DEFAULT NULL,
  `quotation_id` int NULL DEFAULT NULL,
  `contract_start_date` datetime NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `contract_expire_date` datetime NULL DEFAULT NULL,
  `problem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `problem_cause` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `taken_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_renew` int NULL DEFAULT NULL,
  `contract_ref_id` int NULL DEFAULT NULL,
  `contract_renew_date` datetime NULL DEFAULT NULL,
  `service_estimate_start` datetime NULL DEFAULT NULL,
  `service_actual_start` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES (1, 'CT-2200001', '2022-05-31 22:22:08', 5, NULL, NULL, 1654010528, 1, 1654010528, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `contract` VALUES (8, 'CT-2200002', '2022-05-31 00:00:00', 4, '2022-05-31 00:00:00', NULL, 1654010867, 1, 1654010891, 1, '2022-06-28 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-31 00:00:00', '2022-05-31 00:00:00');
INSERT INTO `contract` VALUES (9, 'CT-2200003', '2022-06-03 14:10:26', 6, NULL, NULL, 1654240226, 1, 1654240226, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `contract` VALUES (10, 'CT-2200004', '2022-06-03 00:00:00', 6, '2022-06-10 00:00:00', 2, 1654240282, 1, 1770725803, 15, '2023-06-10 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-10 00:00:00', '2022-06-09 00:00:00');
INSERT INTO `contract` VALUES (11, 'CT26-00001', '2026-02-11 13:21:53', 7, NULL, 2, 1770790913, 15, 1770793521, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_group_id` int NULL DEFAULT NULL,
  `customer_type_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `location_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_method_id` int NULL DEFAULT NULL,
  `payment_term_id` int NULL DEFAULT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tax_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'CU-2100001', 'นิรันดร์', 'fdfdfd', 1, 1, 1, 1621825776, 1, 1653125785, 1, NULL, '', NULL, NULL, '', '', '1621825776.jpg', '', '');
INSERT INTO `customer` VALUES (2, 'CU-2200002', 'xaxa', 'dsas', 1, 1, 1, 1653025210, 1, 1653124115, 1, NULL, '0999999999', 2, 2, 'aaa', 'eraaaaaa', '16531241150.jpg', '1212111221211', 'rasdasda@gmil.com');
INSERT INTO `customer` VALUES (3, 'CU-2200003', 'lol', 'gggggggggg', 1, 1, 1, 1653026096, 1, 1653129639, 1, NULL, '0999999999', 1, 1, 'aaa', 'hhhhhhhhhhhhhhh', '', '1212111221211', 'rasdasda@gmil.com');
INSERT INTO `customer` VALUES (4, 'CU-2200004', 'โรงแรม ฟิวเจอร์', '', 2, 2, 1, 1654233700, 1, 1654233727, 1, NULL, '0947649876', 1, 1, 'สมพงษ์', 'กรุงเทพฯ', '1654233727.jpg', '1212111221211', 'future@gmil.com');

-- ----------------------------
-- Table structure for customer_contactor
-- ----------------------------
DROP TABLE IF EXISTS `customer_contactor`;
CREATE TABLE `customer_contactor`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_primary` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_contactor
-- ----------------------------
INSERT INTO `customer_contactor` VALUES (1, 2, 'sss', 'ddd', '1231231231', NULL, NULL);
INSERT INTO `customer_contactor` VALUES (2, 3, 'www', 'aaaa', '1231231231', NULL, NULL);
INSERT INTO `customer_contactor` VALUES (3, 4, 'นภัทร', 'ประสานงาน', '0896737288', NULL, NULL);

-- ----------------------------
-- Table structure for customer_form
-- ----------------------------
DROP TABLE IF EXISTS `customer_form`;
CREATE TABLE `customer_form`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_form
-- ----------------------------
INSERT INTO `customer_form` VALUES (3, 1, '16531252080.jpg', 1653125208, 1, NULL, NULL);
INSERT INTO `customer_form` VALUES (4, 3, '16531261530.jpg', 1653126153, 1, NULL, NULL);
INSERT INTO `customer_form` VALUES (5, 3, '16531261531.jpg', 1653126153, 1, NULL, NULL);
INSERT INTO `customer_form` VALUES (6, 4, '16542337270.jpg', 1654233727, 1, NULL, NULL);

-- ----------------------------
-- Table structure for customer_group
-- ----------------------------
DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE `customer_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_group
-- ----------------------------
INSERT INTO `customer_group` VALUES (1, 'โรงงาน', 'โรงงาน', '', 1, 1621780671, NULL, 1621780671, NULL);
INSERT INTO `customer_group` VALUES (2, '002', 'โรงแรม', '', 1, 1654233098, NULL, 1654233098, NULL);

-- ----------------------------
-- Table structure for customer_type
-- ----------------------------
DROP TABLE IF EXISTS `customer_type`;
CREATE TABLE `customer_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customer_type
-- ----------------------------
INSERT INTO `customer_type` VALUES (1, 'ทดสอบ', '', '', 1, 1621780824, NULL, 1621780824, NULL);
INSERT INTO `customer_type` VALUES (2, 'ย่อย', 'ลูกค้าย่อย', '', 1, 1654233128, NULL, 1654233128, NULL);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` int NULL DEFAULT NULL,
  `position` int NULL DEFAULT NULL,
  `salary_type` int NULL DEFAULT NULL,
  `emp_start` datetime NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '001', 'hh', 'jj', 1, 1, 1, '2026-02-06 00:00:00', '', '', 1, 1638528777, 1770704647, 1, 15);
INSERT INTO `employee` VALUES (2, '002', 'gg', 'kk', 2, 2, 2, '2026-02-11 00:00:00', '', '', 1, 1638530266, 1770704637, 1, 15);

-- ----------------------------
-- Table structure for estimate_comp
-- ----------------------------
DROP TABLE IF EXISTS `estimate_comp`;
CREATE TABLE `estimate_comp`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `factor` float NULL DEFAULT NULL,
  `amount` float NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of estimate_comp
-- ----------------------------
INSERT INTO `estimate_comp` VALUES (2, 'ค่าอบรม', '', 1, 1500, 1653024327, 1, 1653024327, NULL);
INSERT INTO `estimate_comp` VALUES (3, 'ค่าเดินทาง', '', 1, 400, 1654237058, 1, 1654237058, NULL);

-- ----------------------------
-- Table structure for estimate_comp_cal
-- ----------------------------
DROP TABLE IF EXISTS `estimate_comp_cal`;
CREATE TABLE `estimate_comp_cal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `estimate_id` int NULL DEFAULT NULL,
  `comp_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `cost_per` float NULL DEFAULT NULL,
  `total_amount` float NULL DEFAULT NULL,
  `machine_qty` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of estimate_comp_cal
-- ----------------------------
INSERT INTO `estimate_comp_cal` VALUES (1, 5, 1, 1, 100, 100, 1);
INSERT INTO `estimate_comp_cal` VALUES (2, 5, 2, 5, 1500, 7500, 1);
INSERT INTO `estimate_comp_cal` VALUES (3, 4, 1, 0, 100, 0, 1);
INSERT INTO `estimate_comp_cal` VALUES (4, 4, 2, 0, 1500, 0, 1);
INSERT INTO `estimate_comp_cal` VALUES (5, 6, 1, 1, 100, 100, 1);
INSERT INTO `estimate_comp_cal` VALUES (6, 6, 2, 1, 1500, 1500, 1);
INSERT INTO `estimate_comp_cal` VALUES (7, 7, 1, 7, 100, 700, 1);
INSERT INTO `estimate_comp_cal` VALUES (8, 7, 2, 1, 1500, 1500, 1);
INSERT INTO `estimate_comp_cal` VALUES (9, 8, 1, 1, 100, 100, 1);
INSERT INTO `estimate_comp_cal` VALUES (10, 8, 2, 1, 1500, 1500, 1);
INSERT INTO `estimate_comp_cal` VALUES (11, 9, 1, 1, 100, 100, 1);
INSERT INTO `estimate_comp_cal` VALUES (12, 9, 2, 2, 1500, 3000, 1);
INSERT INTO `estimate_comp_cal` VALUES (13, 10, 2, 1, 1500, 1500, 1);
INSERT INTO `estimate_comp_cal` VALUES (14, 10, 3, 2, 400, 800, 1);

-- ----------------------------
-- Table structure for estimateprice
-- ----------------------------
DROP TABLE IF EXISTS `estimateprice`;
CREATE TABLE `estimateprice`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `journal_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trans_date` datetime NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  `revised` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `service_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `building_size` float NULL DEFAULT NULL,
  `ground_size` float NULL DEFAULT NULL,
  `service_type_id` int NULL DEFAULT NULL,
  `approved_by` int NULL DEFAULT NULL,
  `additional_amount` float NULL DEFAULT NULL,
  `estimate_total_amount` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of estimateprice
-- ----------------------------
INSERT INTO `estimateprice` VALUES (4, 'EP-2200001', '2022-05-20 00:00:00', 1, 1, 2, 1653023968, 1770733506, NULL, 15, '', 100, NULL, 1, NULL, NULL, NULL);
INSERT INTO `estimateprice` VALUES (5, 'EP-2200002', '2022-05-20 00:00:00', 1, 3, 2, 1653024372, 1770732171, NULL, 15, 'test', 100, NULL, 1, NULL, NULL, NULL);
INSERT INTO `estimateprice` VALUES (6, 'EP-2200003', '2022-05-20 00:00:00', 1, 1, 2, 1653024624, 1654009717, NULL, NULL, 'test', 100, NULL, 1, NULL, NULL, 3000);
INSERT INTO `estimateprice` VALUES (7, 'EP-2200004', '2022-05-20 00:00:00', 2, 1, 2, 1653025303, 1653132273, NULL, 1, '', 100, NULL, 1, NULL, NULL, 2500);
INSERT INTO `estimateprice` VALUES (8, 'EP-2200005', '2022-05-20 00:00:00', 2, 12, 2, 1653055137, 1653130756, NULL, 1, '', 100, NULL, 1, NULL, NULL, 2100);
INSERT INTO `estimateprice` VALUES (9, 'EP-2200006', '2022-05-23 00:00:00', 2, NULL, 2, 1653281424, 1653281434, 1, 1, 'test', 100, NULL, 1, NULL, NULL, 5000);
INSERT INTO `estimateprice` VALUES (10, 'EP-2200007', '2022-06-01 00:00:00', 4, 2, 2, 1654237243, 1770715884, NULL, 15, 'test', 100, 0, 9, NULL, 5000, 19900);
INSERT INTO `estimateprice` VALUES (11, 'AX111111', '2026-02-11 00:00:00', 1, NULL, 2, 1770793221, 1770793298, 15, 15, 'test', 200, 25, 8, NULL, 5000, 20000);

-- ----------------------------
-- Table structure for estimateprice_line
-- ----------------------------
DROP TABLE IF EXISTS `estimateprice_line`;
CREATE TABLE `estimateprice_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `estimate_id` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `unit_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `price2` float NULL DEFAULT NULL,
  `price3` float NULL DEFAULT NULL,
  `unit_id2` int NULL DEFAULT NULL,
  `service_count` int NULL DEFAULT NULL,
  `line_total` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of estimateprice_line
-- ----------------------------
INSERT INTO `estimateprice_line` VALUES (1, 4, 2, 3, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0);
INSERT INTO `estimateprice_line` VALUES (2, 5, 1, 3, 500, NULL, 0, NULL, NULL, NULL, NULL, 2, 20, 2, 10, 60);
INSERT INTO `estimateprice_line` VALUES (3, 6, 1, 5, 500, NULL, 0, NULL, NULL, NULL, NULL, 2, 20, 3, 4, 400);
INSERT INTO `estimateprice_line` VALUES (4, 7, 1, 3, 500, NULL, 0, NULL, NULL, NULL, NULL, 2, 20, 2, 2, 12);
INSERT INTO `estimateprice_line` VALUES (5, 8, 1, 2, 500, NULL, 0, NULL, NULL, NULL, NULL, 2, 20, 2, 3, 12);
INSERT INTO `estimateprice_line` VALUES (6, 9, 1, 5, 500, NULL, 0, NULL, NULL, NULL, NULL, 2, 20, 3, 5, 500);
INSERT INTO `estimateprice_line` VALUES (12, 10, 1, 1, 0, NULL, 1, NULL, 1770715884, NULL, 15, NULL, NULL, NULL, 5, 0);
INSERT INTO `estimateprice_line` VALUES (13, 10, 3, 2, 1200, NULL, 1, NULL, 1770715884, NULL, 15, NULL, NULL, NULL, 6, 14400);
INSERT INTO `estimateprice_line` VALUES (14, 10, 1, 1, 500, NULL, 1, NULL, 1770715884, NULL, 15, NULL, NULL, NULL, 1, 500);
INSERT INTO `estimateprice_line` VALUES (15, 10, 3, 1, 0, NULL, 1, NULL, 1770715884, NULL, 15, NULL, NULL, NULL, 1, 0);
INSERT INTO `estimateprice_line` VALUES (16, 11, 2, 1, 15000, NULL, 1, 1770793221, NULL, 15, NULL, NULL, NULL, NULL, 1, 15000);

-- ----------------------------
-- Table structure for job_card
-- ----------------------------
DROP TABLE IF EXISTS `job_card`;
CREATE TABLE `job_card`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_card_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contract_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_card
-- ----------------------------
INSERT INTO `job_card` VALUES (1, 'JC-2200001', 5, 1, 1652935254, 2, 2, 1652945285);
INSERT INTO `job_card` VALUES (2, 'JC-2200002', 6, 1, 1652947908, 2, 2, 1652948813);
INSERT INTO `job_card` VALUES (3, 'JC-2200003', 7, 1, 1652954623, 11, NULL, 1652954623);
INSERT INTO `job_card` VALUES (4, 'JC-2200004', 8, 1, 1654010891, 1, 1, 1654255586);
INSERT INTO `job_card` VALUES (5, 'JC-2200005', 10, 1, 1654240362, 1, 15, 1770713830);
INSERT INTO `job_card` VALUES (6, 'JC2200006', 11, 1, 1770790913, 15, NULL, NULL);

-- ----------------------------
-- Table structure for job_card_line
-- ----------------------------
DROP TABLE IF EXISTS `job_card_line`;
CREATE TABLE `job_card_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_card_id` int NULL DEFAULT NULL,
  `job_count` int NULL DEFAULT NULL,
  `job_date` datetime NULL DEFAULT NULL,
  `approve_id` int NULL DEFAULT NULL,
  `time_in` datetime NULL DEFAULT NULL,
  `time_out` datetime NULL DEFAULT NULL,
  `emp_service` int NULL DEFAULT NULL,
  `job_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `plan_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_card_line
-- ----------------------------
INSERT INTO `job_card_line` VALUES (1, 1, NULL, '2022-05-19 00:00:00', NULL, NULL, NULL, NULL, 'sdsdsfdffdfdfd', 2, 3);
INSERT INTO `job_card_line` VALUES (2, 2, NULL, '2022-05-19 00:00:00', NULL, NULL, NULL, NULL, 'ghjghkgkjgjkgjkgjkgjkghghghjghjghgdffdfg', 2, 20);
INSERT INTO `job_card_line` VALUES (8, 4, NULL, '2022-06-03 00:00:00', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 'lfdfdg', NULL, 1);
INSERT INTO `job_card_line` VALUES (10, 5, 1, '2022-06-03 00:00:00', NULL, NULL, NULL, 1, 'uyyjh', 1, NULL);
INSERT INTO `job_card_line` VALUES (11, 5, 2, '2022-06-02 00:00:00', NULL, NULL, NULL, 2, 'nbbb', 1, NULL);

-- ----------------------------
-- Table structure for job_schedule
-- ----------------------------
DROP TABLE IF EXISTS `job_schedule`;
CREATE TABLE `job_schedule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quotation_id` int NULL DEFAULT NULL,
  `quotation_job_line_id` int NULL DEFAULT NULL,
  `target_date` datetime NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of job_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for journal_issue
-- ----------------------------
DROP TABLE IF EXISTS `journal_issue`;
CREATE TABLE `journal_issue`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `journal_issue_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trans_date` datetime NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `approved_by` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `trans_ref_id` int NULL DEFAULT NULL,
  `trans_ref_type` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of journal_issue
-- ----------------------------
INSERT INTO `journal_issue` VALUES (1, 'IS-2200001', '2022-04-27 00:00:00', '', NULL, NULL, 1651028786, 2, 1651028786, NULL, NULL, NULL);
INSERT INTO `journal_issue` VALUES (2, 'IS-2200002', '2022-04-27 00:00:00', '', 1, NULL, 1651029379, 1, 1651029385, 1, NULL, NULL);
INSERT INTO `journal_issue` VALUES (3, 'IS-2200003', '2022-04-27 00:00:00', '', 1, NULL, 1651030877, 2, 1651030899, 2, NULL, NULL);
INSERT INTO `journal_issue` VALUES (4, 'IS-2200004', '2022-05-19 00:00:00', '', 2, NULL, 1652948190, 2, 1652948468, 2, 11, NULL);
INSERT INTO `journal_issue` VALUES (5, 'IS-2200005', '2022-05-19 17:11:20', NULL, 1, NULL, 1652955080, 11, 1652955080, NULL, 24, NULL);
INSERT INTO `journal_issue` VALUES (6, 'IS-2200006', '2022-05-20 13:39:24', NULL, 2, NULL, 1653028764, 11, 1653028825, 11, 60, NULL);
INSERT INTO `journal_issue` VALUES (23, 'IS-2100001', '2021-12-02 00:00:00', '', 1, NULL, 1638454569, NULL, 1638454569, NULL, NULL, NULL);
INSERT INTO `journal_issue` VALUES (24, 'IS-2200002', '2022-05-31 20:53:00', NULL, 1, NULL, 1654005181, NULL, 1654005181, NULL, 1, 1);
INSERT INTO `journal_issue` VALUES (25, 'IS-2200003', '2022-05-31 20:54:00', NULL, 1, NULL, 1654005280, NULL, 1654005280, NULL, 2, 1);
INSERT INTO `journal_issue` VALUES (26, 'IS-2200004', '2022-05-31 20:56:00', NULL, 1, NULL, 1654005383, NULL, 1654005383, NULL, 3, 1);
INSERT INTO `journal_issue` VALUES (27, 'IS-2200005', '2022-05-31 21:29:00', NULL, 1, NULL, 1654007387, NULL, 1654007387, NULL, 4, 1);
INSERT INTO `journal_issue` VALUES (28, 'IS-2200006', '2022-05-31 21:30:00', NULL, 1, NULL, 1654007453, NULL, 1654007453, NULL, 5, 1);
INSERT INTO `journal_issue` VALUES (29, 'IS-2200007', '2022-05-31 21:52:00', NULL, 1, NULL, 1654008763, NULL, 1654008763, NULL, 6, 1);
INSERT INTO `journal_issue` VALUES (30, 'IS-2200008', '2022-06-01 14:26:00', NULL, 1, NULL, 1654068396, 1, 1654068396, NULL, 9, 2);
INSERT INTO `journal_issue` VALUES (31, 'IS-2200009', '2022-06-01 14:52:00', NULL, 1, NULL, 1654069939, 1, 1654069939, NULL, 10, 3);
INSERT INTO `journal_issue` VALUES (32, 'IS-2200010', '2022-06-01 20:45:00', NULL, 1, NULL, 1654091145, 1, 1654091145, NULL, 11, 3);
INSERT INTO `journal_issue` VALUES (33, 'IS-2200011', '2022-06-01 20:49:00', NULL, 1, NULL, 1654091378, 1, 1654091378, NULL, 12, 3);
INSERT INTO `journal_issue` VALUES (34, 'IS-2200012', '2022-06-02 14:55:00', NULL, 1, NULL, 1654156538, 1, 1654156538, NULL, 13, 3);
INSERT INTO `journal_issue` VALUES (35, 'IS-2200013', '2022-06-03 14:17:00', NULL, 1, NULL, 1654240679, 1, 1654240679, NULL, 14, 3);
INSERT INTO `journal_issue` VALUES (37, 'JI26020001', '2026-02-10 21:07:28', 'Created from Service Order SV-2600001', 1, NULL, 1770732448, 15, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for journal_issue_line
-- ----------------------------
DROP TABLE IF EXISTS `journal_issue_line`;
CREATE TABLE `journal_issue_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `journal_issue_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of journal_issue_line
-- ----------------------------
INSERT INTO `journal_issue_line` VALUES (1, 1, 2, 1, 500, 'แก้ไขงาน');
INSERT INTO `journal_issue_line` VALUES (2, 1, 3, 1, NULL, 'ขายหน้าร้าน');
INSERT INTO `journal_issue_line` VALUES (3, 2, 2, 1, 500, 'zzz');
INSERT INTO `journal_issue_line` VALUES (4, 2, 3, 1, NULL, 'aaaa');
INSERT INTO `journal_issue_line` VALUES (5, 3, 4, 1, NULL, 'แก้ไขงาน');
INSERT INTO `journal_issue_line` VALUES (6, 3, 8, 2, NULL, 'แก้ไขงาน');
INSERT INTO `journal_issue_line` VALUES (7, 4, 4, 1, NULL, '');
INSERT INTO `journal_issue_line` VALUES (8, 4, 8, 1, NULL, '');
INSERT INTO `journal_issue_line` VALUES (9, 5, 4, 4, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (10, 5, 11, 36, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (11, 5, 15, 2, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (12, 5, 16, 21, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (13, 5, 19, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (14, 6, 4, 4, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (15, 6, 11, 36, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (16, 6, 15, 2, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (17, 6, 16, 21, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (18, 6, 19, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (26, 23, 1, 1, 500, '');
INSERT INTO `journal_issue_line` VALUES (27, 26, 3, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (28, 27, 1, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (29, 27, 2, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (30, 27, 3, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (31, 28, NULL, 2, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (32, 28, NULL, 3, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (33, 29, 3, 2, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (36, 29, 1, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (37, 30, 2, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (38, 30, 1, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (39, 31, 1, 3, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (41, 31, 2, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (42, 32, 1, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (43, 32, 2, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (44, 33, 2, 2, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (45, 34, 3, 1, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (46, 34, 2, 2, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (47, 35, 2, 2, NULL, NULL);
INSERT INTO `journal_issue_line` VALUES (48, 37, 1, 3, 500, '');

-- ----------------------------
-- Table structure for knex_migrations
-- ----------------------------
DROP TABLE IF EXISTS `knex_migrations`;
CREATE TABLE `knex_migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batch` int NULL DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knex_migrations
-- ----------------------------

-- ----------------------------
-- Table structure for knex_migrations_lock
-- ----------------------------
DROP TABLE IF EXISTS `knex_migrations_lock`;
CREATE TABLE `knex_migrations_lock`  (
  `index` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `is_locked` int NULL DEFAULT NULL,
  PRIMARY KEY (`index`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knex_migrations_lock
-- ----------------------------
INSERT INTO `knex_migrations_lock` VALUES (1, 0);

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `warehouse_id` int NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES (1, 1, '239/3', '239/3', '', NULL, 1, 1651762276, 1651762276, 1, NULL);
INSERT INTO `location` VALUES (2, 1, '239/4', '239/4', '', NULL, 1, 1651762294, 1651762294, 1, NULL);
INSERT INTO `location` VALUES (3, 2, '01192', '่นานา', '', NULL, 1, 1654232962, 1654232962, 1, NULL);

-- ----------------------------
-- Table structure for material_plan
-- ----------------------------
DROP TABLE IF EXISTS `material_plan`;
CREATE TABLE `material_plan`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quotation_id` int NULL DEFAULT NULL,
  `contract_id` int NULL DEFAULT NULL,
  `quotation_job_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of material_plan
-- ----------------------------

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apply_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1620700205);
INSERT INTO `migration` VALUES ('m130524_201442_init', 1620700206);
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', 1651760987);
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1651760988);
INSERT INTO `migration` VALUES ('m180523_151638_rbac_updates_indexes_without_prefix', 1651760988);
INSERT INTO `migration` VALUES ('m190124_110200_add_verification_token_column_to_user_table', 1620700206);
INSERT INTO `migration` VALUES ('m200409_110543_rbac_update_mssql_trigger', 1651760988);
INSERT INTO `migration` VALUES ('m201208_052942_create_employee_table', 1621779953);
INSERT INTO `migration` VALUES ('m201208_074407_create_warehouse_table', 1621782206);
INSERT INTO `migration` VALUES ('m201208_074431_create_location_table', 1621782338);
INSERT INTO `migration` VALUES ('m201208_080819_create_car_type_table', 1621821326);
INSERT INTO `migration` VALUES ('m210511_041153_create_user_group_table', 1620706319);
INSERT INTO `migration` VALUES ('m210511_041352_create_product_group_table', 1620706621);
INSERT INTO `migration` VALUES ('m210511_041407_create_customer_group_table', 1620706621);
INSERT INTO `migration` VALUES ('m210511_041650_create_product_table', 1620706621);
INSERT INTO `migration` VALUES ('m210511_041835_create_position_table', 1620706823);
INSERT INTO `migration` VALUES ('m210511_041905_create_department_table', 1620706823);
INSERT INTO `migration` VALUES ('m210511_041921_create_unit_table', 1620706823);
INSERT INTO `migration` VALUES ('m210511_042013_create_product_type_table', 1620706823);
INSERT INTO `migration` VALUES ('m210511_042207_create_payment_term_table', 1620706944);
INSERT INTO `migration` VALUES ('m210511_042219_create_payment_method_table', 1620706945);
INSERT INTO `migration` VALUES ('m210511_042303_create_car_group_table', 1620707058);
INSERT INTO `migration` VALUES ('m210511_042412_create_car_table', 1620707058);
INSERT INTO `migration` VALUES ('m210511_042736_create_complain_table', 1620707274);
INSERT INTO `migration` VALUES ('m210511_043010_create_customer_table', 1620707416);
INSERT INTO `migration` VALUES ('m210511_043107_create_customer_type_table', 1620707473);
INSERT INTO `migration` VALUES ('m210521_033921_create_company_table', 1621568368);
INSERT INTO `migration` VALUES ('m210523_141042_add_code_column_to_company_table', 1621779048);
INSERT INTO `migration` VALUES ('m210523_141618_add_address_column_to_company_table', 1621779390);
INSERT INTO `migration` VALUES ('m210523_144742_add_location_info_column_to_customer_table', 1621781269);
INSERT INTO `migration` VALUES ('m210524_013912_add_payment_method_id_column_to_payment_term_table', 1621820357);
INSERT INTO `migration` VALUES ('m210524_015236_add_car_type_id_column_to_car_table', 1621821161);
INSERT INTO `migration` VALUES ('m210524_020309_add_unit_id_column_to_product_table', 1621821796);
INSERT INTO `migration` VALUES ('m210524_020354_add_sale_price_column_to_product_table', 1621821840);
INSERT INTO `migration` VALUES ('m210524_020454_add_nw_column_to_product_table', 1621821899);
INSERT INTO `migration` VALUES ('m210525_012425_add_phone_column_to_company_table', 1621905872);
INSERT INTO `migration` VALUES ('m210525_014950_create_vendor_group_table', 1621907396);
INSERT INTO `migration` VALUES ('m210525_023437_create_vendor_table', 1621910085);
INSERT INTO `migration` VALUES ('m210527_045931_create_work_task_table', 1622091717);
INSERT INTO `migration` VALUES ('m210527_050150_create_work_task_detail_table', 1622091860);
INSERT INTO `migration` VALUES ('m210605_043315_add_sale_price2_column_to_product_table', 1622867600);
INSERT INTO `migration` VALUES ('m210623_061109_create_purch_table', 1624428915);
INSERT INTO `migration` VALUES ('m210623_061230_create_purch_line_table', 1624428915);
INSERT INTO `migration` VALUES ('m210623_061358_create_purch_packing_slip_table', 1624428915);
INSERT INTO `migration` VALUES ('m210623_061509_create_purch_packing_slip_trans_table', 1624429012);
INSERT INTO `migration` VALUES ('m210623_073547_create_purch_req_line_table', 1624434010);
INSERT INTO `migration` VALUES ('m210623_073820_create_purch_req_table', 1624434010);
INSERT INTO `migration` VALUES ('m210625_013432_add_purch_req_id_column_to_purch_line_table', 1624584880);
INSERT INTO `migration` VALUES ('m210625_021628_add_remain_qty_column_to_purch_line_table', 1624587395);
INSERT INTO `migration` VALUES ('m210625_022312_create_stock_trans_table', 1624587803);
INSERT INTO `migration` VALUES ('m210625_022424_create_stock_sum_table', 1624587944);
INSERT INTO `migration` VALUES ('m210625_072043_add_vendor_id_column_to_purch_table', 1624605653);
INSERT INTO `migration` VALUES ('m210625_072136_add_purch_id_column_to_purch_req_line_table', 1624605703);
INSERT INTO `migration` VALUES ('m210704_055348_create_estimateprice_table', 1625378121);
INSERT INTO `migration` VALUES ('m210704_055511_create_estimateprice_line_table', 1625378121);
INSERT INTO `migration` VALUES ('m210926_060547_add_product_id_column_to_work_task_detail_table', 1632636512);
INSERT INTO `migration` VALUES ('m210926_064146_add_line_total_column_to_work_task_detail_table', 1632638664);
INSERT INTO `migration` VALUES ('m210926_071016_add_price2_column_to_estimateprice_line_table', 1632640223);
INSERT INTO `migration` VALUES ('m210926_074313_add_service_place_column_to_estimateprice_table', 1632642201);
INSERT INTO `migration` VALUES ('m211201_134035_create_journal_issue_table', 1638366350);
INSERT INTO `migration` VALUES ('m211201_134150_create_journal_issue_line_table', 1638366350);
INSERT INTO `migration` VALUES ('m211202_161316_add_group_id_column_to_user_table', 1638461610);
INSERT INTO `migration` VALUES ('m211202_161533_add_emp_id_column_to_user_table', 1638461745);
INSERT INTO `migration` VALUES ('m220117_085919_create_bom_table', 1651754608);
INSERT INTO `migration` VALUES ('m220117_091203_create_bom_line_table', 1651754608);
INSERT INTO `migration` VALUES ('m220117_115334_create_service_table', 1651754609);
INSERT INTO `migration` VALUES ('m220121_134255_add_additional_amount_column_to_estimateprice_table', 1651754609);
INSERT INTO `migration` VALUES ('m220121_151910_create_standard_price_table', 1651754609);
INSERT INTO `migration` VALUES ('m220121_152055_create_standard_price_line_table', 1651754609);
INSERT INTO `migration` VALUES ('m220122_000604_add_trans_ref_id_column_to_journal_issue_table', 1651754609);
INSERT INTO `migration` VALUES ('m220130_033653_create_contract_table', 1651754609);
INSERT INTO `migration` VALUES ('m220130_033849_create_quotation_table', 1651754609);
INSERT INTO `migration` VALUES ('m220130_034018_add_contract_expire_date_column_to_contract_table', 1651754609);
INSERT INTO `migration` VALUES ('m220130_040956_add_problem_column_to_contract_table', 1651754609);
INSERT INTO `migration` VALUES ('m220130_041444_add_problem_column_to_complain_table', 1651754609);
INSERT INTO `migration` VALUES ('m220130_044721_create_estimate_comp_table', 1651754609);
INSERT INTO `migration` VALUES ('m220130_050710_create_estimate_comp_cal_table', 1651754609);
INSERT INTO `migration` VALUES ('m220131_143056_create_quotation_line_table', 1651754609);
INSERT INTO `migration` VALUES ('m220131_145448_add_customer_id_column_to_quotation_table', 1651754610);
INSERT INTO `migration` VALUES ('m220204_133202_add_note_column_to_quotation_table', 1651754610);
INSERT INTO `migration` VALUES ('m220204_134200_add_sub_total_column_to_quotation_table', 1651754610);
INSERT INTO `migration` VALUES ('m220205_015243_create_quotation_job_table', 1651754610);
INSERT INTO `migration` VALUES ('m220205_015320_create_quotation_job_line_table', 1651754610);
INSERT INTO `migration` VALUES ('m220205_030957_add_quotation_id_column_to_quotation_job_line_table', 1651754610);
INSERT INTO `migration` VALUES ('m220206_075622_create_job_card_table', 1651754610);
INSERT INTO `migration` VALUES ('m220206_080043_create_job_card_line_table', 1651754610);
INSERT INTO `migration` VALUES ('m220208_143100_add_is_renew_column_to_contract_table', 1651754610);
INSERT INTO `migration` VALUES ('m220424_041930_add_contract_renew_date_column_to_contract_table', 1651754610);
INSERT INTO `migration` VALUES ('m220424_060901_create_calendar_event_table', 1651754611);
INSERT INTO `migration` VALUES ('m220424_115504_create_job_schedule_table', 1651754611);
INSERT INTO `migration` VALUES ('m220424_123252_add_job_count_column_to_quotation_job_line_table', 1651754611);
INSERT INTO `migration` VALUES ('m220425_064636_create_task_table', 1651754611);
INSERT INTO `migration` VALUES ('m220425_064934_create_task_detail_table', 1651754611);
INSERT INTO `migration` VALUES ('m220426_103408_create_customer_contactor_table', 1651754611);
INSERT INTO `migration` VALUES ('m220426_142851_create_stock_count_table', 1651754611);
INSERT INTO `migration` VALUES ('m220426_143016_create_stock_count_line_table', 1651754611);
INSERT INTO `migration` VALUES ('m220426_163509_add_trans_date_column_to_stock_count_line_table', 1651754611);
INSERT INTO `migration` VALUES ('m220427_000405_add_lastest_count_column_to_stock_sum', 1651754611);
INSERT INTO `migration` VALUES ('m220428_012849_create_service_type_table', 1651754611);
INSERT INTO `migration` VALUES ('m220428_030649_create_service_plan_table', 1651754611);
INSERT INTO `migration` VALUES ('m220428_030928_add_interval_no_column_to_service_plan_table', 1651754611);
INSERT INTO `migration` VALUES ('m220429_032541_add_task_job_id_column_to_quotation_job_table', 1651754611);
INSERT INTO `migration` VALUES ('m220429_084343_create_material_plan_table', 1651754611);
INSERT INTO `migration` VALUES ('m220506_050508_create_complain_service_order_table', 1652940924);
INSERT INTO `migration` VALUES ('m220506_050628_create_complain_service_order_line_table', 1652940924);
INSERT INTO `migration` VALUES ('m220510_124734_add_machine_qty_column_to_estimate_comp_cal_table', 1652940924);
INSERT INTO `migration` VALUES ('m220517_093349_alter_service_plan_table', 1652940924);
INSERT INTO `migration` VALUES ('m220517_135044_alter_service_table', 1652940924);
INSERT INTO `migration` VALUES ('m220519_011610_add_warehouse_type_column_to_stock_sum_table', 1652940924);
INSERT INTO `migration` VALUES ('m220519_012932_add_car_id_column_to_service_plan_table', 1652940925);
INSERT INTO `migration` VALUES ('m220519_071818_add_plan_id_column_to_job_card_line_table', 1653023105);
INSERT INTO `migration` VALUES ('m220520_034200_add_tax_id_column_to_customer_table', 1653023105);
INSERT INTO `migration` VALUES ('m220520_034309_add_service_name_column_to_quotation_table', 1653023106);
INSERT INTO `migration` VALUES ('m220520_044632_add_estimate_total_amount_column_to_estimateprice_table', 1653023106);
INSERT INTO `migration` VALUES ('m220520_142940_create_customer_form_table', 1653065851);
INSERT INTO `migration` VALUES ('m220601_140905_create_complain_track_table', 1654092560);
INSERT INTO `migration` VALUES ('m220903_013115_add_approve_token_column_to_purch_req_table', 1662168680);

-- ----------------------------
-- Table structure for payment_method
-- ----------------------------
DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE `payment_method`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment_method
-- ----------------------------
INSERT INTO `payment_method` VALUES (1, '001', 'เงินสด', NULL, 1, 1638343183, NULL, 1638343183, NULL);
INSERT INTO `payment_method` VALUES (2, '002', 'ผ่อน', NULL, 1, 1653025079, 1, 1653025079, NULL);

-- ----------------------------
-- Table structure for payment_term
-- ----------------------------
DROP TABLE IF EXISTS `payment_term`;
CREATE TABLE `payment_term`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `payment_method_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment_term
-- ----------------------------
INSERT INTO `payment_term` VALUES (1, '001', 'สด', '', 1, 1653025140, 1, 1653025140, NULL, 1);
INSERT INTO `payment_term` VALUES (2, '001', 'ผ่อน 3 เดือน', '', 1, 1653025156, 1, 1653025156, NULL, 2);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, 'พนักงานขาย', 'พนักงานขาย', 'พนักงานขาย', 1, 1621779753, 1, 1621779753, NULL);
INSERT INTO `position` VALUES (2, '002', 'ผู้จัดการ', '', 1, 1638530234, 1, 1638530234, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_group_id` int NULL DEFAULT NULL,
  `product_type_id` int NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `min_stock` float NULL DEFAULT NULL,
  `max_stock` float NULL DEFAULT NULL,
  `std_cost` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `unit_id` int NULL DEFAULT NULL,
  `sale_price` float NULL DEFAULT NULL,
  `nw` float NULL DEFAULT NULL,
  `gw` float NULL DEFAULT NULL,
  `sale_price2` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '09333', 'พารา 500', 'sdfd', 1, 1, '', NULL, NULL, 455, 0, 1624524804, 1, 1624524804, NULL, 1, 500, NULL, NULL, NULL);
INSERT INTO `product` VALUES (2, '01-001-0-1-00816', 'ลดไข้สำหรับเด็ก', 'sdfddfd', 1, 1, '', NULL, NULL, 455, 0, 1624525974, 1, 1624525974, NULL, 1, 200, NULL, NULL, 100);
INSERT INTO `product` VALUES (3, 'LGT0001', 'Logiteecth G2001', '', 1, 1, '', NULL, NULL, 1000, 1, 1638433653, NULL, 1638433653, NULL, 1, 1200, NULL, NULL, 1500);

-- ----------------------------
-- Table structure for product_group
-- ----------------------------
DROP TABLE IF EXISTS `product_group`;
CREATE TABLE `product_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_group
-- ----------------------------
INSERT INTO `product_group` VALUES (1, '02', 'ทดสอบ', 'ทดสอบ', 1, 1624524755, NULL, 1624524755, NULL);

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (1, '01', '01', '', 1, 1621781985, 1, 1621781985, NULL);

-- ----------------------------
-- Table structure for purch
-- ----------------------------
DROP TABLE IF EXISTS `purch`;
CREATE TABLE `purch`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `purch_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purch_date` datetime NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  `payment_term_id` int NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `vendor_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of purch
-- ----------------------------
INSERT INTO `purch` VALUES (1, 'PO-2100001', '2021-06-25 00:00:00', NULL, NULL, 'ทดสอบซื้อ', 1, 1624607427, 1, 1624607427, NULL, 1);
INSERT INTO `purch` VALUES (2, 'PO-210002', '2021-07-27 00:00:00', NULL, NULL, 'เทส', 1, 1627357093, 2, 1627357093, NULL, 1);
INSERT INTO `purch` VALUES (3, 'PO-220003', '2022-04-27 00:00:00', NULL, NULL, '', 5, 1651047617, 2, 1651047617, NULL, 1);
INSERT INTO `purch` VALUES (4, 'PO-220004', '2022-05-19 00:00:00', NULL, NULL, '', 5, 1652945724, 2, 1652945724, NULL, 1);
INSERT INTO `purch` VALUES (19, 'PO-2100001', '2021-12-02 00:00:00', NULL, NULL, '', 5, 1638456712, NULL, 1638456712, NULL, 1);
INSERT INTO `purch` VALUES (20, 'PO-2100002', '2021-12-02 00:00:00', NULL, NULL, '', 1, 1638456753, NULL, 1638456753, NULL, 1);
INSERT INTO `purch` VALUES (21, 'PO-2100003', '2021-12-02 00:00:00', NULL, NULL, '', 1, 1638456798, NULL, 1638456798, NULL, 1);
INSERT INTO `purch` VALUES (22, 'PO-2100004', '2021-12-02 00:00:00', NULL, NULL, '', 1, 1638458102, NULL, 1638458102, NULL, 1);
INSERT INTO `purch` VALUES (23, 'PO-2100005', '2021-12-02 00:00:00', NULL, NULL, '', 1, 1638458110, NULL, 1638458110, NULL, 1);
INSERT INTO `purch` VALUES (24, 'PO-2100006', '2021-12-02 00:00:00', NULL, NULL, '', 1, 1638458118, NULL, 1638458118, NULL, 1);
INSERT INTO `purch` VALUES (25, 'PO-2200007', '2022-05-19 00:00:00', NULL, NULL, '', 1, 1652942654, 1, 1652942666, 1, 1);
INSERT INTO `purch` VALUES (26, 'PO-2200008', '2022-05-19 00:00:00', NULL, NULL, '', 1, 1652944986, 1, 1652944986, NULL, 1);
INSERT INTO `purch` VALUES (27, 'PO-2200009', '2022-05-19 00:00:00', NULL, NULL, '', 5, 1652946032, 1, 1652946032, NULL, 1);
INSERT INTO `purch` VALUES (28, 'PO-220005', '2022-06-03 00:00:00', NULL, NULL, '', 5, 1654235996, 1, 1654236001, 1, 2);
INSERT INTO `purch` VALUES (29, 'PO-220006', '2022-06-03 00:00:00', NULL, NULL, '', 1, 1654236989, 1, 1654236989, NULL, 2);
INSERT INTO `purch` VALUES (30, 'PO26020001', '2026-02-10 00:00:00', NULL, NULL, '', 1, 1770717333, 15, NULL, NULL, 2);

-- ----------------------------
-- Table structure for purch_line
-- ----------------------------
DROP TABLE IF EXISTS `purch_line`;
CREATE TABLE `purch_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `purch_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `line_total` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `purch_req_id` int NULL DEFAULT NULL,
  `remain_qty` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of purch_line
-- ----------------------------
INSERT INTO `purch_line` VALUES (3, 1, 1, 2, 800, 1, 1, NULL, NULL, NULL, 1);
INSERT INTO `purch_line` VALUES (4, 3, 2, 2, 800, 1, 1, 1624605427, 1624605427, 3, 2);
INSERT INTO `purch_line` VALUES (5, 3, 1, 2, 390, 780, 1, 1624605427, 1624605427, 2, 2);
INSERT INTO `purch_line` VALUES (25, 19, 3, 2, 1200, 2, 1, 1638456712, 1638456712, 21, 0);
INSERT INTO `purch_line` VALUES (26, 20, 2, 2, 200, 400, 1, 1638456754, 1638456754, 23, 2);
INSERT INTO `purch_line` VALUES (27, 21, 3, 2, 1200, 2, 1, 1638456798, 1638456798, 24, 2);
INSERT INTO `purch_line` VALUES (28, 22, 2, 4, 200, 800, 1, 1638458102, 1638458102, 21, 4);
INSERT INTO `purch_line` VALUES (29, 23, 2, 3, 200, 600, 1, 1638458110, 1638458110, 21, 3);
INSERT INTO `purch_line` VALUES (30, 24, 1, 2, 500, 1, 1, 1638458118, 1638458118, 21, 2);
INSERT INTO `purch_line` VALUES (31, 25, 2, 2, 200, 400, 1, 1652942654, 1652942654, 29, 2);
INSERT INTO `purch_line` VALUES (32, 26, 2, 2, 200, 400, 1, 1652944986, 1652944986, 27, 2);
INSERT INTO `purch_line` VALUES (33, 27, 3, 2, 1200, 2, 1, 1652946032, 1652946032, 28, 0);
INSERT INTO `purch_line` VALUES (34, 28, 3, 2, 1200, 2400, 1, 1654235996, 1654235996, 33, 0);
INSERT INTO `purch_line` VALUES (35, 29, 3, 4, 1200, 4800, 1, 1654236989, 1654236989, 34, 1);
INSERT INTO `purch_line` VALUES (36, 29, 2, 4, 200, 800, 1, 1654236989, 1654236989, 34, 2);
INSERT INTO `purch_line` VALUES (37, 29, 1, 4, 500, 2000, 1, 1654236989, 1654236989, 34, 2);
INSERT INTO `purch_line` VALUES (38, 30, 3, 2, 1200, 2400, 1, NULL, NULL, 28, 2);
INSERT INTO `purch_line` VALUES (39, 30, 1, 2, 500, 1000, 1, NULL, NULL, 29, 2);
INSERT INTO `purch_line` VALUES (40, 30, 2, 2, 200, 400, 1, NULL, NULL, 30, 2);

-- ----------------------------
-- Table structure for purch_packing_slip
-- ----------------------------
DROP TABLE IF EXISTS `purch_packing_slip`;
CREATE TABLE `purch_packing_slip`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `journal_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trans_date` datetime NULL DEFAULT NULL,
  `purch_id` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of purch_packing_slip
-- ----------------------------

-- ----------------------------
-- Table structure for purch_packing_slip_trans
-- ----------------------------
DROP TABLE IF EXISTS `purch_packing_slip_trans`;
CREATE TABLE `purch_packing_slip_trans`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `purch_packing_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `total_amount` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of purch_packing_slip_trans
-- ----------------------------

-- ----------------------------
-- Table structure for purch_req
-- ----------------------------
DROP TABLE IF EXISTS `purch_req`;
CREATE TABLE `purch_req`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `purch_req_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purch_req_date` datetime NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `approval_id` int NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `approve_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of purch_req
-- ----------------------------
INSERT INTO `purch_req` VALUES (2, 'PR-2100001', '2021-06-25 00:00:00', '', 1, NULL, 'ทดสอบ', 1624607345, 1, 1624607345, NULL, NULL);
INSERT INTO `purch_req` VALUES (3, 'PR-21-2100000', '2021-07-27 00:00:00', 'เทส', 4, NULL, 'เทส', 1627356865, 2, 1627357071, 2, NULL);
INSERT INTO `purch_req` VALUES (4, 'PR-2200002', '2022-01-22 00:00:00', '', 1, NULL, 'ทดแทน', 1642821654, 2, 1642821654, NULL, NULL);
INSERT INTO `purch_req` VALUES (5, 'PR-2200003', '2022-04-27 00:00:00', 'ลูกค้าใหม่', 4, NULL, 'ขายงาน', 1651047103, 2, 1651047442, 2, NULL);
INSERT INTO `purch_req` VALUES (6, 'PR-2200004', '2022-05-19 00:00:00', 'test', 0, NULL, '', 1652944770, 2, 1652945566, 2, NULL);
INSERT INTO `purch_req` VALUES (7, 'PR-2200005', '2022-05-19 00:00:00', 'test', 4, NULL, '', 1652945617, 2, 1652945703, 2, NULL);
INSERT INTO `purch_req` VALUES (10, 'PR-2100001', '2021-12-01 00:00:00', '', 4, NULL, '', 1638364109, NULL, 1638455587, NULL, NULL);
INSERT INTO `purch_req` VALUES (12, 'PR-2100009', '2021-12-01 00:00:00', '', 4, NULL, '', 1638364838, NULL, 1638455530, NULL, NULL);
INSERT INTO `purch_req` VALUES (13, 'PR-2100099', '2021-12-01 00:00:00', '', 4, NULL, '', 1638364908, NULL, 1638455553, NULL, NULL);
INSERT INTO `purch_req` VALUES (14, 'PR-2100100', '2021-12-01 00:00:00', '', 4, NULL, '', 1638364944, NULL, 1638455268, NULL, NULL);
INSERT INTO `purch_req` VALUES (15, 'PR-2100101', '2021-12-02 00:00:00', '', 4, NULL, '', 1638424624, NULL, 1638455001, NULL, NULL);
INSERT INTO `purch_req` VALUES (16, 'PR-2100102', '2021-12-02 00:00:00', '', 4, NULL, '', 1638433458, NULL, 1638454986, NULL, NULL);
INSERT INTO `purch_req` VALUES (17, 'PR-2100103', '2021-12-02 00:00:00', '', 4, NULL, '', 1638433786, NULL, 1638454920, NULL, NULL);
INSERT INTO `purch_req` VALUES (18, 'PR-2100104', '2021-12-02 00:00:00', '', 4, NULL, '', 1638455618, NULL, 1638456405, NULL, NULL);
INSERT INTO `purch_req` VALUES (19, 'PR-2100105', '2021-12-02 00:00:00', '', 4, NULL, '', 1638455669, NULL, 1638456726, NULL, NULL);
INSERT INTO `purch_req` VALUES (20, 'PR-2100106', '2021-12-02 00:00:00', '', 4, NULL, '', 1638456038, NULL, 1638456058, NULL, NULL);
INSERT INTO `purch_req` VALUES (21, 'PR-2100107', '2021-12-02 00:00:00', '', 4, NULL, '', 1638456423, NULL, 1638456431, NULL, NULL);
INSERT INTO `purch_req` VALUES (22, 'PR-2100108', '2021-12-02 00:00:00', '', 4, NULL, '', 1638456496, NULL, 1638456637, NULL, NULL);
INSERT INTO `purch_req` VALUES (23, 'PR-2100109', '2021-12-02 00:00:00', '', 4, NULL, '', 1638456739, NULL, 1638456746, NULL, NULL);
INSERT INTO `purch_req` VALUES (24, 'PR-2100110', '2021-12-02 00:00:00', '', 4, NULL, '', 1638456785, NULL, 1638456791, NULL, NULL);
INSERT INTO `purch_req` VALUES (25, 'PR-2100111', '2021-12-02 00:00:00', '', 4, NULL, '', 1638457724, NULL, 1638530441, 1, NULL);
INSERT INTO `purch_req` VALUES (26, 'PR-2100112', '2021-12-02 00:00:00', '', 4, NULL, '', 1638460808, NULL, 1638460960, NULL, NULL);
INSERT INTO `purch_req` VALUES (27, 'PR-2100113', '2021-12-03 00:00:00', '', 4, NULL, '', 1638530894, 1, 1638531519, 1, NULL);
INSERT INTO `purch_req` VALUES (28, 'PR-2100114', '2021-12-03 00:00:00', '', 4, NULL, '', 1638531581, 1, 1638531718, 1, NULL);
INSERT INTO `purch_req` VALUES (29, 'PR-2100115', '2021-12-03 00:00:00', '', 4, NULL, '', 1638531754, 1, 1638537994, 1, NULL);
INSERT INTO `purch_req` VALUES (30, 'PR-2200116', '2022-05-19 00:00:00', '', 1, NULL, '', 1652944940, 1, 1652944940, NULL, NULL);
INSERT INTO `purch_req` VALUES (31, 'PR-2200117', '2022-06-03 00:00:00', 'ครั้งที่1', 0, NULL, 'จำเป็น', 1654233853, 1, 1654235328, 1, NULL);
INSERT INTO `purch_req` VALUES (33, 'PR-2200118', '2022-06-03 00:00:00', 'ครั้งที่2', 4, NULL, 'จำเป็น', 1654235400, 1, 1654235953, 1, NULL);
INSERT INTO `purch_req` VALUES (34, 'PR-2200119', '2022-06-03 00:00:00', 'ครั้งที่3', 4, NULL, 'จำเป็น', 1654236955, 1, 1654236975, 1, NULL);
INSERT INTO `purch_req` VALUES (35, 'PR-2200120', '2022-09-03 00:00:00', 'dfd', 1, NULL, 'ทดสอบ', 1662168921, 1, 1662168921, NULL, '9646603ec3ad3362');
INSERT INTO `purch_req` VALUES (36, 'PR-2200121', '2022-09-03 00:00:00', 'fdfd', 1, NULL, 'ทดสอบ', 1662169132, 1, 1662169132, NULL, 'cb0abf1ff41b6cb7b43ef5679042d116');

-- ----------------------------
-- Table structure for purch_req_line
-- ----------------------------
DROP TABLE IF EXISTS `purch_req_line`;
CREATE TABLE `purch_req_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `purch_req_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `line_total` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `purch_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of purch_req_line
-- ----------------------------
INSERT INTO `purch_req_line` VALUES (12, 10, 1, 1, 500, 500, 5, NULL, NULL, 17);
INSERT INTO `purch_req_line` VALUES (14, 12, 2, 2, 200, 400, 5, NULL, NULL, 16);
INSERT INTO `purch_req_line` VALUES (15, 21, 1, 2, 500, 1, 5, NULL, NULL, 24);
INSERT INTO `purch_req_line` VALUES (16, 21, 2, 3, 200, 600, 5, NULL, NULL, 23);
INSERT INTO `purch_req_line` VALUES (17, 15, 1, 2, 500, 1, 5, NULL, NULL, 15);
INSERT INTO `purch_req_line` VALUES (18, 15, 2, 3, 200, 600, 5, NULL, NULL, 14);
INSERT INTO `purch_req_line` VALUES (19, 16, 1, 3, 500, 1, 5, NULL, NULL, 13);
INSERT INTO `purch_req_line` VALUES (20, 16, 2, 4, 200, 800, 5, NULL, NULL, 9);
INSERT INTO `purch_req_line` VALUES (21, 17, 3, 3, 1200, 3, 5, NULL, NULL, 10);
INSERT INTO `purch_req_line` VALUES (22, 21, 2, 4, 200, 800, 5, NULL, NULL, 22);
INSERT INTO `purch_req_line` VALUES (23, 21, 3, 2, 1200, 2, 5, NULL, NULL, 19);
INSERT INTO `purch_req_line` VALUES (24, 20, 1, 2, 500, 1, 1, NULL, NULL, NULL);
INSERT INTO `purch_req_line` VALUES (25, 21, 3, 3, 1200, 3, 1, NULL, NULL, NULL);
INSERT INTO `purch_req_line` VALUES (26, 22, 2, 2, 200, 400, 5, NULL, NULL, 18);
INSERT INTO `purch_req_line` VALUES (27, 23, 2, 2, 200, 400, 5, NULL, NULL, 20);
INSERT INTO `purch_req_line` VALUES (28, 24, 3, 2, 1200, 2, 5, NULL, NULL, 21);
INSERT INTO `purch_req_line` VALUES (29, 25, 1, 2, 500, 1, 5, NULL, NULL, NULL);
INSERT INTO `purch_req_line` VALUES (30, 26, 2, 2, 200, 400, 5, NULL, NULL, NULL);
INSERT INTO `purch_req_line` VALUES (31, 27, 2, 2, 200, 400, 5, NULL, NULL, 26);
INSERT INTO `purch_req_line` VALUES (32, 28, 3, 2, 1200, 2, 5, NULL, NULL, 27);
INSERT INTO `purch_req_line` VALUES (33, 29, 2, 2, 200, 400, 5, NULL, NULL, 25);
INSERT INTO `purch_req_line` VALUES (34, 30, 2, 3, 200, 600, 1, NULL, NULL, NULL);
INSERT INTO `purch_req_line` VALUES (35, 31, 2, 4, 200, 800, 1, NULL, NULL, NULL);
INSERT INTO `purch_req_line` VALUES (36, 31, 3, 2, 1200, 2400, 1, NULL, NULL, NULL);
INSERT INTO `purch_req_line` VALUES (37, 33, 2, 1, 200, 200, 4, NULL, NULL, NULL);
INSERT INTO `purch_req_line` VALUES (38, 33, 3, 2, 1200, 2400, 5, NULL, NULL, 28);
INSERT INTO `purch_req_line` VALUES (39, 34, 1, 4, 500, 2000, 5, NULL, NULL, 29);
INSERT INTO `purch_req_line` VALUES (40, 34, 2, 4, 200, 800, 5, NULL, NULL, 29);
INSERT INTO `purch_req_line` VALUES (41, 34, 3, 4, 1200, 4800, 5, NULL, NULL, 29);
INSERT INTO `purch_req_line` VALUES (42, 35, 3, 2, 1200, 2400, 1, NULL, NULL, NULL);
INSERT INTO `purch_req_line` VALUES (43, 36, 2, 2, 200, 400, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for quotation
-- ----------------------------
DROP TABLE IF EXISTS `quotation`;
CREATE TABLE `quotation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quotation_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quotation_date` datetime NULL DEFAULT NULL,
  `estimate_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  `service_type_id` int NULL DEFAULT NULL,
  `sale_emp_id` int NULL DEFAULT NULL,
  `period_type_id` int NULL DEFAULT NULL,
  `credit_term` int NULL DEFAULT NULL,
  `amount` float NULL DEFAULT NULL,
  `sale_tax` float NULL DEFAULT NULL,
  `total` float NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_total` float NULL DEFAULT NULL,
  `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quotation
-- ----------------------------
INSERT INTO `quotation` VALUES (2, 'QT-2200002', '2022-05-21 00:00:00', 8, 1, 1653132154, 1, 1653132154, NULL, 2, 1, NULL, NULL, NULL, NULL, 113.512, 1735.11, '', 1621.6, '');
INSERT INTO `quotation` VALUES (3, 'QT-2200003', '1970-01-01 00:00:00', 7, 1, 1653132290, 1, 1653281329, 1, 2, 1, NULL, 1, 1, NULL, 175, 2675, '', 2500, 'hello ');
INSERT INTO `quotation` VALUES (4, 'QT-2200004', '1970-01-01 00:00:00', 9, 2, 1653281470, 1, 1654010860, 1, 2, 1, 1, 1, 2, NULL, 350, 5350, '', 5000, 'hello ');
INSERT INTO `quotation` VALUES (5, 'QT-2200005', '2022-05-31 00:00:00', 6, 2, 1654009744, NULL, 1654009744, NULL, 1, 1, NULL, 1, NULL, NULL, 210, 3210, '', 3000, 'hello ');
INSERT INTO `quotation` VALUES (6, 'QT-2200006', '2022-06-03 00:00:00', 10, 2, 1654239299, 1, 1654239299, NULL, 4, 9, NULL, 1, 1, NULL, 700, 10700, '', 10000, 'หนู/ปลวก');
INSERT INTO `quotation` VALUES (7, 'QT26020001', '2026-02-10 17:36:10', NULL, 3, 1770719770, 15, 1770790671, 15, 4, 9, NULL, NULL, 1, NULL, 700, 10700, '', 10000, 'หนู/ปลวก');

-- ----------------------------
-- Table structure for quotation_job
-- ----------------------------
DROP TABLE IF EXISTS `quotation_job`;
CREATE TABLE `quotation_job`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quotation_id` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `task_job_id` int NULL DEFAULT NULL,
  `task_job_method_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quotation_job
-- ----------------------------
INSERT INTO `quotation_job` VALUES (1, 1, 'กำจัดแมลง', 0, 1650946299, 1, NULL, NULL, NULL, NULL);
INSERT INTO `quotation_job` VALUES (2, 1, 'กำจัดแมลง500', 0, 1650946299, 1, NULL, NULL, NULL, NULL);
INSERT INTO `quotation_job` VALUES (3, 2, 'มด-แมลงสาบ', 0, 1651033961, 1, NULL, NULL, NULL, NULL);
INSERT INTO `quotation_job` VALUES (4, 2, 'หนู : 8iyh', 0, 1651033961, 1, NULL, NULL, NULL, NULL);
INSERT INTO `quotation_job` VALUES (5, 2, 'หนู : ครั้งที่ 1', 0, 1651034446, 1, NULL, NULL, NULL, NULL);
INSERT INTO `quotation_job` VALUES (6, 2, 'หนู : ตลอดอายุสัญญา', 0, 1651034446, 1, NULL, NULL, NULL, NULL);
INSERT INTO `quotation_job` VALUES (7, 2, 'วิธีป้องกัน มด-แมลงสาบ', 0, 1651040239, 1, NULL, NULL, NULL, NULL);
INSERT INTO `quotation_job` VALUES (8, 2, 'วิธีป้องกัน หนู : ครั้งที่ 1', 0, 1651040239, 1, NULL, NULL, NULL, NULL);
INSERT INTO `quotation_job` VALUES (9, 2, 'วิธีป้องกัน หนู : ตลอดอายุสัญญา', 0, 1651040239, 1, NULL, NULL, NULL, NULL);
INSERT INTO `quotation_job` VALUES (10, 4, '1', 0, 1652929295, 1, NULL, NULL, 1, 5);
INSERT INTO `quotation_job` VALUES (11, 4, '2', 0, 1652929295, 1, NULL, NULL, 2, 3);
INSERT INTO `quotation_job` VALUES (12, 4, '3', 0, 1652929295, 1, NULL, NULL, 3, 1);
INSERT INTO `quotation_job` VALUES (13, 7, '1', 0, 1652947710, 1, NULL, NULL, 1, 5);
INSERT INTO `quotation_job` VALUES (14, 7, '2', 0, 1652947710, 1, NULL, NULL, 2, 3);
INSERT INTO `quotation_job` VALUES (15, 8, '1', 0, 1652954040, 1, NULL, NULL, 1, 5);
INSERT INTO `quotation_job` VALUES (16, 8, '3', 0, 1652954040, 1, NULL, NULL, 3, 8);
INSERT INTO `quotation_job` VALUES (17, 8, '5', 0, 1652954041, 1, NULL, NULL, 5, 11);
INSERT INTO `quotation_job` VALUES (18, 8, '6', 0, 1652954041, 1, NULL, NULL, 6, 15);
INSERT INTO `quotation_job` VALUES (19, 4, '12', 0, 1654010856, 1, NULL, NULL, 12, 27);
INSERT INTO `quotation_job` VALUES (20, 6, '12', 0, 1654240274, 1, NULL, NULL, 12, 27);

-- ----------------------------
-- Table structure for quotation_job_line
-- ----------------------------
DROP TABLE IF EXISTS `quotation_job_line`;
CREATE TABLE `quotation_job_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quotation_job_id` int NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `quotation_id` int NULL DEFAULT NULL,
  `job_count` int NULL DEFAULT NULL,
  `job_interval` int NULL DEFAULT NULL,
  `interval_type` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quotation_job_line
-- ----------------------------
INSERT INTO `quotation_job_line` VALUES (1, 1, 'หหหกกหกห', 0, 1, 4, NULL, 1);
INSERT INTO `quotation_job_line` VALUES (2, 2, 'ดดดดกด', 0, 1, 4, NULL, 1);
INSERT INTO `quotation_job_line` VALUES (7, 7, '- เจ้าหน้าที่ทำการสเปรย์ยาบริเวณขอบอาคารรอบนอก ของอาคารสำนักงาน ,อาคารโรงงาน , โกดัง , โรงอาหาร  เพื่อ\r\nไม่ให้มีการเพิ่มจำนวน เช่น บริเวณท่อน้ำทิ้ง , จุดอับต่าง ๆ ,รอยแตกร้าวของโครงสร้างอาคาร \r\n', 0, 2, 4, NULL, NULL);
INSERT INTO `quotation_job_line` VALUES (8, 8, '- เจ้าหน้าที่ทำการกำหนดจุดวางกล่องเหยื่อ    รอบนอกอาคารโรงงาน        10   จุด  / หรือตามความเหมาะสม', 0, 2, NULL, NULL, NULL);
INSERT INTO `quotation_job_line` VALUES (9, 9, ' - เจ้าหน้าที่ทำการตรวจเช็คผลการกัดแทะของหนูและทำการเปลี่ยนเหยื่อใหม่ทุกครั้งที่เข้าทำบริการ ', 0, 2, NULL, NULL, NULL);
INSERT INTO `quotation_job_line` VALUES (13, 13, 'เจ้าหน้าที่ทำการกำหนดจุดพร้อมติดตั้งกล่องเหยื่อพิษรอบนอก พร้อมเปลี่ยนเหยื่อใหม่ทุกครั้งที่เข้าทำบริการ', 0, 7, 7, 12, 1);
INSERT INTO `quotation_job_line` VALUES (14, 14, 'เจ้าหน้าที่ทำการติดตั้งท่อแข็ง ลักษณะการวางและขนาดบ้านตามแบบ', 0, 7, 1, 1, 1);
INSERT INTO `quotation_job_line` VALUES (15, 15, 'เจ้าหน้าที่ทำการกำหนดจุดพร้อมติดตั้งกล่องเหยื่อพิษรอบนอก พร้อมเปลี่ยนเหยื่อใหม่ทุกครั้งที่เข้าทำบริการ จำนวน 12 จุด', 0, 8, 30, 12, 1);
INSERT INTO `quotation_job_line` VALUES (16, 15, 'เจ้าหน้าที่ทำการกำหนดจุดพร้อมติดตั้งกล่องกาวดักหนูภายใน พร้อมเปลี่ยนกาวใหม่ทุกครั้งที่เข้าทำบริการ จำนวน 9 จุด', 0, 8, 30, 12, 1);
INSERT INTO `quotation_job_line` VALUES (17, 16, 'เจ้าหน้าที่จะทำการอัดน้ำยาป้องกันปลวกด้วยเครื่องแรงดันสูงเข้าตามจุดหัวท่อรอบนอกอาคาร พร้อมฉีดพรมพื้นที่รอบนอกอาคารทุกตารางเมตร', 0, 8, 1, 1, 1);
INSERT INTO `quotation_job_line` VALUES (18, 17, 'เจ้าหน้าที่จะทำการสเปรย์น้ำยาตามรอยแตกรอยแยกขอบอาคาร และจุดเสี่ยงต่างๆ เพื่อป้องกันการเกิดใหม่ของแมลงคลาน', 0, 8, 30, 12, 1);
INSERT INTO `quotation_job_line` VALUES (19, 18, 'เจ้าหน้าที่จะทำการพ่นละอองตามจุดเสี่ยง เช่น ท่อระบายน้ำ จุดพักขยะ พุ่มไม้ ผนังอาคาร เพื่อป้องกันการเกิดใหม่ของแมลงบิน', 0, 8, 30, 12, 1);
INSERT INTO `quotation_job_line` VALUES (20, 19, 'dfds', 0, 4, 7, 12, 1);
INSERT INTO `quotation_job_line` VALUES (21, 20, 'dfds', 0, 6, 1, 12, 3);

-- ----------------------------
-- Table structure for quotation_line
-- ----------------------------
DROP TABLE IF EXISTS `quotation_line`;
CREATE TABLE `quotation_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quotation_id` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price_per_unit` float NULL DEFAULT NULL,
  `unit_id` int NULL DEFAULT NULL,
  `qty` int NULL DEFAULT NULL,
  `line_total` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of quotation_line
-- ----------------------------
INSERT INTO `quotation_line` VALUES (2, 2, NULL, 'sasaaa', 1621.6, NULL, 1, 1621.6, 1);
INSERT INTO `quotation_line` VALUES (3, 3, NULL, 'fdsdsfdfssf', 2500, NULL, 1, NULL, 1);
INSERT INTO `quotation_line` VALUES (4, 4, NULL, 'gggggggggggggggggggggg', 5000, NULL, 1, NULL, 1);
INSERT INTO `quotation_line` VALUES (5, 5, NULL, 'aaaaa', 3000, NULL, 1, 3000, 1);
INSERT INTO `quotation_line` VALUES (6, 6, NULL, 'กำจัดปลวก', 10000, NULL, 1, 10000, 1);
INSERT INTO `quotation_line` VALUES (7, 7, NULL, 'กำจัดปลวก', 10000, NULL, 1, 10000, 1);

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estimate_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES (1, 'SV-2200001', 1, 0, 2, NULL, NULL);
INSERT INTO `service` VALUES (2, 'SV-2600001', 5, 0, 15, NULL, 1770732177);
INSERT INTO `service` VALUES (3, 'SV-2600002', 4, 0, 15, NULL, 1770792413);
INSERT INTO `service` VALUES (4, 'SV-2600003', 11, 0, 15, NULL, 1770793403);

-- ----------------------------
-- Table structure for service_plan
-- ----------------------------
DROP TABLE IF EXISTS `service_plan`;
CREATE TABLE `service_plan`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `plan_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quotation_id` int NULL DEFAULT NULL,
  `contract_id` int NULL DEFAULT NULL,
  `quotation_job_id` int NULL DEFAULT NULL,
  `quoation_job_line_id` int NULL DEFAULT NULL,
  `target_date` datetime NULL DEFAULT NULL,
  `confirm_date` datetime NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interval_no` int NULL DEFAULT NULL,
  `car_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of service_plan
-- ----------------------------
INSERT INTO `service_plan` VALUES (1, 'SP-2200001', 4, 5, 10, NULL, '2022-05-19 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (2, 'SP-2200002', 4, 5, 10, NULL, '2022-05-23 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (3, 'SP-2200003', 4, 5, 10, NULL, '2022-05-27 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (4, 'SP-2200004', 4, 5, 10, NULL, '2022-05-31 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (5, 'SP-2200005', 4, 5, 10, NULL, '2022-06-04 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (6, 'SP-2200006', 4, 5, 10, NULL, '2022-06-08 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (7, 'SP-2200007', 4, 5, 10, NULL, '2022-06-12 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (8, 'SP-2200008', 4, 5, 10, NULL, '2022-06-16 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (9, 'SP-2200009', 4, 5, 10, NULL, '2022-06-20 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (10, 'SP-2200010', 4, 5, 10, NULL, '2022-06-24 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (11, 'SP-2200011', 7, 6, 13, 13, '2022-05-19 00:00:00', '2022-05-21 00:00:00', 2, '000', 0, 3);
INSERT INTO `service_plan` VALUES (12, 'SP-2200012', 7, 6, 13, 13, '2022-05-26 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (13, 'SP-2200013', 7, 6, 13, 13, '2022-06-02 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (14, 'SP-2200014', 7, 6, 13, 13, '2022-06-09 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (15, 'SP-2200015', 7, 6, 13, 13, '2022-06-16 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (16, 'SP-2200016', 7, 6, 13, 13, '2022-06-23 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (17, 'SP-2200017', 7, 6, 13, 13, '2022-06-30 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (18, 'SP-2200018', 7, 6, 13, 13, '2022-07-07 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (19, 'SP-2200019', 7, 6, 13, 13, '2022-07-14 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (20, 'SP-2200020', 7, 6, 13, 13, '2022-07-21 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (21, 'SP-2200021', 7, 6, 13, 13, '2022-07-28 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (22, 'SP-2200022', 7, 6, 13, 13, '2022-08-04 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (23, 'SP-2200023', 7, 6, 14, 14, '2022-05-19 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (24, 'SP-2200024', 8, 7, 15, 15, '2022-05-19 00:00:00', '2022-05-24 00:00:00', 2, '', 0, 2);
INSERT INTO `service_plan` VALUES (25, 'SP-2200025', 8, 7, 15, 15, '2022-06-18 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (26, 'SP-2200026', 8, 7, 15, 15, '2022-07-18 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (27, 'SP-2200027', 8, 7, 15, 15, '2022-08-17 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (28, 'SP-2200028', 8, 7, 15, 15, '2022-09-16 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (29, 'SP-2200029', 8, 7, 15, 15, '2022-10-16 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (30, 'SP-2200030', 8, 7, 15, 15, '2022-11-15 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (31, 'SP-2200031', 8, 7, 15, 15, '2022-12-15 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (32, 'SP-2200032', 8, 7, 15, 15, '2023-01-14 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (33, 'SP-2200033', 8, 7, 15, 15, '2023-02-13 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (34, 'SP-2200034', 8, 7, 15, 15, '2023-03-15 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (35, 'SP-2200035', 8, 7, 15, 15, '2023-04-14 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (36, 'SP-2200036', 8, 7, 16, 17, '2022-05-19 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (37, 'SP-2200037', 8, 7, 17, 18, '2022-05-19 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (38, 'SP-2200038', 8, 7, 17, 18, '2022-06-18 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (39, 'SP-2200039', 8, 7, 17, 18, '2022-07-18 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (40, 'SP-2200040', 8, 7, 17, 18, '2022-08-17 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (41, 'SP-2200041', 8, 7, 17, 18, '2022-09-16 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (42, 'SP-2200042', 8, 7, 17, 18, '2022-10-16 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (43, 'SP-2200043', 8, 7, 17, 18, '2022-11-15 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (44, 'SP-2200044', 8, 7, 17, 18, '2022-12-15 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (45, 'SP-2200045', 8, 7, 17, 18, '2023-01-14 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (46, 'SP-2200046', 8, 7, 17, 18, '2023-02-13 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (47, 'SP-2200047', 8, 7, 17, 18, '2023-03-15 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (48, 'SP-2200048', 8, 7, 17, 18, '2023-04-14 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (49, 'SP-2200049', 8, 7, 18, 19, '2022-05-19 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (50, 'SP-2200050', 8, 7, 18, 19, '2022-06-18 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (51, 'SP-2200051', 8, 7, 18, 19, '2022-07-18 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (52, 'SP-2200052', 8, 7, 18, 19, '2022-08-17 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (53, 'SP-2200053', 8, 7, 18, 19, '2022-09-16 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (54, 'SP-2200054', 8, 7, 18, 19, '2022-10-16 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (55, 'SP-2200055', 8, 7, 18, 19, '2022-11-15 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (56, 'SP-2200056', 8, 7, 18, 19, '2022-12-15 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (57, 'SP-2200057', 8, 7, 18, 19, '2023-01-14 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (58, 'SP-2200058', 8, 7, 18, 19, '2023-02-13 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (59, 'SP-2200059', 8, 7, 18, 19, '2023-03-15 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (60, 'SP-2200060', 8, 7, 18, 19, '2023-04-14 00:00:00', '2022-06-15 00:00:00', 2, '', 0, 1);
INSERT INTO `service_plan` VALUES (61, 'SP-2200061', 4, 8, 19, 20, '2022-05-31 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (62, 'SP-2200062', 4, 8, 19, 20, '2022-06-07 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (63, 'SP-2200063', 4, 8, 19, 20, '2022-06-14 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (64, 'SP-2200064', 4, 8, 19, 20, '2022-06-21 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (65, 'SP-2200065', 4, 8, 19, 20, '2022-06-28 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (66, 'SP-2200066', 4, 8, 19, 20, '2022-07-05 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (67, 'SP-2200067', 4, 8, 19, 20, '2022-07-12 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (68, 'SP-2200068', 4, 8, 19, 20, '2022-07-19 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (69, 'SP-2200069', 4, 8, 19, 20, '2022-07-26 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (70, 'SP-2200070', 4, 8, 19, 20, '2022-08-02 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (71, 'SP-2200071', 4, 8, 19, 20, '2022-08-09 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (72, 'SP-2200072', 4, 8, 19, 20, '2022-08-16 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (73, 'SP-2200073', 6, 10, 20, 21, '2022-06-03 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (74, 'SP-2200074', 6, 10, 20, 21, '2022-06-04 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (75, 'SP-2200075', 6, 10, 20, 21, '2022-06-05 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (76, 'SP-2200076', 6, 10, 20, 21, '2022-06-06 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (77, 'SP-2200077', 6, 10, 20, 21, '2022-06-07 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (78, 'SP-2200078', 6, 10, 20, 21, '2022-06-08 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (79, 'SP-2200079', 6, 10, 20, 21, '2022-06-09 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (80, 'SP-2200080', 6, 10, 20, 21, '2022-06-10 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (81, 'SP-2200081', 6, 10, 20, 21, '2022-06-11 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (82, 'SP-2200082', 6, 10, 20, 21, '2022-06-12 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (83, 'SP-2200083', 6, 10, 20, 21, '2022-06-13 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (84, 'SP-2200084', 6, 10, 20, 21, '2022-06-14 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (85, 'SP-2200085', 6, 10, 20, 21, '2022-06-03 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (86, 'SP-2200086', 6, 10, 20, 21, '2022-06-04 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (87, 'SP-2200087', 6, 10, 20, 21, '2022-06-05 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (88, 'SP-2200088', 6, 10, 20, 21, '2022-06-06 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (89, 'SP-2200089', 6, 10, 20, 21, '2022-06-07 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (90, 'SP-2200090', 6, 10, 20, 21, '2022-06-08 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (91, 'SP-2200091', 6, 10, 20, 21, '2022-06-09 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (92, 'SP-2200092', 6, 10, 20, 21, '2022-06-10 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (93, 'SP-2200093', 6, 10, 20, 21, '2022-06-11 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (94, 'SP-2200094', 6, 10, 20, 21, '2022-06-12 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (95, 'SP-2200095', 6, 10, 20, 21, '2022-06-13 00:00:00', '2022-06-13 00:00:00', 2, '', 0, 2);
INSERT INTO `service_plan` VALUES (96, 'SP-2200096', 6, 10, 20, 21, '2026-02-10 00:00:00', NULL, 1, '', 0, 2);
INSERT INTO `service_plan` VALUES (97, 'SP-2200095', 6, 10, 20, 21, '2026-02-10 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (98, 'SP-2200094', 6, 10, 20, 21, '2026-02-11 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (99, 'SP-2200093', 6, 10, 20, 21, '2026-02-12 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (100, 'SP-2200092', 6, 10, 20, 21, '2026-02-13 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (101, 'SP-2200091', 6, 10, 20, 21, '2026-02-14 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (102, 'SP-2200090', 6, 10, 20, 21, '2026-02-15 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (103, 'SP-2200089', 6, 10, 20, 21, '2026-02-16 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (104, 'SP-2200088', 6, 10, 20, 21, '2026-02-17 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (105, 'SP-2200087', 6, 10, 20, 21, '2026-02-18 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (106, 'SP-2200086', 6, 10, 20, 21, '2026-02-19 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (107, 'SP-2200085', 6, 10, 20, 21, '2026-02-20 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (108, 'SP-2200084', 6, 10, 20, 21, '2026-02-21 00:00:00', NULL, 1, NULL, 0, NULL);
INSERT INTO `service_plan` VALUES (109, 'SP-2200083', 7, 11, 13, 13, '2026-02-11 00:00:00', NULL, 1, NULL, 1, NULL);
INSERT INTO `service_plan` VALUES (110, 'SP-2200082', 7, 11, 13, 13, '2026-02-18 00:00:00', NULL, 1, NULL, 2, NULL);
INSERT INTO `service_plan` VALUES (111, 'SP-2200081', 7, 11, 13, 13, '2026-02-25 00:00:00', NULL, 1, NULL, 3, NULL);
INSERT INTO `service_plan` VALUES (112, 'SP-2200080', 7, 11, 13, 13, '2026-03-04 00:00:00', NULL, 1, NULL, 4, NULL);
INSERT INTO `service_plan` VALUES (113, 'SP-2200079', 7, 11, 13, 13, '2026-03-11 00:00:00', NULL, 1, NULL, 5, NULL);
INSERT INTO `service_plan` VALUES (114, 'SP-2200078', 7, 11, 13, 13, '2026-03-18 00:00:00', NULL, 1, NULL, 6, NULL);
INSERT INTO `service_plan` VALUES (115, 'SP-2200077', 7, 11, 13, 13, '2026-03-25 00:00:00', NULL, 1, NULL, 7, NULL);
INSERT INTO `service_plan` VALUES (116, 'SP-2200076', 7, 11, 13, 13, '2026-04-01 00:00:00', NULL, 1, NULL, 8, NULL);
INSERT INTO `service_plan` VALUES (117, 'SP-2200075', 7, 11, 13, 13, '2026-04-08 00:00:00', NULL, 1, NULL, 9, NULL);
INSERT INTO `service_plan` VALUES (118, 'SP-2200074', 7, 11, 13, 13, '2026-04-15 00:00:00', NULL, 1, NULL, 10, NULL);
INSERT INTO `service_plan` VALUES (119, 'SP-2200073', 7, 11, 13, 13, '2026-04-22 00:00:00', NULL, 1, NULL, 11, NULL);
INSERT INTO `service_plan` VALUES (120, 'SP-2200072', 7, 11, 13, 13, '2026-04-29 00:00:00', NULL, 1, NULL, 12, NULL);
INSERT INTO `service_plan` VALUES (121, 'SP-2200071', 7, 11, 14, 14, '2026-02-11 00:00:00', NULL, 1, NULL, 1, NULL);

-- ----------------------------
-- Table structure for service_type
-- ----------------------------
DROP TABLE IF EXISTS `service_type`;
CREATE TABLE `service_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updaated_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of service_type
-- ----------------------------
INSERT INTO `service_type` VALUES (1, 'aaa', '', 1, 1653023945, 1, 1653023945, NULL);
INSERT INTO `service_type` VALUES (8, 'งาน Pest Control ', 'งานควบคุมและกำจัดสัตว์พาหะในพื้นที่ตามหลัก GMP เช่น หนู มด แมลงสาบ แมลงบิน', 1, 1651811856, 11, 1651811856, NULL);
INSERT INTO `service_type` VALUES (9, 'งานกำจัดและป้องกันปลวก', 'งานกำจัดและป้องกันปลวกในอาคาร บ้านพัก ด้วยวิธีที่เหมาะสม', 1, 1651811901, 11, 1651811901, NULL);
INSERT INTO `service_type` VALUES (10, 'งานวางท่อ', 'งานติดตั้งระบบท่ออัดน้ำยาป้องกันปลวกที่ฐานราก', 1, 1651811954, 11, 1651811954, NULL);
INSERT INTO `service_type` VALUES (11, 'งานกวาดล้าง', 'งานกำจัดสัตว์พาหะบางชนิด และป้องกันไม่ให้เกิดซ้ำ ', 1, 1651812101, 11, 1651812101, NULL);

-- ----------------------------
-- Table structure for standard_price
-- ----------------------------
DROP TABLE IF EXISTS `standard_price`;
CREATE TABLE `standard_price`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `journal_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_date` datetime NULL DEFAULT NULL,
  `to_date` datetime NULL DEFAULT NULL,
  `for_emp_id` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of standard_price
-- ----------------------------
INSERT INTO `standard_price` VALUES (1, 'SP-2200001', '2022-05-20 00:00:00', '2022-05-20 00:00:00', 2, 1653024267, 1653024267, 1, NULL, 0);
INSERT INTO `standard_price` VALUES (2, 'SP-2200002', '2022-06-03 00:00:00', '2022-06-03 00:00:00', 2, 1654237141, 1654237141, 1, NULL, 0);
INSERT INTO `standard_price` VALUES (3, 'SP-2200003', '2022-06-03 00:00:00', '2022-06-03 00:00:00', NULL, 1654237202, 1654237202, 1, NULL, 0);

-- ----------------------------
-- Table structure for standard_price_line
-- ----------------------------
DROP TABLE IF EXISTS `standard_price_line`;
CREATE TABLE `standard_price_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `standard_price_id` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `price1` float NULL DEFAULT NULL,
  `price2` float NULL DEFAULT NULL,
  `price3` float NULL DEFAULT NULL,
  `unit1` int NULL DEFAULT NULL,
  `unit2` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of standard_price_line
-- ----------------------------
INSERT INTO `standard_price_line` VALUES (1, 1, 1, 500, 2, 20, NULL, NULL, 0);
INSERT INTO `standard_price_line` VALUES (2, 2, 2, 200, 8, 50, NULL, NULL, 0);
INSERT INTO `standard_price_line` VALUES (3, 3, 3, 1200, 50, 400, NULL, NULL, 0);

-- ----------------------------
-- Table structure for stock_count
-- ----------------------------
DROP TABLE IF EXISTS `stock_count`;
CREATE TABLE `stock_count`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `journal_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trans_date` datetime NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stock_count
-- ----------------------------
INSERT INTO `stock_count` VALUES (1, 'CN-2200001', '1970-01-01 00:00:00', 1, 1651018135, 1);
INSERT INTO `stock_count` VALUES (2, 'CN-2200002', '1970-01-01 00:00:00', 2, 1651026071, 2);
INSERT INTO `stock_count` VALUES (3, 'SC001', '2026-02-10 00:00:00', 1, 1770707781, 15);

-- ----------------------------
-- Table structure for stock_count_line
-- ----------------------------
DROP TABLE IF EXISTS `stock_count_line`;
CREATE TABLE `stock_count_line`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_count_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `counted` float NULL DEFAULT NULL,
  `diff_qty` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `trans_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stock_count_line
-- ----------------------------
INSERT INTO `stock_count_line` VALUES (1, 1, 3, 4, 0, 0, 1, '2022-04-27 00:00:00');
INSERT INTO `stock_count_line` VALUES (2, 1, 2, 2, 0, 0, 1, '2022-04-27 00:00:00');
INSERT INTO `stock_count_line` VALUES (3, 1, 8, 8, 0, 0, 1, '2022-04-27 00:00:00');
INSERT INTO `stock_count_line` VALUES (4, 1, 4, 4, 0, 0, 1, '2022-04-27 00:00:00');
INSERT INTO `stock_count_line` VALUES (5, 2, 3, 4, 0, 0, 1, '2022-04-27 00:00:00');
INSERT INTO `stock_count_line` VALUES (6, 2, 2, 2, 0, 0, 1, '2022-04-27 00:00:00');
INSERT INTO `stock_count_line` VALUES (7, 2, 8, 8, 0, 0, 1, '2022-04-27 00:00:00');
INSERT INTO `stock_count_line` VALUES (8, 2, 4, 4, 0, 0, 1, '2022-04-27 00:00:00');

-- ----------------------------
-- Table structure for stock_sum
-- ----------------------------
DROP TABLE IF EXISTS `stock_sum`;
CREATE TABLE `stock_sum`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `warehouse_id` int NULL DEFAULT NULL,
  `location_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `warehouse_type` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stock_sum
-- ----------------------------
INSERT INTO `stock_sum` VALUES (3, 1, 1, 1, 2, 1, 1624591262, NULL, 1654236997, NULL, NULL);
INSERT INTO `stock_sum` VALUES (4, 3, 1, 1, 11, 1, 1638433804, NULL, 1654236997, NULL, NULL);
INSERT INTO `stock_sum` VALUES (5, 2, 1, 1, 4, 1, 1638442533, NULL, 1654236997, NULL, NULL);

-- ----------------------------
-- Table structure for stock_trans
-- ----------------------------
DROP TABLE IF EXISTS `stock_trans`;
CREATE TABLE `stock_trans`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `trans_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trans_date` datetime NULL DEFAULT NULL,
  `trans_module_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `trans_stock_type` int NULL DEFAULT NULL,
  `ref_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stock_trans
-- ----------------------------
INSERT INTO `stock_trans` VALUES (4, '', '2021-06-25 10:21:02', 2, 1, 1, NULL, 1, NULL, NULL, 1624591262, NULL, 1624591262, NULL);
INSERT INTO `stock_trans` VALUES (5, '', '2021-09-26 15:41:16', 3, 1, 2, NULL, 1, NULL, NULL, 1632645676, NULL, 1632645676, NULL);
INSERT INTO `stock_trans` VALUES (6, '', '2021-12-02 15:30:04', 3, 3, 3, NULL, 1, NULL, NULL, 1638433804, NULL, 1638433804, NULL);
INSERT INTO `stock_trans` VALUES (7, '', '2021-12-02 17:55:33', 3, 2, 0, NULL, 1, NULL, NULL, 1638442533, NULL, 1638442533, NULL);
INSERT INTO `stock_trans` VALUES (8, '', '2021-12-02 17:55:33', 3, 1, 1, NULL, 1, NULL, NULL, 1638442533, NULL, 1638442533, NULL);
INSERT INTO `stock_trans` VALUES (9, 'RC-2100001', '2021-12-02 20:20:27', 3, 2, 0, NULL, 1, NULL, NULL, 1638451227, NULL, 1638451227, NULL);
INSERT INTO `stock_trans` VALUES (10, 'RC-2100002', '2021-12-02 20:20:27', 3, 1, 1, NULL, 1, NULL, NULL, 1638451227, NULL, 1638451227, NULL);
INSERT INTO `stock_trans` VALUES (13, 'IS-2100001', '2021-12-02 21:16:09', 4, 1, 1, NULL, 2, NULL, NULL, 1638454569, NULL, 1638454569, NULL);
INSERT INTO `stock_trans` VALUES (14, 'RC-2200003', '2022-05-05 21:41:48', 3, 3, 1, NULL, 1, 19, NULL, 1651761708, NULL, 1651761708, NULL);
INSERT INTO `stock_trans` VALUES (15, 'RC-2200004', '2022-05-05 21:43:48', 3, 3, 1, NULL, 1, 19, NULL, 1651761828, NULL, 1651761828, NULL);
INSERT INTO `stock_trans` VALUES (16, 'RC-2200005', '2022-05-19 14:18:42', 3, 2, 1, NULL, 1, 25, NULL, 1652944722, NULL, 1652944722, NULL);
INSERT INTO `stock_trans` VALUES (17, 'RC-2200006', '2022-05-19 14:21:07', 3, 2, 1, NULL, 1, 25, NULL, 1652944867, NULL, 1652944867, NULL);
INSERT INTO `stock_trans` VALUES (18, 'RC-2200007', '2022-05-19 14:23:22', 3, 2, 1, NULL, 1, 26, NULL, 1652945002, NULL, 1652945002, NULL);
INSERT INTO `stock_trans` VALUES (19, 'RC-2200008', '2022-05-19 14:27:32', 3, 2, 1, NULL, 1, 26, NULL, 1652945252, NULL, 1652945252, NULL);
INSERT INTO `stock_trans` VALUES (20, 'RC-2200009', '2022-05-19 14:40:40', 3, 3, 1, NULL, 1, 27, NULL, 1652946040, NULL, 1652946040, NULL);
INSERT INTO `stock_trans` VALUES (21, 'RC-2200010', '2022-05-19 14:40:52', 3, 3, 1, NULL, 1, 27, NULL, 1652946052, NULL, 1652946052, NULL);
INSERT INTO `stock_trans` VALUES (22, 'RC-2200011', '2022-06-03 13:14:50', 3, 3, 1, NULL, 1, 28, NULL, 1654236890, NULL, 1654236890, NULL);
INSERT INTO `stock_trans` VALUES (23, 'RC-2200012', '2022-06-03 13:15:25', 3, 3, 1, NULL, 1, 28, NULL, 1654236925, NULL, 1654236925, NULL);
INSERT INTO `stock_trans` VALUES (24, 'RC-2200013', '2022-06-03 13:16:37', 3, 3, 3, NULL, 1, 29, NULL, 1654236997, NULL, 1654236997, NULL);
INSERT INTO `stock_trans` VALUES (25, 'RC-2200014', '2022-06-03 13:16:37', 3, 2, 2, NULL, 1, 29, NULL, 1654236997, NULL, 1654236997, NULL);
INSERT INTO `stock_trans` VALUES (26, 'RC-2200015', '2022-06-03 13:16:37', 3, 1, 2, NULL, 1, 29, NULL, 1654236997, NULL, 1654236997, NULL);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 'การควบคุมและป้องกันหนู', '', NULL, 1651646171, 11, 1651805560, 11);
INSERT INTO `task` VALUES (2, 'งานวางท่อ', '', NULL, 1651646274, 11, 1651805209, 11);
INSERT INTO `task` VALUES (3, 'การกำจัดและป้องกันปลวก', '', NULL, 1651646286, 11, 1651646286, NULL);
INSERT INTO `task` VALUES (5, 'การควบคุมและป้องกันมด แมลงสาบ', '', NULL, 1651806698, 11, 1651806698, NULL);
INSERT INTO `task` VALUES (6, 'การควบคุมและป้องกันยุง แมลงวัน แมลงบิน', '', NULL, 1651809152, 11, 1651809152, NULL);
INSERT INTO `task` VALUES (7, 'การควบคุมและป้องกันจิ้งจก', '', NULL, 1651809562, 11, 1651809562, NULL);
INSERT INTO `task` VALUES (8, 'เครื่องไฟดักแมลง', '', NULL, 1651809872, 11, 1651809872, NULL);
INSERT INTO `task` VALUES (9, 'ตรวจติดตามผล', '', NULL, 1651809911, 11, 1651809911, NULL);
INSERT INTO `task` VALUES (10, 'ตรวจ QC', '', NULL, 1651810390, 11, 1651810390, NULL);
INSERT INTO `task` VALUES (11, 'อบรม', '', NULL, 1651810536, 11, 1651810536, NULL);
INSERT INTO `task` VALUES (12, 'Indepth Inspection', '', 1, 1651810682, 11, 1657552666, 1);

-- ----------------------------
-- Table structure for task_detail
-- ----------------------------
DROP TABLE IF EXISTS `task_detail`;
CREATE TABLE `task_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_title_id` int NULL DEFAULT NULL,
  `task_method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area_type` int NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `frequency_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task_detail
-- ----------------------------
INSERT INTO `task_detail` VALUES (1, 1, '', NULL, '', NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `task_detail` VALUES (27, 12, 'fsdkf', NULL, 'dfds', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES (1, 'Pcs', 'ชิ้น', '', 1, 1621782120, NULL, 1621782120, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT 10,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `group_id` int NULL DEFAULT NULL,
  `emp_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `password_reset_token`(`password_reset_token` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (14, 'admin', '', '$2b$10$e7up35qB7HeZ7rQEreLq2edDCH0WAq/tYNOuhegvfww.U0qTMDSau', NULL, 'admin@example.com', 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `user` VALUES (15, 'admintest', '', '$2b$10$0WmDySZtMYtnz5KYzeGgxe5cdmcD0utGPDlHphLvNwlXHWBzRnszO', NULL, 'test@example.com', 1, 0, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, NULL, 'aaa', 'ddd', 1, 1638461423, NULL, 1638461423, NULL);

-- ----------------------------
-- Table structure for vendor
-- ----------------------------
DROP TABLE IF EXISTS `vendor`;
CREATE TABLE `vendor`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vendor_group_id` int NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_method_id` int NULL DEFAULT NULL,
  `payment_term_id` int NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vendor
-- ----------------------------
INSERT INTO `vendor` VALUES (1, 'SXXX001', 'Test', 1, 'dffd', NULL, NULL, '', 1, 1624605359, 1, 1624605359, NULL);
INSERT INTO `vendor` VALUES (2, 'ko3993', 'สามเคมี', 2, 'อุปกรณ์เคมี', 1, 1, '', 1, 1654233806, 1, 1654233806, NULL);

-- ----------------------------
-- Table structure for vendor_group
-- ----------------------------
DROP TABLE IF EXISTS `vendor_group`;
CREATE TABLE `vendor_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of vendor_group
-- ----------------------------
INSERT INTO `vendor_group` VALUES (1, 'RM', 'วัสดุก่อสร้าง', '', 1, 1624546109, NULL, 1624546109, NULL);
INSERT INTO `vendor_group` VALUES (2, '032', 'เคมีอุป', '', 1, 1654233767, NULL, 1654233767, NULL);

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES (1, 'A5', 'A5', 'คลังทดสอบ2', '', 1, 1621782643, 1770796190, 1, 15);
INSERT INTO `warehouse` VALUES (2, '1102', 'ตึก B Tower', '', NULL, 1, 1654232923, 1654232923, 1, NULL);

-- ----------------------------
-- Table structure for work_task
-- ----------------------------
DROP TABLE IF EXISTS `work_task`;
CREATE TABLE `work_task`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of work_task
-- ----------------------------
INSERT INTO `work_task` VALUES (1, 'A1', 'เคลียร์พื้นที่', 'เข้าเช็คและเคลียร์พื้นที่หน้างาน', 1, 1632638964, 1, 1632638964, NULL);
INSERT INTO `work_task` VALUES (4, 'A2', 'aa', 'aa', 1, 1638343345, NULL, 1638343345, NULL);

-- ----------------------------
-- Table structure for work_task_detail
-- ----------------------------
DROP TABLE IF EXISTS `work_task_detail`;
CREATE TABLE `work_task_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `work_task_id` int NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accepted_val` float NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `qty` float NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `line_total` float NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of work_task_detail
-- ----------------------------
INSERT INTO `work_task_detail` VALUES (1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 800, 800);
INSERT INTO `work_task_detail` VALUES (6, 4, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 1, 500, 500);

-- ----------------------------
-- View structure for query_customer_contract
-- ----------------------------
DROP VIEW IF EXISTS `query_customer_contract`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `query_customer_contract` AS select `contract`.`id` AS `id`,`contract`.`contract_no` AS `contract_no`,`contract`.`contract_date` AS `contract_date`,`contract`.`contract_start_date` AS `contract_start_date`,`contract`.`status` AS `status`,`contract`.`contract_expire_date` AS `contract_expire_date`,`contract`.`is_renew` AS `is_renew`,`quotation`.`quotation_no` AS `quotation_no`,`quotation`.`customer_id` AS `customer_id`,`quotation`.`service_name` AS `service_name`,`quotation`.`total` AS `total`,`quotation`.`sub_total` AS `sub_total`,`quotation`.`sale_tax` AS `sale_tax`,`quotation`.`amount` AS `amount`,`payment_term`.`name` AS `payment_name` from ((`quotation` join `contract` on((`contract`.`quotation_id` = `quotation`.`id`))) join `payment_term` on((`quotation`.`credit_term` = `payment_term`.`id`))) ;

-- ----------------------------
-- View structure for query_customer_plan
-- ----------------------------
DROP VIEW IF EXISTS `query_customer_plan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `query_customer_plan` AS select `service_plan`.`id` AS `id`,`service_plan`.`plan_no` AS `plan_no`,`service_plan`.`quotation_id` AS `quotation_id`,`service_plan`.`contract_id` AS `contract_id`,`service_plan`.`quotation_job_id` AS `quotation_job_id`,`service_plan`.`quoation_job_line_id` AS `quoation_job_line_id`,`service_plan`.`target_date` AS `target_date`,`service_plan`.`confirm_date` AS `confirm_date`,`service_plan`.`status` AS `status`,`service_plan`.`note` AS `note`,`service_plan`.`interval_no` AS `interval_no`,`quotation`.`quotation_no` AS `quotation_no`,`quotation`.`customer_id` AS `customer_id`,`quotation`.`service_type_id` AS `service_type_id`,`quotation`.`sale_emp_id` AS `sale_emp_id` from (`service_plan` join `quotation` on((`service_plan`.`quotation_id` = `quotation`.`id`))) ;

-- ----------------------------
-- View structure for query_jobcard_history
-- ----------------------------
DROP VIEW IF EXISTS `query_jobcard_history`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `query_jobcard_history` AS select `job_card`.`contract_id` AS `id`,`job_card`.`job_card_no` AS `job_card_no`,`job_card_line`.`job_date` AS `job_date`,`job_card_line`.`approve_id` AS `approve_id`,`job_card_line`.`time_in` AS `time_in`,`job_card_line`.`time_out` AS `time_out`,`job_card_line`.`emp_service` AS `emp_service`,`job_card_line`.`job_description` AS `job_description`,`job_card_line`.`status` AS `status`,`service_plan`.`plan_no` AS `plan_no`,`service_plan`.`quotation_job_id` AS `quotation_job_id`,`service_plan`.`quoation_job_line_id` AS `quoation_job_line_id`,`service_plan`.`confirm_date` AS `confirm_date` from ((`job_card` join `job_card_line` on((`job_card`.`id` = `job_card_line`.`job_card_id`))) join `service_plan` on((`job_card_line`.`plan_id` = `service_plan`.`id`))) ;

SET FOREIGN_KEY_CHECKS = 1;
