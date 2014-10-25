alter table tbGoodsVendition 
	add iTerm tinyint(4) unsigned not null default 0 after iGoodsType,
	drop primary key,
	add primary key(dtStatDate,iWorldId,iGoodsId,iGoodsType,iTerm,iType1,iType2,iType3);
	
alter table dbOssConf.tbItemConf
	add iItemSubType tinyint(4) unsigned not null default 0 after vItemTypeName,
	add vItemSubTypeName varchar(32) not null default '0' after iItemSubType;
	
alter table dbOssConf.tbGoodsConf
	add iGoodsSubType tinyint(4) unsigned not null default 0 after vGoodsTypeName,
	add vGoodsSubTypeName varchar(32) not null default '0' after iGoodsSubType;
	
alter table dbOssConf.tbJobConf
	drop iSecondaryJobId,
	drop vSecondaryName,
	drop iTertiaryJobId,
	drop vTertiaryName;
	
alter table tbItemExchange 
    change iItemId iItemId int(11) unsigned not null default 0,
    add iItemTotalPrice bigint(20) unsigned not null default 0,
    add iItemMaxPrice int(11) unsigned not null default 0,
    add iItemMinPrice int(11) unsigned not null default 0;
    
alter table tbMoneyProduce
    add iRoleNum int(11) unsigned not null default 0 after iProduce;
        
alter table tbMoneyConsume
    add iRoleNum int(11) unsigned not null default 0 after iConsume;
        
alter table tbMoneyTransfer
    add iRoleNum int(11) unsigned not null default 0 after iTransfer; 
       
alter table tbMoneyStorage
    add iRoleNum int(11) unsigned not null default 0 after iStore;

alter table tbStoreGamePoints
    drop primary key,
    add iWorldId tinyint(4) unsigned not null default 0 after dtStatDate,
    add primary key(dtStatDate,iWorldId);
    
alter table tbStoreGamePointsUserDis
    drop primary key,
    add iWorldId tinyint(4) unsigned not null default 0 after dtStatDate,
    add primary key(dtStatDate,iWorldId,iSegment);
    
alter table tbConsumeGamePoints
    drop primary key,
    add iWorldId tinyint(4) unsigned not null default 0 after dtStatDate,
    add primary key(dtStatDate,iWorldId);
    
alter table tbConsumeGamePointsUserDis
    drop primary key,
    add iWorldId tinyint(4) unsigned not null default 0 after dtStatDate,
    add primary key(dtStatDate,iWorldId,iSegment);
    
alter table tbGamePointsStorage
    drop primary key,
    add iWorldId tinyint(4) unsigned not null default 0 after dtStatDate,
    add primary key(dtStatDate,iWorldId);
    
alter table tbGamePointsStorageUserDis
    drop primary key,
    add iWorldId tinyint(4) unsigned not null default 0 after dtStatDate,
    add primary key(dtStatDate,iWorldId,iSegment);    

-- modify by Bwar on 2009-11-04    
alter table tbMoneyProduce
    add iRoleJob tinyint(4) unsigned NOT NULL default '0' after iProduce,
    add iRoleLevel tinyint(4) unsigned NOT NULL default '0' after iRoleJob,
    drop primary key,
    add primary key(dtStatDate,iWorldId,iMoneyType,iProduce,iRoleJob,iRoleLevel);

-- modify by Bwar on 2009-11-04       
alter table tbMoneyConsume
    add iRoleJob tinyint(4) unsigned NOT NULL default '0' after iConsume,
    add iRoleLevel tinyint(4) unsigned NOT NULL default '0' after iRoleJob,
    drop primary key,
    add primary key(dtStatDate,iWorldId,iMoneyType,iConsume,iRoleJob,iRoleLevel);

-- modify by Bwar on 2009-11-04       
alter table tbMoneyTransfer
    add iRoleJob tinyint(4) unsigned NOT NULL default '0' after iTransfer,
    add iRoleLevel tinyint(4) unsigned NOT NULL default '0' after iRoleJob,
    drop primary key,
    add primary key(dtStatDate,iWorldId,iMoneyType,iTransfer,iRoleJob,iRoleLevel);

-- modify by Bwar on 2009-11-04       
alter table tbMoneyStorageLvDis
    add iRoleJob tinyint(4) unsigned NOT NULL default '0' after iMoneyType,
    drop primary key,
    add primary key(dtStatDate,iWorldId,iMoneyType,iRoleJob,iLevel);

-- modify by liang on 2009-11-06
alter table dbOssConf.tbTaskConf
	add `iAreaId` tinyint(4) unsigned NOT NULL default '0' COMMENT '区域ID',
	add `vAreaName` varchar(32) default NULL COMMENT '区域名称',
	add `iTaskTypeId` tinyint(4) unsigned NOT NULL default '0' COMMENT '任务类型ID',
	add `vTaskTypeName` varchar(32) default NULL COMMENT '任务类型名称';
    
-- modify by Bwar on 2009-11-19
alter table tbMoneyProduce
    change iProduce iProduce int(11) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-19
