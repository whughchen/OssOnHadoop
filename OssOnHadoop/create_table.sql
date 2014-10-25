
--活跃
use u_ied_iplat;
CREATE TABLE t_dw_bbly_oss_tblogin(
    statis_date BIGINT,
    worldid BIGINT,
    iuin BIGINT,
    ilogintime BIGINT,
    ionlinetime BIGINT,
    iloginip BIGINT,
    ilevel BIGINT,
    iloginway BIGINT
)
PARTITION BY LIST( statis_date )
(
    PARTITION default
)
STORED AS FORMATFILE COMPRESS;



CREATE TABLE t_dw_bbly_oss_tbaccountday(
    statis_date BIGINT,
    iuin BIGINT,
    iregtime BIGINT,
    iregip BIGINT,
    iregway BIGINT
)
PARTITION BY LIST( statis_date )
(
    PARTITION default
)
STORED AS FORMATFILE COMPRESS;





--付费
CREATE TABLE t_dw_bbly_oss_tbworldpay(
    statis_date BIGINT,
    worldid BIGINT,
    iuin BIGINT,
    ipaytime BIGINT,
    ipayment BIGINT,
    itimes BIGINT,
    ilevel BIGINT,
    iflag BIGINT,
    iloginway BIGINT,
    iregway BIGINT
)
PARTITION BY LIST( statis_date )
(
    PARTITION default
)
STORED AS FORMATFILE COMPRESS;

insert into oss_tbGamePointSegmentConf values
('bbly',0,'(0-10)'       ),
('bbly',1000,'[10-20)'   ),
('bbly',2000,'[20-50)'   ),
('bbly',5000,'[50-100)'  ),
('bbly',10000,'[100-150)'),
('bbly',15000,'[150-200)'),
('bbly',20000,''         );


insert into oss_conf_tbLevelSegmentConf values
('yxcq',1,'1-5级'   ),
('yxcq',2,'1-5级'   ),
('yxcq',3,'1-5级'   ),
('yxcq',4,'1-5级'   ),
('yxcq',5,'1-5级'   ),
('yxcq',6,'6-10级'  ),
('yxcq',7,'6-10级'  ),
('yxcq',8,'6-10级'  ),
('yxcq',9,'6-10级'  ),
('yxcq',10,'6-10级' ),
('yxcq',11,'11-15级'),
('yxcq',12,'11-15级'),
('yxcq',13,'11-15级'),
('yxcq',14,'11-15级'),
('yxcq',15,'11-15级'),
('yxcq',16,'16-20级'),
('yxcq',17,'16-20级'),
('yxcq',18,'16-20级'),
('yxcq',19,'16-20级'),
('yxcq',20,'16-20级'),
('yxcq',21,'21-25级'),
('yxcq',22,'21-25级'),
('yxcq',23,'21-25级'),
('yxcq',24,'21-25级'),
('yxcq',25,'21-25级'),
('yxcq',26,'26-30级'),
('yxcq',27,'26-30级'),
('yxcq',28,'26-30级'),
('yxcq',29,'26-30级'),
('yxcq',30,'26-30级');


--配置表
insert into  oss_conf_tbcapacity values('bbly',255,'宝宝乐园',1000000,0,'',0);

-- insert into oss_conf_tbGamePointSegmentConf values
-- ('bbly',0,'(0-10)'),
-- ('bbly',1000,'[10-20)'),
-- ('bbly',2000,'[20-50)'),
-- ('bbly',5000,'[50-100)'),
-- ('bbly',10000,'[100-150)'),
-- ('bbly',15000,'[150-200)'),
-- ('bbly',20000,'[200-∞)')



