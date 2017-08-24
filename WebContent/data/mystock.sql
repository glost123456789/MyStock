/*
MySQL Data Transfer
Source Host: localhost
Source Database: mystock
Target Host: localhost
Target Database: mystock
Date: 2015-08-14 10:41:20
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bsd
-- ----------------------------
CREATE TABLE `bsd` (
  `djid` varchar(14) NOT NULL,
  `riqi` date NOT NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `userid` (`userid`),
  CONSTRAINT `bsd_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报损单';

-- ----------------------------
-- Table structure for bsdsp
-- ----------------------------
CREATE TABLE `bsdsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `F_Bsdsp_Bsd` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `bsdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`),
  CONSTRAINT `F_Bsdsp_Bsd` FOREIGN KEY (`djid`) REFERENCES `bsd` (`djid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报损单商品';

-- ----------------------------
-- Table structure for byd
-- ----------------------------
CREATE TABLE `byd` (
  `djid` varchar(14) NOT NULL,
  `riqi` date NOT NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `userid` (`userid`),
  CONSTRAINT `byd_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报溢单';

-- ----------------------------
-- Table structure for bydsp
-- ----------------------------
CREATE TABLE `bydsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `FK_Bydsp_Byd` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `bydsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`),
  CONSTRAINT `FK_Bydsp_Byd` FOREIGN KEY (`djid`) REFERENCES `byd` (`djid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='报溢单商品';

-- ----------------------------
-- Table structure for ckd
-- ----------------------------
CREATE TABLE `ckd` (
  `djid` varchar(14) NOT NULL,
  `khid` int(11) default NULL COMMENT '供应商id',
  `khname` varchar(50) default NULL,
  `riqi` date NOT NULL,
  `yfje` double default NULL,
  `sfje` double default NULL,
  `cbje` double default NULL,
  `jystate` varchar(2) default NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `FK_Ckd_Kh` (`khid`),
  KEY `FK_Ckd_Users` (`userid`),
  CONSTRAINT `FK_Ckd_Kh` FOREIGN KEY (`khid`) REFERENCES `kh` (`khid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Ckd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售出库';

-- ----------------------------
-- Table structure for ckdsp
-- ----------------------------
CREATE TABLE `ckdsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `lbid` int(11) default NULL,
  `lbname` varchar(20) default NULL,
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `FK_Ckdsp_Ckd` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `ckdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`),
  CONSTRAINT `FK_Ckdsp_Ckd` FOREIGN KEY (`djid`) REFERENCES `ckd` (`djid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='销售单商品';

-- ----------------------------
-- Table structure for gys
-- ----------------------------
CREATE TABLE `gys` (
  `gysid` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `lxren` varchar(30) default NULL COMMENT '联系人',
  `lxtel` varchar(30) default NULL COMMENT '联系电话',
  `address` varchar(50) default NULL COMMENT '地址',
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`gysid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Table structure for jhd
-- ----------------------------
CREATE TABLE `jhd` (
  `djid` varchar(14) NOT NULL,
  `gysid` int(11) default NULL,
  `gysname` varchar(50) default NULL,
  `riqi` date NOT NULL,
  `yfje` double default NULL,
  `sfje` double default NULL,
  `jystate` varchar(2) default NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `FK_Jhd_Gys` (`gysid`),
  KEY `FK_Jhd_Users` (`userid`),
  CONSTRAINT `FK_Jhd_Gys` FOREIGN KEY (`gysid`) REFERENCES `gys` (`gysid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Jhd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='进货单';

-- ----------------------------
-- Table structure for jhdsp
-- ----------------------------
CREATE TABLE `jhdsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `lbid` int(11) default NULL,
  `lbname` varchar(20) default NULL,
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `Fk_JhdSp_Jhd` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `Fk_JhdSp_Jhd` FOREIGN KEY (`djid`) REFERENCES `jhd` (`djid`) ON DELETE CASCADE,
  CONSTRAINT `jhdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='进货单商品';

-- ----------------------------
-- Table structure for kh
-- ----------------------------
CREATE TABLE `kh` (
  `khid` int(11) NOT NULL auto_increment,
  `khname` varchar(50) NOT NULL,
  `lxren` varchar(30) default NULL COMMENT '联系人',
  `lxtel` varchar(30) default NULL COMMENT '联系电话',
  `address` varchar(50) default NULL COMMENT '地址',
  `bz` varchar(200) default NULL,
  PRIMARY KEY  (`khid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='客户';

-- ----------------------------
-- Table structure for menu
-- ----------------------------
CREATE TABLE `menu` (
  `menuid` int(11) NOT NULL,
  `menuname` varchar(20) NOT NULL,
  `pid` int(11) default NULL,
  `menuurl` varchar(100) default NULL,
  `menutype` int(11) NOT NULL,
  `ordernum` int(11) default NULL,
  `icon` varchar(20) default NULL,
  PRIMARY KEY  (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单目录';

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL auto_increment,
  `rolename` varchar(20) NOT NULL,
  `bz` varchar(100) default NULL,
  PRIMARY KEY  (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for rolemenu
-- ----------------------------
CREATE TABLE `rolemenu` (
  `roleid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  PRIMARY KEY  (`roleid`,`menuid`),
  KEY `menuid` (`menuid`),
  CONSTRAINT `rolemenu_ibfk_3` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`) ON DELETE CASCADE,
  CONSTRAINT `rolemenu_ibfk_4` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单';

-- ----------------------------
-- Table structure for spdw
-- ----------------------------
CREATE TABLE `spdw` (
  `dwid` int(11) NOT NULL auto_increment COMMENT 'id',
  `dwname` varchar(20) NOT NULL,
  PRIMARY KEY  (`dwid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='货物单位';

-- ----------------------------
-- Table structure for splb
-- ----------------------------
CREATE TABLE `splb` (
  `lbid` int(11) NOT NULL auto_increment,
  `lbname` varchar(20) default NULL COMMENT '类别名称',
  `pid` int(11) default NULL COMMENT '父类别id',
  PRIMARY KEY  (`lbid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品类别';

-- ----------------------------
-- Table structure for spxx
-- ----------------------------
CREATE TABLE `spxx` (
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) NOT NULL COMMENT '货物名称',
  `xinghao` varchar(20) default NULL COMMENT '型号',
  `lbid` int(11) NOT NULL COMMENT '类别id',
  `lbname` varchar(20) NOT NULL,
  `dw` varchar(10) default NULL COMMENT '单位',
  `jhprice` double default '0',
  `chprice` double default '0',
  `scjj` double default '0',
  `kcsl` int(11) default '0',
  `kczj` double default '0',
  `minnum` int(11) default '0',
  `csname` varchar(50) default NULL,
  `state` varchar(1) default '0',
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`spid`),
  KEY `FK_Spxx_Splb` (`lbid`),
  CONSTRAINT `FK_Spxx_Splb` FOREIGN KEY (`lbid`) REFERENCES `splb` (`lbid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Table structure for test
-- ----------------------------
CREATE TABLE `test` (
  `Id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for thd
-- ----------------------------
CREATE TABLE `thd` (
  `djid` varchar(14) NOT NULL,
  `gysid` int(11) default NULL,
  `gysname` varchar(50) default NULL,
  `riqi` date NOT NULL,
  `yfje` double default NULL COMMENT '应付金额',
  `sfje` double default NULL COMMENT '实付金额',
  `jystate` varchar(2) default NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `FK_Thd_Gys` (`gysid`),
  KEY `FK_Thd_Users` (`userid`),
  CONSTRAINT `FK_Thd_Gys` FOREIGN KEY (`gysid`) REFERENCES `gys` (`gysid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Thd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品退库';

-- ----------------------------
-- Table structure for thdsp
-- ----------------------------
CREATE TABLE `thdsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `lbid` int(11) default NULL,
  `lbname` varchar(20) default NULL,
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `FK_Thdsp_Thd` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `FK_Thdsp_Thd` FOREIGN KEY (`djid`) REFERENCES `thd` (`djid`) ON DELETE CASCADE,
  CONSTRAINT `thdsp_ibfk_1` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='退货单商品';

-- ----------------------------
-- Table structure for tkd
-- ----------------------------
CREATE TABLE `tkd` (
  `djid` varchar(14) NOT NULL,
  `khid` int(11) default NULL COMMENT '供应商id',
  `khname` varchar(50) default NULL,
  `riqi` date NOT NULL,
  `yfje` double default NULL,
  `sfje` double default NULL,
  `cbje` double default NULL,
  `jystate` varchar(2) default NULL,
  `userid` int(11) default NULL,
  `username` varchar(20) default NULL,
  `bz` varchar(200) default NULL COMMENT '备注',
  PRIMARY KEY  (`djid`),
  KEY `FK_Tkd_Kh` (`khid`),
  KEY `FK_Tkd_Users` (`userid`),
  CONSTRAINT `FK_Tkd_Kh` FOREIGN KEY (`khid`) REFERENCES `kh` (`khid`) ON DELETE SET NULL,
  CONSTRAINT `FK_Tkd_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户退货';

-- ----------------------------
-- Table structure for tkdsp
-- ----------------------------
CREATE TABLE `tkdsp` (
  `id` int(11) NOT NULL auto_increment,
  `djid` varchar(14) NOT NULL,
  `spid` varchar(10) NOT NULL COMMENT '商品id',
  `spname` varchar(20) default NULL COMMENT '商品名称',
  `spdw` varchar(20) default NULL COMMENT '商品单位',
  `spxinghao` varchar(20) default NULL COMMENT '规格型号',
  `lbid` int(11) default NULL,
  `lbname` varchar(20) default NULL,
  `dj` double default NULL COMMENT '单价',
  `sl` int(11) default NULL COMMENT '数量',
  `zj` double default NULL COMMENT '总价',
  PRIMARY KEY  (`id`),
  KEY `djid` (`djid`),
  KEY `spid` (`spid`),
  CONSTRAINT `tkdsp_ibfk_4` FOREIGN KEY (`djid`) REFERENCES `tkd` (`djid`) ON DELETE CASCADE,
  CONSTRAINT `tkdsp_ibfk_5` FOREIGN KEY (`spid`) REFERENCES `spxx` (`spid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户退货商品';

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users` (
  `userid` int(11) NOT NULL auto_increment,
  `logincode` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `roleid` int(11) default NULL,
  `state` int(11) NOT NULL,
  `bz` varchar(100) default NULL,
  PRIMARY KEY  (`userid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- View structure for vusermenu
-- ----------------------------
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vusermenu` AS select distinct sql_no_cache `a`.`userid` AS `userid`,`a`.`logincode` AS `logincode`,`a`.`username` AS `username`,`d`.`menuid` AS `menuid`,`d`.`menuname` AS `menuname`,`d`.`pid` AS `pid`,`d`.`menuurl` AS `menuurl`,`d`.`menutype` AS `menutype`,`d`.`ordernum` AS `ordernum`,`d`.`icon` AS `icon` from ((`users` `a` join `rolemenu` `c`) join `menu` `d`) where ((`a`.`roleid` = `c`.`roleid`) and (`c`.`menuid` = `d`.`menuid`)) order by `d`.`ordernum`;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `byd` VALUES ('BY201205070001', '2012-05-07', '1', '管理员', 'sdfdsfds');
INSERT INTO `bydsp` VALUES ('1', 'BY201205070001', '0001', '阿莫西林胶囊2', '袋', '888888', '16', '2', '32');
INSERT INTO `ckd` VALUES ('XS201203140001', '1', '百姓大药房', '2012-03-14', '258', '258', '3684', '1', '1', '管理员', '');
INSERT INTO `ckd` VALUES ('XS201203150001', '1', '百姓大药房', '2012-03-15', '2028', '2028', '936', '1', '1', '管理员', '');
INSERT INTO `ckd` VALUES ('XS201205100001', '1', '百姓大药房', '2012-05-10', '2600', '2600', '1676.97333333333', '1', '1', '管理员', '');
INSERT INTO `ckdsp` VALUES ('1', 'XS201203140001', '0001', '阿莫西林胶囊', '袋', '888888', '1', '呼吸类', '26', '3', '78');
INSERT INTO `ckdsp` VALUES ('2', 'XS201203140001', '0002', '六味地黄丸', '盒', 'sfsfs', '1', '呼吸类', '45', '4', '180');
INSERT INTO `ckdsp` VALUES ('3', 'XS201203150001', '0001', '阿莫西林胶囊', '袋', '888888', '1', '呼吸类', '26', '78', '2028');
INSERT INTO `ckdsp` VALUES ('4', 'XS201205100001', '0001', '阿莫西林胶囊2', '袋', '888888', '1', '呼吸类', '26', '100', '2600');
INSERT INTO `gys` VALUES ('1', '时代阳光药\"品批发\"公司6666666', '赵子明', '1367767', '长沙刘阳', '舒服舒服');
INSERT INTO `gys` VALUES ('2', '湖南双周药业公司', '陈明', '3434242', '2342342', '243242');
INSERT INTO `gys` VALUES ('3', '是大法师', '的份上', '212121', '121大苏打', '啊冯绍峰');
INSERT INTO `gys` VALUES ('4', '说法萨芬33888888888888888', '大方的说法', '322121', '342143', '的十分大方');
INSERT INTO `gys` VALUES ('5', '是大法师', '发顺丰', '的法师打发士大夫', '的份上', '大方的说法');
INSERT INTO `gys` VALUES ('6', '的身份的方式', '是打发士大夫', '的是范德萨', '非官方大哥', '地方');
INSERT INTO `gys` VALUES ('7', '打发士大夫', '的份上', '的是范德萨', '的份上', '实得分');
INSERT INTO `gys` VALUES ('8', '士大夫的说法', '实得分', '打发士大夫', '的所发生的', '第三方打发打发');
INSERT INTO `gys` VALUES ('9', '的师傅的说法', '实得分', '地方', '的师傅的说法', '实得分');
INSERT INTO `gys` VALUES ('10', '是打发士大夫', '实得分是大多数', '地方说的范德萨', '地方', '第三方');
INSERT INTO `gys` VALUES ('11', '第三方', '地方飞', '大方的说法', '第三方第三方', '第三方地方');
INSERT INTO `gys` VALUES ('12', '的师傅的说法', '第三方', '发的说法', '第三方 ', '第三方');
INSERT INTO `gys` VALUES ('13', 'dsfds', 'dsfds', 'dsfds', 'dsfds', 'dsfds');
INSERT INTO `gys` VALUES ('14', 'dsfsf', 'sdfsd', 'fdsfsdf', 'dsfdsfsd', 'fsdfdsfdsf');
INSERT INTO `gys` VALUES ('15', 'dsfdsf', 'dsfdsfsd', 'dsfdsfdsf', 'dsfds', 'fsdfdsfsdfds');
INSERT INTO `gys` VALUES ('19', 'sdfsd', 'fdsfsd', 'fsdfsd', 'fdsf', 'dsfdsfdsfds');
INSERT INTO `jhd` VALUES ('JH201203140001', '1', '时代阳光药品批发公司', '2012-03-14', '1290', '1290', '1', '1', '管理员', '');
INSERT INTO `jhd` VALUES ('JH201203150001', '2', '湖南双周药业公司', '2012-03-15', '447', '447', '1', '1', '管理员', '');
INSERT INTO `jhd` VALUES ('JH201203190001', '8', '士大夫的说法', '2012-03-19', '5273', '5273', '1', '2', '赵培', '');
INSERT INTO `jhd` VALUES ('JH201203190002', '2', '湖南双周药业公司', '2012-03-19', '575', '575', '1', '2', '赵培', 'sssss');
INSERT INTO `jhd` VALUES ('JH201203190003', '10', '是打发士大夫', '2012-03-19', '1035', '1035', '1', '2', '赵培', '');
INSERT INTO `jhd` VALUES ('JH201203190004', '6', '的身份的方式', '2012-03-19', '9890', '9890', '1', '2', '赵培', '');
INSERT INTO `jhd` VALUES ('JH201203190005', '4', '说法萨芬', '2012-03-19', '544', '544', '1', '2', '赵培', '');
INSERT INTO `jhd` VALUES ('JH201205070001', '1', '时代阳光药品批发公司6666666', '2012-05-07', '128', '128', '1', '1', '管理员', '888888');
INSERT INTO `jhd` VALUES ('JH201205100001', '1', '时代阳光药\"品批发\"公司6666666', '2012-05-10', '3200', '3200', '1', '1', '管理员', 'sdfs');
INSERT INTO `jhd` VALUES ('JH201205100002', '1', '时代阳光药\"品批发\"公司6666666', '2012-05-10', '11569', '11569', '1', '1', '管理员', '');
INSERT INTO `jhdsp` VALUES ('1', 'JH201203140001', '0001', '阿莫西林胶囊', '袋', '888888', '1', '呼吸类', '12', '20', '240');
INSERT INTO `jhdsp` VALUES ('2', 'JH201203140001', '0002', '六味地黄丸', '盒', 'sfsfs', '1', '呼吸类', '21', '50', '1050');
INSERT INTO `jhdsp` VALUES ('3', 'JH201203150001', '0002', '六味地黄丸', '盒', 'sfsfs', '1', '呼吸类', '21', '3', '63');
INSERT INTO `jhdsp` VALUES ('4', 'JH201203150001', '0001', '阿莫西林胶囊', '袋', '888888', '1', '呼吸类', '12', '32', '384');
INSERT INTO `jhdsp` VALUES ('5', 'JH201203190001', '0002', '六味地黄丸', '盒', 'sfsfs', '1', '呼吸类', '23', '211', '4853');
INSERT INTO `jhdsp` VALUES ('6', 'JH201203190001', '0001', '阿莫西林胶囊', '袋', '888888', '1', '呼吸类', '12', '35', '420');
INSERT INTO `jhdsp` VALUES ('7', 'JH201203190002', '0002', '六味地黄丸', '盒', 'sfsfs', '1', '呼吸类', '23', '25', '575');
INSERT INTO `jhdsp` VALUES ('8', 'JH201203190003', '0001', '阿莫西林胶囊', '袋', '888888', '1', '呼吸类', '23', '45', '1035');
INSERT INTO `jhdsp` VALUES ('9', 'JH201203190004', '0002', '六味地黄丸', '盒', 'sfsfs', '1', '呼吸类', '23', '430', '9890');
INSERT INTO `jhdsp` VALUES ('10', 'JH201203190004', '0001', '阿莫西林胶囊', '袋', '888888', '1', '呼吸类', '15', '0', '0');
INSERT INTO `jhdsp` VALUES ('11', 'JH201203190005', '0001', '阿莫西林胶囊', '袋', '888888', '1', '呼吸类', '16', '34', '544');
INSERT INTO `jhdsp` VALUES ('12', 'JH201205070001', '0001', '阿莫西林胶囊2', '袋', '888888', '1', '呼吸类', '16', '8', '128');
INSERT INTO `jhdsp` VALUES ('13', 'JH201205100001', '0001', '阿莫西林胶囊2', '袋', '888888', '1', '呼吸类', '16', '200', '3200');
INSERT INTO `jhdsp` VALUES ('14', 'JH201205100002', '22222', '华山大力丸', '盒', '2321321', '3', '感冒类', '23', '323', '7429');
INSERT INTO `jhdsp` VALUES ('15', 'JH201205100002', '2321323', '罗红霉素', '盒', 'asdsd', '3', '感冒类', '12', '345', '4140');
INSERT INTO `kh` VALUES ('1', '百姓大药房', '何兄', '1231231231', '是打发士大夫', '舒服舒服');
INSERT INTO `kh` VALUES ('2', 'wewfrw', 'sdfds', 'sdfs', 'sdfs', 'sdfdsf');
INSERT INTO `kh` VALUES ('3', 'dsfdsfs', 'dsfds', 'dsfds', 'dsfdsf', 'dsfdsfdsfdsf');
INSERT INTO `menu` VALUES ('0', '系统菜单', '-1', null, '1', '0', 'menu-plugin');
INSERT INTO `menu` VALUES ('10', '进货管理', '0', null, '1', '1', 'menu-1');
INSERT INTO `menu` VALUES ('20', '销售管理', '0', null, '1', '2', 'menu-2');
INSERT INTO `menu` VALUES ('30', '库存管理', '0', null, '1', '3', 'menu-3');
INSERT INTO `menu` VALUES ('40', '统计报表', '0', null, '1', '4', 'menu-4');
INSERT INTO `menu` VALUES ('50', '基础资料', '0', null, '1', '5', 'menu-5');
INSERT INTO `menu` VALUES ('60', '系统管理', '0', null, '1', '6', 'menu-6');
INSERT INTO `menu` VALUES ('70', '测试模块', '0', null, '1', '7', 'menu-6');
INSERT INTO `menu` VALUES ('1010', '进货入库', '10', '../jinhuo/jinhuo.jsp', '0', '1', 'menu-11');
INSERT INTO `menu` VALUES ('1020', '退货出库', '10', '../jinhuo/tuihuo.jsp', '0', '2', 'menu-12');
INSERT INTO `menu` VALUES ('1030', '进货单据查询', '10', '../jinhuo/jinsearch.jsp', '0', '3', 'menu-13');
INSERT INTO `menu` VALUES ('1040', '退货单据查询', '10', '../jinhuo/mingxi.jsp', '0', '4', 'menu-14');
INSERT INTO `menu` VALUES ('1050', '当前库存查询', '10', '../kucun/kcsearch.jsp', '0', '5', 'menu-15');
INSERT INTO `menu` VALUES ('2010', '销售出库', '20', '../chushou/chuku.jsp', '0', '1', 'menu-21');
INSERT INTO `menu` VALUES ('2020', '客户退货', '20', '../chushou/tuiku.jsp', '0', '2', 'menu-22');
INSERT INTO `menu` VALUES ('2030', '销售单据查询', '20', '../chushou/chusearch.jsp', '0', '3', 'menu-23');
INSERT INTO `menu` VALUES ('2040', '客户退货查询', '20', '../chushou/mingxi.jsp', '0', '4', 'menu-24');
INSERT INTO `menu` VALUES ('2050', '当前库存查询', '20', '../kucun/kcsearch.jsp', '0', '5', 'menu-25');
INSERT INTO `menu` VALUES ('3010', '商品报损', '30', '../kucun/baosun.jsp', '0', '1', 'menu-31');
INSERT INTO `menu` VALUES ('3020', '商品报溢', '30', '../kucun/baoyi.jsp', '0', '2', 'menu-32');
INSERT INTO `menu` VALUES ('3030', '库存报警', '30', '../kucun/baojing.jsp', '0', '3', 'menu-33');
INSERT INTO `menu` VALUES ('3040', '报损报溢查询', '30', '../kucun/biansearch.jsp', '0', '4', 'menu-34');
INSERT INTO `menu` VALUES ('3050', '当前库存查询', '30', '../kucun/kcsearch.jsp', '0', '5', 'menu-35');
INSERT INTO `menu` VALUES ('4010', '供应商统计', '40', '../tongji/gystj.jsp', '0', '1', 'menu-41');
INSERT INTO `menu` VALUES ('4020', '客户统计', '40', '../tongji/khtj.jsp', '0', '2', 'menu-42');
INSERT INTO `menu` VALUES ('4030', '商品采购统计', '40', '../tongji/spcgtj.jsp', '0', '3', 'menu-43');
INSERT INTO `menu` VALUES ('4040', '商品销售统计', '40', '../tongji/spxstj.jsp', '0', '4', 'menu-44');
INSERT INTO `menu` VALUES ('4050', '按日统计分析', '40', '../tongji/tjfxri.jsp', '0', '5', 'menu-45');
INSERT INTO `menu` VALUES ('4060', '按月统计分析', '40', '../tongji/tjfxyue.jsp', '0', '6', 'menu-46');
INSERT INTO `menu` VALUES ('5010', '供应商管理', '50', '../ziliao/gys.jsp', '0', '1', 'menu-51');
INSERT INTO `menu` VALUES ('5020', '客户管理', '50', '../ziliao/kh.jsp', '0', '2', 'menu-52');
INSERT INTO `menu` VALUES ('5030', '商品管理', '50', '../ziliao/spxx.jsp', '0', '3', 'menu-53');
INSERT INTO `menu` VALUES ('5040', '期初库存', '50', '../ziliao/kc.jsp', '0', '4', 'menu-54');
INSERT INTO `menu` VALUES ('6010', '角色管理', '60', '../power/role.jsp', '0', '1', 'menu-61');
INSERT INTO `menu` VALUES ('6020', '用户管理', '60', '../power/user.jsp', '0', '2', 'menu-62');
INSERT INTO `menu` VALUES ('6030', '数据库管理', '60', '../power/beifen.jsp', '3', '3', 'menu-63');
INSERT INTO `menu` VALUES ('7010', '操作控制', '70', null, '1', '1', 'menu-51');
INSERT INTO `menu` VALUES ('701010', '日志查看', '7010', '../power/user.jsp', '0', '1', 'menu-51');
INSERT INTO `role` VALUES ('1', '管理员', '系统管理');
INSERT INTO `role` VALUES ('2', '入库员', '入库管理');
INSERT INTO `role` VALUES ('3', '销售员', '');
INSERT INTO `rolemenu` VALUES ('1', '10');
INSERT INTO `rolemenu` VALUES ('2', '10');
INSERT INTO `rolemenu` VALUES ('1', '20');
INSERT INTO `rolemenu` VALUES ('1', '30');
INSERT INTO `rolemenu` VALUES ('1', '40');
INSERT INTO `rolemenu` VALUES ('1', '50');
INSERT INTO `rolemenu` VALUES ('3', '50');
INSERT INTO `rolemenu` VALUES ('1', '60');
INSERT INTO `rolemenu` VALUES ('1', '70');
INSERT INTO `rolemenu` VALUES ('2', '1010');
INSERT INTO `rolemenu` VALUES ('2', '1020');
INSERT INTO `rolemenu` VALUES ('2', '1030');
INSERT INTO `rolemenu` VALUES ('2', '1040');
INSERT INTO `rolemenu` VALUES ('1', '1050');
INSERT INTO `rolemenu` VALUES ('2', '1050');
INSERT INTO `rolemenu` VALUES ('1', '2010');
INSERT INTO `rolemenu` VALUES ('1', '2020');
INSERT INTO `rolemenu` VALUES ('1', '2030');
INSERT INTO `rolemenu` VALUES ('1', '2040');
INSERT INTO `rolemenu` VALUES ('1', '2050');
INSERT INTO `rolemenu` VALUES ('1', '3010');
INSERT INTO `rolemenu` VALUES ('1', '3020');
INSERT INTO `rolemenu` VALUES ('1', '3030');
INSERT INTO `rolemenu` VALUES ('1', '3040');
INSERT INTO `rolemenu` VALUES ('1', '3050');
INSERT INTO `rolemenu` VALUES ('1', '4010');
INSERT INTO `rolemenu` VALUES ('1', '4020');
INSERT INTO `rolemenu` VALUES ('1', '4030');
INSERT INTO `rolemenu` VALUES ('1', '4040');
INSERT INTO `rolemenu` VALUES ('1', '4050');
INSERT INTO `rolemenu` VALUES ('1', '4060');
INSERT INTO `rolemenu` VALUES ('1', '5010');
INSERT INTO `rolemenu` VALUES ('3', '5010');
INSERT INTO `rolemenu` VALUES ('1', '5020');
INSERT INTO `rolemenu` VALUES ('1', '5030');
INSERT INTO `rolemenu` VALUES ('1', '5040');
INSERT INTO `rolemenu` VALUES ('1', '6010');
INSERT INTO `rolemenu` VALUES ('1', '6020');
INSERT INTO `rolemenu` VALUES ('1', '6030');
INSERT INTO `rolemenu` VALUES ('1', '7010');
INSERT INTO `rolemenu` VALUES ('1', '701010');
INSERT INTO `spdw` VALUES ('1', '个');
INSERT INTO `spdw` VALUES ('2', '袋');
INSERT INTO `spdw` VALUES ('3', '盒');
INSERT INTO `spdw` VALUES ('4', '相');
INSERT INTO `splb` VALUES ('1', '呼吸类', '0');
INSERT INTO `splb` VALUES ('3', '感冒类', '0');
INSERT INTO `spxx` VALUES ('0001', '阿莫西林胶囊2', '888888', '1', '呼吸类', '袋', '16.7697333333333', '26', '16', '200', '3353.94666666667', '10', '舒服舒服', '2', '是大法师');
INSERT INTO `spxx` VALUES ('0002', '六味地黄丸', 'sfsfs', '1', '呼吸类', '盒', '22.8122448979592', '45', '23', '700', '15968.5714285714', '4', '舒服舒服是否', '2', '飞');
INSERT INTO `spxx` VALUES ('22222', '华山大力丸', '2321321', '3', '感冒类', '盒', '23', '45', '23', '277', '6371', '12', '江西人事局', '2', '');
INSERT INTO `spxx` VALUES ('2321323', '罗红霉素', 'asdsd', '3', '感冒类', '盒', '12', '45', '12', '390', '4680', '12', '12121212', '2', '121212');
INSERT INTO `test` VALUES ('1', 'zhaopie');
INSERT INTO `test` VALUES ('2', 'zhaopie');
INSERT INTO `test` VALUES ('3', 'zhaopie');
INSERT INTO `test` VALUES ('4', '时代阳光药\"品批发\"公司6666666');
INSERT INTO `test` VALUES ('5', '湖南双周药业公司');
INSERT INTO `test` VALUES ('6', '是大法师');
INSERT INTO `test` VALUES ('7', '说法萨芬33888888888888888');
INSERT INTO `test` VALUES ('8', '是大法师');
INSERT INTO `test` VALUES ('9', '的身份的方式');
INSERT INTO `test` VALUES ('10', '打发士大夫');
INSERT INTO `test` VALUES ('11', '士大夫的说法');
INSERT INTO `test` VALUES ('12', '的师傅的说法');
INSERT INTO `test` VALUES ('13', '是打发士大夫');
INSERT INTO `test` VALUES ('14', '第三方');
INSERT INTO `test` VALUES ('15', '的师傅的说法');
INSERT INTO `test` VALUES ('16', 'dsfds');
INSERT INTO `test` VALUES ('17', 'dsfsf');
INSERT INTO `test` VALUES ('18', 'dsfdsf');
INSERT INTO `test` VALUES ('19', 'sdfsd');
INSERT INTO `test` VALUES ('20', '时代阳光药\"品批发\"公司6666666');
INSERT INTO `test` VALUES ('21', '湖南双周药业公司');
INSERT INTO `test` VALUES ('22', '是大法师');
INSERT INTO `test` VALUES ('23', '说法萨芬33888888888888888');
INSERT INTO `test` VALUES ('24', '是大法师');
INSERT INTO `test` VALUES ('25', '的身份的方式');
INSERT INTO `test` VALUES ('26', '打发士大夫');
INSERT INTO `test` VALUES ('27', '士大夫的说法');
INSERT INTO `test` VALUES ('28', '的师傅的说法');
INSERT INTO `test` VALUES ('29', '是打发士大夫');
INSERT INTO `test` VALUES ('30', '第三方');
INSERT INTO `test` VALUES ('31', '的师傅的说法');
INSERT INTO `test` VALUES ('32', 'dsfds');
INSERT INTO `test` VALUES ('33', 'dsfsf');
INSERT INTO `test` VALUES ('34', 'dsfdsf');
INSERT INTO `test` VALUES ('35', 'sdfsd');
INSERT INTO `test` VALUES ('36', '时代阳光药\"品批发\"公司6666666');
INSERT INTO `test` VALUES ('37', '湖南双周药业公司');
INSERT INTO `test` VALUES ('38', '是大法师');
INSERT INTO `test` VALUES ('39', '说法萨芬33888888888888888');
INSERT INTO `test` VALUES ('40', '是大法师');
INSERT INTO `test` VALUES ('41', '的身份的方式');
INSERT INTO `test` VALUES ('42', '打发士大夫');
INSERT INTO `test` VALUES ('43', '士大夫的说法');
INSERT INTO `test` VALUES ('44', '的师傅的说法');
INSERT INTO `test` VALUES ('45', '是打发士大夫');
INSERT INTO `test` VALUES ('46', '第三方');
INSERT INTO `test` VALUES ('47', '的师傅的说法');
INSERT INTO `test` VALUES ('48', 'dsfds');
INSERT INTO `test` VALUES ('49', 'dsfsf');
INSERT INTO `test` VALUES ('50', 'dsfdsf');
INSERT INTO `test` VALUES ('51', 'sdfsd');
INSERT INTO `thd` VALUES ('TH201203190001', '1', '时代阳光药品批发公司', '2012-03-19', '112', '112', '1', '2', '赵培', '');
INSERT INTO `thd` VALUES ('TH201205100001', '1', '时代阳光药\"品批发\"公司6666666', '2012-05-10', '-540', '-540', '1', '1', '管理员', '');
INSERT INTO `thd` VALUES ('TH201205100002', '1', '时代阳光药\"品批发\"公司6666666', '2012-05-10', '529', '529', '1', '1', '管理员', '');
INSERT INTO `thd` VALUES ('TH201205100003', '1', '时代阳光药\"品批发\"公司6666666', '2012-05-10', '805', '805', '1', '1', '管理员', '');
INSERT INTO `thdsp` VALUES ('1', 'TH201203190001', '0001', '阿莫西林胶囊', '袋', '888888', '1', '呼吸类', '16', '7', '112');
INSERT INTO `thdsp` VALUES ('2', 'TH201205100001', '2321323', '罗红霉素', '盒', 'asdsd', '3', '感冒类', '12', '-45', '-540');
INSERT INTO `thdsp` VALUES ('3', 'TH201205100002', '22222', '华山大力丸', '盒', '2321321', '3', '感冒类', '23', '23', '529');
INSERT INTO `thdsp` VALUES ('4', 'TH201205100002', '22222', '华山大力丸', '盒', '2321321', '3', '感冒类', '23', '23', '529');
INSERT INTO `thdsp` VALUES ('5', 'TH201205100003', '0002', '六味地黄丸', '盒', 'sfsfs', '1', '呼吸类', '23', '35', '805');
INSERT INTO `users` VALUES ('1', 'admin', 'admin', '管理员', '1', '0', '系统管理员');
INSERT INTO `users` VALUES ('2', 'zhaopei', '123321', '赵培', '2', '0', '是大法师');
INSERT INTO `users` VALUES ('3', 'rongrong', '123321', '葛君蓉', '3', '0', '');

-- ----------------------------
-- Trigger structure for ckdsp_setspxx
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `ckdsp_setspxx` BEFORE DELETE ON `ckdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl+old.sl,kczj=kcsl*jhprice where spid=old.spid;
END;;
DELIMITER ;

-- ----------------------------
-- Trigger structure for jhdsp_setspxx
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `jhdsp_setspxx` BEFORE DELETE ON `jhdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl-old.sl,kczj=kcsl*jhprice where spid=old.spid;
END;;
DELIMITER ;

-- ----------------------------
-- Trigger structure for thdsp_setspxx
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `thdsp_setspxx` BEFORE DELETE ON `thdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl+old.sl,kczj=kcsl*jhprice where spid=old.spid;
END;;
DELIMITER ;

-- ----------------------------
-- Trigger structure for tkdsp_setspxx
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `tkdsp_setspxx` BEFORE DELETE ON `tkdsp` FOR EACH ROW BEGIN
    update spxx set kcsl=kcsl-old.sl,kczj=kcsl*jhprice where spid=old.spid;
END;;
DELIMITER ;
