-- -----------------------------------------------------------------------------
-- Project:    OSS
-- File:         oss_config_table_create.sql
-- Description:   经营分析配置表创建脚本
-- Author:   whughchen@gmail.com
-- Date:       2014-03-10
-- History:
-- -----------------------------------------------------------------------------

use dbOssConf;

-- 创建  服务器容量配置表 tbCapacity
CREATE TABLE IF NOT EXISTS tbCapacity (
    iWorldId smallint(6) unsigned not null default 0 COMMENT 'World 编号',
    vWorldName varchar(32) not null default '0' COMMENT 'World名称',
    iMaxCapacity int(11) unsigned not null default '0' COMMENT '服务器容量',
	iIdcId tinyint(4) unsigned not null default '0' COMMENT '所属IDC ID',
	vIdcName varchar(32) not null default '0' COMMENT '所属IDC名称',
    iIsActive tinyint(4) unsigned not null default 0,
    PRIMARY KEY(iWorldId),
    INDEX(iIsActive)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='服务器容量配置表';

-- 创建  频道名称配置表 tbChannelConf
CREATE TABLE IF NOT EXISTS tbChannelConf (
    iWorldId smallint(6) NOT NULL default '0' COMMENT 'World 编号',
    iChannelId smallint(6) NOT NULL default '0' COMMENT '频道/Zone编号',
    vChannelName varchar(32) NOT NULL default '0' COMMENT 'ZONE名称',
    PRIMARY KEY  (iWorldId,iChannelId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='频道名称配置表';

-- 创建省级行政区、片区配置表tbProvince
CREATE TABLE IF NOT EXISTS tbProvince (
    iProvinceId int(11) unsigned not null default 0 COMMENT '省市区编号',
    vProvinceName varchar(32) not null default '0' COMMENT '省市区名称',
    vArea varchar(32) not null default '0' COMMENT '所属片区',
    PRIMARY KEY(iProvinceId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '省级行政区片区配置表'; 

-- 创建网络运营商配置表tbSPInfo
CREATE TABLE IF NOT EXISTS tbSPInfo (
    iSPId smallint(6) unsigned not null default 0 COMMENT '网络运营商编号',
    vSPName varchar(32) not null default '0' COMMENT '网络运营商名称',
    PRIMARY KEY(iSPId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '网络运营商配置表';

-- 创建  道具名称配置表 tbItemConf
CREATE TABLE IF NOT EXISTS tbItemConf (
    iItemType smallint(6) unsigned not null default 0 COMMENT '道具类型ID',
    iItemId int(11) unsigned not null default 0 COMMENT '道具ID',
    vItemName varchar(32) not null default '0' COMMENT '道具名称',
    vItemTypeName varchar(32) not null default '0' COMMENT '道具类型名称',
	iItemSubType tinyint(4) unsigned not null default 0 COMMENT '道具子类型ID', 
	vItemSubTypeName varchar(32) not null default '0' COMMENT '道具子类型名',
    iPrice int(11) unsigned not null default '0' COMMENT '单价',
    iOriginalItemType smallint(6) unsigned not null default 0 COMMENT '游戏原始道具类型ID',
    iTerm smallint(6) unsigned not null default '0' COMMENT '期限',
    PRIMARY KEY(iItemType,iItemId,iOriginalItemType,iTerm)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '道具名称配置表';

-- 创建  商品名称配置表 tbGoodsConf
CREATE TABLE IF NOT EXISTS tbGoodsConf (
    iGoodsType smallint(6) unsigned not null default 0 COMMENT '商品类型ID',
    iGoodsId int(11) unsigned not null default 0 COMMENT '商品ID',
    vGoodsName varchar(32) not null default '0' COMMENT '商品名称',
    vGoodsTypeName varchar(32) not null default '0' COMMENT '商品类型名称',
	iGoodsSubType tinyint(4) unsigned not null default 0 COMMENT '商品子类型ID', 
	vGoodsSubTypeName varchar(32) not null default '0' COMMENT '商品子类型名',
    iPrice int(11) unsigned not null default '0' COMMENT '单价',
    iOriginalGoodsType tinyint(4) unsigned not null default 0 COMMENT '游戏原始商品类型ID',
    iTerm smallint(6) unsigned not null default '0' COMMENT '用户定义期限',
    iOriginalTerm int(11) unsigned not null default '0' COMMENT '原始期限',
    PRIMARY KEY(iGoodsType,iGoodsId,iOriginalGoodsType,iTerm)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '商品名称配置表';

-- 创建  任务名称配置表 tbTaskConf
CREATE TABLE IF NOT EXISTS tbTaskConf (
    `iTaskId` smallint(6) unsigned NOT NULL default '0' COMMENT '任务ID',
    `vTaskName` varchar(32) default NULL COMMENT '任务名称',
    `iTaskLevel` tinyint(4) unsigned NOT NULL default '0' COMMENT '任务级别',
    `iAreaId` tinyint(4) unsigned NOT NULL default '0' COMMENT '区域ID',
    `vAreaName` varchar(32) default NULL COMMENT '区域名称',
    `iTaskTypeId` tinyint(4) unsigned NOT NULL default '0' COMMENT '任务类型ID',
    `vTaskTypeName` varchar(32) default NULL COMMENT '任务类型名称',
    PRIMARY KEY(iTaskId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '任务名称配置表';

-- 创建  角色性别配置表 tbSexConf
CREATE TABLE IF NOT EXISTS tbSexConf (
    cSex char(1) not null default 'M' COMMENT '性别',
    iSexId smallint(6) unsigned not null default 0 COMMENT '性别ID',
    PRIMARY KEY(cSex)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '角色性别配置表';

-- 创建  职业名称配置表 tbJobConf
CREATE TABLE IF NOT EXISTS tbJobConf (
    iJobId smallint(6) unsigned not null default 0 COMMENT '职业ID',
    vJobName varchar(32) not null default '0' COMMENT '职业名称',
    PRIMARY KEY(iJobId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '职业名称配置表';

-- 创建  怪物名称配置表 tbMonsterConf
CREATE TABLE IF NOT EXISTS tbMonsterConf (
    iMonsterId int(11) unsigned not null default 0 COMMENT '怪物ID',
    vMonsterName varchar(32) not null default '0' COMMENT '怪物名称',
    iLevel tinyint(4) unsigned not null default '0' COMMENT '怪物等级',
    iMoney int(11) unsigned not null default '0' COMMENT '杀死怪物后可获得金钱数',
    iExp int(11) unsigned not null default '0' COMMENT '杀死怪物后可获得经验',
    PRIMARY KEY(iMonsterId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '怪物名称配置表';

-- 创建  副本配置表 tbRaidConf
CREATE TABLE IF NOT EXISTS tbRaidConf (
    iRaidId smallint(6) unsigned not null default 0 COMMENT '任务ID',
    vRaidName varchar(32) not null default '0' COMMENT '任务名称',
    iLevel tinyint(4) unsigned not null default 0 COMMENT '任务级别',
    PRIMARY KEY(iRaidId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '副本配置表';

-- 创建  地图配置表 tbMapConf
CREATE TABLE IF NOT EXISTS tbMapConf (
    iMapId smallint(6) unsigned not null default 0 COMMENT '地图ID',
    vMapName varchar(32) not null default '0' COMMENT '地图名称',
    PRIMARY KEY(iMapId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '地图配置表';

-- 创建  NPC配置表 tbNpcConf
CREATE TABLE IF NOT EXISTS tbNpcConf (
    iNpcId smallint(6) unsigned not null default 0 COMMENT 'NPC ID',
    vNpcName varchar(32) not null default '0' COMMENT 'NPC名称',
    PRIMARY KEY(iNpcId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT 'NPC配置表';

-- 创建  技能配置表 tbSkillConf
CREATE TABLE IF NOT EXISTS tbSkillConf (
    iSkillId smallint(6) unsigned not null default 0 COMMENT '技能ID',
    vSkillName varchar(32) not null default '0' COMMENT '技能名称',
    PRIMARY KEY(iSkillId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '技能配置表';

-- 创建  游戏金钱名称配置表 tbMoneyTypeConf
CREATE TABLE IF NOT EXISTS tbMoneyTypeConf (
    iMoneyType smallint(6) unsigned not null default 0 COMMENT '金钱类型ID',
    vMoneyName varchar(32) not null default '0' COMMENT '金钱类型名称',
    PRIMARY KEY(iMoneyType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '游戏金钱名称配置表';

-- 创建  金钱产出、消耗、转移、存储方式配置表 tbMoneyModeConf
CREATE TABLE IF NOT EXISTS tbMoneyModeConf (
    iModeId int(11) unsigned not null default 0 COMMENT '金钱流向ID',
    vModeName varchar(32) not null default '0' COMMENT '金钱流向名称',
    iModeType tinyint(4) unsigned not null default 0 COMMENT '模式类型ID',
    iModeTypeName varchar(32) not null default '0' COMMENT '模式类型名称',
    PRIMARY KEY(iModeId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '金钱流向配置表';

-- 创建  物品产出、消耗、转移、存储方式配置表 tbItemModeConf
CREATE TABLE IF NOT EXISTS tbItemModeConf (
    iModeId int(11) unsigned not null default 0 COMMENT '道具流向ID',
    vModeName varchar(32) not null default '0' COMMENT '道具流向名称',
    iModeType tinyint(4) unsigned not null default 0 COMMENT '模式类型ID',
    iModeTypeName varchar(32) not null default '0' COMMENT '模式类型名称',
    PRIMARY KEY(iModeId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '道具流向配置表';

-- 创建  金钱储存区间段配置表 tbMoneySegmentConf
CREATE TABLE IF NOT EXISTS tbMoneySegmentConf (
    iSegment int(11) unsigned not null default 0 COMMENT '金钱存储量区间段ID',
    vSegmentName varchar(32) not null default '0' COMMENT '金钱存储量区间段描述',
    PRIMARY KEY(iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '金钱储存区间段配置表';

-- 创建  点券储存区间段配置表 tbGamePointSegmentConf
CREATE TABLE IF NOT EXISTS tbGamePointSegmentConf (
    iSegment int(11) unsigned not null default 0 COMMENT '点券存储量区间段ID',
    vSegmentName varchar(32) not null default '0' COMMENT '点券存储量区间段描述',
    PRIMARY KEY(iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '点券储存区间段配置表';

-- 创建  点券储存区间段配置表 tbGamePointSegConf
CREATE TABLE IF NOT EXISTS tbGamePointSegConf (
    iSegment int(11) unsigned not null default 0 COMMENT '点券存储量区间段ID',
    vSegmentName varchar(32) not null default '0' COMMENT '点券存储量区间段描述',
    PRIMARY KEY(iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '点券储存区间段配置表';

-- 创建  掉线类型配置表 tbOfflineConf
CREATE TABLE IF NOT EXISTS tbOfflineConf (
    iOfflineType tinyint(4) unsigned not null default 0 COMMENT '掉线类型ID',
    vOfflineName varchar(32) not null default '0' COMMENT '掉线类型名',
    PRIMARY KEY(iOfflineType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '掉线类型配置表';

-- 创建  团体操作配置表 tbOrganizationConf
CREATE TABLE IF NOT EXISTS tbOrganizationConf (
    iOperType tinyint(4) unsigned not null default 0 COMMENT '操作类型ID',
    vOperName varchar(32) not null default '0' COMMENT '操作类型名',
    PRIMARY KEY(iOperType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '团体操作配置表';

-- 创建  游戏模式配置表 tbGameModeConf
CREATE TABLE IF NOT EXISTS tbGameModeConf (
    iGameMode int(11) unsigned not null default 0 COMMENT '模式ID',
    vModeName varchar(32) not null default '0' COMMENT '模式名',
    PRIMARY KEY(iGameMode)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '游戏模式配置表';

-- 创建  游戏场景配置表 tbGameSceneConf
CREATE TABLE IF NOT EXISTS tbGameSceneConf (
    iSceneMode int(11) unsigned not null default 0 COMMENT '场景ID',
    vSceneName varchar(32) not null default '0' COMMENT '场景名',
    PRIMARY KEY(iSceneMode)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '游戏场景配置表';

-- 创建  包月操作类型配置表 tbMonthPayCmdConf
CREATE TABLE IF NOT EXISTS tbMonthPayCmdConf (
    iCmdType smallint(6) unsigned not null default 0 COMMENT '操作类型ID',
    vCmdName varchar(32) not null default '0' COMMENT '操作类型名',
    PRIMARY KEY(iCmdType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '包月操作类型配置表';

-- 创建  包月付费途径配置表 tbMonthPayWayConf
CREATE TABLE IF NOT EXISTS tbMonthPayWayConf (
    iPayType smallint(6) unsigned not null default 0 COMMENT '付费类型ID',
    vPayName varchar(32) not null default '0' COMMENT '付费类型名',
    PRIMARY KEY(iPayType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '包月付费途径配置表';

-- 创建  点券充值途径配置表 tbDmsBillOperConf
CREATE TABLE IF NOT EXISTS tbDmsBillOperConf (
    iOperId smallint(6) unsigned not null default 0 COMMENT '充值途径ID',
    vOperName varchar(32) not null default '0' COMMENT '充值途径名',
    iOperType smallint(6) unsigned not null default 0 COMMENT '充值类型ID',
    PRIMARY KEY(iOperId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '点券充值途径配置表';

-- 创建 点券消耗渠道统计表 tbPointsConsumeWayConf
CREATE TABLE IF NOT EXISTS tbPointsConsumeWayConf (
  iWayId smallint(6) unsigned NOT NULL default '0' COMMENT '消耗渠道ID',
  vWayName varchar(32) NOT NULL default '0' COMMENT '消耗渠道名',
  iWayType smallint(6) unsigned not null default 0 COMMENT '消费类型ID',
  PRIMARY KEY  (iWayId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='点券消耗渠道配置表'; 

-- 创建  角色等级分段区间配置表 tbLevelSegmentConf
CREATE TABLE IF NOT EXISTS tbLevelSegmentConf (
    iLevel tinyint(4) unsigned not null default 0 COMMENT '等级',
    vSegment varchar(32) not null default '0' COMMENT '等级段名',
    PRIMARY KEY(iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '角色等级分段区间配置表';

-- 创建 增加团体类型名称配置表 tbOrgTypeNameConf
CREATE TABLE IF NOT EXISTS tbOrgTypeNameConf (
  	iOrgType tinyint(4) unsigned NOT NULL default '1' COMMENT '团体类型ID',
  	vOrgName varchar(32) NOT NULL default '0' COMMENT '团体类型名称',
  	PRIMARY KEY  (iOrgType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='团体类型名称配置表';	

-- 创建 任务类型名称配置表 tbTaskTypeNameConf
CREATE TABLE IF NOT EXISTS tbTaskTypeNameConf (
  iTaskTypeId tinyint(4) unsigned NOT NULL default '0' COMMENT '任务类型ID',
  vTaskTypeName varchar(32) NOT NULL default '0' COMMENT '任务类型名称',
  PRIMARY KEY  (iTaskTypeId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='任务类型名称配置表';

-- 创建 监控配置表 tbMonitorConf
CREATE TABLE IF NOT EXISTS tbMonitorConf(
    vProgramName varchar(32) NOT NULL DEFAULT '0' COMMENT '程序名',
    vProgramDesc  varchar(32) NULL COMMENT '程序作用描述',
    vInfection varchar(512) NULL COMMENT '程序影响的统计结果表',
    dtBetimes time NOT NULL DEFAULT '00:00:00' COMMENT '额定统计完成时间',
    PRIMARY KEY(vProgramName),
    INDEX(dtBetimes)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='统计监控配置表';

-- 创建  在线时长区间段配置表 tbPlayTimeSegmentConf
CREATE TABLE IF NOT EXISTS tbPlayTimeSegmentConf (
    iSegment int(11) unsigned not null default 0 COMMENT '在线时长区间段ID',
    vSegmentName varchar(32) not null default '0' COMMENT '在线时长区间段描述',
    PRIMARY KEY(iSegment)
) TYPE=InnoDB DEFAULT CHARSET=gbk COMMENT '在线时长区间段配置表';

-- 创建 zone在线配置表 tbZoneConf
CREATE TABLE IF NOT EXISTS `tbZoneConf` (
  `iZoneId` int(12) unsigned NOT NULL default '0' COMMENT '国家ID',
  `vZoneName` varchar(32) NOT NULL default '0' COMMENT '国家名称',
  PRIMARY KEY  (`iZoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='国家配置表';

-- 创建  装备加工方式配置表 tbArmMakeConf
CREATE TABLE IF NOT EXISTS `tbArmMakeConf` (
  `iArmMakeId` int(11) unsigned NOT NULL default '0',
  `vArmMakeName` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`iArmMakeId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  活动配置表 tbActivityConf
CREATE TABLE IF NOT EXISTS  `tbActivityConf` (
  `iActivityId` int(11) unsigned NOT NULL default '0',
  `vActivityName` varchar(32) default NULL,
  `vStatTerm` text
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  角色行为配置表 tbRoleBehConf
CREATE TABLE IF NOT EXISTS `tbRoleBehConf` (
  `iBehaId` int(11) unsigned NOT NULL default '0',
  `vBehaName` varchar(32) default NULL,
  PRIMARY KEY  (`iBehaId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  结果表维护配置表  tbOssResultTableMaintenanceConf
CREATE TABLE IF NOT EXISTS tbOssResultTableMaintenanceConf (
   vTableName varchar(32) NOT NULL default '0' COMMENT '结果表名',
   vTableDesc varchar(32) NOT NULL default '0' COMMENT '结果表内容描述',
   iReservedDays smallint(6) unsigned NOT NULL default 0 COMMENT '当前结果表中数据保留天数',
   vTimeFieldName varchar(32) NOT NULL default '0' COMMENT '时间条件字段名',
  PRIMARY KEY  (vTableName)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='结果表维护配置表';

-- 创建  组用户配置表  tbGroupUserConf
CREATE TABLE IF NOT EXISTS tbGroupUserConf (
   iGroupId tinyint(4) unsigned NOT NULL default 0 COMMENT '组ID',
   vGroupName varchar(32) NOT NULL default '0' COMMENT '组名称',
   PRIMARY KEY (iGroupId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='组用户配置表';

-- 创建 通用配置模块执行语句配置表
CREATE TABLE IF NOT EXISTS dbOssConf.tbOssConfigureOpt (
  vResultTab VARCHAR(32) NOT NULL COMMENT '结果表名',
  iDBConnType smallint unsigned NOT NULL DEFAULT 202 COMMENT '数据库连接类型，请参考文档。或参见代码CONN_TYPE的枚举值。默认为直接连接LOGDB',
  iDbNum TINYINT unsigned NOT NULL DEFAULT 1 COMMENT '数据库个数',
  iTabNum TINYINT unsigned NOT NULL DEFAULT 1 COMMENT '数据库表个数，比如会作分表处理，分成多少张表',
  iDBTYPE TINYINT unsigned NOT NULL DEFAULT 1 COMMENT '数据库类型。1：MYSQL；2：ORACLE；3：SQL SERVER',
  vOptSql VARCHAR(1024) NOT NULL COMMENT '执行的SQL语句',
  vResultColumnList varchar(256) NOT NULL COMMENT '结果库列名，不能加时间和大区字段',
  vPrimayColumn VARCHAR(16) DEFAULT NULL COMMENT '当根据主键列汇总其它列时，所填的主键列名。仅支持一个列作为主键',
  iIsActive TINYINT unsigned NOT NULL DEFAULT 0 COMMENT '是否激活执行。0：否；1：是',
  iExecDataType TINYINT unsigned NOT NULL COMMENT '处理数据方式。1：所见即所得；2：同列相加；3：依据某一主键同列相加。后续若有增加，请按顺序递增扩展',
  PRIMARY KEY (vResultTab)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用配置模块执行语句配置表';

-- 创建 通用渠道配置表
CREATE TABLE `tbSFromConf` (
  `iSFrom` int(11) NOT NULL DEFAULT '0',
  `vSFrom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`iSFrom`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk
