/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - ts-ssmj
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ts-ssmj` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ts-ssmj`;

/*Table structure for table `chubanshe` */

DROP TABLE IF EXISTS `chubanshe`;

CREATE TABLE `chubanshe` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '出版社名称  Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='图书出版社表';

/*Data for the table `chubanshe` */

insert  into `chubanshe`(`id`,`name`) values (1,'出版社名称1'),(2,'出版社名称2'),(3,'出版社名称3');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssm1z8hn/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssm1z8hn/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssm1z8hn/upload/picture3.jpg'),(4,'homepage',NULL);

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` tinyint(4) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别',2,'男',NULL,'2021-01-25 11:41:54'),(2,'sex_types','性别',1,'女',NULL,'2021-01-25 11:41:54'),(3,'lb_types','图书类别',3,'小说',NULL,'2021-01-25 11:41:54'),(4,'lb_types','图书类别',2,'文言文',NULL,'2021-01-25 11:41:54'),(5,'lb_types','图书类别',1,'诗歌',NULL,'2021-01-25 11:41:54'),(6,'sf_types','是否借阅',2,'是',NULL,'2021-01-25 11:41:54'),(7,'sf_types','是否借阅',1,'否',NULL,'2021-01-25 11:41:54');

/*Table structure for table `jieyue` */

DROP TABLE IF EXISTS `jieyue`;

CREATE TABLE `jieyue` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yh_types` tinyint(4) DEFAULT NULL COMMENT '借阅人 Search',
  `ts_types` tinyint(4) DEFAULT NULL COMMENT '借阅书名 Search',
  `lb_types` tinyint(4) DEFAULT NULL COMMENT '图书类别 Search',
  `cbs_types` tinyint(4) DEFAULT NULL COMMENT '图书出版社 Search',
  `sj_types` tinyint(4) DEFAULT NULL COMMENT '所在书架 Search',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '借阅时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='借阅表';

/*Data for the table `jieyue` */

insert  into `jieyue`(`id`,`yh_types`,`ts_types`,`lb_types`,`cbs_types`,`sj_types`,`create_time`) values (6,1,4,3,2,2,'2021-02-25 16:34:04'),(7,1,3,3,3,1,'2021-02-25 16:34:14'),(8,2,2,2,2,2,'2021-02-25 16:35:10');

/*Table structure for table `liuyanxinxi` */

DROP TABLE IF EXISTS `liuyanxinxi`;

CREATE TABLE `liuyanxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `note` varchar(255) DEFAULT NULL COMMENT '留言信息',
  `yhnote` varchar(11) DEFAULT NULL COMMENT '留言人',
  `note_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '留言时间 Search',
  `reply` varchar(255) DEFAULT NULL COMMENT '回复',
  `glreply` varchar(11) DEFAULT NULL COMMENT '回复人',
  `reply_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '回复时间 Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `liuyanxinxi` */

insert  into `liuyanxinxi`(`id`,`note`,`yhnote`,`note_time`,`reply`,`glreply`,`reply_time`) values (4,'1231111','admin','2021-02-03 17:15:28','只有管理员可以回复','admin','2021-02-03 17:15:29'),(7,'123312312','admin','2021-02-25 16:34:21',NULL,NULL,NULL);

/*Table structure for table `shujia` */

DROP TABLE IF EXISTS `shujia`;

CREATE TABLE `shujia` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) DEFAULT NULL COMMENT '位置  Search',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='书架表';

/*Data for the table `shujia` */

insert  into `shujia`(`id`,`name`) values (1,'位置1'),(2,'位置2'),(3,'位置3');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` int(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','z5o1rsmij98ydh2mrdfrqa0efhlgph2z','2021-01-28 18:04:51','2021-02-25 17:35:16'),(2,1,'小札','users','用户','t72yh6v7y7h2h5v4w09jxe52xm5ue4ib','2021-02-02 16:10:08','2021-02-25 17:34:33'),(3,1,'小札','users','员工','2mmlqx16d8s2gl4i3iu1djp5y620zwqz','2021-02-02 16:20:10','2021-02-03 10:56:34'),(4,2,'小站','users','员工','abnya3h963wfqb2vluckg138z3pnwqnt','2021-02-02 16:48:23','2021-02-02 18:27:14'),(5,4,'小夏','users','员工','rgei89c1m1i5ndnws5r15tiaaw16phdx','2021-02-02 16:51:56','2021-02-03 10:57:10'),(6,12,'员工2','users','员工','62jmrjqq1zf319mq1d7021sudn93f4zs','2021-02-03 09:56:47','2021-02-03 10:56:48'),(7,1,'admin','users','vip管理员','nsm5vfh3sv0v2dvkdg0v1i6m46dto5sp','2021-02-24 19:20:15','2021-02-24 22:29:51'),(8,1,'客户姓名1','users','客户','5gmitkjkvu3o7a2267rl7bgdw6dpwcqv','2021-02-24 20:28:18','2021-02-24 22:32:13'),(9,2,'客户姓名2','users','客户','hbx7ji51cm1qgrdhz5xgy8bmshbpty5a','2021-02-24 20:50:44','2021-02-24 22:32:30'),(10,2,'小站','users','用户','ewxfqni3g6g6ds7w0dzmo1en76m4ftq3','2021-02-25 16:25:27','2021-02-25 17:34:57');

/*Table structure for table `tushu` */

DROP TABLE IF EXISTS `tushu`;

CREATE TABLE `tushu` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial` varchar(200) DEFAULT NULL COMMENT '图书编号 Search',
  `name` varchar(200) DEFAULT NULL COMMENT '图书名称 Search',
  `author` varchar(200) DEFAULT NULL COMMENT '图书作者',
  `lb_types` tinyint(4) DEFAULT NULL COMMENT '图书类别 Search',
  `cbs_types` tinyint(4) DEFAULT NULL COMMENT '图书出版社 Search',
  `sj_types` tinyint(4) DEFAULT NULL COMMENT '所在书架 Search',
  `sf_types` tinyint(4) DEFAULT NULL COMMENT '是否借阅 Search',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '图书添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='图书表';

/*Data for the table `tushu` */

insert  into `tushu`(`id`,`serial`,`name`,`author`,`lb_types`,`cbs_types`,`sj_types`,`sf_types`,`create_time`) values (1,'图书编号1','图书名称1','图书作者1',1,1,3,1,'2021-02-25 15:23:02'),(2,'图书编号2','图书名称2','图书作者2',2,2,2,2,'2021-02-25 15:51:57'),(3,'图书编号3','图书名称3','图书作者3',3,3,1,2,'2021-02-25 15:51:58'),(4,'1231','1231','123',3,2,2,2,'2021-02-25 16:32:49');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) NOT NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2021-01-28 18:04:51');

/*Table structure for table `xitonggonggao` */

DROP TABLE IF EXISTS `xitonggonggao`;

CREATE TABLE `xitonggonggao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题 Search',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `neirong` longtext COMMENT '内容',
  `riqi` datetime DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统公告';

/*Data for the table `xitonggonggao` */

insert  into `xitonggonggao`(`id`,`addtime`,`biaoti`,`leixing`,`neirong`,`riqi`) values (1,'2021-02-25 17:35:20','日常公告标题','日常公告','公告信息','2021-02-25 17:35:20'),(2,'2021-02-25 17:35:20','紧急公告标题','紧急公告','公告信息','2021-02-25 17:35:20'),(3,'2021-02-25 17:35:20','其他公告标题','其他公告','公告信息','2021-02-25 17:35:20');

/*Table structure for table `yonghuxinxi` */

DROP TABLE IF EXISTS `yonghuxinxi`;

CREATE TABLE `yonghuxinxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名称 Search',
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `img_photo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `sex_types` tinyint(10) DEFAULT '1' COMMENT '性别',
  `role` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `yonghuxinxi` */

insert  into `yonghuxinxi`(`id`,`name`,`account`,`password`,`img_photo`,`sex_types`,`role`) values (1,'小札','111','111','http://localhost:8080/ts-ssmj/file/download?fileName=1614237013459.jpg',1,'用户'),(2,'小站','222','222','http://localhost:8080/ts-ssmj/file/download?fileName=1614237006816.jpg',2,'用户');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
