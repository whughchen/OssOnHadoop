-- -----------------------------------------------------------------------------
-- Project:    OSS
-- File:         oss_table_create.sql
-- Description:   ��Ӫ���������ű�
-- Author:   whughchen@gmail.com
-- Date:       2014-02-24
-- History:
-- -----------------------------------------------------------------------------

-- ����  ע���û�ͳ�Ʊ� tbUserRegister
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

-- ����  ע���ɫ�û�ͳ�Ʊ� tbRegisterUser
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

-- ����  ������ע���û�ְҵ����ֲ�ͳ�Ʊ� tbDayRegisterUserLvDis
CREATE TABLE IF NOT EXISTS tbDayRegisterUserLvDis (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iJob tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iRegNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iJob,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  ����ע���û�ְҵ����ֲ�ͳ�Ʊ� tbRegisterUserLvDis
CREATE TABLE IF NOT EXISTS tbRegisterUserLvDis (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iJob tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iRegNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iJob,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  ��ע���û�ְҵ�ȼ�ͨ����ͳ�Ʊ� tbMonthRegisterUserLvPass
CREATE TABLE IF NOT EXISTS tbMonthRegisterUserLvPass (
    dtStatDate date not null default '1970-01-01',
    dtRegDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iJob tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iRegNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,dtRegDate,iWorldId,iJob,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
    
-- ���� �û���Ծ���ͳ�Ʊ�  tbUserLogin
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

-- ���� �û���Ծ����ȼ��ֲ�ͳ�Ʊ� tbUserLoginLvDis
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

-- ���� �����û���Ծ����ȼ��ֲ�ͳ�Ʊ� tbPayUserLoginLvDis
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

-- ���� ���û���Ծ����ȼ��ֲ�ͳ�Ʊ� tbGroupUserLoginLvDis
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

-- ���� �Ǹ����û���Ծ����ȼ��ֲ�ͳ�Ʊ� tbFreeUserLoginLvDis
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

-- ���� �ܻ�Ծ�û���Ծ�ȵȼ��ֲ�ͳ�Ʊ� tbWeekActivityScaleLvDis
CREATE TABLE IF NOT EXISTS tbWeekActivityScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iActivityDays int(11) unsigned not null default 0,
    iActivityNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iActivityDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ˫�ܻ�Ծ�û���Ծ�ȵȼ��ֲ�ͳ�Ʊ� tbDWeekActivityScaleLvDis
CREATE TABLE IF NOT EXISTS tbDWeekActivityScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iActivityDays int(11) unsigned not null default 0,
    iActivityNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iActivityDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �»�Ծ�û���Ծ�ȵȼ��ֲ�ͳ�Ʊ� tbMonthActivityScaleLvDis
CREATE TABLE IF NOT EXISTS tbMonthActivityScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iActivityDays int(11) unsigned not null default 0,
    iActivityNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iActivityDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ������ע���û������ֲ�ͳ�Ʊ� tbDayRegRegionDis
CREATE TABLE IF NOT EXISTS tbDayRegRegionDis(
    dtStatDate date not null default '1970-01-01',
    iProvinceId int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iProvinceId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �յ�¼�û������ֲ�ͳ�Ʊ� tbDayLoginRegionDis
CREATE TABLE IF NOT EXISTS tbDayLoginRegionDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iProvinceId int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iProvinceId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �յ�¼�û�������Ӫ�̷ֲ�ͳ�Ʊ� tbDayLoginSPDis
CREATE TABLE IF NOT EXISTS tbDayLoginSPDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iSPId tinyint(6) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iSPId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ����Ч��Ծ�û���Ծ��ͳ�Ʊ� tbInEffectActivity
CREATE TABLE IF NOT EXISTS tbInEffectActivity(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iActivityDays tinyint(4) unsigned not null default 0,
    iActivityNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iActivityDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �û�����ͳ�Ʊ� tbResidentUser
CREATE TABLE IF NOT EXISTS tbResidentUser(
    dtRegDate date not null default '1970-01-01',
    dtStatDate date not null default '1970-01-01',
    iDayNum smallint(6) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iCumulateUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,dtRegDate,iDayNum)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ���û������ȼ��ֲ�ͳ�Ʊ�  tbResidentUserLvDis
CREATE TABLE IF NOT EXISTS tbResidentUserLvDis(
    dtRegDate date not null default '1970-01-01',
    dtStatDate date not null default '1970-01-01',
    iDayNum smallint(6) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iCumulateUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,dtRegDate,iDayNum,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ʵʱ����ͳ�Ʊ� tbRealOnline
CREATE TABLE IF NOT EXISTS tbRealOnline(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iWorldId int(11) unsigned not null default 0,
    iChannelId smallint(6) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iWorldId,iChannelId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� IDCʵʱ����ͳ�Ʊ� tbIdcRealOnline
CREATE TABLE IF NOT EXISTS tbIdcRealOnline(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iIdcId tinyint(4) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iIdcId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ʷ����ͳ�Ʊ� tbHistoryOnline
CREATE TABLE IF NOT EXISTS tbHistoryOnline(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iMaxOnlineNum int(11) unsigned not null default 0,
    iAvgOnlineNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� Ƶ����ʷ����ͳ�Ʊ� tbChannelOnline
CREATE TABLE IF NOT EXISTS tbChannelOnline(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iChannelId tinyint(4) unsigned NOT NULL default '0',
    iMaxOnlineNum int(11) unsigned not null default 0,
    iAvgOnlineNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ƽ������ʱ��ͳ�Ʊ� tbUserOnlineTime
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

-- ���� ƽ������ʱ���ȼ��ֲ�ͳ�Ʊ� tbUserOnlineTimeLvDis
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

-- ���� ƽ����Ϸʱ��ͳ�Ʊ� tbPlayTime
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

-- ���� ƽ����Ϸʱ���ȼ��ֲ�ͳ�Ʊ� tbPlayTimeLvDis
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

-- ���� ACGƽ����Ϸʱ��ͳ�Ʊ� tbAcgPlayTime
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

-- ���� ACGƽ����Ϸʱ���ȼ��ֲ�ͳ�Ʊ� tbAcgPlayTimeLvDis
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

-- ���� ��������ͳ�Ʊ� tbGoodsVendition
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

-- ���� �������۰��»���ͳ�Ʊ� tbMonthsGoodsVendition
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

-- ���� ���������û�ͳ�Ʊ� tbNewPayer
CREATE TABLE IF NOT EXISTS tbNewPayer(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayNewPayNum int(11) unsigned not null default 0,
    iWeekNewPayNum int(11) unsigned not null default 0,
    iDWeekNewPayNum int(11) unsigned not null default 0,
    iMonthNewPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ���������û��ȼ��ֲ�ͳ�Ʊ� tbNewPayerLvDis
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

-- ���� �����������û��������ͳ�Ʊ� tbDayNewPayer
CREATE TABLE IF NOT EXISTS tbDayNewPayer(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayNewPayNum int(11) unsigned not null default 0,
    iPayTimes int(11) unsigned not null default 0,
    iPayment int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �����������û����Ѵ���ͳ�Ʊ� tbDayNewPayerPayTimes
CREATE TABLE IF NOT EXISTS tbDayNewPayerPayTimes(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iPayTimes int(11) unsigned not null default 0,
    iPayerNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iPayTimes)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �����������û����Ѷ�ͳ�Ʊ� tbDayNewPayerPayment
CREATE TABLE IF NOT EXISTS tbDayNewPayerPayment(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iPayment int(11) unsigned not null default 0,
    iPayerNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iPayment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �ո����û��������ͳ�Ʊ� tbDayPayer
CREATE TABLE IF NOT EXISTS tbDayPayer(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayPayNum int(11) unsigned not null default 0,
    iPayTimes int(11) unsigned not null default 0,
    iPayment int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �ո����û����Ѵ���ͳ�Ʊ� tbDayPayerPayTimes
CREATE TABLE IF NOT EXISTS tbDayPayerPayTimes(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iPayTimes int(11) unsigned not null default 0,
    iPayerNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iPayTimes)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �ո����û����Ѷ�ͳ�Ʊ� tbDayPayerPayment
CREATE TABLE IF NOT EXISTS tbDayPayerPayment(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iPayment int(11) unsigned not null default 0,
    iPayerNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iPayment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
    
-- ���� �û����ѻ�Ծ���ͳ�Ʊ�  tbPayer
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

-- ���� �û����ѻ�Ծ����ȼ��ֲ�ͳ�Ʊ� tbPayerLvDis
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

-- ���� �ܸ����û����ѻ�Ծ�ȵȼ��ֲ�ͳ�Ʊ� tbWeekPayScaleLvDis
CREATE TABLE IF NOT EXISTS tbWeekPayScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iPayDays int(11) unsigned not null default 0,
    iPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iPayDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ˫�ܸ����û����ѻ�Ծ�ȵȼ��ֲ�ͳ�Ʊ� tbDWeekPayScaleLvDis
CREATE TABLE IF NOT EXISTS tbDWeekPayScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iPayDays int(11) unsigned not null default 0,
    iPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iPayDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �¸����û����ѻ�Ծ�ȵȼ��ֲ�ͳ�Ʊ� tbMonthPayScaleLvDis
CREATE TABLE IF NOT EXISTS tbMonthPayScaleLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iPayDays int(11) unsigned not null default 0,
    iPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel, iPayDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ����Ч�����û����ѻ�Ծ��ͳ�Ʊ� tbInEffectPay
CREATE TABLE IF NOT EXISTS tbInEffectPay(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iPayDays tinyint(4) unsigned not null default 0,
    iPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iPayDays)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
    
-- ���� ���г�ֵ�û�ͳ�Ʊ� tbDepositors
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

-- ���� ������ֵ�û�ͳ�Ʊ� tbNewDepositors
CREATE TABLE IF NOT EXISTS tbNewDepositors(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayNewDepositorNum int(11) unsigned not null default 0,
    iWeekNewDepositorNum int(11) unsigned not null default 0,
    iDWeekNewDepositorNum int(11) unsigned not null default 0,
    iMonthNewDepositorNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


-- ���� ���߸����û�ͳ�Ʊ� tbItemPayer
CREATE TABLE IF NOT EXISTS tbItemPayer(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iDayPayNum int(11) unsigned not null default 0,
    iWeekPayNum int(11) unsigned not null default 0,
    iDWeekPayNum int(11) unsigned not null default 0,
    iMonthPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �յ��߸����û��ȼ��ֲ�ͳ�Ʊ� tbDayItemPayerLvDis
CREATE TABLE IF NOT EXISTS tbDayItemPayerLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iDayPayNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ȯ��ֵͳ�Ʊ� tbStoreGamePoints
CREATE TABLE IF NOT EXISTS tbStoreGamePoints(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iStoreTimes int(11) unsigned not null default 0,
    iStore int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ȯ��ֵ���������ֲ�ͳ�Ʊ� tbStoreGamePointsUserDis
CREATE TABLE IF NOT EXISTS tbStoreGamePointsUserDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iSegment int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iStore int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ȯ����ͳ�Ʊ� tbConsumeGamePoints
CREATE TABLE IF NOT EXISTS tbConsumeGamePoints(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iConsumeTimes int(11) unsigned not null default 0,
    iConsume int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ȯ�������������ֲ�ͳ�Ʊ� tbConsumeGamePointsUserDis
CREATE TABLE IF NOT EXISTS tbConsumeGamePointsUserDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iSegment int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iConsume int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ȯ����ͳ�Ʊ� tbGamePointsStorage
CREATE TABLE IF NOT EXISTS tbGamePointsStorage(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iStorage int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ȯ�������������ֲ�ͳ�Ʊ� tbGamePointsStorageUserDis
CREATE TABLE IF NOT EXISTS tbGamePointsStorageUserDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iSegment int(11) unsigned not null default 0,
    iUserNum int(11) unsigned not null default 0,
    iStorage int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate, iWorldId, iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ȯ����ͳ�Ʊ� tbPointsConsign
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

-- ���� ��ȯ��ֵ;��ͳ�Ʊ� tbDmsBillOperType
CREATE TABLE IF NOT EXISTS tbDmsBillOperType(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default 0,
  iOperId tinyint(11) unsigned default 0,
  iUinNum int(11) unsigned default 0,
  iValue int(11) unsigned default 0,
  PRIMARY KEY  (dtStatDate,iWorldId,iOperId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ������ȯ��ֵ;��ͳ�Ʊ� tbDmsBillOperTypeWeb
CREATE TABLE IF NOT EXISTS tbDmsBillOperTypeWeb(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default 0,
  iOperId tinyint(11) unsigned default 0,
  iUinNum int(11) unsigned default 0,
  iValue int(11) unsigned default 0,
  PRIMARY KEY  (dtStatDate,iWorldId,iOperId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ȯ��������ͳ�Ʊ� tbPointsConsumeWay
CREATE TABLE IF NOT EXISTS tbPointsConsumeWay(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default 0,
  iWayId int(11) unsigned default 0,
  iUinNum int(11) unsigned default 0,
  iValue int(11) unsigned default 0,
  PRIMARY KEY  (dtStatDate,iWorldId,iWayId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��Ч�û�ͳ�Ʊ� tbEffectiveUser
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

-- ���� ��Ч�û��ȼ��ֲ�ͳ�Ʊ� tbEffectiveUserLvDis
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

-- ���� ��ɫ��¼����ͳ�Ʊ� tbRoleLoginTimes
CREATE TABLE IF NOT EXISTS tbRoleLoginTimes(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId tinyint(4) unsigned NOT NULL default '0',
  iTotalLoginTimes int(11) unsigned default NULL,
  PRIMARY KEY  (dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ɫ��¼�����ֲ�ͳ�Ʊ� tbRoleLoginTimesDis
CREATE TABLE IF NOT EXISTS tbRoleLoginTimesDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId tinyint(4) unsigned NOT NULL default '0',
  iLoginTimes int(11) unsigned NOT NULL default '0',
  iRoleNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iLoginTimes)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ���н�ɫ�Ա�ְҵ����ͳ�Ʊ� tbRoleJobLvDis
CREATE TABLE IF NOT EXISTS tbRoleJobLvDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  cGender char(1) NOT NULL default '0',
  iJobId tinyint(4) unsigned NOT NULL default '0',
  iLevel tinyint(4) unsigned NOT NULL default '0',
  iRoleNum int(11) unsigned default NULL,
  PRIMARY KEY  (dtStatDate,iWorldId,cGender,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �ջ�Ծ��ɫ�Ա�ְҵ����ͳ�Ʊ� tbDayActivityRoleJobLvDis
CREATE TABLE IF NOT EXISTS tbDayActivityRoleJobLvDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  cGender char(1) NOT NULL default '0',
  iJobId tinyint(4) unsigned NOT NULL default '0',
  iLevel tinyint(4) unsigned NOT NULL default '0',
  iRoleNum int(11) unsigned default NULL,
  PRIMARY KEY  (dtStatDate,iWorldId,cGender,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �������������ֲ�ͳ�Ʊ� tbMonthPayUserDis
CREATE TABLE IF NOT EXISTS tbMonthPayUserDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iSegment tinyint(4) unsigned NOT NULL default '0',
  iUserNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ���²���ͳ�Ʊ� tbMonthPayOperate
CREATE TABLE IF NOT EXISTS tbMonthPayOperate(
  dtStatDate date NOT NULL default '1970-01-01',
  iOperType smallint(6) unsigned NOT NULL default '0',
  iUserNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iOperType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ����;������ͳ�Ʊ� tbMonthPayUserApproach
CREATE TABLE IF NOT EXISTS tbMonthPayUserApproach(
  dtStatDate date NOT NULL default '1970-01-01',
  iApproach smallint(6) unsigned NOT NULL default '0',
  iUserNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iApproach)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����ÿСʱ������������ͳ�Ʊ� tbRealtimeIncome
CREATE TABLE IF NOT EXISTS tbRealtimeIncome(
  dtStatTime datetime NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iPayType tinyint(4) unsigned NOT NULL default '0',
  iIncome int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatTime,iWorldId,iPayType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ÿСʱ��ȯ��ֵͳ�Ʊ� tbRealtimeGamePoints
CREATE TABLE IF NOT EXISTS tbRealtimeGamePoints(
  dtStatTime datetime NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iPayType tinyint(4) unsigned NOT NULL default '0',
  iVaule int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatTime,iWorldId,iPayType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ÿСʱ��ȯ����ͳ�Ʊ�  tbHourPointsConsume
CREATE TABLE IF NOT EXISTS tbHourPointsConsume(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iWorldId int(11) unsigned not null default 0,
    iConsume int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ɫ��¼����ͳ�Ʊ� tbRoleLoginTimes
CREATE TABLE IF NOT EXISTS tbRoleLoginTimes(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iTotalLoginTimes int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ɫ��¼�����ֲ�ͳ�Ʊ� tbRoleLoginTimesDis
CREATE TABLE IF NOT EXISTS tbRoleLoginTimesDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iLoginTimes int(11) unsigned NOT NULL default '0',
  iRoleNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ����ſ�ͳ�Ʊ� tbOrganizationGeneral
CREATE TABLE IF NOT EXISTS tbOrganizationGeneral(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iOrgType tinyint(4) unsigned NOT NULL default '1',
  iOrgNum int(11) unsigned NOT NULL default '0',
  iMemberNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId,iOrgType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ����ȼ��ֲ�ͳ�Ʊ� tbOrganizationLevel
CREATE TABLE IF NOT EXISTS tbOrganizationLevel(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iOrgType tinyint(4) unsigned NOT NULL default '1',
  iLevel tinyint(4) unsigned NOT NULL default '0',
  iOrgNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId,iOrgType,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ����仯��Ϣͳ�Ʊ� tbOrganizationChange
CREATE TABLE IF NOT EXISTS tbOrganizationChange(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iOrgType tinyint(4) unsigned NOT NULL default '1',
  iChangeType tinyint(4) unsigned NOT NULL default '0',
  iOrgNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId,iOrgType,iChangeType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �����Ա�䶯ͳ�Ʊ� tbOrganizationMemberChange
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

-- ���� �����Ա�ȼ��ֲ�ͳ�Ʊ� tbOrganizationMemberLvDis
CREATE TABLE IF NOT EXISTS tbOrganizationMemberLvDis(
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iOrgType tinyint(4) unsigned NOT NULL default '1',
  iLevel tinyint(4) unsigned NOT NULL default '0',
  iMemberNum int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (dtStatDate,iWorldId,iZoneId,iOrgType,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  ����ͳ�Ʊ� tbTask
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

-- ����  ��ְͬҵ�͵ȼ�����������ͳ�Ʊ� tbTaskJobLvDis
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

-- ����  ��ɫɱ������ͳ�Ʊ� tbPlayerKilled
CREATE TABLE IF NOT EXISTS tbPlayerKilled (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iJobId tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iKilledNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  ��ɫ��������ͳ�Ʊ� tbPlayerKilledAreaDis
CREATE TABLE IF NOT EXISTS tbPlayerKilledAreaDis (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iMapId int(11) unsigned not null default 0,
    iKilledNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iMapId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  NPC���ۣ���Ҵ�NPC������ͳ�Ʊ� tbNpcSold
CREATE TABLE IF NOT EXISTS tbNpcSold (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(8) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,    
    iSoldNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  NPC�ع����������Ʒ��NPC��ͳ�Ʊ� tbNpcBuy
CREATE TABLE IF NOT EXISTS tbNpcBuy (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(6) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iBuyNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  ��Ʒ�ϳ�ͳ�Ʊ� tbItemCompose
CREATE TABLE IF NOT EXISTS tbItemCompose (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(6) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iComposeNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��Ұ�̯����ͳ�Ʊ� tbStall
CREATE TABLE IF NOT EXISTS tbStall (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iUserNum int(11) unsigned not null default 0,
    iStallNum int(11) unsigned not null default 0,
    iStallTime bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��Ǯ����ͳ�Ʊ� tbMoneyProduce
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

-- ���� ��Ǯ����ͳ�Ʊ� tbMoneyConsume
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

-- ���� ��Ǯת��ͳ�Ʊ� tbMoneyTransfer
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

-- ���� ��Ǯ����ͳ�Ʊ� tbMoneyStorage
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

-- ���� ϵͳ��Ǯ���ȼ�ӵ�����ֲ�ͳ�Ʊ� tbMoneyStorageLvDis
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

-- ���� ϵͳ��Ǯ���������ɫ���ֲ�ͳ�Ʊ� tbMoneyStorageRoleDis
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

-- ���� ��Ʒ����ͳ�Ʊ� tbItemProduce
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

-- ���� ��Ʒ����ͳ�Ʊ� tbItemCallback
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

-- ���� ��Ʒ���ͳ�Ʊ� tbItemObtain
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

-- ���� ��Ʒ����ͳ�Ʊ� tbItemConsume
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

-- ���� ��Ʒ����ͳ�Ʊ� tbItemDiscard
CREATE TABLE IF NOT EXISTS tbItemDiscard (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(4) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iDiscardNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��Ʒ����ͳ�Ʊ� tbItemDestroy
CREATE TABLE IF NOT EXISTS tbItemDestroy (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iItemType smallint(4) unsigned not null default 0,
    iItemId int(11) unsigned not null default 0,
    iDestroyNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iItemType,iItemId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��Ʒ����ͳ�Ʊ� tbItemExchange
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

-- ���� ��Ʒ����ͳ�Ʊ� tbItemConsign
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

-- ���� ���ͳ�Ʊ� tbTroop
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

-- ���� ����������������ͳ�Ʊ� tbRaid
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

-- ���� ���ﱻɱ����ͳ�Ʊ� tbMonsterKilled
CREATE TABLE IF NOT EXISTS tbMonsterKilled (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iMonsterId int(11) unsigned not null default 0,
    iKilledNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iMonsterId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ְҵɱ�ִ���ͳ�Ʊ� tbKillMonByJob
CREATE TABLE IF NOT EXISTS tbKillMonByJob (
  dtStatDate date NOT NULL default '1970-01-01',
  iWorldId int(11) unsigned NOT NULL default '0',
  iZoneId  tinyint(4) unsigned NOT NULL default '0',
  iJob tinyint(4) unsigned NOT NULL default '0',
  iKillMon int(11) unsigned default NULL,
  PRIMARY KEY (dtStatDate,iWorldId,iZoneId,iJob)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��ɫ����ʱ��ͳ�Ʊ� tbPlayerLvUpgrade
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

-- ���� �û�����ͳ�Ʊ� tbExceptionalOffline
CREATE TABLE IF NOT EXISTS tbExceptionalOffline (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iOfflineType tinyint(4) unsigned not null default 0,
    iOfflineNum int(11) unsigned not null default 0,
    iOfflineTimes int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iOfflineType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� �����Ϸ������Ϣ�� tbGameSenceInfo
CREATE TABLE IF NOT EXISTS `tbGameSenceInfo` (
  `dtStatDate` date NOT NULL default '1970-01-01' COMMENT 'ͳ������',
  `iWorldId` tinyint(4) unsigned NOT NULL default '0' COMMENT '����ID',
  `iZoneId` tinyint(4) unsigned NOT NULL default '0' COMMENT 'Ƶ��ID',
  `iGameMode` int(4) NOT NULL default '0' COMMENT '��Ϸģʽ',
  `iGameScene` int(4) NOT NULL default '0' COMMENT '��Ϸ����',
  `iGameCount` int(11) default '0' COMMENT 'ʹ�ô���',
  `iPlayerCount` int(11) default '0' COMMENT 'ʹ������',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,`iZoneId`,`iGameMode`,`iGameScene`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ;

-- ����  ��ɫPK����ͳ�Ʊ� tbPkKilled
CREATE TABLE IF NOT EXISTS tbPkKilled (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iJobId tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iKilledNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  ��ɫPKɱ��ͳ�Ʊ� tbPkKiller
CREATE TABLE IF NOT EXISTS tbPkKiller (
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iZoneId  tinyint(4) unsigned NOT NULL default '0',
    iJobId tinyint(4) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iKillNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iZoneId,iJobId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  �ͻ�������ͳ�Ʊ� tbClientStart
CREATE TABLE IF NOT EXISTS tbClientStart (
    dtTime datetime not null default '1970-01-01 08:00:00',
    iReportId int(11) unsigned not null default 0,
    vSp varchar(32) not null default '0',
    iSuccessNum int(11) unsigned not null default 0,
    iFailedNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtTime,iReportId,vSp)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  ��������ͳ�Ʊ� tbPatch
CREATE TABLE IF NOT EXISTS tbPatch (
    dtTime datetime not null default '1970-01-01 08:00:00',
    iReportId int(11) unsigned not null default 0,
    vSp varchar(32) not null default '0',
    iPatchNum int(11) unsigned not null default 0,
    iUnpatchNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtTime,iReportId,vSp)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  ��ȡQQǩ��ʱ��ͳ�Ʊ� tbGetIdiographTime
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

-- ����  ��ȡQQǩ��ʧ��ԭ��ͳ�Ʊ� tbGetIdiographFailed
CREATE TABLE IF NOT EXISTS tbGetIdiographFailed (
    dtTime datetime not null default '1970-01-01 08:00:00',
    iReportId int(11) unsigned not null default 0,
    vSp varchar(32) not null default '0',
    vReason varchar(64) not null default '0',
    iFailedTimes int(11) unsigned not null default 0,
    PRIMARY KEY(dtTime,iReportId,vSp,vReason)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

    
-- ���� ʵʱע��ͳ�Ʊ� tbRealRegister
CREATE TABLE IF NOT EXISTS tbRealRegister(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iWorldId int(11) unsigned not null default 0,
    iAllRegNum int(11) unsigned not null default 0,
    iNewRegNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
-- ���� ÿСʱ����ͳ�Ʊ� tbHourLogin
CREATE TABLE IF NOT EXISTS tbHourLogin(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iWorldId int(11) unsigned not null default 0,
    iLoginNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
    
-- ���� ÿСʱ�ǳ�ͳ�Ʊ� tbHourLogout
CREATE TABLE IF NOT EXISTS tbHourLogout(
    dtStatTime datetime not null default '1970-01-01 00:00:00',
    iWorldId int(11) unsigned not null default 0,
    iLoginNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatTime,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ͳ�Ƽ�ر���� tbMonitorReport
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

-- ���� ͳ�Ƴ����ر� tbMonitorProgram
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
    
-- ���� ICE���Ӽ�ر���� tbIceConnectMonitorReport
CREATE TABLE IF NOT EXISTS tbIceConnectMonitorReport(
    dtMonitorTime datetime not null default '1970-01-01 00:00:00',
    iWarnningLevel tinyint(4) unsigned not null default 0,
    vErrMsg varchar(128) null,
    PRIMARY KEY(dtMonitorTime)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ƽ����Ϸʱ��ͳ�Ʊ� tbPlayTimeSum
CREATE TABLE IF NOT EXISTS tbPlayTimeSum(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iOnlineNum int(11) unsigned not null default 0,
    iOnlineTime bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ����ʱ�����������ֲ�ͳ�Ʊ� tbPlayTimeSegDis
CREATE TABLE IF NOT EXISTS tbPlayTimeSegDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iSegment smallint(6) unsigned not null default 0,
    iSegmentNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��Ϸ��Ϸʱ���ȼ��ֲ�ͳ�Ʊ� tbPlayTimeSumLvDis
CREATE TABLE IF NOT EXISTS tbPlayTimeSumLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iOnlineNum int(11) unsigned not null default 0,
    iOnlineTime bigint(20) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ���� ��Ϸʱ���ȼ�ʱ�����������ֲ�ͳ�Ʊ� tbPlayTimeSegLvDis
CREATE TABLE IF NOT EXISTS tbPlayTimeSegLvDis(
    dtStatDate date not null default '1970-01-01',
    iWorldId int(11) unsigned not null default 0,
    iLevel tinyint(4) unsigned not null default 0,
    iSegment smallint(6) unsigned not null default 0,
    iSegmentNum int(11) unsigned not null default 0,
    PRIMARY KEY(dtStatDate,iWorldId,iLevel,iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- ���� װ���ӹ��ܿ�ͳ�Ʊ� tbArmMakeGen
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
-- ���� װ���ӹ����ӹ��ȼ��ֲ�ͳ�Ʊ� tbArmMakeLvDis
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
-- ���� ���ͳ�Ʊ� tbActivity
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
-- ���� ��ɫ��Ϊ�ȼ��ֲ�ͳ�Ʊ� tbRoleBehLvDis
CREATE TABLE  IF NOT EXISTS `tbRoleBehLvDis` (
  `dtStatDate` date NOT NULL default '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL default '0',
  `iZoneId`  tinyint(4) unsigned NOT NULL default '0',
  `iBehaId` int(11) unsigned NOT NULL default '0',
  `iRoleLevel` int(11) unsigned NOT NULL default '0',
  `iRoleNum` int(11) NOT NULL default '0',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,`iBehaId`,`iRoleLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- ���� ����ѧϰͳ�Ʊ� tbSkillLearn
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
-- ���� �����������ֵȼ�ͳ�Ʊ� tbTaskFinishedLvDis
CREATE TABLE  IF NOT EXISTS `tbTaskFinishedLvDis` (
  `dtStatDate` date NOT NULL default '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL default '0',
  `iZoneId`  tinyint(4) unsigned NOT NULL default '0',
  `iTaskId` int(11) unsigned NOT NULL default '0',
  `iRoleLevel` int(11) unsigned NOT NULL default '0',
  `iRoleNum` int(11) NOT NULL default '0',
  PRIMARY KEY  (`dtStatDate`,`iWorldId`,`iTaskId`,`iRoleLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;
-- ���� �������ͳ�Ʊ� tbCopyTeam
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

-- ���� �³�ֵ��������ֲ�ͳ�Ʊ� tbDepositMonthSeg
CREATE TABLE `tbDepositMonthSeg` (
  `dtStatDate` date NOT NULL DEFAULT '1970-01-01',
  `iWorldId` int(11) unsigned NOT NULL DEFAULT '0',
  `iStatType` smallint(4) unsigned NOT NULL DEFAULT '0',
  `iSegment` int(11) unsigned NOT NULL DEFAULT '0',
  `iUserNum` int(11) unsigned NOT NULL DEFAULT '0',
  `iMonthAmount` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dtStatDate`,`iWorldId`,`iStatType`,`iSegment`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk ;

-- ���� ����ע��ͳ�Ʊ� tbSFromReg_tem
CREATE TABLE IF NOT EXISTS tbSFromReg_tem (
dtStatDate DATE NOT NULL DEFAULT '1970-01-01',
iSFrom smallint(6) unsigned NOT NULL DEFAULT 0,
iRegNum int unsigned NOT NULL DEFAULT 0,
PRIMARY KEY(dtStatDate, iSFrom)
) TYPE = InnoDB DEFAULT CHARSET=gbk;

-- ���� ע�����������Ϣͳ�Ʊ� tbSFromUserActivityCase_Reg
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

-- ���� ȫ��ע�����������Ϣͳ�Ʊ� tbSFromUserActivityCase_Reg_AllWorld
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

-- ���� ��¼���������Ϣͳ�Ʊ� tbSFromUserActivityCase_Log
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


-- ���� ��¼���������Ϣͳ�Ʊ� tbSFromUserActivityCase_Log_AllWorld
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
