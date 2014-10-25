-- -----------------------------------------------------------------------------
-- Project:    OSS
-- File:         oss_config_table_create.sql
-- Description:   ��Ӫ�������ñ����ű�
-- Author:   whughchen@gmail.com
-- Date:       2014-03-10
-- History:
-- -----------------------------------------------------------------------------

use dbOssConf;

-- ����  �������������ñ� tbCapacity
CREATE TABLE IF NOT EXISTS tbCapacity (
    iWorldId smallint(6) unsigned not null default 0 COMMENT 'World ���',
    vWorldName varchar(32) not null default '0' COMMENT 'World����',
    iMaxCapacity int(11) unsigned not null default '0' COMMENT '����������',
	iIdcId tinyint(4) unsigned not null default '0' COMMENT '����IDC ID',
	vIdcName varchar(32) not null default '0' COMMENT '����IDC����',
    iIsActive tinyint(4) unsigned not null default 0,
    PRIMARY KEY(iWorldId),
    INDEX(iIsActive)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�������������ñ�';

-- ����  Ƶ���������ñ� tbChannelConf
CREATE TABLE IF NOT EXISTS tbChannelConf (
    iWorldId smallint(6) NOT NULL default '0' COMMENT 'World ���',
    iChannelId smallint(6) NOT NULL default '0' COMMENT 'Ƶ��/Zone���',
    vChannelName varchar(32) NOT NULL default '0' COMMENT 'ZONE����',
    PRIMARY KEY  (iWorldId,iChannelId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='Ƶ���������ñ�';

-- ����ʡ����������Ƭ�����ñ�tbProvince
CREATE TABLE IF NOT EXISTS tbProvince (
    iProvinceId int(11) unsigned not null default 0 COMMENT 'ʡ�������',
    vProvinceName varchar(32) not null default '0' COMMENT 'ʡ��������',
    vArea varchar(32) not null default '0' COMMENT '����Ƭ��',
    PRIMARY KEY(iProvinceId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT 'ʡ��������Ƭ�����ñ�'; 

-- ����������Ӫ�����ñ�tbSPInfo
CREATE TABLE IF NOT EXISTS tbSPInfo (
    iSPId smallint(6) unsigned not null default 0 COMMENT '������Ӫ�̱��',
    vSPName varchar(32) not null default '0' COMMENT '������Ӫ������',
    PRIMARY KEY(iSPId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '������Ӫ�����ñ�';

-- ����  �����������ñ� tbItemConf
CREATE TABLE IF NOT EXISTS tbItemConf (
    iItemType smallint(6) unsigned not null default 0 COMMENT '��������ID',
    iItemId int(11) unsigned not null default 0 COMMENT '����ID',
    vItemName varchar(32) not null default '0' COMMENT '��������',
    vItemTypeName varchar(32) not null default '0' COMMENT '������������',
	iItemSubType tinyint(4) unsigned not null default 0 COMMENT '����������ID', 
	vItemSubTypeName varchar(32) not null default '0' COMMENT '������������',
    iPrice int(11) unsigned not null default '0' COMMENT '����',
    iOriginalItemType smallint(6) unsigned not null default 0 COMMENT '��Ϸԭʼ��������ID',
    iTerm smallint(6) unsigned not null default '0' COMMENT '����',
    PRIMARY KEY(iItemType,iItemId,iOriginalItemType,iTerm)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '�����������ñ�';

-- ����  ��Ʒ�������ñ� tbGoodsConf
CREATE TABLE IF NOT EXISTS tbGoodsConf (
    iGoodsType smallint(6) unsigned not null default 0 COMMENT '��Ʒ����ID',
    iGoodsId int(11) unsigned not null default 0 COMMENT '��ƷID',
    vGoodsName varchar(32) not null default '0' COMMENT '��Ʒ����',
    vGoodsTypeName varchar(32) not null default '0' COMMENT '��Ʒ��������',
	iGoodsSubType tinyint(4) unsigned not null default 0 COMMENT '��Ʒ������ID', 
	vGoodsSubTypeName varchar(32) not null default '0' COMMENT '��Ʒ��������',
    iPrice int(11) unsigned not null default '0' COMMENT '����',
    iOriginalGoodsType tinyint(4) unsigned not null default 0 COMMENT '��Ϸԭʼ��Ʒ����ID',
    iTerm smallint(6) unsigned not null default '0' COMMENT '�û���������',
    iOriginalTerm int(11) unsigned not null default '0' COMMENT 'ԭʼ����',
    PRIMARY KEY(iGoodsType,iGoodsId,iOriginalGoodsType,iTerm)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��Ʒ�������ñ�';

-- ����  �����������ñ� tbTaskConf
CREATE TABLE IF NOT EXISTS tbTaskConf (
    `iTaskId` smallint(6) unsigned NOT NULL default '0' COMMENT '����ID',
    `vTaskName` varchar(32) default NULL COMMENT '��������',
    `iTaskLevel` tinyint(4) unsigned NOT NULL default '0' COMMENT '���񼶱�',
    `iAreaId` tinyint(4) unsigned NOT NULL default '0' COMMENT '����ID',
    `vAreaName` varchar(32) default NULL COMMENT '��������',
    `iTaskTypeId` tinyint(4) unsigned NOT NULL default '0' COMMENT '��������ID',
    `vTaskTypeName` varchar(32) default NULL COMMENT '������������',
    PRIMARY KEY(iTaskId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '�����������ñ�';

-- ����  ��ɫ�Ա����ñ� tbSexConf
CREATE TABLE IF NOT EXISTS tbSexConf (
    cSex char(1) not null default 'M' COMMENT '�Ա�',
    iSexId smallint(6) unsigned not null default 0 COMMENT '�Ա�ID',
    PRIMARY KEY(cSex)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��ɫ�Ա����ñ�';

-- ����  ְҵ�������ñ� tbJobConf
CREATE TABLE IF NOT EXISTS tbJobConf (
    iJobId smallint(6) unsigned not null default 0 COMMENT 'ְҵID',
    vJobName varchar(32) not null default '0' COMMENT 'ְҵ����',
    PRIMARY KEY(iJobId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT 'ְҵ�������ñ�';

-- ����  �����������ñ� tbMonsterConf
CREATE TABLE IF NOT EXISTS tbMonsterConf (
    iMonsterId int(11) unsigned not null default 0 COMMENT '����ID',
    vMonsterName varchar(32) not null default '0' COMMENT '��������',
    iLevel tinyint(4) unsigned not null default '0' COMMENT '����ȼ�',
    iMoney int(11) unsigned not null default '0' COMMENT 'ɱ�������ɻ�ý�Ǯ��',
    iExp int(11) unsigned not null default '0' COMMENT 'ɱ�������ɻ�þ���',
    PRIMARY KEY(iMonsterId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '�����������ñ�';

-- ����  �������ñ� tbRaidConf
CREATE TABLE IF NOT EXISTS tbRaidConf (
    iRaidId smallint(6) unsigned not null default 0 COMMENT '����ID',
    vRaidName varchar(32) not null default '0' COMMENT '��������',
    iLevel tinyint(4) unsigned not null default 0 COMMENT '���񼶱�',
    PRIMARY KEY(iRaidId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '�������ñ�';

-- ����  ��ͼ���ñ� tbMapConf
CREATE TABLE IF NOT EXISTS tbMapConf (
    iMapId smallint(6) unsigned not null default 0 COMMENT '��ͼID',
    vMapName varchar(32) not null default '0' COMMENT '��ͼ����',
    PRIMARY KEY(iMapId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��ͼ���ñ�';

-- ����  NPC���ñ� tbNpcConf
CREATE TABLE IF NOT EXISTS tbNpcConf (
    iNpcId smallint(6) unsigned not null default 0 COMMENT 'NPC ID',
    vNpcName varchar(32) not null default '0' COMMENT 'NPC����',
    PRIMARY KEY(iNpcId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT 'NPC���ñ�';

-- ����  �������ñ� tbSkillConf
CREATE TABLE IF NOT EXISTS tbSkillConf (
    iSkillId smallint(6) unsigned not null default 0 COMMENT '����ID',
    vSkillName varchar(32) not null default '0' COMMENT '��������',
    PRIMARY KEY(iSkillId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '�������ñ�';

-- ����  ��Ϸ��Ǯ�������ñ� tbMoneyTypeConf
CREATE TABLE IF NOT EXISTS tbMoneyTypeConf (
    iMoneyType smallint(6) unsigned not null default 0 COMMENT '��Ǯ����ID',
    vMoneyName varchar(32) not null default '0' COMMENT '��Ǯ��������',
    PRIMARY KEY(iMoneyType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��Ϸ��Ǯ�������ñ�';

-- ����  ��Ǯ���������ġ�ת�ơ��洢��ʽ���ñ� tbMoneyModeConf
CREATE TABLE IF NOT EXISTS tbMoneyModeConf (
    iModeId int(11) unsigned not null default 0 COMMENT '��Ǯ����ID',
    vModeName varchar(32) not null default '0' COMMENT '��Ǯ��������',
    iModeType tinyint(4) unsigned not null default 0 COMMENT 'ģʽ����ID',
    iModeTypeName varchar(32) not null default '0' COMMENT 'ģʽ��������',
    PRIMARY KEY(iModeId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��Ǯ�������ñ�';

-- ����  ��Ʒ���������ġ�ת�ơ��洢��ʽ���ñ� tbItemModeConf
CREATE TABLE IF NOT EXISTS tbItemModeConf (
    iModeId int(11) unsigned not null default 0 COMMENT '��������ID',
    vModeName varchar(32) not null default '0' COMMENT '������������',
    iModeType tinyint(4) unsigned not null default 0 COMMENT 'ģʽ����ID',
    iModeTypeName varchar(32) not null default '0' COMMENT 'ģʽ��������',
    PRIMARY KEY(iModeId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '�����������ñ�';

-- ����  ��Ǯ������������ñ� tbMoneySegmentConf
CREATE TABLE IF NOT EXISTS tbMoneySegmentConf (
    iSegment int(11) unsigned not null default 0 COMMENT '��Ǯ�洢�������ID',
    vSegmentName varchar(32) not null default '0' COMMENT '��Ǯ�洢�����������',
    PRIMARY KEY(iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��Ǯ������������ñ�';

-- ����  ��ȯ������������ñ� tbGamePointSegmentConf
CREATE TABLE IF NOT EXISTS tbGamePointSegmentConf (
    iSegment int(11) unsigned not null default 0 COMMENT '��ȯ�洢�������ID',
    vSegmentName varchar(32) not null default '0' COMMENT '��ȯ�洢�����������',
    PRIMARY KEY(iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��ȯ������������ñ�';

-- ����  ��ȯ������������ñ� tbGamePointSegConf
CREATE TABLE IF NOT EXISTS tbGamePointSegConf (
    iSegment int(11) unsigned not null default 0 COMMENT '��ȯ�洢�������ID',
    vSegmentName varchar(32) not null default '0' COMMENT '��ȯ�洢�����������',
    PRIMARY KEY(iSegment)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��ȯ������������ñ�';

-- ����  �����������ñ� tbOfflineConf
CREATE TABLE IF NOT EXISTS tbOfflineConf (
    iOfflineType tinyint(4) unsigned not null default 0 COMMENT '��������ID',
    vOfflineName varchar(32) not null default '0' COMMENT '����������',
    PRIMARY KEY(iOfflineType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '�����������ñ�';

-- ����  ����������ñ� tbOrganizationConf
CREATE TABLE IF NOT EXISTS tbOrganizationConf (
    iOperType tinyint(4) unsigned not null default 0 COMMENT '��������ID',
    vOperName varchar(32) not null default '0' COMMENT '����������',
    PRIMARY KEY(iOperType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '����������ñ�';

-- ����  ��Ϸģʽ���ñ� tbGameModeConf
CREATE TABLE IF NOT EXISTS tbGameModeConf (
    iGameMode int(11) unsigned not null default 0 COMMENT 'ģʽID',
    vModeName varchar(32) not null default '0' COMMENT 'ģʽ��',
    PRIMARY KEY(iGameMode)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��Ϸģʽ���ñ�';

-- ����  ��Ϸ�������ñ� tbGameSceneConf
CREATE TABLE IF NOT EXISTS tbGameSceneConf (
    iSceneMode int(11) unsigned not null default 0 COMMENT '����ID',
    vSceneName varchar(32) not null default '0' COMMENT '������',
    PRIMARY KEY(iSceneMode)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��Ϸ�������ñ�';

-- ����  ���²����������ñ� tbMonthPayCmdConf
CREATE TABLE IF NOT EXISTS tbMonthPayCmdConf (
    iCmdType smallint(6) unsigned not null default 0 COMMENT '��������ID',
    vCmdName varchar(32) not null default '0' COMMENT '����������',
    PRIMARY KEY(iCmdType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '���²����������ñ�';

-- ����  ���¸���;�����ñ� tbMonthPayWayConf
CREATE TABLE IF NOT EXISTS tbMonthPayWayConf (
    iPayType smallint(6) unsigned not null default 0 COMMENT '��������ID',
    vPayName varchar(32) not null default '0' COMMENT '����������',
    PRIMARY KEY(iPayType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '���¸���;�����ñ�';

-- ����  ��ȯ��ֵ;�����ñ� tbDmsBillOperConf
CREATE TABLE IF NOT EXISTS tbDmsBillOperConf (
    iOperId smallint(6) unsigned not null default 0 COMMENT '��ֵ;��ID',
    vOperName varchar(32) not null default '0' COMMENT '��ֵ;����',
    iOperType smallint(6) unsigned not null default 0 COMMENT '��ֵ����ID',
    PRIMARY KEY(iOperId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��ȯ��ֵ;�����ñ�';

-- ���� ��ȯ��������ͳ�Ʊ� tbPointsConsumeWayConf
CREATE TABLE IF NOT EXISTS tbPointsConsumeWayConf (
  iWayId smallint(6) unsigned NOT NULL default '0' COMMENT '��������ID',
  vWayName varchar(32) NOT NULL default '0' COMMENT '����������',
  iWayType smallint(6) unsigned not null default 0 COMMENT '��������ID',
  PRIMARY KEY  (iWayId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��ȯ�����������ñ�'; 

-- ����  ��ɫ�ȼ��ֶ��������ñ� tbLevelSegmentConf
CREATE TABLE IF NOT EXISTS tbLevelSegmentConf (
    iLevel tinyint(4) unsigned not null default 0 COMMENT '�ȼ�',
    vSegment varchar(32) not null default '0' COMMENT '�ȼ�����',
    PRIMARY KEY(iLevel)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT '��ɫ�ȼ��ֶ��������ñ�';

-- ���� �������������������ñ� tbOrgTypeNameConf
CREATE TABLE IF NOT EXISTS tbOrgTypeNameConf (
  	iOrgType tinyint(4) unsigned NOT NULL default '1' COMMENT '��������ID',
  	vOrgName varchar(32) NOT NULL default '0' COMMENT '������������',
  	PRIMARY KEY  (iOrgType)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='���������������ñ�';	

-- ���� ���������������ñ� tbTaskTypeNameConf
CREATE TABLE IF NOT EXISTS tbTaskTypeNameConf (
  iTaskTypeId tinyint(4) unsigned NOT NULL default '0' COMMENT '��������ID',
  vTaskTypeName varchar(32) NOT NULL default '0' COMMENT '������������',
  PRIMARY KEY  (iTaskTypeId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='���������������ñ�';

-- ���� ������ñ� tbMonitorConf
CREATE TABLE IF NOT EXISTS tbMonitorConf(
    vProgramName varchar(32) NOT NULL DEFAULT '0' COMMENT '������',
    vProgramDesc  varchar(32) NULL COMMENT '������������',
    vInfection varchar(512) NULL COMMENT '����Ӱ���ͳ�ƽ����',
    dtBetimes time NOT NULL DEFAULT '00:00:00' COMMENT '�ͳ�����ʱ��',
    PRIMARY KEY(vProgramName),
    INDEX(dtBetimes)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='ͳ�Ƽ�����ñ�';

-- ����  ����ʱ����������ñ� tbPlayTimeSegmentConf
CREATE TABLE IF NOT EXISTS tbPlayTimeSegmentConf (
    iSegment int(11) unsigned not null default 0 COMMENT '����ʱ�������ID',
    vSegmentName varchar(32) not null default '0' COMMENT '����ʱ�����������',
    PRIMARY KEY(iSegment)
) TYPE=InnoDB DEFAULT CHARSET=gbk COMMENT '����ʱ����������ñ�';

-- ���� zone�������ñ� tbZoneConf
CREATE TABLE IF NOT EXISTS `tbZoneConf` (
  `iZoneId` int(12) unsigned NOT NULL default '0' COMMENT '����ID',
  `vZoneName` varchar(32) NOT NULL default '0' COMMENT '��������',
  PRIMARY KEY  (`iZoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�������ñ�';

-- ����  װ���ӹ���ʽ���ñ� tbArmMakeConf
CREATE TABLE IF NOT EXISTS `tbArmMakeConf` (
  `iArmMakeId` int(11) unsigned NOT NULL default '0',
  `vArmMakeName` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`iArmMakeId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  ����ñ� tbActivityConf
CREATE TABLE IF NOT EXISTS  `tbActivityConf` (
  `iActivityId` int(11) unsigned NOT NULL default '0',
  `vActivityName` varchar(32) default NULL,
  `vStatTerm` text
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  ��ɫ��Ϊ���ñ� tbRoleBehConf
CREATE TABLE IF NOT EXISTS `tbRoleBehConf` (
  `iBehaId` int(11) unsigned NOT NULL default '0',
  `vBehaName` varchar(32) default NULL,
  PRIMARY KEY  (`iBehaId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ����  �����ά�����ñ�  tbOssResultTableMaintenanceConf
CREATE TABLE IF NOT EXISTS tbOssResultTableMaintenanceConf (
   vTableName varchar(32) NOT NULL default '0' COMMENT '�������',
   vTableDesc varchar(32) NOT NULL default '0' COMMENT '�������������',
   iReservedDays smallint(6) unsigned NOT NULL default 0 COMMENT '��ǰ����������ݱ�������',
   vTimeFieldName varchar(32) NOT NULL default '0' COMMENT 'ʱ�������ֶ���',
  PRIMARY KEY  (vTableName)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�����ά�����ñ�';

-- ����  ���û����ñ�  tbGroupUserConf
CREATE TABLE IF NOT EXISTS tbGroupUserConf (
   iGroupId tinyint(4) unsigned NOT NULL default 0 COMMENT '��ID',
   vGroupName varchar(32) NOT NULL default '0' COMMENT '������',
   PRIMARY KEY (iGroupId)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='���û����ñ�';

-- ���� ͨ������ģ��ִ��������ñ�
CREATE TABLE IF NOT EXISTS dbOssConf.tbOssConfigureOpt (
  vResultTab VARCHAR(32) NOT NULL COMMENT '�������',
  iDBConnType smallint unsigned NOT NULL DEFAULT 202 COMMENT '���ݿ��������ͣ���ο��ĵ�����μ�����CONN_TYPE��ö��ֵ��Ĭ��Ϊֱ������LOGDB',
  iDbNum TINYINT unsigned NOT NULL DEFAULT 1 COMMENT '���ݿ����',
  iTabNum TINYINT unsigned NOT NULL DEFAULT 1 COMMENT '���ݿ���������������ֱ����ֳɶ����ű�',
  iDBTYPE TINYINT unsigned NOT NULL DEFAULT 1 COMMENT '���ݿ����͡�1��MYSQL��2��ORACLE��3��SQL SERVER',
  vOptSql VARCHAR(1024) NOT NULL COMMENT 'ִ�е�SQL���',
  vResultColumnList varchar(256) NOT NULL COMMENT '��������������ܼ�ʱ��ʹ����ֶ�',
  vPrimayColumn VARCHAR(16) DEFAULT NULL COMMENT '�����������л���������ʱ�������������������֧��һ������Ϊ����',
  iIsActive TINYINT unsigned NOT NULL DEFAULT 0 COMMENT '�Ƿ񼤻�ִ�С�0����1����',
  iExecDataType TINYINT unsigned NOT NULL COMMENT '�������ݷ�ʽ��1�����������ã�2��ͬ����ӣ�3������ĳһ����ͬ����ӡ������������ӣ��밴˳�������չ',
  PRIMARY KEY (vResultTab)
)ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='������ģ��ִ��������ñ�';

-- ���� ͨ���������ñ�
CREATE TABLE `tbSFromConf` (
  `iSFrom` int(11) NOT NULL DEFAULT '0',
  `vSFrom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`iSFrom`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk
