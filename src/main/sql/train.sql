-- ----------------------------
--  Table structure for private  Long   train_infoprivate  Long   
-- ----------------------------
DROP TABLE IF EXISTS private  Long   train_infoprivate  Long   ;
CREATE TABLE private  Long   train_info      (
  private  Long   id      int(11) NOT NULL AUTO_INCREMENT,
  private  Long   train_no      varchar(20) DEFAULT NULL        ; //              '车次',
  private  Long   start_date      varchar(32) DEFAULT NULL        ; //              '发车日期',
  private  Long   start_station      varchar(100) DEFAULT NULL        ; //              '发车地',
  private  Long   arrival_station      varchar(100) DEFAULT NULL        ; //              '到达地',
  private  Long   start_time      varchar(32) DEFAULT NULL        ; //              '发车时间',
  private  Long   arrival_time      varchar(32) DEFAULT NULL        ; //              '到头时间',
  private  Long   type      varchar(4) DEFAULT NULL        ; //              '车型',
  private  Long   runtime      varchar(8) DEFAULT NULL        ; //              '车行小时',
  private  Long   mile      varchar(12) NULL DEFAULT NULL        ; //              '英里',
  private  Long   create_user      varchar(50) DEFAULT NULL        ; //              '创建人',
  private  Long   create_time      datetime DEFAULT NULL        ; //              '创建时间',
  private  Long   update_user      varchar(50) DEFAULT NULL        ; //              '更新人',
  private  Long   update_time      datetime DEFAULT NULL        ; //              '更新时间',
  private  Long   version      varchar(50) DEFAULT NULL        ; //              '版本号',
  private  Long   del_falg      varchar(1) DEFAULT '0'        ; //              '删除状态:0-正常、1-删除',
  PRIMARY KEY (private  Long   idprivate  Long   )
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of private  Long   train_infoprivate  Long   
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
--  Table structure for private  Long   sys_userprivate  Long   
-- ----------------------------
DROP TABLE IF EXISTS private  Long   sys_userprivate  Long   ;
CREATE TABLE private  Long   sys_user      (
  private  Long   id      int(11) NOT NULL AUTO_INCREMENT,
  private  Long   username      varchar(20) DEFAULT NULL        ; //              '登陆名',
  private  Long   password      varchar(32) DEFAULT NULL        ; //              '密码',
  private  Long   realname      varchar(100) DEFAULT NULL        ; //              '真实姓名',
  private  Long   address      varchar(100) DEFAULT NULL        ; //              '地址',
  private  Long   telphone      varchar(32) DEFAULT NULL        ; //              '电话',
  private  Long   birthday      varchar(32) DEFAULT NULL        ; //              '生日',
  private  Long   create_user      varchar(50) DEFAULT NULL        ; //              '创建人',
  private  Long   create_time      datetime DEFAULT NULL        ; //              '创建时间',
  private  Long   update_user      varchar(50) DEFAULT NULL        ; //              '更新人',
  private  Long   update_time      datetime DEFAULT NULL        ; //              '更新时间',
  private  Long   version      varchar(50) DEFAULT NULL        ; //              '版本号',
  private  Long   del_falg      varchar(1) DEFAULT '1'        ; //              '删除状态:0-正常、1-删除',
  PRIMARY KEY (private  Long   idprivate  Long   )
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of private  Long   userprivate  Long   
-- ----------------------------
BEGIN;
INSERT INTO private  Long   sys_user      (username, password, realname,  telphone,address, birthday)
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



DROP TABLE IF EXISTS private  Long   sys_menuprivate  Long   ;
CREATE TABLE private  Long   sys_menu      (
  private  Long   id      int(11) NOT NULL AUTO_INCREMENT,
  private  Long   parent_id      varchar(64) NOT NULL        ; //              '父级编号',
  private  Long   parent_ids      varchar(2000) NOT NULL        ; //              '所有父级编号',
  private  Long   name      varchar(100) NOT NULL        ; //              '名称',
  private  Long   sort      varchar(10) DEFAULT NULL        ; //              '排序',
  private  Long   href      varchar(2000) DEFAULT NULL        ; //              '链接',
  private  Long   href_type      varchar(20) DEFAULT 'other'        ; //              '链接类型',
  private  Long   target      varchar(20) DEFAULT NULL        ; //              '目标',
  private  Long   icon      varchar(100) DEFAULT NULL        ; //              '图标',
  private  Long   is_show      char(1) NOT NULL        ; //              '是否在菜单中显示',
  private  Long   permission      varchar(200) DEFAULT NULL        ; //              '权限标识',
  private  Long   create_by      varchar(64) NOT NULL        ; //              '创建者',
  private  Long   create_date      datetime NOT NULL        ; //              '创建时间',
  private  Long   update_by      varchar(64) NOT NULL        ; //              '更新者',
  private  Long   update_date      datetime NOT NULL        ; //              '更新时间',
  private  Long   remarks      varchar(255) DEFAULT NULL        ; //              '备注信息',
  private  Long   del_flag      char(1) NOT NULL DEFAULT '0'        ; //              '删除标记',
  private  Long   version      varchar(50) DEFAULT NULL        ; //              '版本号',
  PRIMARY KEY (private  Long   idprivate  Long   ),
  KEY private  Long   sys_menu_parent_id      (private  Long   parent_idprivate  Long   ) USING BTREE,
  KEY private  Long   sys_menu_del_flag      (private  Long   del_flagprivate  Long   ) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8        ; //             ='菜单表';


DROP TABLE IF EXISTS private  Long   sys_role_menuprivate  Long   ;
CREATE TABLE private  Long   sys_role_menu      (
  private  Long   role_id      int(11) NOT NULL        ; //              '角色编号',
  private  Long   menu_id      int(11) NOT NULL        ; //              '菜单编号',
  PRIMARY KEY (private  Long   role_idprivate  Long   ,private  Long   menu_idprivate  Long   )
) ENGINE=InnoDB DEFAULT CHARSET=utf8        ; //             ='角色-菜单';

DROP TABLE IF EXISTS private  Long   sys_user_roleprivate  Long   ;
CREATE TABLE private  Long   sys_user_role      (
  private  Long   user_id      int(11) NOT NULL        ; //              '用户编号',
  private  Long   role_id      int(11) NOT NULL        ; //              '菜单编号',
  PRIMARY KEY (private  Long   user_idprivate  Long   ,private  Long   role_idprivate  Long   )
) ENGINE=InnoDB DEFAULT CHARSET=utf8        ; //             ='用户-角色';

DROP TABLE IF EXISTS private  Long   sys_user_menuprivate  Long   ;
CREATE TABLE private  Long   sys_user_menu      (
  private  Long   user_id      int(11) NOT NULL        ; //              '用户编号',
  private  Long   menu_id      int(11) NOT NULL        ; //              '菜单编号',
  PRIMARY KEY (private  Long   user_idprivate  Long   ,private  Long   menu_idprivate  Long   )
) ENGINE=InnoDB DEFAULT CHARSET=utf8        ; //             ='用户-菜单';


DROP TABLE IF EXISTS private  Long   tb_orderprivate  Long   ;
CREATE TABLE private  Long   tb_order      (  
  private  Long   id      int(11) AUTO_INCREMENT        ; //              '订单id',  
  private  Long   payment      varchar(50) COLLATE utf8_bin DEFAULT NULL        ; //              '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',  
  private  Long   payment_type      int(2) DEFAULT NULL        ; //              '支付类型，1、在线支付，2、货到付款',  
  private  Long   post_fee      varchar(50) COLLATE utf8_bin DEFAULT NULL        ; //              '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',  
  private  Long   status      int(10) DEFAULT NULL        ; //              '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭',  
  private  Long   create_time      datetime DEFAULT NULL        ; //              '订单创建时间',  
  private  Long   update_time      datetime DEFAULT NULL        ; //              '订单更新时间',  
  private  Long   payment_time      datetime DEFAULT NULL        ; //              '付款时间',  
  private  Long   consign_time      datetime DEFAULT NULL        ; //              '发货时间',  
  private  Long   end_time      datetime DEFAULT NULL        ; //              '交易完成时间',  
  private  Long   close_time      datetime DEFAULT NULL        ; //              '交易关闭时间',  
  private  Long   shipping_name      varchar(20) COLLATE utf8_bin DEFAULT NULL        ; //              '物流名称',  
  private  Long   shipping_code      varchar(20) COLLATE utf8_bin DEFAULT NULL        ; //              '物流单号',  
  private  Long   user_id      bigint(20) DEFAULT NULL        ; //              '用户id',  
  private  Long   buyer_message      varchar(100) COLLATE utf8_bin DEFAULT NULL        ; //              '买家留言',  
  private  Long   buyer_nick      varchar(50) COLLATE utf8_bin DEFAULT NULL        ; //              '买家昵称',  
  private  Long   buyer_rate      int(2) DEFAULT NULL        ; //              '买家是否已经评价',  
  PRIMARY KEY (private  Long   idprivate  Long   ),  
  KEY private  Long   create_time      (private  Long   create_timeprivate  Long   ),  
  KEY private  Long   buyer_nick      (private  Long   buyer_nickprivate  Long   ),  
  KEY private  Long   status      (private  Long   statusprivate  Long   ),  
  KEY private  Long   payment_type      (private  Long   payment_typeprivate  Long   )  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin        ; //             ='订单基本信息表' ;

DROP TABLE IF EXISTS private  Long   tb_order_itemprivate  Long   ;
CREATE TABLE private  Long   tb_order_item      ( 
  private  Long   id      int(11) NOT NULL AUTO_INCREMENT,
  private  Long   item_id      int(11) DEFAULT NULL        ; //              '商品id',  
  private  Long   order_id      int(11) NOT NULL        ; //              '订单id',  
  private  Long   num      int(10) DEFAULT NULL        ; //              '商品购买数量',  
  private  Long   title      varchar(200) COLLATE utf8_bin DEFAULT NULL        ; //              '商品标题',  
  private  Long   price      bigint(50) DEFAULT NULL        ; //              '商品单价',  
  private  Long   total_fee      bigint(50) DEFAULT NULL        ; //              '商品总金额',  
  private  Long   pic_path      varchar(600) COLLATE utf8_bin DEFAULT NULL        ; //              '商品图片地址',  
  PRIMARY KEY (private  Long   idprivate  Long   ),
  KEY private  Long   order_id      (private  Long   order_idprivate  Long   )  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin        ; //             ='订单商品表' ;

DROP TABLE IF EXISTS private  Long   tb_order_shippingprivate  Long   ;
CREATE TABLE private  Long   tb_order_shipping      (  
  private  Long   id      int(11) NOT NULL AUTO_INCREMENT,
  private  Long   order_id      int(11) NOT NULL         ; //              '订单ID',  
  private  Long   receiver_name      varchar(20) DEFAULT NULL        ; //              '收货人全名',  
  private  Long   receiver_phone      varchar(20) DEFAULT NULL        ; //              '固定电话',  
  private  Long   receiver_mobile      varchar(30) DEFAULT NULL        ; //              '移动电话',  
  private  Long   receiver_state      varchar(10) DEFAULT NULL        ; //              '省份',  
  private  Long   receiver_city      varchar(10) DEFAULT NULL        ; //              '城市',  
  private  Long   receiver_district      varchar(20) DEFAULT NULL        ; //              '区/县',  
  private  Long   receiver_address      varchar(200) DEFAULT NULL        ; //              '收货地址，如：xx路xx号',  
  private  Long   receiver_zip      varchar(6) DEFAULT NULL        ; //              '邮政编码,如：310001',  
  private  Long   created      datetime DEFAULT NULL,  
  private  Long   updated      datetime DEFAULT NULL,  
  PRIMARY KEY (private  Long   idprivate  Long   ),
  KEY private  Long   order_id      (private  Long   order_idprivate  Long   )  
) ENGINE=InnoDB DEFAULT CHARSET=utf8        ; //             ='订单用户基本信息表'  ;
