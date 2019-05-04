-- ----------------------------
--  Table structure for `train_info`
-- ----------------------------
DROP TABLE IF EXISTS `train_info`;
CREATE TABLE `train_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `train_no` varchar(20) DEFAULT NULL COMMENT '车次',
  `start_date` varchar(32) DEFAULT NULL COMMENT '发车日期',
  `start_station` varchar(100) DEFAULT NULL COMMENT '发车地',
  `arrival_station` varchar(100) DEFAULT NULL COMMENT '到达地',
  `start_time` varchar(32) DEFAULT NULL COMMENT '发车时间',
  `arrival_time` varchar(32) DEFAULT NULL COMMENT '到头时间',
  `type` varchar(4) DEFAULT NULL COMMENT '车型',
  `runtime` varchar(8) DEFAULT NULL COMMENT '车行小时',
  `mile` varchar(12) NULL DEFAULT NULL COMMENT '英里',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(50) DEFAULT NULL COMMENT '版本号',
  `del_falg` varchar(1) DEFAULT '0' COMMENT '删除状态:0-正常、1-删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `train_info`
-- ----------------------------
BEGIN;
INSERT INTO train_info (train_no, start_station, arrival_station, start_time, arrival_time, type, runtime, mile)

VALUES 
('2559', '北京北', '上海', '20:49', '07:05', '普快', '10:16', '1150'), 
('2560', '北京北', '南京', '20:49', '07:05', '普快', '10:16', '1150'), 
('2561', '深圳', '长春', '20:49', '07:05', '动车', '10:16', '1150'), 
('2562', '南京', '深圳', '20:49', '07:05', '普快', '10:16', '1150'), 
('2563', '北京北', '广州', '20:49', '07:05', '动车', '10:16', '1150'), 
('2564', '广州', '河源', '20:49', '07:05', '普快', '10:16', '1150'), 
('2565', '上海', '深圳', '20:49', '07:05', '普快', '10:16', '1150'), 
('2566', '北京北', '南山', '20:49', '07:05', '动车', '10:16', '1150'), 
('2567', '南京', '石家庄', '20:49', '07:05', '普快', '10:16', '1150'), 
('2569', '广州', '清远', '20:49', '07:05', '普快', '10:16', '1150'), 
('2570', '北京北', '赤峰', '20:49', '07:05', '普快', '10:16', '1150'), 
('3561', '深圳', '上海', '20:49', '07:05', '普快', '10:16', '1150'), 
('3562', '北京北', '赤峰', '20:49', '07:05', '普快', '10:16', '1150'), 
('3563', '南京', '深圳', '20:49', '07:05', '动车', '10:16', '1150'), 
('3564', '广州', '上海', '20:49', '07:05', '普快', '10:16', '1150'), 
('3565', '北京北', '赤壁', '20:49', '07:05', '动车', '10:16', '1150'), 
('3567', '南京', '上海', '20:49', '07:05', '普快', '10:16', '1150'), 
('3568', '北京北', '佛山', '20:49', '07:05', '动车', '10:16', '1150'), 
('3598', '深圳', '上海', '20:49', '07:05', '普快', '10:16', '1150'), 
('3610', '北京北', '清远', '20:49', '07:05', '普快', '10:16', '1150'), 
('3611', '南京', '赤峰', '20:49', '07:05', '普快', '10:16', '1150'), 
('3612', '广州', '三亚', '20:49', '07:05', '动车', '10:16', '1150'), 
('3613', '北京北', '赤峰', '20:49', '07:05', '普快', '10:16', '1150'), 
('3614', '北京北', '长沙', '20:49', '07:05', '普快', '10:16', '1150'), 
('3615', '深圳', '南京', '20:49', '07:05', '普快', '10:16', '1150'), 
('3616', '北京北', '三明', '20:49', '07:05', '动车', '10:16', '1150'), 
('3617', '广州', '赤峰', '20:49', '07:05', '普快', '10:16', '1150'), 
('3618', '北京北', '上海', '20:49', '07:05', '普快', '10:16', '1150'), 
('3619', '北京北', '南京', '20:49', '07:05', '普快', '10:16', '1150'), 
('3630', '深圳', '赤峰', '20:49', '07:05', '普快', '10:16', '1150'), 
('3710', '深圳', '南京', '20:49', '07:05', '普快', '10:16', '1150'), 
('3722', '北京北', '赤峰', '20:49', '07:05', '普快', '10:16', '1150');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL COMMENT '登陆名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `telphone` varchar(32) DEFAULT NULL COMMENT '电话',
  `birthday` varchar(32) DEFAULT NULL COMMENT '生日',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(50) DEFAULT NULL COMMENT '版本号',
  `del_falg` varchar(1) DEFAULT '1' COMMENT '删除状态:0-正常、1-删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (username, password, realname,  telphone,address, birthday)
VALUES ('admin', 'admin',  '张三丰', '13167876788', '北京东城区', '1990-04-20 16:58:16'), 
('dog', 'dog', '虚竹', '13167876788', '北京东城区', '1990-04-20 16:58:16'), 
('ben', 'ben',  '王语嫣', '13167876788', '北京东城区', '1990-04-20 16:58:16'), 
('jason', 'jason',  '张三禄', '13098712345', '武汉汉阳区', '1992-04-20 16:58:51'), 
('banana', 'banana',  '慕容复', '13098712345', '武汉汉阳区', '1992-04-20 16:58:51'), 
('cat', 'cat','段誉', '17235467789', '深圳罗湖区', '1993-04-20 16:58:58'), 
('bruce', 'bruce',  '李小龙', '13100989988', '香港九龙区', '1999-04-21 22:04:15'), 
('test', 'test',  '乔三槐', '15900098734', '广州白云区', '1991-04-20 16:58:41'), 
('car', 'car',  '鸠摩智', '17235467789', '深圳罗湖区', '1993-04-20 16:58:58'), 
('apple', 'apple',  '乔峰', '15900098734', '广州白云区', '1991-04-20 16:58:41'), 
('mali', 'mali', '马夫人', '15900098734', '广州白云区', '1991-04-20 16:58:41');
COMMIT;



DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `href_type` varchar(20) DEFAULT 'other' COMMENT '链接类型',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` varchar(50) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`) USING BTREE,
  KEY `sys_menu_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='菜单表';


DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `version` varchar(50) DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`) USING BTREE,
  KEY `sys_role_enname` (`enname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='角色表';


CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  `menu_id` int(11) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `role_id` int(11) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`user_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';


CREATE TABLE `sys_user_menu` (
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `menu_id` int(11) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`user_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-菜单';


