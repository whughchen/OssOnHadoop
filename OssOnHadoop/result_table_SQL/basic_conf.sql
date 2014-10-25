set names gbk;

replace into tbProvince(iProvinceId,vProvinceName,vArea)values(10,'北京','华北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(20,'广东','华南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(21,'上海','华东');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(22,'天津','华北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(23,'重庆','西南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(24,'辽宁','东北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(25,'江苏','华东');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(27,'湖北','华中');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(28,'四川','西南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(29,'陕西','西北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(311,'河北','华北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(351,'山西','华北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(371,'河南','华北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(431,'吉林','东北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(451,'黑龙江','东北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(471,'内蒙古','华北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(531,'山东','华北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(551,'安徽','华东');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(571,'浙江','华东');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(591,'福建','华南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(731,'湖南','华中');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(771,'广西','华南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(791,'江西','华东');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(851,'贵州','西南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(871,'云南','西南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(891,'西藏','西南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(898,'海南','华南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(931,'甘肃','西北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(951,'宁夏','西北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(971,'青海','西北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(991,'新疆','西北');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(852,'香港','华南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(853,'澳门','华南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(886,'台湾','华南');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(0,'未知','未知');

replace into tbSPInfo(iSPId,vSPName)values(10001,'广电网');
replace into tbSPInfo(iSPId,vSPName)values(10002,'教育网');
replace into tbSPInfo(iSPId,vSPName)values(10003,'电信');
replace into tbSPInfo(iSPId,vSPName)values(10004,'经济信息网');
replace into tbSPInfo(iSPId,vSPName)values(10005,'网通');
replace into tbSPInfo(iSPId,vSPName)values(10006,'联通');
replace into tbSPInfo(iSPId,vSPName)values(10007,'金桥网');
replace into tbSPInfo(iSPId,vSPName)values(10008,'铁通');
replace into tbSPInfo(iSPId,vSPName)values(10009,'移动');
replace into tbSPInfo(iSPId,vSPName)values(10010,'长宽');
replace into tbSPInfo(iSPId,vSPName)values(10011,'天威');
replace into tbSPInfo(iSPId,vSPName)values(10012,'未知');

replace into tbCapacity(iWorldId,vWorldName,iMaxCapacity,iIdcId,vIdcName) values(0,'所有服务器(分区)',10000,0,'所有服务器(分区)');
replace into tbCapacity(iWorldId,vWorldName,iMaxCapacity,iIdcId,vIdcName) values(255,'所有服务器(汇总)',1000000,0,'所有服务器(汇总)');

replace into tbMoneySegmentConf values(1,'[0,100)');
replace into tbMoneySegmentConf values(100,'[100,1000)');
replace into tbMoneySegmentConf values(1000,'[1000,1W)');
replace into tbMoneySegmentConf values(10000,'[1W,10W)');
replace into tbMoneySegmentConf values(100000,'[10W,100W)');
replace into tbMoneySegmentConf values(1000000,'[100W,1000W)');
replace into tbMoneySegmentConf values(10000000,'[1000W,1E)');
replace into tbMoneySegmentConf values(100000000,'[1E,10E)');
replace into tbMoneySegmentConf values(1000000000,'[10E,∞)');

replace into tbGamePointSegmentConf values(0,'(0,1)');
replace into tbGamePointSegmentConf values(100,'[1,5)');
replace into tbGamePointSegmentConf values(500,'[5,10)');
replace into tbGamePointSegmentConf values(1000,'[10,20)');
replace into tbGamePointSegmentConf values(2000,'[20,30)');
replace into tbGamePointSegmentConf values(3000,'[30,50)');
replace into tbGamePointSegmentConf values(5000,'[50,100)');
replace into tbGamePointSegmentConf values(10000,'[100,200)');
replace into tbGamePointSegmentConf values(20000,'[200,500)');
replace into tbGamePointSegmentConf values(50000,'[500,1000)');
replace into tbGamePointSegmentConf values(100000,'[1000,2000)');
replace into tbGamePointSegmentConf values(200000,'[2000,∞ )');


-- replace into tbGamePointSegConf values(0,'(0,5)');
-- replace into tbGamePointSegConf values(500,'[5,10)');
-- replace into tbGamePointSegConf values(1000,'[10,15)');
-- replace into tbGamePointSegConf values(1500,'[15,20)');
-- replace into tbGamePointSegConf values(2000,'[20,25)');
-- replace into tbGamePointSegConf values(2500,'[25,30)');
-- replace into tbGamePointSegConf values(3000,'[30,40)');
-- replace into tbGamePointSegConf values(4000,'[40,50)');
-- replace into tbGamePointSegConf values(5000,'[50,60)');
-- replace into tbGamePointSegConf values(6000,'[60,80)');
-- replace into tbGamePointSegConf values(8000,'[80,100)');
-- replace into tbGamePointSegConf values(10000,'[100,150)');
-- replace into tbGamePointSegConf values(15000,'[150,200)');
-- replace into tbGamePointSegConf values(20000,'[200,500)');
-- replace into tbGamePointSegConf values(50000,'[500,∞)');



replace into tbDmsBillOperConf values(101,'Q币', 1);
replace into tbDmsBillOperConf values(102,'Q点', 1);
replace into tbDmsBillOperConf values(103,'网银', 1);
replace into tbDmsBillOperConf values(104,'财付通', 1);
replace into tbDmsBillOperConf values(105,'esales', 2);
replace into tbDmsBillOperConf values(106,'Q币卡', 1);
replace into tbDmsBillOperConf values(107,'业务受理', 2);
replace into tbDmsBillOperConf values(108,'专用赠送渠道', 2);
replace into tbDmsBillOperConf values(109,'管理端充值', 2);
replace into tbDmsBillOperConf values(255,'汇总', 0);

INSERT IGNORE INTO tbSexConf VALUES('M', 0);
INSERT IGNORE INTO tbSexConf VALUES('F', 1);

REPLACE INTO tbMonitorConf VALUES('MmogHistoryOnline','MMOG历史在线统计','tbHistoryOnline','07:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogChannelOnline','MMOG频道历史在线统计','tbChannelOnline','07:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogPayUserStat','MMOG付费用户统计','tbPayer','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogNewPayUserStat','MMOG新增付费用户统计','tbNewPayer','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogRegUserStat','MMOG注册用户统计','tbUserRegister','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogLoginUserStat','MMOG用户活跃情况统计','tbUserLogin,tbUserLoginLvDis,tbPayUserLoginLvDis,tbFreeUserLoginLvDis,tbG1UserLoginLvDis,tbG2UserLoginLvDis,tbG3UserLoginLvDis','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogActivityCase','MMOG用户活跃情况统计','tbUserLogin,tbUserLoginLvDis,tbPayUserLoginLvDis,tbFreeUserLoginLvDis,tbG1UserLoginLvDis,tbG2UserLoginLvDis,tbG3UserLoginLvDis','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogPlayerOnlineTime','MMOG在线时长统计','tbPlayTime','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogDayNewPayStat','MMOG日新增付费情况统计','tbDayNewPayer,tbDayNewPayerPayTimes,tbDayNewPayerPayment','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogDayPayStat','MMOG日付费情况统计','tbDayPayer,tbDayPayerPayTimes,tbDayPayerPayment','08:00:00');
REPLACE INTO tbMonitorConf VALUES('OssUserPayCase','用户消费情况统计','tbPayer,tbPayerLvDis,tbDayPayer,tbConsumeGamePoints,tbDayPayerPayTimes,tbDayPayerPayment,tbConsumeGamePointsUserDis,tbDayNewPayer,tbDayNewPayerPayTimes,tbDayNewPayerPayment,tbWeekPayScaleLvDis,tbDWeekPayScaleLvDis,tbMonthPayScaleLvDis,tbInEffectPay,tbNewPayer,tbNewPayerLvDis','08:00:00');
REPLACE INTO tbMonitorConf VALUES('OssUserDepositCase','用户充值情况统计','tbDepositors,tbStoreGamePoints,tbStoreGamePointsUserDis,tbNewDepositors','08:00:00');
REPLACE INTO tbMonitorConf VALUES('OssUserActivityCase','用户活跃情况统计','tbUserLogin,tbUserLoginLvDis,tbPayUserLoginLvDis,tbFreeUserLoginLvDis,tbG1UserLoginLvDis,tbG2UserLoginLvDis,tbG3UserLoginLvDis,tbWeekActivityScaleLvDis,tbDWeekActivityScaleLvDis,tbMonthActivityScaleLvDis,tbInEffectActivity','08:00:00');
REPLACE INTO tbMonitorConf VALUES('OssUserRegisterCase','注册用户统计','tbUserRegister,tbResidentUser,tbResidentUserLvDis','08:00:00');
      
-- 创建频道名称配置表并填充初始数据
CREATE TABLE tbChannelConf as (select distinct iWorldId, iChannelId from tbRealOnline);
alter table tbChannelConf add vChannelName varchar(32) NOT NULL default '0' COMMENT '频道名称', add primary key (iWorldId,iChannelId);
update tbChannelConf set vChannelName=iChannelId;
