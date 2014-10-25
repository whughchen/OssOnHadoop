set names gbk;

replace into tbProvince(iProvinceId,vProvinceName,vArea)values(10,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(20,'�㶫','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(21,'�Ϻ�','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(22,'���','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(23,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(24,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(25,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(27,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(28,'�Ĵ�','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(29,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(311,'�ӱ�','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(351,'ɽ��','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(371,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(431,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(451,'������','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(471,'���ɹ�','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(531,'ɽ��','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(551,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(571,'�㽭','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(591,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(731,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(771,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(791,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(851,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(871,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(891,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(898,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(931,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(951,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(971,'�ຣ','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(991,'�½�','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(852,'���','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(853,'����','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(886,'̨��','����');
replace into tbProvince(iProvinceId,vProvinceName,vArea)values(0,'δ֪','δ֪');

replace into tbSPInfo(iSPId,vSPName)values(10001,'�����');
replace into tbSPInfo(iSPId,vSPName)values(10002,'������');
replace into tbSPInfo(iSPId,vSPName)values(10003,'����');
replace into tbSPInfo(iSPId,vSPName)values(10004,'������Ϣ��');
replace into tbSPInfo(iSPId,vSPName)values(10005,'��ͨ');
replace into tbSPInfo(iSPId,vSPName)values(10006,'��ͨ');
replace into tbSPInfo(iSPId,vSPName)values(10007,'������');
replace into tbSPInfo(iSPId,vSPName)values(10008,'��ͨ');
replace into tbSPInfo(iSPId,vSPName)values(10009,'�ƶ�');
replace into tbSPInfo(iSPId,vSPName)values(10010,'����');
replace into tbSPInfo(iSPId,vSPName)values(10011,'����');
replace into tbSPInfo(iSPId,vSPName)values(10012,'δ֪');

replace into tbCapacity(iWorldId,vWorldName,iMaxCapacity,iIdcId,vIdcName) values(0,'���з�����(����)',10000,0,'���з�����(����)');
replace into tbCapacity(iWorldId,vWorldName,iMaxCapacity,iIdcId,vIdcName) values(255,'���з�����(����)',1000000,0,'���з�����(����)');

replace into tbMoneySegmentConf values(1,'[0,100)');
replace into tbMoneySegmentConf values(100,'[100,1000)');
replace into tbMoneySegmentConf values(1000,'[1000,1W)');
replace into tbMoneySegmentConf values(10000,'[1W,10W)');
replace into tbMoneySegmentConf values(100000,'[10W,100W)');
replace into tbMoneySegmentConf values(1000000,'[100W,1000W)');
replace into tbMoneySegmentConf values(10000000,'[1000W,1E)');
replace into tbMoneySegmentConf values(100000000,'[1E,10E)');
replace into tbMoneySegmentConf values(1000000000,'[10E,��)');

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
replace into tbGamePointSegmentConf values(200000,'[2000,�� )');


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
-- replace into tbGamePointSegConf values(50000,'[500,��)');



replace into tbDmsBillOperConf values(101,'Q��', 1);
replace into tbDmsBillOperConf values(102,'Q��', 1);
replace into tbDmsBillOperConf values(103,'����', 1);
replace into tbDmsBillOperConf values(104,'�Ƹ�ͨ', 1);
replace into tbDmsBillOperConf values(105,'esales', 2);
replace into tbDmsBillOperConf values(106,'Q�ҿ�', 1);
replace into tbDmsBillOperConf values(107,'ҵ������', 2);
replace into tbDmsBillOperConf values(108,'ר����������', 2);
replace into tbDmsBillOperConf values(109,'����˳�ֵ', 2);
replace into tbDmsBillOperConf values(255,'����', 0);

INSERT IGNORE INTO tbSexConf VALUES('M', 0);
INSERT IGNORE INTO tbSexConf VALUES('F', 1);

REPLACE INTO tbMonitorConf VALUES('MmogHistoryOnline','MMOG��ʷ����ͳ��','tbHistoryOnline','07:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogChannelOnline','MMOGƵ����ʷ����ͳ��','tbChannelOnline','07:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogPayUserStat','MMOG�����û�ͳ��','tbPayer','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogNewPayUserStat','MMOG���������û�ͳ��','tbNewPayer','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogRegUserStat','MMOGע���û�ͳ��','tbUserRegister','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogLoginUserStat','MMOG�û���Ծ���ͳ��','tbUserLogin,tbUserLoginLvDis,tbPayUserLoginLvDis,tbFreeUserLoginLvDis,tbG1UserLoginLvDis,tbG2UserLoginLvDis,tbG3UserLoginLvDis','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogActivityCase','MMOG�û���Ծ���ͳ��','tbUserLogin,tbUserLoginLvDis,tbPayUserLoginLvDis,tbFreeUserLoginLvDis,tbG1UserLoginLvDis,tbG2UserLoginLvDis,tbG3UserLoginLvDis','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogPlayerOnlineTime','MMOG����ʱ��ͳ��','tbPlayTime','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogDayNewPayStat','MMOG�������������ͳ��','tbDayNewPayer,tbDayNewPayerPayTimes,tbDayNewPayerPayment','08:00:00');
REPLACE INTO tbMonitorConf VALUES('MmogDayPayStat','MMOG�ո������ͳ��','tbDayPayer,tbDayPayerPayTimes,tbDayPayerPayment','08:00:00');
REPLACE INTO tbMonitorConf VALUES('OssUserPayCase','�û��������ͳ��','tbPayer,tbPayerLvDis,tbDayPayer,tbConsumeGamePoints,tbDayPayerPayTimes,tbDayPayerPayment,tbConsumeGamePointsUserDis,tbDayNewPayer,tbDayNewPayerPayTimes,tbDayNewPayerPayment,tbWeekPayScaleLvDis,tbDWeekPayScaleLvDis,tbMonthPayScaleLvDis,tbInEffectPay,tbNewPayer,tbNewPayerLvDis','08:00:00');
REPLACE INTO tbMonitorConf VALUES('OssUserDepositCase','�û���ֵ���ͳ��','tbDepositors,tbStoreGamePoints,tbStoreGamePointsUserDis,tbNewDepositors','08:00:00');
REPLACE INTO tbMonitorConf VALUES('OssUserActivityCase','�û���Ծ���ͳ��','tbUserLogin,tbUserLoginLvDis,tbPayUserLoginLvDis,tbFreeUserLoginLvDis,tbG1UserLoginLvDis,tbG2UserLoginLvDis,tbG3UserLoginLvDis,tbWeekActivityScaleLvDis,tbDWeekActivityScaleLvDis,tbMonthActivityScaleLvDis,tbInEffectActivity','08:00:00');
REPLACE INTO tbMonitorConf VALUES('OssUserRegisterCase','ע���û�ͳ��','tbUserRegister,tbResidentUser,tbResidentUserLvDis','08:00:00');
      
-- ����Ƶ���������ñ�����ʼ����
CREATE TABLE tbChannelConf as (select distinct iWorldId, iChannelId from tbRealOnline);
alter table tbChannelConf add vChannelName varchar(32) NOT NULL default '0' COMMENT 'Ƶ������', add primary key (iWorldId,iChannelId);
update tbChannelConf set vChannelName=iChannelId;
