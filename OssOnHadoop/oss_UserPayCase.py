#!/usr/bin/env python
#-*- coding: utf-8 -*-
#
#  Descripe: 
#  Auther: Richard chen  (whughchen@gmail.com)
#  Created Date: 2013-05-06
#  CopyRight: Tencent Company
#  编写python SQL 规范:
#  0.
#    sql语句最后不要加分号
#    sql="alter table  T_FAT_QQGAME_GAME_BILL  drop partition (p_%s)" %(bgDt_tmp)
#  1.
#    execute SQL有异常，如果你在代码里捕捉了，调度是不会重新调度的。
#    你可以在捕捉代码里打印“FAILED”字符串，调度如果发现log里有FAILED，就会重新调度。
#    try:
#       res = tdw.execute(sql)
#       WriteLog("info","exec sql 1 ok")
#    except Exception, hsx:
#       WriteLog("error","sql 1 FAILED"+hsx.message) #hsx.message异常打印信息
#  2.
#    分区查询都用隐式查询  where  STATIS_DATE=20100908
#  3.
#    case when then else 语句要注意类型匹配，比如CHGHAPPYENERGY是bigint 因此 0 也要cast成bigint
#    case when CHGHAPPYENERGY<0 then CHGHAPPYENERGY else cast ( 0 as BIGINT) end
#    else 是bigint，then 也要是bigint
#    then cast (gametype+68 as bigint) else gametype 
#  4. 
#    建议使用drop partition 和 add partition ，而不使用truncate partition
# ------------------------------------------------------------------------------------------------

# need __import__ three python modules to support the datetime conversion
time = __import__('time')
datetime = __import__('datetime')
string = __import__('string')

# some global variables related to the shell script
bgDt = "00000000"
edDt = "00000000"
SepDay = 1
res = ""

# ------------------------------------------------------------------------------------------------
# new function to support `date -d "$bgDt_tmp 1 days" +%Y%m%d` in shell script
# 
def getYM(baseTime):   
    return str(baseTime)[0:6]   

def getYMFirstDay(baseTime):   
    return str(baseTime)[0:6] + "01"   
                    
def getYear():   
    return str(datetime.date.today())[0:4]
  
def getMonth():   
    return str(datetime.date.today())[5:7]
 
def getDay():   
    return str(datetime.date.today())[8:10]      

def getToday():   
    return str(getYear() + getMonth() + getDay())    
    
def getDateDelta(baseTime, delta):
    # baseTime： is a string like "19700101"
    # delta：    1代表后一天 -1代表前一天
    d1 = datetime.datetime(string.atoi(baseTime[0:4]), string.atoi(baseTime[4:6]), string.atoi(baseTime[6:8]))
    d2 = d1 + datetime.timedelta(days=delta)
    deltaDate = d2.strftime("%Y%m%d")
    return deltaDate

# 返回指定日期周一和周日
# return the date(monday:weektype=1 or sunday weektype=7) from a giving date 
# baseDate： is a string like "19700101"
def getMondayOfWeek(baseDate, weektype):
    tRealDate = time.strptime(str(baseDate), '%Y%m%d')
    nWeekDay = int(time.strftime('%w', tRealDate))
    if nWeekDay == 0:
        nWeekDay = 7
    nAddNumber = (int(weektype) - nWeekDay) * 1440
    dRealDate = datetime.datetime(tRealDate[0], tRealDate[1], tRealDate[2])
    dRealDate2 = dRealDate + datetime.timedelta(minutes=nAddNumber)
    ndate = int(str(dRealDate2)[0:4] + str(dRealDate2)[5:7] + str(dRealDate2)[8:10])
    return ndate

# ------------------------------------------------------------------------------------------------    

NOW = lambda: time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
script_name = "oss_UserPayCase.py"
    
def Usage():
    print "Usage:%s <YYYYMMDD> <para>" % script_name

def write_log(msg):
    '''打日志'''
    tdw_obj.WriteLog("|%s|msg ----> %s" % (script_name, msg))

def is_mth_end_day(day):
    '''判断所给日期(格式yyyymmdd)是否月末，是在返回True，否则返回False'''
    original_mth = day[4:6]
    after_day_mth = getDateDelta(day, 1)[4:6]
    # 如果前后的月份不同，说明是月末
    return original_mth != after_day_mth


