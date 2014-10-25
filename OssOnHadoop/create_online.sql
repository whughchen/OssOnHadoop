--在线数据部署机器 10.206.15.154 用户名：oss  密码：oss_develop
--mysql -uroot
--注意：部署勿把其它业务数据给删掉或覆盖掉。


CREATE DATABASE db_wgame_{:business_id}_dr  DEFAULT CHARACTER SET utf8;

use db_wgame_{:business_id}_dr;

create table tb_{:business_id}_roleinfo_qq_0 ( 
   gameappid varchar(32) not null DEFAULT 'qq',
   openid varchar(32) NOT NULL,
   regtime int(11) NOT NULL DEFAULT '0',
   level int(11) NOT NULL DEFAULT '0',
   moneyios int(11) NOT NULL DEFAULT '0',
   moneyandroid int(11) NOT NULL DEFAULT '0',
   diamondios int(11) NOT NULL DEFAULT '0',
   diamondandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (openid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create table tb_{:business_id}_roleinfo_qq_1 ( 
   gameappid varchar(32) not null DEFAULT 'qq',
   openid varchar(32) NOT NULL,
   regtime int(11) NOT NULL DEFAULT '0',
   level int(11) NOT NULL DEFAULT '0',
   moneyios int(11) NOT NULL DEFAULT '0',
   moneyandroid int(11) NOT NULL DEFAULT '0',
   diamondios int(11) NOT NULL DEFAULT '0',
   diamondandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (openid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create table tb_{:business_id}_roleinfo_qq_2 ( 
   gameappid varchar(32) not null DEFAULT 'qq',
   openid varchar(32) NOT NULL,
   regtime int(11) NOT NULL DEFAULT '0',
   level int(11) NOT NULL DEFAULT '0',
   moneyios int(11) NOT NULL DEFAULT '0',
   moneyandroid int(11) NOT NULL DEFAULT '0',
   diamondios int(11) NOT NULL DEFAULT '0',
   diamondandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (openid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create table tb_{:business_id}_roleinfo_qq_3 ( 
   gameappid varchar(32) not null DEFAULT 'qq',
   openid varchar(32) NOT NULL,
   regtime int(11) NOT NULL DEFAULT '0',
   level int(11) NOT NULL DEFAULT '0',
   moneyios int(11) NOT NULL DEFAULT '0',
   moneyandroid int(11) NOT NULL DEFAULT '0',
   diamondios int(11) NOT NULL DEFAULT '0',
   diamondandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (openid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create table tb_{:business_id}_roleinfo_qq_4 ( 
   gameappid varchar(32) not null DEFAULT 'qq',
   openid varchar(32) NOT NULL,
   regtime int(11) NOT NULL DEFAULT '0',
   level int(11) NOT NULL DEFAULT '0',
   moneyios int(11) NOT NULL DEFAULT '0',
   moneyandroid int(11) NOT NULL DEFAULT '0',
   diamondios int(11) NOT NULL DEFAULT '0',
   diamondandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (openid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

create table tb_{:business_id}_roleinfo_wx_0( 
   gameappid varchar(32) not null DEFAULT 'wx',
   openid varchar(32) NOT NULL,
   regtime int(11) NOT NULL DEFAULT '0',
   level int(11) NOT NULL DEFAULT '0',
   moneyios int(11) NOT NULL DEFAULT '0',
   moneyandroid int(11) NOT NULL DEFAULT '0',
   diamondios int(11) NOT NULL DEFAULT '0',
   diamondandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (openid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create table tb_{:business_id}_roleinfo_wx_1( 
   gameappid varchar(32) not null DEFAULT 'wx',
   openid varchar(32) NOT NULL,
   regtime int(11) NOT NULL DEFAULT '0',
   level int(11) NOT NULL DEFAULT '0',
   moneyios int(11) NOT NULL DEFAULT '0',
   moneyandroid int(11) NOT NULL DEFAULT '0',
   diamondios int(11) NOT NULL DEFAULT '0',
   diamondandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (openid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create table tb_{:business_id}_roleinfo_wx_2( 
   gameappid varchar(32) not null DEFAULT 'wx',
   openid varchar(32) NOT NULL,
   regtime int(11) NOT NULL DEFAULT '0',
   level int(11) NOT NULL DEFAULT '0',
   moneyios int(11) NOT NULL DEFAULT '0',
   moneyandroid int(11) NOT NULL DEFAULT '0',
   diamondios int(11) NOT NULL DEFAULT '0',
   diamondandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (openid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create table tb_{:business_id}_roleinfo_wx_3( 
   gameappid varchar(32) not null DEFAULT 'wx',
   openid varchar(32) NOT NULL,
   regtime int(11) NOT NULL DEFAULT '0',
   level int(11) NOT NULL DEFAULT '0',
   moneyios int(11) NOT NULL DEFAULT '0',
   moneyandroid int(11) NOT NULL DEFAULT '0',
   diamondios int(11) NOT NULL DEFAULT '0',
   diamondandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (openid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
create table tb_{:business_id}_roleinfo_wx_4( 
   gameappid varchar(32) not null DEFAULT 'wx',
   openid varchar(32) NOT NULL,
   regtime int(11) NOT NULL DEFAULT '0',
   level int(11) NOT NULL DEFAULT '0',
   moneyios int(11) NOT NULL DEFAULT '0',
   moneyandroid int(11) NOT NULL DEFAULT '0',
   diamondios int(11) NOT NULL DEFAULT '0',
   diamondandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (openid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;


use db_online;

create table tb_{:business_id}_onlinecnt_qq_0 ( 
   gameappid varchar(32) not null DEFAULT 'qq',
   timekey int(11) NOT NULL AUTO_INCREMENT,
   gsid varchar(32) NOT NULL DEFAULT '',
   onlinecntios int(11) NOT NULL DEFAULT '0',
   onlinecntandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (timekey,gsid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

create table tb_{:business_id}_onlinecnt_wx_0 ( 
   gameappid varchar(32) not null DEFAULT 'wx',
   timekey int(11) NOT NULL AUTO_INCREMENT,
   gsid varchar(32) NOT NULL DEFAULT '',
   onlinecntios int(11) NOT NULL DEFAULT '0',
   onlinecntandroid int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (timekey,gsid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

use db_GameOssResult;


create  view v_tb_{:business_id}_roleinfo as
select * from db_wgame_{:business_id}_dr.tb_{:business_id}_roleinfo_wx_0 union all
select * from db_wgame_{:business_id}_dr.tb_{:business_id}_roleinfo_wx_1 union all
select * from db_wgame_{:business_id}_dr.tb_{:business_id}_roleinfo_wx_2 union all
select * from db_wgame_{:business_id}_dr.tb_{:business_id}_roleinfo_wx_3 union all
select * from db_wgame_{:business_id}_dr.tb_{:business_id}_roleinfo_wx_4 union all
select * from db_wgame_{:business_id}_dr.tb_{:business_id}_roleinfo_qq_0 union all
select * from db_wgame_{:business_id}_dr.tb_{:business_id}_roleinfo_qq_1 union all
select * from db_wgame_{:business_id}_dr.tb_{:business_id}_roleinfo_qq_2 union all
select * from db_wgame_{:business_id}_dr.tb_{:business_id}_roleinfo_qq_3 union all
select * from db_wgame_{:business_id}_dr.tb_{:business_id}_roleinfo_qq_4
;

--更改
create  view v_tb_{:business_id}_onlinecnt as
select * from db_online.tb_{:business_id}_onlinecnt_qq_0 union all
select * from db_online.tb_{:business_id}_onlinecnt_wx_0
;

--容量配置表：
CREATE TABLE {:business_id}_rpt_tbcapacity(
  iworldid int(11) NOT NULL,
  vworldname varchar(32) DEFAULT NULL,
  imaxcapacity int(11) DEFAULT NULL,
  iidcid int(11) DEFAULT NULL,
  vidcname varchar(32) DEFAULT NULL,
  iisactive int(11) DEFAULT NULL,
  vgameappid varchar(32) DEFAULT NULL,
  platid int(11) DEFAULT NULL,
  PRIMARY KEY (iworldid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 
;

CREATE TABLE {:business_id}_tmp_tbRealOnline (
  dtStatTime datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  vGameAppID varchar(32) NOT NULL,
  PlatID int(11) NOT NULL,
  iChannelId smallint(6) unsigned NOT NULL DEFAULT '65535',
  iUserNum int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (dtStatTime,vGameAppID,PlatID,iChannelId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE {:business_id}_rpt_tbRealOnline (
  dtStatTime datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  iWorldId int(11) unsigned NOT NULL DEFAULT '0',
  iChannelId smallint(6) unsigned NOT NULL DEFAULT '0',
  iUserNum int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (dtStatTime,iWorldId,iChannelId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE {:business_id}_rpt_tbHistoryOnline (
  dtStatDate date NOT NULL DEFAULT '1970-01-01',
  iWorldId int(11) unsigned NOT NULL DEFAULT '0',
  iMaxOnlineNum int(11) unsigned NOT NULL DEFAULT '0',
  iAvgOnlineNum int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;


CREATE TABLE {:business_id}_tmp_tbMoneyStorage (
  dtStatDate date NOT NULL DEFAULT '1970-01-01',
  vGameAppID varchar(32) NOT NULL,
  PlatID int(11) NOT NULL,
  iZoneId tinyint(4) unsigned NOT NULL DEFAULT '0',
  iMoneyType tinyint(4) unsigned NOT NULL DEFAULT '0',
  iStore int(11) unsigned NOT NULL DEFAULT '0',
  iRoleNum int(11) unsigned NOT NULL DEFAULT '0',
  iMoney bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (dtStatDate,vGameAppID,PlatID,iZoneId,iMoneyType,iStore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

CREATE TABLE {:business_id}_rpt_tbMoneyStorage (
  dtStatDate date NOT NULL DEFAULT '1970-01-01',
  iWorldId int(11) unsigned NOT NULL DEFAULT '0',
  iZoneId tinyint(4) unsigned NOT NULL DEFAULT '0',
  iMoneyType tinyint(4) unsigned NOT NULL DEFAULT '0',
  iStore int(11) unsigned NOT NULL DEFAULT '0',
  iRoleNum int(11) unsigned NOT NULL DEFAULT '0',
  iMoney bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (dtStatDate,iWorldId,iZoneId,iMoneyType,iStore)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;

insert into tbbusiness (business_id) values('{:business_id}')
;
 