alter table tbMoneyConsume
    change iConsume iConsume int(11) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-19
alter table tbMoneyTransfer
    change iTransfer iTransfer int(11) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-19
alter table tbMoneyStorage
    change iStore iStore int(11) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-19
alter table dbOssConf.tbMoneyModeConf
    change iModeId iModeId int(11) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-19
alter table tbMoneyStorage
    drop primary key,
    add primary key(dtStatDate,iWorldId,iMoneyType,iStore);
    
-- modify by Bwar on 2009-11-19
alter table tbMoneyStorageRoleDis
    drop primary key,
    add primary key(dtStatDate,iWorldId,iMoneyType,iLevel,iStoreSegment);
    
-- modify by Bwar on 2009-11-20
alter table dbOssConf.tbItemModeConf
    change iModeId iModeId int(11) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-20
alter table dbOssConf.tbItemConf
    change iItemType iItemType smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-20
alter table tbItemProduce
    change iItemType iItemType smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-20
alter table tbItemCallback
    change iItemType iItemType smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-20
alter table tbItemObtain
    change iItemType iItemType smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-20
alter table tbItemConsume
    change iItemType iItemType smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-20
alter table tbItemDiscard
    change iItemType iItemType smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-20
alter table tbItemDestroy
    change iItemType iItemType smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-20
alter table tbItemExchange
    change iItemType iItemType smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-20
alter table tbItemConsign
    change iItemType iItemType smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2009-11-23
alter table dbOssConf.tbItemConf
    change iOriginalItemType iOriginalItemType smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2010-01-19
alter table tbResidentUser
    add iCumulateUserNum int(11) unsigned not null default 0;
    
-- modify by Bwar on 2010-01-19
alter table tbResidentUserLvDis
    add iCumulateUserNum int(11) unsigned not null default 0;
    
-- modify by Bwar on 2010-01-21
alter table tbGoodsVendition
    add iPaymentCoupon int(11) unsigned not null default 0 after iPaymentGold,
    add iPaymentExp int(11) unsigned not null default 0 after iPaymentCoupon,
    add iPaymentTenpay int(11) unsigned not null default 0 after iPaymentQB;
    
-- modify by Bwar on 2010-01-26
alter table tbNewPayer
    add iWorldId smallint(6) unsigned not null default 255 after dtStatDate;
    
-- modify by Bwar on 2010-01-26
alter table tbDayNewPayer
    iWorldId smallint(6) unsigned not null default 255 after dtStatDate;
    
-- modify by Bwar on 2010-01-26
alter table tbDayNewPayerPayTimes
    add iWorldId smallint(6) unsigned not null default 255 after dtStatDate;
    
-- modify by Bwar on 2010-01-26
alter table tbDayNewPayerPayment
    add iWorldId smallint(6) unsigned not null default 255 after dtStatDate;
    
-- modify by Bwar on 2010-01-26
alter table tbDayPayer
    add iWorldId smallint(6) unsigned not null default 255 after dtStatDate;
    
-- modify by Bwar on 2010-01-26
alter table tbDayPayerPayTimes
    add iWorldId smallint(6) unsigned not null default 255 after dtStatDate;
    
-- modify by Bwar on 2010-01-26
alter table tbDayPayerPayment
    add iWorldId smallint(6) unsigned not null default 255 after dtStatDate;
    
-- modify by Bwar on 2010-01-26
alter table tbPayer
    add iWorldId smallint(6) unsigned not null default 255 after dtStatDate,
    add iDMonthPayNum int(11) unsigned not null default 0,
    add iWeekLostNum int(11) unsigned not null default 0,
    add iDWeekLostNum int(11) unsigned not null default 0,
    add iMonthLostNum int(11) unsigned not null default 0,
    add iSilenceNum int(11) unsigned not null default 0,
    add iWeekBackNum int(11) unsigned not null default 0,
    add iDWeekBackNum int(11) unsigned not null default 0,
    add iMonthBackNum int(11) unsigned not null default 0;
    
-- modify by Bwar on 2010-02-03
alter table tbGamePointsStorageUserDis
    change iSegment iSegment smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2010-02-03
alter table tbDmsBillOperType
    change iOperId iOperId smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2010-02-04
alter table tbStoreGamePointsUserDis
    change iSegment iSegment smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2010-02-04
alter table tbConsumeGamePointsUserDis
    change iSegment iSegment smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2010-02-04
alter table tbGamePointsStorageUserDis
    change iSegment iSegment smallint(6) unsigned not null default 0;
    
-- modify by Bwar on 2010-02-04
alter table tbStoreGamePointsUserDis
    change iSegment iSegment smallint(6) unsigned not null default 0;

-- modify by liangcui on 2010-03-10
alter table tbOrganizationGeneral 
	add iOrgType tinyint(4) unsigned NOT NULL default '1' after iWorldId,
	drop  primary key,
	add  primary key (dtStatDate,iWorldId,iOrgType);   
	
-- modify by liangcui on 2010-03-10
alter table tbOrganizationLevel 
	add iOrgType tinyint(4) unsigned NOT NULL default '1' after iWorldId,
	drop primary key,
	add primary key (dtStatDate,iWorldId,iOrgType,iLevel); 
    
-- modify by liangcui on 2010-03-10
alter table tbOrganizationChange 
	add iOrgType tinyint(4) unsigned NOT NULL default '1' after iWorldId,
	drop primary key,
	add primary key (dtStatDate,iWorldId,iOrgType,iChangeType); 

-- modify by liangcui on 2010-03-10
alter table tbOrganizationMemberChange 
	add iOrgType tinyint(4) unsigned NOT NULL default '1' after iWorldId,
	drop primary key,
	add primary key (dtStatDate,iWorldId,iOrgType,iChangeType);  
	
-- modify by liangcui on 2010-03-10
alter table tbOrganizationMemberLvDis 
	add iOrgType tinyint(4) unsigned NOT NULL default '1' after iWorldId,
	drop primary key,
	add primary key (dtStatDate,iOrgType,iWorldId,iLevel);	
    
-- modify by Bwar on 2010-03-16
alter table tbDmsBillOperType
    add iUinNum int(11) unsigned not null default 0 after iOperId;
    
-- modify by Bwar on 2010-03-19
alter table tbPointsConsign
    add iConsignPoundage int(11) unsigned not null default 0 after iConsignCharge;
    
-- modify by Noyce on 2010-03-29
alter table tbRaid
    add iRoleNum int(11) unsigned not null default 0 after iRaidId;    

-- modify by liangcui on 2010-03-30
alter table tbTask 
	add iTaskType tinyint(4) unsigned not null default 0 after iWorldId;
	
-- modify by alexjiang on 2010-06-30
alter table tbTask 
	add iTotalTime int(11) unsigned not null default 0  after iCancelTimes;

-- modify by Noyce on 2010-06-30
alter table tbGamePointsStorageUserDis change iSegment iSegment int(11) unsigned not null default 0;

-- modify by liangcui on 2010-07-19
alter table tbOrganizationGeneral add `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbOrganizationLevel add `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbOrganizationChange add `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table  tbOrganizationMemberChange add `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbRoleLoginTimes add `iZoneId` tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbRoleLoginTimesDis add `iZoneId` tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbPlayerKilled add `iZoneId` tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbKillMonByJob add `iZoneId` tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbTask add `iZoneId` tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbStall add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbNpcSold add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbNpcBuy add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbMoneyProduce add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbMoneyConsume add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbMoneyTransfer add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbMoneyStorage add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbMoneyStorageLvDis add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbMoneyStorageRoleDis add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbItemProduce add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbItemConsume add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbItemObtain add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbItemCallback add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbItemDestroy add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbItemDiscard add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbItemExchange add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbItemCompose add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbMonsterKilled add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbPkKilled add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbPkKiller add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;

alter table tbTroop add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;
alter table tbRaid add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;

-- modify by davidliang on 2010-08-04
alter table tbTask add column iAcceptUinNum int(11) unsigned NOT NULL default '0',add column iCompleteUinNum int(11) unsigned NOT NULL default '0';   

-- modify by kimi on 2010-09-27
alter table tbGameSenceInfo add  `iZoneId`  tinyint(4) unsigned NOT NULL default '0' after iWorldId;

-- modify by bwar on 2010-12-15
alter table tbStoreGamePointsUserDis change iSegment iSegment int(11) unsigned not null default 0;
alter table tbConsumeGamePointsUserDis change iSegment iSegment int(11) unsigned not null default 0;

-- modify by bwar on 2011-04-27
alter table tbEffectiveUser add iLastMonthEffectiveNum int(11) unsigned not null default 0;
alter table tbEffectiveUserLvDis add iLastMonthEffectiveNum int(11) unsigned not null default 0;

-- modify by bwar on 2011-05-06
alter table tbEffectiveUser add iNatureMonthRegisterNum int(11) unsigned not null default 0;
alter table tbEffectiveUserLvDis add iNatureMonthRegisterNum int(11) unsigned not null default 0;

-- modify by noyce on 2011-07-06
alter table tbProvince change iProvinceId iProvinceId int(11) unsigned not null default 0;

-- modify by noyce on 2011-07-07
alter table tbDayRegRegionDis change iProvinceId iProvinceId int(11) unsigned not null default 0;

-- modify by noyce on 2011-07-12
alter table tbDayLoginRegionDis change iProvinceId iProvinceId int(11) unsigned not null default 0;

-- modify by noyce on 2012-03-08
alter table tbPointsConsumeWayConf add iWayType smallint(6) unsigned not null default 0 COMMENT '消费类型ID';

-- modify by nocye on 2012-05-04
alter table tbEffectiveUser 
    add iNewEffectiveKeepNum int(11) unsigned not null default 0,
    add iOldEffectiveKeepNum int(11) unsigned not null default 0,
    add iBackEffectiveKeepNum int(11) unsigned not null default 0;
