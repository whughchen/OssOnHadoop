-- -----------------------------------------------------------------------------
-- Project:    OSS
-- File:         oss_table_create.sql
-- Description:   经营分析表创建脚本
-- Author:   whughchen@gmail.com
-- Date:       2014-02-24
-- History:
-- -----------------------------------------------------------------------------

-- 创建  注册用户统计表 tbUserRegister
CREATE TABLE IF NOT EXISTS tbUserRegister (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iAllRegNum int(11) unsigned not null default 0,
    iDayRegNum int(11) unsigned not null default 0,
    iWeekRegNum int(11) unsigned not null default 0,
    iDWeekRegNum int(11) unsigned not null default 0,
    iMonthRegNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  注册角色用户统计表 tbRegisterUser
CREATE TABLE IF NOT EXISTS tbRegisterUser (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iAllRegNum int(11) unsigned not null default 0,
    iDayRegNum int(11) unsigned not null default 0,
    iWeekRegNum int(11) unsigned not null default 0,
    iDWeekRegNum int(11) unsigned not null default 0,
    iMonthRegNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  日新增注册用户职业级别分布统计表 tbDayRegisterUserLvDis
CREATE TABLE IF NOT EXISTS tbDayRegisterUserLvDis (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iJob tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iRegNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iJob,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  所有注册用户职业级别分布统计表 tbRegisterUserLvDis
CREATE TABLE IF NOT EXISTS tbRegisterUserLvDis (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iJob tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iRegNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iJob,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  月注册用户职业等级通过率统计表 tbMonthRegisterUserLvPass
CREATE TABLE IF NOT EXISTS tbMonthRegisterUserLvPass (
    dtStatDate date not null default '1970-01-01',
    dtRegDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iJob tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iRegNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,dtRegDate,iWorldId,iJob,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
    
-- 创建 用户活跃情况统计表  tbUserLogin
CREATE TABLE IF NOT EXISTS tbUserLogin(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayActivityNum int(11) unsigned not null default 0,
    iWeekActivityNum int(11) unsigned not null default 0,
    iDWeekActivityNum int(11) unsigned not null default 0,
    iMonthActivityNum int(11) unsigned not null default 0,
    iDMonthActivityNum int(11) unsigned not null default 0,
    iWeekLostNum int(11) unsigned not null default 0,
    iDWeekLostNum int(11) unsigned not null default 0,
    iMonthLostNum int(11) unsigned not null default 0,
    iSilenceNum int(11) unsigned not null default 0,
    iWeekBackNum int(11) unsigned not null default 0,
    iDWeekBackNum int(11) unsigned not null default 0,
    iMonthBackNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 用户活跃情况等级分布统计表 tbUserLoginLvDis
CREATE TABLE IF NOT EXISTS tbUserLoginLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iDayActivityNum int(11) unsigned not null default 0,
    iWeekActivityNum int(11) unsigned not null default 0,
    iDWeekActivityNum int(11) unsigned not null default 0,
    iMonthActivityNum int(11) unsigned not null default 0,
    iDMonthActivityNum int(11) unsigned not null default 0,
    iWeekLostNum int(11) unsigned not null default 0,
    iDWeekLostNum int(11) unsigned not null default 0,
    iMonthLostNum int(11) unsigned not null default 0,
    iSilenceNum int(11) unsigned not null default 0,
    iWeekBackNum int(11) unsigned not null default 0,
    iDWeekBackNum int(11) unsigned not null default 0,
    iMonthBackNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 付费用户活跃情况等级分布统计表 tbPayUserLoginLvDis
CREATE TABLE IF NOT EXISTS tbPayUserLoginLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iDayActivityNum int(11) unsigned not null default 0,
    iWeekActivityNum int(11) unsigned not null default 0,
    iDWeekActivityNum int(11) unsigned not null default 0,
    iMonthActivityNum int(11) unsigned not null default 0,
    iDMonthActivityNum int(11) unsigned not null default 0,
    iWeekLostNum int(11) unsigned not null default 0,
    iDWeekLostNum int(11) unsigned not null default 0,
    iMonthLostNum int(11) unsigned not null default 0,
    iSilenceNum int(11) unsigned not null default 0,
    iWeekBackNum int(11) unsigned not null default 0,
    iDWeekBackNum int(11) unsigned not null default 0,
    iMonthBackNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 组用户活跃情况等级分布统计表 tbGroupUserLoginLvDis
CREATE TABLE IF NOT EXISTS tbGroupUserLoginLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iGroupId tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iDayActivityNum int(11) unsigned not null default 0,
    iWeekActivityNum int(11) unsigned not null default 0,
    iDWeekActivityNum int(11) unsigned not null default 0,
    iMonthActivityNum int(11) unsigned not null default 0,
    iDMonthActivityNum int(11) unsigned not null default 0,
    iWeekLostNum int(11) unsigned not null default 0,
    iDWeekLostNum int(11) unsigned not null default 0,
    iMonthLostNum int(11) unsigned not null default 0,
    iSilenceNum int(11) unsigned not null default 0,
    iWeekBackNum int(11) unsigned not null default 0,
    iDWeekBackNum int(11) unsigned not null default 0,
    iMonthBackNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iGroupId, iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 非付费用户活跃情况等级分布统计表 tbFreeUserLoginLvDis
CREATE TABLE IF NOT EXISTS tbFreeUserLoginLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iDayActivityNum int(11) unsigned not null default 0,
    iWeekActivityNum int(11) unsigned not null default 0,
    iDWeekActivityNum int(11) unsigned not null default 0,
    iMonthActivityNum int(11) unsigned not null default 0,
    iDMonthActivityNum int(11) unsigned not null default 0,
    iWeekLostNum int(11) unsigned not null default 0,
    iDWeekLostNum int(11) unsigned not null default 0,
    iMonthLostNum int(11) unsigned not null default 0,
    iSilenceNum int(11) unsigned not null default 0,
    iWeekBackNum int(11) unsigned not null default 0,
    iDWeekBackNum int(11) unsigned not null default 0,
    iMonthBackNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 周活跃用户活跃度等级分布统计表 tbWeekActivityScaleLvDis
CREATE TABLE IF NOT EXISTS tbWeekActivityScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iActivityDays int(11) unsigned not null default 0,
    iActivityNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iActivityDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 双周活跃用户活跃度等级分布统计表 tbDWeekActivityScaleLvDis
CREATE TABLE IF NOT EXISTS tbDWeekActivityScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iActivityDays int(11) unsigned not null default 0,
    iActivityNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iActivityDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 月活跃用户活跃度等级分布统计表 tbMonthActivityScaleLvDis
CREATE TABLE IF NOT EXISTS tbMonthActivityScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iActivityDays int(11) unsigned not null default 0,
    iActivityNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iActivityDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日新增注册用户地区分布统计表 tbDayRegRegionDis
CREATE TABLE IF NOT EXISTS tbDayRegRegionDis(
    dtStatDate date not null default '1970-01-01',
    iProvinceId int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iProvinceId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日登录用户地区分布统计表 tbDayLoginRegionDis
CREATE TABLE IF NOT EXISTS tbDayLoginRegionDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iProvinceId int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iProvinceId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日登录用户网络运营商分布统计表 tbDayLoginSPDis
CREATE TABLE IF NOT EXISTS tbDayLoginSPDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iSPId tinyint(6) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iSPId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 月有效活跃用户活跃度统计表 tbInEffectActivity
CREATE TABLE IF NOT EXISTS tbInEffectActivity(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iActivityDays tinyint(4) unsigned not null default 0,
    iActivityNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iActivityDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 用户存留统计表 tbResidentUser
CREATE TABLE IF NOT EXISTS tbResidentUser(
    dtRegDate date not null default '1970-01-01',
    dtStatDate date not null default '1970-01-01',
    iDayNum smallint(6) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iCumulateUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,dtRegDate,iDayNum)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 月用户存留等级分布统计表  tbResidentUserLvDis
CREATE TABLE IF NOT EXISTS tbResidentUserLvDis(
    dtRegDate date not null default '1970-01-01',
    dtStatDate date not null default '1970-01-01',
    iDayNum smallint(6) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iCumulateUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,dtRegDate,iDayNum,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 实时在线统计表 tbRealOnline
CREATE TABLE IF NOT EXISTS tbRealOnline(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iWorldId int(11) unsigned not null default 0,
    iChannelId smallint(6) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iWorldId,iChannelId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 IDC实时在线统计表 tbIdcRealOnline
CREATE TABLE IF NOT EXISTS tbIdcRealOnline(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iIdcId tinyint(4) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iIdcId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 历史在线统计表 tbHistoryOnline
CREATE TABLE IF NOT EXISTS tbHistoryOnline(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iMaxOnlineNum int(11) unsigned not null default 0,
    iAvgOnlineNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 频道历史在线统计表 tbChannelOnline
CREATE TABLE IF NOT EXISTS tbChannelOnline(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iChannelId tinyint(4) unsigned NOT NULL default '0',
    iMaxOnlineNum int(11) unsigned not null default 0,
    iAvgOnlineNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 平均在线时长统计表 tbUserOnlineTime
CREATE TABLE IF NOT EXISTS tbUserOnlineTime(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iOnlineNum int(11) unsigned not null default 0,
    iOnlineTime bigint(20) unsigned not null default 0,
    iAvgOnlineTime int(11) unsigned not null default 0,
    iSegment smallint(6) unsigned not null default 0,
    iSegmentNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 平均在线时长等级分布统计表 tbUserOnlineTimeLvDis
CREATE TABLE IF NOT EXISTS tbUserOnlineTimeLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iOnlineNum int(11) unsigned not null default 0,
    iOnlineTime bigint(20) unsigned not null default 0,
    iAvgOnlineTime int(11) unsigned not null default 0,
    iSegment smallint(6) unsigned not null default 0,
    iSegmentNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iLevel,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 平均游戏时长统计表 tbPlayTime
CREATE TABLE IF NOT EXISTS tbPlayTime(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iOnlineNum int(11) unsigned not null default 0,
    iOnlineTime bigint(20) unsigned not null default 0,
    iAvgOnlineTime int(11) unsigned not null default 0,
    iSegment smallint(6) unsigned not null default 0,
    iSegmentNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 平均游戏时长等级分布统计表 tbPlayTimeLvDis
CREATE TABLE IF NOT EXISTS tbPlayTimeLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iOnlineNum int(11) unsigned not null default 0,
    iOnlineTime bigint(20) unsigned not null default 0,
    iAvgOnlineTime int(11) unsigned not null default 0,
    iSegment smallint(6) unsigned not null default 0,
    iSegmentNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iLevel,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 ACG平均游戏时长统计表 tbAcgPlayTime
CREATE TABLE IF NOT EXISTS tbAcgPlayTime(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iOnlineNum int(11) unsigned not null default 0,
    iOnlineTime bigint(20) unsigned not null default 0,
    iAvgOnlineTime int(11) unsigned not null default 0,
    iSegment smallint(6) unsigned not null default 0,
    iSegmentNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 ACG平均游戏时长等级分布统计表 tbAcgPlayTimeLvDis
CREATE TABLE IF NOT EXISTS tbAcgPlayTimeLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iOnlineNum int(11) unsigned not null default 0,
    iOnlineTime bigint(20) unsigned not null default 0,
    iAvgOnlineTime int(11) unsigned not null default 0,
    iSegment smallint(6) unsigned not null default 0,
    iSegmentNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iLevel,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 道具销售统计表 tbGoodsVendition
CREATE TABLE IF NOT EXISTS tbGoodsVendition(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iGoodsId int(11) unsigned not null default 0,
    iGoodsType smallint(6) unsigned not null default 0,
    iTerm smallint(6) unsigned not null default 0,
    iType1 tinyint(4) unsigned not null default 0,
    iType2 tinyint(4) unsigned not null default 0,
    iType3 tinyint(4) unsigned not null default 0,
    iGoodsNum int(11) unsigned not null default 0,
    iPaymentGold int(11) unsigned not null default 0,
    iPaymentCoupon int(11) unsigned not null default 0,
    iPaymentExp int(11) unsigned not null default 0,
    iPaymentGamePoint int(11) unsigned not null default 0,
    iPaymentQpoint int(11) unsigned not null default 0,
    iPaymentQB int(11) unsigned not null default 0,
    iPaymentTenpay int(11) unsigned not null default 0,
    iPayUinCount int(11) unsigned not null default 0,
    iPayRoleCount int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iGoodsId,iGoodsType,iTerm,iType1,iType2,iType3)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 道具销售按月汇总统计表 tbMonthsGoodsVendition
CREATE TABLE IF NOT EXISTS tbMonthsGoodsVendition(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iGoodsId int(11) unsigned not null default 0,
    iGoodsType smallint(6) unsigned not null default 0,
    iTerm smallint(6) unsigned not null default 0,
    iType1 tinyint(4) unsigned not null default 0,
    iType2 tinyint(4) unsigned not null default 0,
    iType3 tinyint(4) unsigned not null default 0,
    iGoodsNum int(11) unsigned not null default 0,
    iPaymentGold int(11) unsigned not null default 0,
    iPaymentCoupon int(11) unsigned not null default 0,
    iPaymentExp int(11) unsigned not null default 0,
    iPaymentGamePoint int(11) unsigned not null default 0,
    iPaymentQpoint int(11) unsigned not null default 0,
    iPaymentQB int(11) unsigned not null default 0,
    iPaymentTenpay int(11) unsigned not null default 0,
    iPayUinCount int(11) unsigned not null default 0,
    iPayRoleCount int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iGoodsId,iGoodsType,iTerm,iType1,iType2,iType3)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 新增付费用户统计表 tbNewPayer
CREATE TABLE IF NOT EXISTS tbNewPayer(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayNewPayNum int(11) unsigned not null default 0,
    iWeekNewPayNum int(11) unsigned not null default 0,
    iDWeekNewPayNum int(11) unsigned not null default 0,
    iMonthNewPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 新增付费用户等级分布统计表 tbNewPayerLvDis
CREATE TABLE IF NOT EXISTS tbNewPayerLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iDayNewPayNum int(11) unsigned not null default 0,
    iWeekNewPayNum int(11) unsigned not null default 0,
    iDWeekNewPayNum int(11) unsigned not null default 0,
    iMonthNewPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日新增付费用户付费情况统计表 tbDayNewPayer
CREATE TABLE IF NOT EXISTS tbDayNewPayer(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayNewPayNum int(11) unsigned not null default 0,
    iPayTimes int(11) unsigned not null default 0,
    iPayment int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日新增付费用户付费次数统计表 tbDayNewPayerPayTimes
CREATE TABLE IF NOT EXISTS tbDayNewPayerPayTimes(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iPayTimes int(11) unsigned not null default 0,
    iPayerNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iPayTimes)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日新增付费用户付费额统计表 tbDayNewPayerPayment
CREATE TABLE IF NOT EXISTS tbDayNewPayerPayment(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iPayment int(11) unsigned not null default 0,
    iPayerNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iPayment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日付费用户付费情况统计表 tbDayPayer
CREATE TABLE IF NOT EXISTS tbDayPayer(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayPayNum int(11) unsigned not null default 0,
    iPayTimes int(11) unsigned not null default 0,
    iPayment int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日付费用户付费次数统计表 tbDayPayerPayTimes
CREATE TABLE IF NOT EXISTS tbDayPayerPayTimes(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iPayTimes int(11) unsigned not null default 0,
    iPayerNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iPayTimes)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日付费用户付费额统计表 tbDayPayerPayment
CREATE TABLE IF NOT EXISTS tbDayPayerPayment(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iPayment int(11) unsigned not null default 0,
    iPayerNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iPayment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
    
-- 创建 用户付费活跃情况统计表  tbPayer
CREATE TABLE IF NOT EXISTS tbPayer(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iAllPayNum int(11) unsigned not null default 0,
    iDayPayNum int(11) unsigned not null default 0,
    iWeekPayNum int(11) unsigned not null default 0,
    iDWeekPayNum int(11) unsigned not null default 0,
    iMonthPayNum int(11) unsigned not null default 0,
    iDMonthPayNum int(11) unsigned not null default 0,
    iWeekLostNum int(11) unsigned not null default 0,
    iDWeekLostNum int(11) unsigned not null default 0,
    iMonthLostNum int(11) unsigned not null default 0,
    iSilenceNum int(11) unsigned not null default 0,
    iWeekBackNum int(11) unsigned not null default 0,
    iDWeekBackNum int(11) unsigned not null default 0,
    iMonthBackNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 用户付费活跃情况等级分布统计表 tbPayerLvDis
CREATE TABLE IF NOT EXISTS tbPayerLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iAllPayNum int(11) unsigned not null default 0,
    iDayPayNum int(11) unsigned not null default 0,
    iWeekPayNum int(11) unsigned not null default 0,
    iDWeekPayNum int(11) unsigned not null default 0,
    iMonthPayNum int(11) unsigned not null default 0,
    iDMonthPayNum int(11) unsigned not null default 0,
    iWeekLostNum int(11) unsigned not null default 0,
    iDWeekLostNum int(11) unsigned not null default 0,
    iMonthLostNum int(11) unsigned not null default 0,
    iSilenceNum int(11) unsigned not null default 0,
    iWeekBackNum int(11) unsigned not null default 0,
    iDWeekBackNum int(11) unsigned not null default 0,
    iMonthBackNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 周付费用户付费活跃度等级分布统计表 tbWeekPayScaleLvDis
CREATE TABLE IF NOT EXISTS tbWeekPayScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iPayDays int(11) unsigned not null default 0,
    iPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iPayDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 双周付费用户付费活跃度等级分布统计表 tbDWeekPayScaleLvDis
CREATE TABLE IF NOT EXISTS tbDWeekPayScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iPayDays int(11) unsigned not null default 0,
    iPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iPayDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 月付费用户付费活跃度等级分布统计表 tbMonthPayScaleLvDis
CREATE TABLE IF NOT EXISTS tbMonthPayScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iPayDays int(11) unsigned not null default 0,
    iPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iPayDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 月有效付费用户付费活跃度统计表 tbInEffectPay
CREATE TABLE IF NOT EXISTS tbInEffectPay(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iPayDays tinyint(4) unsigned not null default 0,
    iPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iPayDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
    
-- 创建 所有充值用户统计表 tbDepositors
CREATE TABLE IF NOT EXISTS tbDepositors(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iAllDepositorNum int(11) unsigned not null default 0,
    iDayDepositorNum int(11) unsigned not null default 0,
    iWeekDepositorNum int(11) unsigned not null default 0,
    iDWeekDepositorNum int(11) unsigned not null default 0,
    iMonthDepositorNum int(11) unsigned not null default 0,
    iDMonthDepositorNum int(11) unsigned not null default 0,
    iWeekLostNum int(11) unsigned not null default 0,
    iDWeekLostNum int(11) unsigned not null default 0,
    iMonthLostNum int(11) unsigned not null default 0,
    iSilenceNum int(11) unsigned not null default 0,
    iWeekBackNum int(11) unsigned not null default 0,
    iDWeekBackNum int(11) unsigned not null default 0,
    iMonthBackNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 新增充值用户统计表 tbNewDepositors
CREATE TABLE IF NOT EXISTS tbNewDepositors(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayNewDepositorNum int(11) unsigned not null default 0,
    iWeekNewDepositorNum int(11) unsigned not null default 0,
    iDWeekNewDepositorNum int(11) unsigned not null default 0,
    iMonthNewDepositorNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


-- 创建 道具付费用户统计表 tbItemPayer
CREATE TABLE IF NOT EXISTS tbItemPayer(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayPayNum int(11) unsigned not null default 0,
    iWeekPayNum int(11) unsigned not null default 0,
    iDWeekPayNum int(11) unsigned not null default 0,
    iMonthPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日道具付费用户等级分布统计表 tbDayItemPayerLvDis
CREATE TABLE IF NOT EXISTS tbDayItemPayerLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iDayPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 点券充值统计表 tbStoreGamePoints
CREATE TABLE IF NOT EXISTS tbStoreGamePoints(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iStoreTimes int(11) unsigned not null default 0,
    iStore int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 点券充值区间人数分布统计表 tbStoreGamePointsUserDis
CREATE TABLE IF NOT EXISTS tbStoreGamePointsUserDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iSegment int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iStore int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 点券消耗统计表 tbConsumeGamePoints
CREATE TABLE IF NOT EXISTS tbConsumeGamePoints(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iConsumeTimes int(11) unsigned not null default 0,
    iConsume int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 点券消耗区间人数分布统计表 tbConsumeGamePointsUserDis
CREATE TABLE IF NOT EXISTS tbConsumeGamePointsUserDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iSegment int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iConsume int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 点券存量统计表 tbGamePointsStorage
CREATE TABLE IF NOT EXISTS tbGamePointsStorage(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iStorage int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 点券存量区间人数分布统计表 tbGamePointsStorageUserDis
CREATE TABLE IF NOT EXISTS tbGamePointsStorageUserDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iSegment int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iStorage int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 点券寄售统计表 tbPointsConsign
CREATE TABLE IF NOT EXISTS tbPointsConsign(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iPointCardValue smallint(6) unsigned not NULL default 0,
  iSellerNum int(11) unsigned not NULL default 0,
  iBuyerNum int(11) unsigned not NULL default 0,
  iConsignTimes int(11) unsigned not NULL default 0,
  iBuyTimes int(11) unsigned not NULL default 0,
  iConsignPoints bigint(20) unsigned not NULL default 0,
  iBargainPoints bigint(20) unsigned not NULL default 0,
  iBargainMoney bigint(20) unsigned not NULL default 0,
  iConsignCharge int(11) unsigned not NULL default 0,
  iConsignPoundage int(11) unsigned not NULL default 0,
  iRevenue int(11) unsigned not NULL default 0,
  PRIMARY KEY  (dtStatDate,iWorldId,iPointCardValue)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 点券充值途径统计表 tbDmsBillOperType
CREATE TABLE IF NOT EXISTS tbDmsBillOperType(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default 0,
  iOperId tinyint(11) unsigned default 0,
  iUinNum int(11) unsigned default 0,
  iValue int(11) unsigned default 0,
  PRIMARY KEY  (dtStatDate,iWorldId,iOperId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 官网点券充值途径统计表 tbDmsBillOperTypeWeb
CREATE TABLE IF NOT EXISTS tbDmsBillOperTypeWeb(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default 0,
  iOperId tinyint(11) unsigned default 0,
  iUinNum int(11) unsigned default 0,
  iValue int(11) unsigned default 0,
  PRIMARY KEY  (dtStatDate,iWorldId,iOperId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 点券消耗渠道统计表 tbPointsConsumeWay
CREATE TABLE IF NOT EXISTS tbPointsConsumeWay(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default 0,
  iWayId int(11) unsigned default 0,
  iUinNum int(11) unsigned default 0,
  iValue int(11) unsigned default 0,
  PRIMARY KEY  (dtStatDate,iWorldId,iWayId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 有效用户统计表 tbEffectiveUser
CREATE TABLE IF NOT EXISTS tbEffectiveUser(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iEffectiveNum int(11) unsigned not null default 0,
    iNewEffectiveNum int(11) unsigned not null default 0,
    iOldEffectiveNum int(11) unsigned not null default 0,
    iBackEffectiveNum int(11) unsigned not null default 0,
    iLostEffectiveNum int(11) unsigned not null default 0,
    iLastMonthEffectiveNum int(11) unsigned not null default 0,
    iNatureMonthRegisterNum int(11) unsigned not null default 0,
    iNewEffectiveKeepNum int(11) unsigned not null default 0,
    iOldEffectiveKeepNum int(11) unsigned not null default 0,
    iBackEffectiveKeepNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 有效用户等级分布统计表 tbEffectiveUserLvDis
CREATE TABLE IF NOT EXISTS tbEffectiveUserLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iEffectiveNum int(11) unsigned not null default 0,
    iNewEffectiveNum int(11) unsigned not null default 0,
    iOldEffectiveNum int(11) unsigned not null default 0,
    iBackEffectiveNum int(11) unsigned not null default 0,
    iLostEffectiveNum int(11) unsigned not null default 0,
    iLastMonthEffectiveNum int(11) unsigned not null default 0,
    iNatureMonthRegisterNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 角色登录次数统计表 tbRoleLoginTimes
CREATE TABLE IF NOT EXISTS tbRoleLoginTimes(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId tinyint(4) unsigned NOT NULL default '0',
  iTotalLoginTimes int(11) unsigned default NULL,
  PRIMARY KEY  (dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 角色登录次数分布统计表 tbRoleLoginTimesDis
CREATE TABLE IF NOT EXISTS tbRoleLoginTimesDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId tinyint(4) unsigned NOT NULL default '0',
  iLoginTimes int(11) unsigned NOT NULL default '0',
  iRoleNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iLoginTimes)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 所有角色性别职业级别统计表 tbRoleJobLvDis
CREATE TABLE IF NOT EXISTS tbRoleJobLvDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  cGender char(1) NOT NULL default '0',
  iJobId tinyint(4) unsigned NOT NULL default '0',
  iLevel tinyint(4) unsigned NOT NULL default '0',
  iRoleNum int(11) unsigned default NULL,
  PRIMARY KEY  (dtStatDate,iWorldId,cGender,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 日活跃角色性别职业级别统计表 tbDayActivityRoleJobLvDis
CREATE TABLE IF NOT EXISTS tbDayActivityRoleJobLvDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  cGender char(1) NOT NULL default '0',
  iJobId tinyint(4) unsigned NOT NULL default '0',
  iLevel tinyint(4) unsigned NOT NULL default '0',
  iRoleNum int(11) unsigned default NULL,
  PRIMARY KEY  (dtStatDate,iWorldId,cGender,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 包月区间人数分布统计表 tbMonthPayUserDis
CREATE TABLE IF NOT EXISTS tbMonthPayUserDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iSegment tinyint(4) unsigned NOT NULL default '0',
  iUserNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 包月操作统计表 tbMonthPayOperate
CREATE TABLE IF NOT EXISTS tbMonthPayOperate(
  dtStatDate date NOT NULL default '1970-01-01',
  iOperType smallint(6) unsigned NOT NULL default '0',
  iUserNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iOperType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 包月途径人数统计表 tbMonthPayUserApproach
CREATE TABLE IF NOT EXISTS tbMonthPayUserApproach(
  dtStatDate date NOT NULL default '1970-01-01',
  iApproach smallint(6) unsigned NOT NULL default '0',
  iUserNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iApproach)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建每小时道具销售收入统计表 tbRealtimeIncome
CREATE TABLE IF NOT EXISTS tbRealtimeIncome(
  dtStatTime datetime NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iPayType tinyint(4) unsigned NOT NULL default '0',
  iIncome int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatTime,iWorldId,iPayType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 每小时点券充值统计表 tbRealtimeGamePoints
CREATE TABLE IF NOT EXISTS tbRealtimeGamePoints(
  dtStatTime datetime NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iPayType tinyint(4) unsigned NOT NULL default '0',
  iVaule int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatTime,iWorldId,iPayType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 每小时点券消费统计表  tbHourPointsConsume
CREATE TABLE IF NOT EXISTS tbHourPointsConsume(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iWorldId int(11) unsigned not null default 0,
    iConsume int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 角色登录次数统计表 tbRoleLoginTimes
CREATE TABLE IF NOT EXISTS tbRoleLoginTimes(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iTotalLoginTimes int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 角色登录次数分布统计表 tbRoleLoginTimesDis
CREATE TABLE IF NOT EXISTS tbRoleLoginTimesDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iLoginTimes int(11) unsigned NOT NULL default '0',
  iRoleNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 团体概况统计表 tbOrganizationGeneral
CREATE TABLE IF NOT EXISTS tbOrganizationGeneral(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iOrgType tinyint(4) unsigned NOT NULL default '1',
  iOrgNum int(11) unsigned NOT NULL default '0',
  iMemberNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId,iOrgType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 团体等级分布统计表 tbOrganizationLevel
CREATE TABLE IF NOT EXISTS tbOrganizationLevel(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iOrgType tinyint(4) unsigned NOT NULL default '1',
  iLevel tinyint(4) unsigned NOT NULL default '0',
  iOrgNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId,iOrgType,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 团体变化信息统计表 tbOrganizationChange
CREATE TABLE IF NOT EXISTS tbOrganizationChange(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iOrgType tinyint(4) unsigned NOT NULL default '1',
  iChangeType tinyint(4) unsigned NOT NULL default '0',
  iOrgNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId,iOrgType,iChangeType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 团体成员变动统计表 tbOrganizationMemberChange
CREATE TABLE IF NOT EXISTS tbOrganizationMemberChange(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iOrgType tinyint(4) unsigned NOT NULL default '1',
  iChangeType tinyint(4) unsigned NOT NULL default '0',
  iMemberNum int(11) unsigned NOT NULL default '0',
  iLevelSum bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId,iOrgType,iChangeType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 团体成员等级分布统计表 tbOrganizationMemberLvDis
CREATE TABLE IF NOT EXISTS tbOrganizationMemberLvDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iOrgType tinyint(4) unsigned NOT NULL default '1',
  iLevel tinyint(4) unsigned NOT NULL default '0',
  iMemberNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId,iOrgType,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  任务统计表 tbTask
CREATE TABLE IF NOT EXISTS tbTask (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iTaskType tinyint(4) unsigned not null default 0,
    iTaskId smallint(6) unsigned not null default 0,
    iAcceptRoleNum int(11) unsigned not null default 0,
    iAcceptTimes int(11) unsigned not null default 0,
    iCompleteRoleNum int(11) unsigned not null default 0,
    iCompleteTimes int(11) unsigned not null default 0,
    iCancelRoleNum int(11) unsigned not null default 0,
    iCancelTimes int(11) unsigned not null default 0,
    iAcceptUinNum int(11) unsigned not null default 0,
    iCompleteUinNum int(11) unsigned not null default 0,
    iTotalTime int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iTaskType,iTaskId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  不同职业和等级玩家完成任务统计表 tbTaskJobLvDis
CREATE TABLE IF NOT EXISTS `tbTaskJobLvDis` (
  `dtStatDate` date NOT NULL default '1970-01-01',
  `iWorldId` tinyint(4) unsigned NOT NULL default '0',
  `iZoneId`  tinyint(4) unsigned NOT NULL default '0',
  `iTaskId` tinyint(8) unsigned NOT NULL default '0',
  `iJobId` tinyint(4) unsigned NOT NULL default '0',
  `iLevel` tinyint(4) unsigned NOT NULL default '0',
  `iRoleNum` int(11) unsigned default '0',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,`iZoneId`,`iTaskId`,`iJobId`,`iLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  角色杀怪死亡统计表 tbPlayerKilled
CREATE TABLE IF NOT EXISTS tbPlayerKilled (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iJobId tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iKilledNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  角色死亡区域统计表 tbPlayerKilledAreaDis
CREATE TABLE IF NOT EXISTS tbPlayerKilledAreaDis (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iMapId int(11) unsigned not null default 0,
    iKilledNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iMapId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  NPC销售（玩家从NPC处购买）统计表 tbNpcSold
CREATE TABLE IF NOT EXISTS tbNpcSold (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(8) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,    
    iSoldNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  NPC回购（玩家卖物品给NPC）统计表 tbNpcBuy
CREATE TABLE IF NOT EXISTS tbNpcBuy (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(6) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iBuyNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  物品合成统计表 tbItemCompose
CREATE TABLE IF NOT EXISTS tbItemCompose (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(6) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iComposeNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 玩家摆摊交易统计表 tbStall
CREATE TABLE IF NOT EXISTS tbStall (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iUserNum int(11) unsigned not null default 0,
    iStallNum int(11) unsigned not null default 0,
    iStallTime bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 金钱产出统计表 tbMoneyProduce
CREATE TABLE IF NOT EXISTS tbMoneyProduce (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iMoneyType tinyint(4) unsigned not null default 0,
    iProduce int(11) unsigned not null default 0,
    iRoleJob tinyint(4) unsigned NOT NULL default 0,
    iRoleLevel tinyint(4) unsigned NOT NULL default 0,
    iRoleNum int(11) unsigned not null default 0,
    iMoney bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iMoneyType,iProduce,iRoleJob,iRoleLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 金钱消耗统计表 tbMoneyConsume
CREATE TABLE IF NOT EXISTS tbMoneyConsume (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iMoneyType tinyint(4) unsigned not null default 0,
    iConsume int(11) unsigned not null default 0,
    iRoleJob tinyint(4) unsigned NOT NULL default 0,
    iRoleLevel tinyint(4) unsigned NOT NULL default 0,
    iRoleNum int(11) unsigned not null default 0,
    iMoney bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iMoneyType,iConsume,iRoleJob,iRoleLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 金钱转移统计表 tbMoneyTransfer
CREATE TABLE IF NOT EXISTS tbMoneyTransfer (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iMoneyType tinyint(4) unsigned not null default 0,
    iTransfer int(11) unsigned not null default 0,
    iRoleJob tinyint(4) unsigned NOT NULL default 0,
    iRoleLevel tinyint(4) unsigned NOT NULL default 0,
    iRoleNum int(11) unsigned not null default 0,
    iMoney bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iMoneyType,iTransfer,iRoleJob,iRoleLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 金钱存量统计表 tbMoneyStorage
CREATE TABLE IF NOT EXISTS tbMoneyStorage (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iMoneyType tinyint(4) unsigned not null default 0,
    iStore int(11) unsigned not null default 0,
    iRoleNum int(11) unsigned not null default 0,
    iMoney bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iMoneyType,iStore)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 系统金钱各等级拥有量分布统计表 tbMoneyStorageLvDis
CREATE TABLE IF NOT EXISTS tbMoneyStorageLvDis (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iMoneyType tinyint(4) unsigned not null default 0,
    iRoleJob tinyint(4) unsigned NOT NULL default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iRoleNum int(11) unsigned not null default 0,
    iTotalMoney bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iMoneyType,iRoleJob,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 系统金钱存量区间角色数分布统计表 tbMoneyStorageRoleDis
CREATE TABLE IF NOT EXISTS tbMoneyStorageRoleDis (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iMoneyType tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iStoreSegment int(11) unsigned not null default 0,
    iRoleNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iMoneyType,iLevel,iStoreSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 物品产出统计表 tbItemProduce
CREATE TABLE IF NOT EXISTS tbItemProduce (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(4) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iProduceType int(11) unsigned not null default 0,
    iProduceNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId,iProduceType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 物品回收统计表 tbItemCallback
CREATE TABLE IF NOT EXISTS tbItemCallback (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(4) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iCallbackType int(11) unsigned not null default 0,
    iCallbackNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId,iCallbackType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 物品获得统计表 tbItemObtain
CREATE TABLE IF NOT EXISTS tbItemObtain (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(4) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iObtainType int(11) unsigned not null default 0,
    iObtainNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId,iObtainType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 物品消耗统计表 tbItemConsume
CREATE TABLE IF NOT EXISTS tbItemConsume (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(4) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iConsumeType int(11) unsigned not null default 0,
    iConsumeNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId,iConsumeType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 物品丢弃统计表 tbItemDiscard
CREATE TABLE IF NOT EXISTS tbItemDiscard (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(4) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iDiscardNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 物品销毁统计表 tbItemDestroy
CREATE TABLE IF NOT EXISTS tbItemDestroy (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(4) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iDestroyNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 物品交易统计表 tbItemExchange
CREATE TABLE IF NOT EXISTS tbItemExchange (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(4) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iExchangeType int(11) unsigned not null default 0,
    iExchangeNum int(11) unsigned not null default 0,
    iItemTotalPrice bigint(20) unsigned not null default 0,
    iItemMaxPrice int(11) unsigned not null default 0,
    iItemMinPrice int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId,iExchangeType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 物品寄售统计表 tbItemConsign
CREATE TABLE IF NOT EXISTS tbItemConsign(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iItemType smallint(4) unsigned not null default 0,
  iItemId int(11) unsigned not null default 0,
  iSellerNum int(11) unsigned not NULL default 0,
  iBuyerNum int(11) unsigned not NULL default 0,
  iConsignTimes int(11) unsigned not NULL default 0,
  iBuyTimes int(11) unsigned not NULL default 0,
  iConsignNum int(11) unsigned not NULL default 0,
  iBargainNum int(11) unsigned not NULL default 0,
  iBargainMoney bigint(20) unsigned not NULL default 0,
  iConsignCharge int(11) unsigned not NULL default 0,
  iRevenue int(11) unsigned not NULL default 0,
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 组队统计表 tbTroop
CREATE TABLE IF NOT EXISTS tbTroop (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iJobId tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iRoleNum int(11) unsigned not null default 0,
    iTroopTimes int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 副本开启、完成情况统计表 tbRaid
CREATE TABLE IF NOT EXISTS tbRaid (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iRaidId smallint(6) unsigned not null default 0,
    iRoleNum int(11) unsigned not null default 0,
    iEnterNum int(11) unsigned not null default 0,
    iCleanNum int(11) unsigned not null default 0,
    iTotalCleanTime bigint(20) unsigned not null default 0,
    iFailNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iRaidId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 怪物被杀次数统计表 tbMonsterKilled
CREATE TABLE IF NOT EXISTS tbMonsterKilled (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iMonsterId int(11) unsigned not null default 0,
    iKilledNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iMonsterId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 各职业杀怪次数统计表 tbKillMonByJob
CREATE TABLE IF NOT EXISTS tbKillMonByJob (
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iJob tinyint(4) unsigned NOT NULL default '0',
  iKillMon int(11) unsigned default NULL,
  PRIMARY KEY (dtStatDate,iWorldId,iZoneId,iJob)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 角色升级时间统计表 tbPlayerLvUpgrade
CREATE TABLE IF NOT EXISTS tbPlayerLvUpgrade (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iJobId tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iRoleNum int(11) unsigned not null default 0,
    iTotalUpgradeTime bigint(20) unsigned not null default 0,
    iCurrentUpgradeTime bigint(20) unsigned not null default 0,
    iMinUpgradeTime int(11) unsigned not null default 0,
    iMinCurrentUpgradeTimie int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 用户掉线统计表 tbExceptionalOffline
CREATE TABLE IF NOT EXISTS tbExceptionalOffline (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iOfflineType tinyint(4) unsigned not null default 0,
    iOfflineNum int(11) unsigned not null default 0,
    iOfflineTimes int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iOfflineType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 玩家游戏场景信息表 tbGameSenceInfo
CREATE TABLE IF NOT EXISTS `tbGameSenceInfo` (
  `dtStatDate` date NOT NULL default '1970-01-01' COMMENT '统计日期',
  `iWorldId` tinyint(4) unsigned NOT NULL default '0' COMMENT '大区ID',
  `iZoneId` tinyint(4) unsigned NOT NULL default '0' COMMENT '频道ID',
  `iGameMode` int(4) NOT NULL default '0' COMMENT '游戏模式',
  `iGameScene` int(4) NOT NULL default '0' COMMENT '游戏场景',
  `iGameCount` int(11) default '0' COMMENT '使用次数',
  `iPlayerCount` int(11) default '0' COMMENT '使用人数',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,`iZoneId`,`iGameMode`,`iGameScene`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ;

-- 创建  角色PK死亡统计表 tbPkKilled
CREATE TABLE IF NOT EXISTS tbPkKilled (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iJobId tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iKilledNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  角色PK杀手统计表 tbPkKiller
CREATE TABLE IF NOT EXISTS tbPkKiller (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iJobId tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iKillNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  客户端启动统计表 tbClientStart
CREATE TABLE IF NOT EXISTS tbClientStart (
    dtTime datetime not null default '1970-01-01 08:00:00',
    iReportId int(11) unsigned not null default 0,
    vSp varchar(32) not null default '0',
    iSuccessNum int(11) unsigned not null default 0,
    iFailedNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtTime,iReportId,vSp)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  补丁更新统计表 tbPatch
CREATE TABLE IF NOT EXISTS tbPatch (
    dtTime datetime not null default '1970-01-01 08:00:00',
    iReportId int(11) unsigned not null default 0,
    vSp varchar(32) not null default '0',
    iPatchNum int(11) unsigned not null default 0,
    iUnpatchNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtTime,iReportId,vSp)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  拉取QQ签名时间统计表 tbGetIdiographTime
CREATE TABLE IF NOT EXISTS tbGetIdiographTime (
    dtTime datetime not null default '1970-01-01 08:00:00',
    iReportId int(11) unsigned not null default 0,
    vSp varchar(32) not null default '0',
    iTotalGetIdiographTime int(11) unsigned not null default 0,
    iMaxGetIdiographTime int(11) unsigned not null default 0,
    iMinGetIdiographTime int(11) unsigned not null default 0,
    iGetIdiographTimes int(11) unsigned not null default 0,
    PRIMARY KEY(dtTime,iReportId,vSp)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建  拉取QQ签名失败原因统计表 tbGetIdiographFailed
CREATE TABLE IF NOT EXISTS tbGetIdiographFailed (
    dtTime datetime not null default '1970-01-01 08:00:00',
    iReportId int(11) unsigned not null default 0,
    vSp varchar(32) not null default '0',
    vReason varchar(64) not null default '0',
    iFailedTimes int(11) unsigned not null default 0,
    PRIMARY KEY(dtTime,iReportId,vSp,vReason)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

    
-- 创建 实时注册统计表 tbRealRegister
CREATE TABLE IF NOT EXISTS tbRealRegister(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iWorldId int(11) unsigned not null default 0,
    iAllRegNum int(11) unsigned not null default 0,
    iNewRegNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
-- 创建 每小时登入统计表 tbHourLogin
CREATE TABLE IF NOT EXISTS tbHourLogin(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iWorldId int(11) unsigned not null default 0,
    iLoginNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
-- 创建 每小时登出统计表 tbHourLogout
CREATE TABLE IF NOT EXISTS tbHourLogout(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iWorldId int(11) unsigned not null default 0,
    iLoginNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 统计监控报告表 tbMonitorReport
CREATE TABLE IF NOT EXISTS tbMonitorReport(
    dtMonitorDate date NOT NULL DEFAULT '1970-01-01',
    cArea char(2) NOT NULL DEFAULT '0',
    dtBeginTime time NOT NULL DEFAULT '00:00:00',
    dtEndTime time NOT NULL DEFAULT '00:00:00',
    iCostTime int(11) unsigned NOT NULL DEFAULT '0',
    vState  varchar(32) NULL,
    vErrorDetail  varchar(512) NULL,
    PRIMARY KEY(dtMonitorDate, cArea)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 统计程序监控表 tbMonitorProgram
CREATE TABLE IF NOT EXISTS tbMonitorProgram(
    dtMonitorDate date NOT NULL DEFAULT '1970-01-01',
    cArea char(2) NOT NULL DEFAULT '0',
    vProgramName varchar(32) NOT NULL DEFAULT '0',
    dtBetimes time NOT NULL DEFAULT '00:00:00',
    dtBeginTime time NOT NULL DEFAULT '00:00:00',
    dtEndTime time NOT NULL DEFAULT '00:00:00',
    iCostTime int(11) unsigned NOT NULL DEFAULT '0',
    vState  varchar(32) NULL,
    vErrorDetail  varchar(256) NULL,
    vInfection  varchar(256) NULL,
    PRIMARY KEY(dtMonitorDate, cArea, vProgramName),
    INDEX(dtBetimes)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
-- 创建 ICE连接监控报告表 tbIceConnectMonitorReport
CREATE TABLE IF NOT EXISTS tbIceConnectMonitorReport(
    dtMonitorTime datetime not null default '1970-01-01 00:00:00',
    iWarnningLevel tinyint(4) unsigned not null default 0,
    vErrMsg varchar(128) null,
    PRIMARY KEY(dtMonitorTime)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 平均游戏时长统计表 tbPlayTimeSum
CREATE TABLE IF NOT EXISTS tbPlayTimeSum(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iOnlineNum int(11) unsigned not null default 0,
    iOnlineTime bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 在线时长区间人数分布统计表 tbPlayTimeSegDis
CREATE TABLE IF NOT EXISTS tbPlayTimeSegDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iSegment smallint(6) unsigned not null default 0,
    iSegmentNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 游戏游戏时长等级分布统计表 tbPlayTimeSumLvDis
CREATE TABLE IF NOT EXISTS tbPlayTimeSumLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iOnlineNum int(11) unsigned not null default 0,
    iOnlineTime bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 游戏时长等级时长区间人数分布统计表 tbPlayTimeSegLvDis
CREATE TABLE IF NOT EXISTS tbPlayTimeSegLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iSegment smallint(6) unsigned not null default 0,
    iSegmentNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iLevel,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- 创建 装备加工总况统计表 tbArmMakeGen
CREATE TABLE IF NOT EXISTS `tbArmMakeGen` (
  `dtStatDate` date NOT NULL default '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL default '0',
  `iZoneId`  tinyint(4) unsigned NOT NULL default '0',
  `iArmMachId` int(11) unsigned NOT NULL default '0',
  `iTotalTimes` int(11) unsigned NOT NULL default '0',
  `iSuccessTimes` int(11) unsigned NOT NULL default '0',
  `iTotalPlayer` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,iArmMachId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- 创建 装备加工按加工等级分布统计表 tbArmMakeLvDis
CREATE TABLE IF NOT EXISTS `tbArmMakeLvDis` (
  `dtStatDate` date NOT NULL default '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL default '0',
  `iZoneId`  tinyint(4) unsigned NOT NULL default '0',
  `iArmMachId` int(11) unsigned NOT NULL default '0',
  `iLevel` int(11) unsigned NOT NULL default '0',
  `iAllTimes` int(11) unsigned NOT NULL default '0',
  `iSuccessTimes` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,iArmMachId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- 创建 活动类统计表 tbActivity
 CREATE TABLE  IF NOT EXISTS `tbActivity` (
  `dtStatDate` date NOT NULL default '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL default '0',
  `iZoneId`  tinyint(4) unsigned NOT NULL default '0',
  `iActivityId` int(11) unsigned NOT NULL default '0',
  `iValue1` int(11) unsigned NOT NULL default '0',
  `iValue2` int(11) unsigned NOT NULL default '0',
  `iValue3` int(11) unsigned NOT NULL default '0',
  `iValue4` int(11) unsigned NOT NULL default '0',
  `iValue5` int(11) unsigned NOT NULL default '0',
  `iValue6` int(11) unsigned NOT NULL default '0',
  `iValue7` int(11) unsigned NOT NULL default '0',
  `iValue8` int(11) unsigned NOT NULL default '0',
  `iValue9` int(11) unsigned NOT NULL default '0',
  `iValue10` int(11) unsigned NOT NULL default '0',
  `iValue11` int(11) unsigned NOT NULL default '0',
  `iValue12` int(11) unsigned NOT NULL default '0',
  `iValue13` int(11) unsigned NOT NULL default '0',
  `iValue14` int(11) unsigned NOT NULL default '0',
  `iValue15` int(11) unsigned NOT NULL default '0',
  `iValue16` int(11) unsigned NOT NULL default '0',
  `iValue17` int(11) unsigned NOT NULL default '0',
  `iValue18` int(11) unsigned NOT NULL default '0',
  `iValue19` int(11) unsigned NOT NULL default '0',
  `iValue20` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,`iActivityId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- 创建 角色行为等级分布统计表 tbRoleBehLvDis
CREATE TABLE  IF NOT EXISTS `tbRoleBehLvDis` (
  `dtStatDate` date NOT NULL default '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL default '0',
  `iZoneId`  tinyint(4) unsigned NOT NULL default '0',
  `iBehaId` int(11) unsigned NOT NULL default '0',
  `iRoleLevel` int(11) unsigned NOT NULL default '0',
  `iRoleNum` int(11) NOT NULL default '0',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,`iBehaId`,`iRoleLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- 创建 技能学习统计表 tbSkillLearn
CREATE TABLE  IF NOT EXISTS `tbSkillLearn` (
  `dtStatDate` date NOT NULL default '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL default '0',
  `iZoneId`  tinyint(4) unsigned NOT NULL default '0',
  `iSkillId` int(11) unsigned NOT NULL default '0',
  `iJob` int(11) unsigned NOT NULL default '0',
  `iRoleLevel` int(11) unsigned NOT NULL default '0',
  `iRoleNum` int(11) NOT NULL default '0',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,`iSkillId`,`iJob`,`iRoleLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- 创建 任务完成情况分等级统计表 tbTaskFinishedLvDis
CREATE TABLE  IF NOT EXISTS `tbTaskFinishedLvDis` (
  `dtStatDate` date NOT NULL default '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL default '0',
  `iZoneId`  tinyint(4) unsigned NOT NULL default '0',
  `iTaskId` int(11) unsigned NOT NULL default '0',
  `iRoleLevel` int(11) unsigned NOT NULL default '0',
  `iRoleNum` int(11) NOT NULL default '0',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,`iTaskId`,`iRoleLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- 创建 副本组队统计表 tbCopyTeam
CREATE TABLE  IF NOT EXISTS `tbCopyTeam` (
  `dtStatDate` date NOT NULL default '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL default '0',
  `iZoneId`  tinyint(4) unsigned NOT NULL default '0',
  `iCopyId` int(11) unsigned NOT NULL default '0',
  `iRoleNum` int(11) unsigned NOT NULL default '0',
  `iTeamNum` int(11) unsigned NOT NULL default '0',
  `iAllRoleLevel` int(11) NOT NULL default '0',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,`iCopyId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- 创建 月充值额度人数分布统计表 tbDepositMonthSeg
CREATE TABLE `tbDepositMonthSeg` (
  `dtStatDate` date NOT NULL DEFAULT '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL DEFAULT '0',
  `iStatType` smallint(4) unsigned NOT NULL DEFAULT '0',
  `iSegment` int(11) unsigned NOT NULL DEFAULT '0',
  `iUserNum` int(11) unsigned NOT NULL DEFAULT '0',
  `iMonthAmount` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dtStatDate`,`iWorldId`,`iStatType`,`iSegment`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ;

-- 创建 渠道注册统计表 tbSFromReg_tem
CREATE TABLE IF NOT EXISTS tbSFromReg_tem (
dtStatDate DATE NOT NULL DEFAULT '1970-01-01',
iSFrom smallint(6) unsigned NOT NULL DEFAULT 0,
iRegNum int unsigned NOT NULL DEFAULT 0,
PRIMARY KEY(dtStatDate, iSFrom)
) TYPE = InnoDB DEFAULT CHARSET=gbk;

-- 创建 注册渠道相关信息统计表 tbSFromUserActivityCase_Reg
CREATE TABLE IF NOT EXISTS tbSFromUserActivityCase_Reg (
dtStatDate DATE NOT NULL DEFAULT '1970-01-01',
iWorldId INT(11) unsigned NOT NULL DEFAULT 0,
iStatType TINYINT(11) unsigned NOT NULL DEFAULT 0,
iSFrom smallint(6) unsigned NOT NULL DEFAULT 0,
iActiveUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iAddUserNum INT(11) unsigned NOT NULL DEFAULT 0,
ilostUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iBackUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iDepositUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iDepositAmount bigint unsigned NOT NULL DEFAULT 0,
iDepositTimes INT(11) unsigned NOT NULL DEFAULT 0,
iPayUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iPayAmount bigint unsigned NOT NULL DEFAULT 0,
iPayTimes INT(11) unsigned NOT NULL DEFAULT 0,
iStorageUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iStorageAmount bigint unsigned NOT NULL DEFAULT 0,
PRIMARY KEY(dtStatDate, iWorldId,iStatType,iSFrom)
)TYPE = InnoDB DEFAULT CHARSET=gbk;

-- 创建 全局注册渠道相关信息统计表 tbSFromUserActivityCase_Reg_AllWorld
CREATE TABLE IF NOT EXISTS tbSFromUserActivityCase_Reg_AllWorld (
dtStatDate DATE NOT NULL DEFAULT '1970-01-01',
iWorldId INT(11) unsigned NOT NULL DEFAULT 0,
iStatType TINYINT(11) unsigned NOT NULL DEFAULT 0,
iSFrom smallint(6) unsigned NOT NULL DEFAULT 0,
iActiveUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iAddUserNum INT(11) unsigned NOT NULL DEFAULT 0,
ilostUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iBackUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iDepositUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iDepositAmount bigint unsigned NOT NULL DEFAULT 0,
iDepositTimes INT(11) unsigned NOT NULL DEFAULT 0,
iPayUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iPayAmount bigint unsigned NOT NULL DEFAULT 0,
iPayTimes INT(11) unsigned NOT NULL DEFAULT 0,
iStorageUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iStorageAmount bigint unsigned NOT NULL DEFAULT 0,
PRIMARY KEY(dtStatDate, iWorldId,iStatType,iSFrom)
)TYPE = InnoDB DEFAULT CHARSET=gbk;

-- 创建 登录渠道相关信息统计表 tbSFromUserActivityCase_Log
CREATE TABLE IF NOT EXISTS tbSFromUserActivityCase_Log (
dtStatDate DATE NOT NULL DEFAULT '1970-01-01',
iWorldId INT(11) unsigned NOT NULL DEFAULT 0,
iStatType TINYINT(11) unsigned NOT NULL DEFAULT 0,
iSFrom smallint(6) unsigned NOT NULL DEFAULT 0,
iActiveUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iAddUserNum INT(11) unsigned NOT NULL DEFAULT 0,
ilostUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iBackUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iDepositUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iDepositAmount bigint unsigned NOT NULL DEFAULT 0,
iDepositTimes INT(11) unsigned NOT NULL DEFAULT 0,
iPayUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iPayAmount bigint unsigned NOT NULL DEFAULT 0,
iPayTimes INT(11) unsigned NOT NULL DEFAULT 0,
iStorageUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iStorageAmount bigint unsigned NOT NULL DEFAULT 0,
PRIMARY KEY(dtStatDate, iWorldId,iStatType,iSFrom)
)TYPE = InnoDB DEFAULT CHARSET=gbk;


-- 创建 登录渠道相关信息统计表 tbSFromUserActivityCase_Log_AllWorld
CREATE TABLE IF NOT EXISTS tbSFromUserActivityCase_Log_AllWorld (
dtStatDate DATE NOT NULL DEFAULT '1970-01-01',
iWorldId INT(11) unsigned NOT NULL DEFAULT 0,
iStatType TINYINT(11) unsigned NOT NULL DEFAULT 0,
iSFrom smallint(6) unsigned NOT NULL DEFAULT 0,
iActiveUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iAddUserNum INT(11) unsigned NOT NULL DEFAULT 0,
ilostUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iBackUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iDepositUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iDepositAmount bigint unsigned NOT NULL DEFAULT 0,
iDepositTimes INT(11) unsigned NOT NULL DEFAULT 0,
iPayUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iPayAmount bigint unsigned NOT NULL DEFAULT 0,
iPayTimes INT(11) unsigned NOT NULL DEFAULT 0,
iStorageUserNum INT(11) unsigned NOT NULL DEFAULT 0,
iStorageAmount bigint unsigned NOT NULL DEFAULT 0,
PRIMARY KEY(dtStatDate, iWorldId,iStatType,iSFrom)
)TYPE = InnoDB DEFAULT CHARSET=gbk;