def num2DateStr(dateNum):
    dateNum = str(dateNum)
    if len(dateNum) != 8:
        write_log("dateNum_to_string func ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        return None
    return '%s-%s-%s' % (dateNum[:4], dateNum[4:6], dateNum[6:])


def _exec_sql(sql='', need_raise=False):
    '''执行 SQL 语句，need_raise 指明是否需要抛出异常，默认不需要'''
    write_log("running:\n" + sql)
    try:
        rs = tdw_obj.execute(sql)
        return rs
    except Exception, e:
        if need_raise: raise e      # 如果传参指明需要抛出异常
        else: write_log("ERROR execute sql FAILED: " + e.message)


def global_init(argv):
    '''准备全局变量，获取参数'''
    global date_begin           # 统计起始日期
    global date_end             # 统计结束日期
    global statis_date          # 统计日期
    global sAppKey
    global isNoLevel            # 如果过程文件无 iLevel 字段值，则需要从 UserActiveCase 过程表关联
    statis_date = argv[0]
    date_end = statis_date
    sAppKey = argv[1]
    isNoLevel = False           # 默认过程文件的 iLevel 字段不为 null
    if len(argv) == 3:          # 传入 no_level 表示需要从 UserActiveCase 过程表关联用户等级
        isNoLevel = True if argv[2] == 'no_level' else False 
    
    global mth1days             # 本月共有多少天
    global mth2days             # 上个月有多少天
    global mth3days             # 上上个月有多少天
    
    global m_ullDayPay
    global m_ullWeekPay
    global m_ullDWeekPay
    global m_ullMonthPay
    global m_ullDMonthPay
    
    global m_ullLastWeekPay
    global m_ullLastDWeekPay
    global m_ullLastMonthPay
    
    global m_ullAntepenultWeekPay
    global m_ullAntepenultDWeekPay
    global m_ullAntepenultMonthPay
    global m_ulNaturalMonthPay      # 自然月开始（1日）到当前日期活跃
    global ucNaturalMonthDayNum     # 自然月开始（1日）到当前日期天数
    
    m_ullDayPay = long("0x0000000000000001", 16)
    m_ullWeekPay = long("0x000000000000007F", 16)
    m_ullDWeekPay = long("0x0000000000003FFF", 16)
    m_ullLastWeekPay = long("0x0000000000003F80", 16)
    m_ullLastDWeekPay = long("0x000000000FFFC000", 16)
    m_ullAntepenultWeekPay = long("0x00000000001FC000", 16)
    m_ullAntepenultDWeekPay = long("0x000003FFF0000000", 16)
    ucNaturalMonthDayNum = int(statis_date[6:8])
    m_ulNaturalMonthPay = (1 << ucNaturalMonthDayNum) - 1
    m_ullLastMonthPay = 0
    
    if is_mth_end_day(statis_date):                         # 如果是月底最后一天，按自然月天数统计
        mth1days = int(statis_date[6:])
        mth2days = int(getDateDelta(statis_date, -mth1days)[6:])
        mth3days = int(getDateDelta(statis_date, -(mth1days + mth2days))[6:])
        m_ullMonthPay = (1 << mth1days) - 1
#        m_ullMonthPay = long('0b' + '1' * mth1days, 2)
#        m_ullMonthPay = long('0b111111111111111111111111111111', 2)
        m_ullDMonthPay = (1 << (mth1days + mth2days)) - 1
#        m_ullDMonthPay = long('0b' + '1' * (mth1days + mth2days), 2)
#        m_ullDMonthPay = long('0b1111111111111111111111111111111111111111111111111111111111111', 2)
        for i in range(mth1days, mth1days + mth2days):
            m_ullLastMonthPay |= (1 << i)
            # '0b1111111111111111111111111111111000000000000000000000000000000'
        m_ullAntepenultMonthPay = (1 << mth3days) - 1
#        m_ullAntepenultMonthPay = long('0b' + '1' * mth3days, 2)
#        m_ullAntepenultMonthPay = long('0b1111111111111111111111111111', 2)
    else:                                                   # 不是月底最后一天，按30天统计月指标
        mth1days = 30
        mth2days = 30
        mth3days = 30
        m_ullMonthPay = long("0x000000003FFFFFFF", 16)
        m_ullDMonthPay = long("0x0FFFFFFFFFFFFFFF", 16)         # 60 bit
        m_ullLastMonthPay = long("0x0FFFFFFFC0000000", 16)      # 60 bit
        m_ullAntepenultMonthPay = long("0x3FFFFFFF" , 16)       # 30 bit
    write_log('mth1days:%s, mth2days:%s, mth3days:%s' % (mth1days, mth2days, mth3days))
    

def create_mid_table():
    sql = """
    CREATE TABLE IF NOT EXISTS t_dw_%s_oss_tbUserPay
    (
        statis_date bigint,
        iWorldId bigint,
        iUin bigint,
        iLevel bigint,
        iPayment bigint,
        iPayTimes bigint,
        strPayDays string        -- 按位记录付费的日期
    )
    PARTITION BY LIST(statis_date)
    (
        PARTITION default
    )   
    STORED as FORMATFILE COMPRESS
    """ % (sAppKey)
    _exec_sql(sql)
    
    sql = """
    CREATE TABLE IF NOT EXISTS t_dw_%s_tbPayScaleLvDis_mid 
    (
        statis_date bigint,
        iWorldId bigint,
        iLevel bigint,
        iWeek bigint,
        iDWeek bigint,
        iMonth bigint,
        iNaturalMonth bigint,
        iNum bigint
    )
    PARTITION BY LIST(statis_date)
    (
        PARTITION default
    )   
    STORED as FORMATFILE COMPRESS
    """ % (sAppKey)
    _exec_sql(sql)


def _add_partition():
    sql = """alter table t_dw_%s_oss_tbUserPay drop partition (p_%s)""" % (sAppKey, statis_date)
    _exec_sql(sql)
    sql = """alter table t_dw_%s_oss_tbUserPay add partition p_%s values in ('%s')""" % (sAppKey, statis_date, statis_date)
    _exec_sql(sql)
    
    sql = """alter table t_dw_%s_tbPayScaleLvDis_mid drop partition (p_%s)""" % (sAppKey, statis_date)
    _exec_sql(sql)
    sql = """alter table t_dw_%s_tbPayScaleLvDis_mid add partition p_%s values in ('%s')""" % (sAppKey, statis_date, statis_date)
    _exec_sql(sql)
    

def create_rs_table():
    '''检查并创建结果表'''
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbPayer (
        dtStatDate bigint,
        vGame string,
        iWorldId bigint,
        iAllPayNum bigint,
        iDayPayNum bigint,
        iWeekPayNum bigint,
        iDWeekPayNum bigint,
        iMonthPayNum bigint,
        iDMonthPayNum bigint,
        iWeekLostNum bigint,
        iDWeekLostNum bigint,
        iMonthLostNum bigint,
        iSilenceNum bigint,
        iWeekBackNum bigint,
        iDWeekBackNum bigint,
        iMonthBackNum bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbPayerLvDis (
        dtStatDate bigint,
        vGame string,
        iWorldId bigint,
        iLevel bigint,
        iAllPayNum bigint,
        iDayPayNum bigint,
        iWeekPayNum bigint,
        iDWeekPayNum bigint,
        iMonthPayNum bigint,
        iDMonthPayNum bigint,
        iWeekLostNum bigint,
        iDWeekLostNum bigint,
        iMonthLostNum bigint,
        iSilenceNum bigint,
        iWeekBackNum bigint,
        iDWeekBackNum bigint,
        iMonthBackNum bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbDayPayer (
        dtStatDate bigint,
        vGame string,
        iWorldId bigint,
        iDayPayNum bigint,
        iPayTimes bigint,
        iPayment bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbConsumeGamePoints (
        dtStatDate bigint, 
        vGame string, 
        iWorldId bigint, 
        iUserNum bigint, 
        iConsumeTimes bigint, 
        iConsume bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbDayPayerPayTimes (
        dtStatDate bigint, 
        vGame string, 
        iWorldId bigint, 
        iPayTimes bigint, 
        iPayerNum bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_temp_tbDayPayerPayInfo (
        dtStatDate bigint, 
        vGame string, 
        iWorldId bigint, 
        iPayTimes bigint, 
        iPayerNum bigint,
        iPayment bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbDayPayerPayment (
        dtStatDate bigint, 
        vGame string,
        iWorldId bigint, 
        iPayment bigint, 
        iPayerNum bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbConsumeGamePointsUserDis (
        dtStatDate bigint, 
        vGame string, 
        iWorldId bigint, 
        iSegment bigint, 
        iUserNum bigint, 
        iConsume bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbDayNewPayer (
        dtStatDate bigint,
        vGame string,  
        iWorldId bigint, 
        iDayNewPayNum bigint, 
        iPayTimes bigint, 
        iPayment bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbDayNewPayerPayTimes (
        dtStatDate bigint,
        vGame string,  
        iWorldId bigint, 
        iPayTimes bigint, 
        iPayerNum bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_temp_tbDayNewPayerPayInfo (
        dtStatDate bigint, 
        vGame string, 
        iWorldId bigint, 
        iPayTimes bigint, 
        iPayerNum bigint,
        iPayment bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbDayNewPayerPayment (
        dtStatDate bigint, 
        vGame string,
        iWorldId bigint, 
        iPayment bigint, 
        iPayerNum bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbWeekPayScaleLvDis (
        dtStatDate bigint,
        vGame string,  
        iWorldId bigint, 
        iLevel bigint, 
        iPayDays bigint, 
        iPayNum bigint 
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbDWeekPayScaleLvDis (
        dtStatDate bigint, 
        vGame string, 
        iWorldId bigint, 
        iLevel bigint, 
        iPayDays bigint, 
        iPayNum bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbMonthPayScaleLvDis (
        dtStatDate bigint, 
        vGame string, 
        iWorldId bigint, 
        iLevel bigint, 
        iPayDays bigint, 
        iPayNum bigint 
    ) STORED AS PGDATA
    """
    _exec_sql(sql)

    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbInEffectPay (
        dtStatDate bigint, 
        vGame string, 
        iWorldId bigint, 
        iPayDays bigint, 
        iPayNum bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)

    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbNewPayer (
        dtStatDate bigint, 
        vGame string, 
        iWorldId bigint, 
        iDayNewPayNum bigint, 
        iWeekNewPayNum bigint, 
        iDWeekNewPayNum bigint, 
        iMonthNewPayNum bigint 
    ) STORED AS PGDATA
    """
    _exec_sql(sql)

    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbNewPayerLvDis (
        dtStatDate bigint, 
        vGame string, 
        iWorldId bigint, 
        iLevel bigint, 
        iDayNewPayNum bigint, 
        iWeekNewPayNum bigint, 
        iDWeekNewPayNum bigint, 
        iMonthNewPayNum bigint  
    ) STORED AS PGDATA
    """
    _exec_sql(sql)


def build_mid_data():
    '''构造中间数据'''
    sql = """
    insert table u_ied_iplat::t_dw_%s_oss_tbUserPay
    select %s as statis_date, T.iWorldId, T.iUin, max(iLevel) as iLevel, sum(T.iPayment) as iPayment, sum(T.iPayTimes) as iPayTimes, 
            max(strPayDays) as strPayDays 
    from 
    ( 
        select iWorldId, iUin, max(iLevel) as iLevel, sum(iPayment) as iPayment, sum(iPayTimes) as iPayTimes, 
            case    -- 当天有付费，补 1
                when B.iWorldId is not null and B.iUin is not null then concat(regexp_replace(max(A.strPayDays), '^0+', ''), '1')
                    -- 当天无付费，补 0
                when B.iWorldId is null and B.iUin is null then concat(regexp_replace(max(A.strPayDays), '^0+', ''), '0')
            end as strPayDays  
        from 
        (                -- 历史所有付费用户，分大区与汇总255
            select iWorldId, iUin, iLevel, iPayment, iPayTimes, strPayDays from u_ied_iplat::t_dw_%s_oss_tbUserPay where statis_date=%s 
                union all    -- 当天付费用户，分大区
            select distinct WorldId as iWorldId, iUin, iLevel, iPayment, iTimes, '0' from u_ied_iplat::t_dw_%s_oss_tbWorldPay 
            where statis_date=%s and WorldId is not null and WorldId<>255 
                union all    -- 当天付费用户，汇总255
            select 255, iUin, max(iLevel), sum(iPayment), sum(iTimes), '0' from u_ied_iplat::t_dw_%s_oss_tbWorldPay 
            where statis_date=%s group by iUin  
        ) A 
        left join 
        (        -- 当天所有汇总、分区付费用户 Uin
            select distinct WorldId as iWorldId, iUin from u_ied_iplat::t_dw_%s_oss_tbWorldPay where statis_date=%s and WorldId is not null and WorldId<>255 
                union all 
            select distinct 255, iUin from u_ied_iplat::t_dw_%s_oss_tbWorldPay where statis_date=%s   
        ) B 
        on ( A.iWorldId=B.iWorldId and A.iUin=B.iUin ) 
        group by A.iWorldId, A.iUin, B.iWorldId, B.iUin  
    ) T 
    group by T.iWorldId, T.iUin
    """ % (sAppKey, statis_date, sAppKey, getDateDelta(statis_date, -1), sAppKey, statis_date,
           sAppKey, statis_date, sAppKey, statis_date, sAppKey, statis_date)
    _exec_sql(sql, True)


#def clean_history_result():
#    '''清理已有的历史统计结果'''
#    sql = """
#    delete from oss_tbPayer where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbPayerLvDis where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbDayPayer where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbConsumeGamePoints where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbDayPayerPayTimes where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbDayPayerPayment where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbConsumeGamePointsUserDis where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbDayNewPayer where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbDayNewPayerPayTimes where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbDayNewPayerPayment where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbWeekPayScaleLvDis where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbDWeekPayScaleLvDis where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbMonthPayScaleLvDis where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbInEffectPay where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbNewPayer where dtStatDate=[statis_date] and vGame='[vGameName]' ;
#    delete from oss_tbNewPayerLvDis where dtStatDate=[statis_date] and vGame='[vGameName]'
#    """.replace('[statis_date]', statis_date).replace('[vGameName]', sAppKey)
#    for query in sql.strip().split(';'):
#        _exec_sql(query.strip())


def delete_result(table=''):
    sql = "delete from %s where dtStatDate=%s and vGame='%s' " % (table, statis_date, sAppKey)
    _exec_sql(sql, need_raise=True)


def DayPayStat():
    # --------------- DayPayStat() ---------------
    delete_result('oss_temp_tbDayPayerPayInfo')
    sql = """
    insert table oss_temp_tbDayPayerPayInfo
    select %s as dtStatDate, '%s' as vGame, iWorldId, iPayTimes, iPayerNum, sum(iPayment) as iPayment 
    from 
    (
        select WorldId as iWorldId, iTimes as iPayTimes, count(iUin) as iPayerNum, sum(iPayment) as iPayment 
        from u_ied_iplat::t_dw_%s_oss_tbWorldPay where statis_date=%s and WorldId is not null and WorldId<>255 group by WorldId, iTimes 
            union all 
        select 255, iTimes, count(iUin) as iPayerNum, sum(iPayment) as iPayment from 
        (
            select iUin, sum(iTimes) as iTimes, sum(iPayment) as iPayment from u_ied_iplat::t_dw_%s_oss_tbWorldPay 
            -- 255汇总与分区只会入库二选一，故用 or
            where statis_date=%s and ( (WorldId is null or WorldId=255) or (WorldId is not null and WorldId<>255) ) 
            group by iUin
        ) A  group by A.iTimes 
    ) B 
    group by iWorldId, iPayTimes, iPayerNum
    """ % (statis_date, sAppKey, sAppKey, statis_date, sAppKey, statis_date)
    _exec_sql(sql, need_raise=True)
    
    delete_result('oss_tbDayPayer')
    sql = """
    insert table oss_tbDayPayer  
    select %s as dtStatDate, vGame, iWorldId, sum(iPayerNum) as iDayPayNum, sum(iPayTimes) as iPayTimes, sum(iPayment) as iPayment 
    from oss_temp_tbDayPayerPayInfo where dtStatDate=%s and vGame='%s' group by vGame, iWorldId
    """ % (statis_date, statis_date, sAppKey)
    _exec_sql(sql, need_raise=True)

    delete_result('oss_tbConsumeGamePoints')
    sql = """
    insert table oss_tbConsumeGamePoints 
    select dtStatDate, vGame, iWorldId, iDayPayNum, iPayTimes, iPayment
    from oss_tbDayPayer where dtStatDate=%s and vGame='%s'
    """ % (statis_date, sAppKey)
    _exec_sql(sql, need_raise=True)
    
    delete_result('oss_tbDayPayerPayTimes')
    sql = """
    insert table oss_tbDayPayerPayTimes   
    select %s as dtStatDate, vGame, iWorldId, iPayTimes, iPayerNum  
    from oss_temp_tbDayPayerPayInfo where dtStatDate=%s and vGame='%s'
    """ % (statis_date, statis_date, sAppKey)
    _exec_sql(sql, need_raise=True)
    delete_result('oss_temp_tbDayPayerPayInfo') # 继续把中间结果删掉，减少该表的数据量
    
    sql = "SELECT iSegment FROM oss_tbGamePointSegmentConf where vGame='%s' order by iSegment asc" % sAppKey
    segments = _exec_sql(sql, need_raise=True)
    write_log("segments: %s\n'" % segments)
    
    segment_sql = ''
    i = 0
    for seg in segments:
        if i == 0: # 第一个区间，左开右开
            segment_sql += """when iPayment>%s and iPayment<%s then %s 
            """ % (seg, segments[i + 1], seg) 
        elif i == len(segments) - 1: # 最后一个区间，左闭
            segment_sql += """    else %s """ % (seg) 
        else: # 中间的区间，左闭右开
            segment_sql += """    when iPayment>=%s and iPayment<%s then %s 
            """ % (seg, segments[i + 1], seg) 
        i += 1
    
    delete_result('oss_tbConsumeGamePointsUserDis')
    sql = """
    insert table oss_tbConsumeGamePointsUserDis 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iSegment, count(iUin) as iUserNum, sum(iPayment) as iConsume from 
    (
        select WorldId as iWorldId, iUin, iPayment,
            case %s end as iSegment 
        from u_ied_iplat::t_dw_%s_oss_tbWorldPay 
        where statis_date=%s and WorldId is not null and WorldId<>255 
            union all 
        select 255 as iWorldId, iUin, iPayment,
            case %s end as iSegment 
        from
        ( 
            select iUin, sum(iPayment) as iPayment from u_ied_iplat::t_dw_%s_oss_tbWorldPay 
            -- 255汇总与分区只会入库二选一，故用 or
            where statis_date=%s and ( (WorldId is null or WorldId=255) or (WorldId is not null and WorldId<>255) ) 
            group by iUin
        ) a 
    ) b group by iWorldId, iSegment
    """ % (statis_date, sAppKey, segment_sql, sAppKey, statis_date, segment_sql, sAppKey, statis_date)
    _exec_sql(sql, need_raise=True)

    delete_result('oss_tbDayPayerPayment')
    sql = """
    insert table oss_tbDayPayerPayment 
    select dtStatDate, vGame, iWorldId, iSegment as iPayment, iUserNum as iPayerNum 
    from oss_tbConsumeGamePointsUserDis where dtStatDate=%s and vGame='%s' 
    """ % (statis_date, sAppKey)
    _exec_sql(sql, need_raise=True)
    # --------------- DayPayStat() end ---------------


def DayNewPayStat():
    # --------------- DayNewPayStat() ---------------
    delete_result('oss_temp_tbDayNewPayerPayInfo')
    sql = """
    insert table oss_temp_tbDayNewPayerPayInfo 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iPayTimes, iPayerNum, sum(iPayment) as iPayment
    from 
    (
        select iWorldId, iPayTimes, count(iUin) as iPayerNum, sum(iPayment) as iPayment 
        from t_dw_%s_oss_tbUserPay where statis_date=%s and length(strPayDays)=1 
        group by iWorldId, iPayTimes 
    ) t group by iWorldId, iPayTimes, iPayerNum
    """ % (statis_date, sAppKey, sAppKey, statis_date)
    _exec_sql(sql, need_raise=True)
    
    delete_result('oss_tbDayNewPayer')
    sql = """
    insert table oss_tbDayNewPayer 
    select %s as dtStatDate, '%s' as vGame, iWorldId, sum(iPayerNum) as iDayNewPayNum, sum(iPayTimes*iPayerNum) as iPayTimes, sum(iPayment) as iPayment
    from oss_temp_tbDayNewPayerPayInfo where dtStatDate=%s and vGame='%s' group by iWorldId
    """ % (statis_date, sAppKey, statis_date, sAppKey)
    _exec_sql(sql, need_raise=True)
   
    delete_result('oss_tbDayNewPayerPayTimes')
    sql = """
    insert table oss_tbDayNewPayerPayTimes 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iPayTimes, iPayerNum 
    from oss_temp_tbDayNewPayerPayInfo where dtStatDate=%s and vGame='%s' 
    """ % (statis_date, sAppKey, statis_date, sAppKey)
    _exec_sql(sql, need_raise=True)
    delete_result('oss_temp_tbDayNewPayerPayInfo') # 继续把中间结果删掉，减少该表的数据量
    
    sql = "SELECT iSegment FROM oss_tbGamePointSegmentConf where vGame='%s' order by iSegment asc" % sAppKey
    segments = _exec_sql(sql, need_raise=True)
    write_log("segments: %s\n'" % segments)
    
    segment_sql = ''
    i = 0
    for seg in segments:
        if i == 0: # 第一个区间，左开右开
            segment_sql += """when iPayment>%s and iPayment<%s then %s 
            """ % (seg, segments[i + 1], seg) 
        elif i == len(segments) - 1: # 最后一个区间，左闭
            segment_sql += """    else %s """ % (seg) 
        else: # 中间的区间，左闭右开
            segment_sql += """    when iPayment>=%s and iPayment<%s then %s 
            """ % (seg, segments[i + 1], seg) 
        i += 1
    
    delete_result('oss_tbDayNewPayerPayment')
    sql = """
    insert table oss_tbDayNewPayerPayment 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iSegment as iPayment, count(iUin) as iUserNum from 
    (
        select iWorldId, iUin, 
            case %s end as iSegment 
        from u_ied_iplat::t_dw_%s_oss_tbUserPay
        where statis_date=%s and length(strPayDays)=1
    ) a group by iWorldId, iSegment  
    """ % (statis_date, sAppKey, segment_sql, sAppKey, statis_date)
    _exec_sql(sql, need_raise=True)
    # --------------- DayNewPayStat() end ---------------


def NewPayStat():
    # --------------- NewPayStat() begin ---------------
    tb = """
        (    -- 关联 UserActiveCase 所制造的过程表，以获取 iLevel
            select A.iWorldId, A.iUin, case when B.iLevel is null then 0 else B.iLevel end as iLevel, A.strPayDays  
            from 
            (    select iWorldId, iUin, strPayDays from u_ied_iplat::t_dw_%s_oss_tbUserPay where statis_date=%s    ) A  
            left join 
            (    select iWorldId, iUin, iLevel from u_ied_iplat::t_dw_%s_oss_tbUserActive where statis_date=%s    ) B 
            on ( A.iWorldId=B.iWorldId and A.iUin=B.iUin ) 
        ) T 
    """ % (sAppKey, statis_date, sAppKey, getDateDelta(statis_date, -1))
    tb_sql = tb if isNoLevel else 'u_ied_iplat::t_dw_%s_oss_tbUserPay where statis_date=%s ' % (sAppKey, statis_date)
    
    delete_result('oss_tbNewPayerLvDis')
    sql = """
    insert table oss_tbNewPayerLvDis 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iLevel, iDayNewPayNum, iWeekNewPayNum, iDWeekNewPayNum, iMonthNewPayNum 
    from 
    (    -- strPayDays 不可能有前置的 0，那么只要判断 length(strPayDays) 即可知道是不是某个周期的新增付费 
        select iWorldId, iLevel, 
                sum(case when length(strPayDays)=1 then 1 else 0 end) as iDayNewPayNum, 
                sum(case when length(strPayDays)<=7 then 1 else 0 end) as iWeekNewPayNum,  
                sum(case when length(strPayDays)<=14 then 1 else 0 end) as iDWeekNewPayNum,  
                sum(case when length(strPayDays)<=%s then 1 else 0 end) as iMonthNewPayNum 
        from %s 
        group by iWorldId, iLevel 
    ) A 
    """ % (statis_date, sAppKey, mth1days, tb_sql)
    _exec_sql(sql, need_raise=True)
    
    delete_result('oss_tbNewPayer')
    sql = """
    insert table oss_tbNewPayer 
    select dtStatDate, '%s' as vGame, iWorldId, sum(iDayNewPayNum), sum(iWeekNewPayNum), sum(iDWeekNewPayNum), sum(iMonthNewPayNum) 
    from u_ied_iplat::oss_tbNewPayerLvDis 
    where dtStatDate=%s and vGame='%s' 
    group by dtStatDate, iWorldId 
    """ % (sAppKey, statis_date, sAppKey) 
    _exec_sql(sql, need_raise=True)
    # --------------- NewPayStat() end ---------------


def PayCaseStat():
    # --------------- PayCaseStat() begin ---------------
    tb = """
        (    -- 关联 UserActiveCase 所制造的过程表，以获取 iLevel
            select A.iWorldId, A.iUin, case when B.iLevel is null then 0 else B.iLevel end as iLevel, A.strPayDays  
            from 
            (    select iWorldId, iUin, strPayDays from u_ied_iplat::t_dw_%s_oss_tbUserPay where statis_date=%s    ) A  
            left join 
            (    select iWorldId, iUin, iLevel from u_ied_iplat::t_dw_%s_oss_tbUserActive where statis_date=%s    ) B 
            on ( A.iWorldId=B.iWorldId and A.iUin=B.iUin ) 
        ) T 
    """ % (sAppKey, statis_date, sAppKey, getDateDelta(statis_date, -1))
    tb_sql = tb if isNoLevel else 'u_ied_iplat::t_dw_%s_oss_tbUserPay where statis_date=%s ' % (sAppKey, statis_date)
    
    delete_result('oss_tbPayerLvDis')
    sql = """
    insert table oss_tbPayerLvDis 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iLevel, iAllPayNum, iDayPayNum, iWeekPayNum, iDWeekPayNum, iMonthPayNum, 
        iDMonthPayNum, iWeekLostNum, iDWeekLostNum, iMonthLostNum, iSilenceNum, iWeekBackNum, iDWeekBackNum, iMonthBackNum 
    from 
    (
        select iWorldId, iLevel, count(iUin) as iAllPayNum, 
                sum(case when (cast(conv(substr(strPayDays, -1, 1), 2, 10) as bigint) & 1) > 0 then 1 else 0 end) as iDayPayNum, 
                sum(case when (cast(conv(substr(strPayDays, case when length(strPayDays)>7 then -7 else 0 end, 7), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iWeekPayNum,  
                
                sum(case when (cast(conv(substr(strPayDays, case when length(strPayDays)>14 then -14 else 0 end, 14), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iDWeekPayNum,  
                
                sum(case when (cast(conv(substr(strPayDays, case when length(strPayDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iMonthPayNum, 
                
                sum(case when (cast(conv(substr(strPayDays, case when length(strPayDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iDMonthPayNum,
                
                sum(case when (cast(conv(substr(strPayDays, case when length(strPayDays)>14 then -14 else 0 end, 14), 2, 10) as bigint) & %s) > 0 
                        and (cast(conv(substr(strPayDays, case when length(strPayDays)>7 then -7 else 0 end, 7), 2, 10) as bigint) & %s) = 0 then 1 else 0 end) as iWeekLostNum, 
                        
                sum(case when (cast(conv(substr(strPayDays, case when length(strPayDays)>28 then -28 else 0 end, 28), 2, 10) as bigint) & %s) > 0 
                        and (cast(conv(substr(strPayDays, case when length(strPayDays)>14 then -14 else 0 end, 14), 2, 10) as bigint) & %s) = 0 then 1 else 0 end) as iDWeekLostNum, 
                        
                sum(case when (cast(conv(substr(strPayDays, case when length(strPayDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) > 0 
                        and (cast(conv(substr(strPayDays, case when length(strPayDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) = 0 then 1 else 0 end) as iMonthLostNum, 
                        
                sum(case when (cast(conv(substr(strPayDays, case when length(strPayDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) = 0 then 1 else 0 end) as iSilenceNum, 
                        
                sum(case when (cast(conv(substr(strPayDays, case when length(strPayDays)>21 then -21 else 0 end, 21), 2, 10) as bigint) & %s) > 0 
                        and (cast(conv(substr(strPayDays, case when length(strPayDays)>14 then -14 else 0 end, 14), 2, 10) as bigint) & %s) = 0 
                        and (cast(conv(substr(strPayDays, case when length(strPayDays)>7 then -7 else 0 end, 7), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iWeekBackNum, 
                        
                sum(case when (cast(conv(substr(strPayDays, case when length(strPayDays)>42 then -42 else 0 end, 42), 2, 10) as bigint) & %s) > 0 
                        and (cast(conv(substr(strPayDays, case when length(strPayDays)>28 then -28 else 0 end, 28), 2, 10) as bigint) & %s) = 0 
                        and (cast(conv(substr(strPayDays, case when length(strPayDays)>14 then -14 else 0 end, 14), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iDWeekBackNum, 
                        
                sum(case when length(strPayDays)<=%s then 0     -- 少于 2个月的位数，则倒数第三个月未付费过，直接判断为 0 
                        else (case when (cast(conv(substr(strPayDays, case when length(strPayDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) > 0 
                                    and (cast(conv(substr(strPayDays, -%s, %s), 2, 10) as bigint) & %s) = 0 
                                    and (cast(conv(substr(strPayDays, -%s, %s), 2, 10) as bigint) & %s) > 0 then 1 else 0 
                            end)
                    end) as iMonthBackNum
        from %s 
        group by iWorldId, iLevel 
    ) A 
    """ % (statis_date, sAppKey, m_ullWeekPay, m_ullDWeekPay,
           mth1days, mth1days, mth1days, m_ullMonthPay, # iMonthPayNum
           mth1days + mth2days, mth1days + mth2days, mth1days + mth2days, m_ullDMonthPay, # iDMonthPayNum
           m_ullDWeekPay, m_ullWeekPay, # iWeekLostNum
           m_ullLastDWeekPay, m_ullDWeekPay, # iDWeekLostNum
           mth1days + mth2days, mth1days + mth2days, mth1days + mth2days, m_ullDMonthPay, mth1days, mth1days, mth1days, m_ullMonthPay, # iMonthLostNum
           mth1days + mth2days, mth1days + mth2days, mth1days + mth2days, m_ullDMonthPay, # iSilenceNum
           m_ullAntepenultWeekPay, m_ullLastWeekPay, m_ullWeekPay, # iWeekBackNum
           m_ullAntepenultDWeekPay, m_ullLastDWeekPay, m_ullDWeekPay, # iDWeekBackNum
           mth1days + mth2days, mth1days + mth2days + mth3days, mth1days + mth2days + mth3days, mth3days, m_ullAntepenultMonthPay,
           mth1days + mth2days, mth1days + mth2days, m_ullLastMonthPay, mth1days, mth1days, m_ullMonthPay,
           tb_sql)
    _exec_sql(sql, need_raise=True)
    
    delete_result('oss_tbPayer')
    sql = """
    insert table oss_tbPayer 
    select dtStatDate, '%s' as vGame, iWorldId, sum(iAllPayNum), sum(iDayPayNum), sum(iWeekPayNum), sum(iDWeekPayNum), sum(iMonthPayNum), 
            sum(iDMonthPayNum), sum(iWeekLostNum), sum(iDWeekLostNum), sum(iMonthLostNum), sum(iSilenceNum), sum(iWeekBackNum), sum(iDWeekBackNum), sum(iMonthBackNum) 
    from u_ied_iplat::oss_tbPayerLvDis  
    where dtStatDate=%s and vGame='%s' and iLevel<>255  -- oss_tbPayerLvDis 中没有 iLevel=255 的，累加即可
    group by dtStatDate, iWorldId
    """ % (sAppKey, statis_date, sAppKey) 
    _exec_sql(sql, need_raise=True)
    # --------------- PayCaseStat() end ---------------


def PayScaleStat():
    tb = """
        (    -- 关联 UserActiveCase 所制造的过程表，以获取 iLevel
            select A.iWorldId, A.iUin, case when B.iLevel is null then 0 else B.iLevel end as iLevel, A.strPayDays  
            from 
            (    select iWorldId, iUin, strPayDays from u_ied_iplat::t_dw_%s_oss_tbUserPay where statis_date=%s    ) A  
            left join 
            (    select iWorldId, iUin, iLevel from u_ied_iplat::t_dw_%s_oss_tbUserActive where statis_date=%s    ) B 
            on ( A.iWorldId=B.iWorldId and A.iUin=B.iUin ) 
        ) T 
    """ % (sAppKey, statis_date, sAppKey, getDateDelta(statis_date, -1))
    tb_sql = tb if isNoLevel else 'u_ied_iplat::t_dw_%s_oss_tbUserPay where statis_date=%s ' % (sAppKey, statis_date)
    
    sql = """
    insert table t_dw_%s_tbPayScaleLvDis_mid 
    select %s as dtStatDate, iWorldId, iLevel, iWeek, iDWeek, iMonth, iNaturalMonth, count(iUin) as iNum 
    from  
    (
        select iWorldId, iUin, max(iLevel) as iLevel, 
            length(regexp_replace(substr(max(strPayDays), case when length(max(strPayDays))>7 then -7 else 0 end, 7), '0', '')) as iWeek,
            length(regexp_replace(substr(max(strPayDays), case when length(max(strPayDays))>14 then -14 else 0 end, 14), '0', '')) as iDWeek,
            length(regexp_replace(substr(max(strPayDays), case when length(max(strPayDays))>%s then -%s else 0 end, %s), '0', '')) as iMonth,
            length(regexp_replace(substr(max(strPayDays), case when length(max(strPayDays))>%s then -%s else 0 end, %s), '0', '')) as iNaturalMonth 
        from %s 
        group by iWorldId, iUin 
    ) T 
    group by iWorldId, iLevel, iWeek, iDWeek, iMonth, iNaturalMonth 
    """ % (sAppKey, statis_date,
           mth1days, mth1days, mth1days,
           ucNaturalMonthDayNum, ucNaturalMonthDayNum, m_ulNaturalMonthPay,
           tb_sql)
    _exec_sql(sql, need_raise=True)
    
    delete_result('oss_tbWeekPayScaleLvDis')
    sql = """
    insert table oss_tbWeekPayScaleLvDis 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iLevel, iWeek as iPayDays, sum(iNum) as iPayNum 
    from t_dw_%s_tbPayScaleLvDis_mid where statis_date=%s and iWeek>0 
    group by iWorldId, iLevel, iWeek
    """ % (statis_date, sAppKey, sAppKey, statis_date)
    _exec_sql(sql, need_raise=True)
    
    delete_result('oss_tbDWeekPayScaleLvDis')
    sql = """
    insert table oss_tbDWeekPayScaleLvDis 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iLevel, iDWeek as iPayDays, sum(iNum) as iPayNum 
    from t_dw_%s_tbPayScaleLvDis_mid where statis_date=%s and iDWeek>0
    group by iWorldId, iLevel, iDWeek 
    """ % (statis_date, sAppKey, sAppKey, statis_date)
    _exec_sql(sql, need_raise=True)
    
    delete_result('oss_tbMonthPayScaleLvDis')
    sql = """
    insert table oss_tbMonthPayScaleLvDis 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iLevel, iMonth as iPayDays, sum(iNum) as iPayNum 
    from t_dw_%s_tbPayScaleLvDis_mid where statis_date=%s and iMonth>0 
    group by iWorldId, iLevel, iMonth 
    """ % (statis_date, sAppKey, sAppKey, statis_date)
    _exec_sql(sql, need_raise=True)
    
    delete_result('oss_tbInEffectPay')
    sql = """
    insert table oss_tbInEffectPay 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iNaturalMonth as iPayDays, sum(iNum) as iPayNum 
    from t_dw_%s_tbPayScaleLvDis_mid where statis_date=%s and iNaturalMonth>1 
    group by iWorldId, iNaturalMonth 
    """ % (statis_date, sAppKey, sAppKey, statis_date)
    _exec_sql(sql, need_raise=True)
 

def STAT():
    DayPayStat()
    DayNewPayStat()
    NewPayStat()
    PayCaseStat()
    PayScaleStat()


def TDW_PL(tdw, argv=[]):
    '''主函数入口'''
    global tdw_obj      # 声明为全局变量
    tdw_obj = tdw
    write_log('argv: ' + str(argv))
    if len(argv) < 2:
        Usage()
        return 1
    write_log("start: Program %s start" % script_name)
    
    #tdw_obj.execute("use u_ied_iplat")                    # 连接主库
    tdw_obj.execute("use u_ied_iplat")  
    tdw_obj.execute("set fetch.execinfo.mode=no")       # 关闭返回SQL执行信息到结果集
    tdw_obj.execute("set hive.exec.parallel=true")      # 并行优化开关
    tdw_obj.execute("set hive.inputfiles.splitbylinenum=true")
    tdw_obj.execute("set mapred.reduce.tasks=800")
    
    # 2013-07-29 Richard chen  (whughchen@gmail.com) 去掉创建中间表的注释，以便其他业务通用
    # 2013-08-01 Richard chen  (whughchen@gmail.com) 优化：分段区间的 sql 用打标记+sum case 的方式统计，利用中间 PG 表保存重复的中间结果
    # 2013-10-30 Richard chen  (whughchen@gmail.com) 更新：增加传入参数说明【如果业务的 tbWorldPay 表的 iLevel 字段为 null，则应该传入 no_level 参数， 
    #                        表示需要从 UserActiveCase 过程表关联取得用户等级】，默认不需要传入该参数
    #                   修复：避开业务过程数据缺少 255汇总付费用户数据的情况
    
    """ ---------- 经分框架的OssUserPayCase程序 ---------- """
    global_init(argv)
    create_mid_table()
#    create_rs_table()
    _add_partition()        # 先清理已有的分区数据
    build_mid_data()
#    clean_history_result()
    STAT()
    
    '''
    NOTE：u_ied_iplat::t_dw_xxx_oss_tbWorldPay 表中的 WorldId 字段值为 null 时与框架的 255 一样，标识不分大区的汇总
    '''
    
    write_log("end: Program %s end" % script_name)
