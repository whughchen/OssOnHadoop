#!/usr/bin/env python
#-*- coding: utf-8 -*-
#
#  Descripe: 
#  Auther: richghchen
#  Created Date: 2014-10-16
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
    #convert the number into a DateType
    tRealDate = time.strptime(str(baseDate), '%Y%m%d')
    #get the day of a week
    nWeekDay = int(time.strftime('%w', tRealDate))
    #if the date is sunday then set it 0
    if nWeekDay == 0:
        nWeekDay = 7
    #change the day into a minutes
    nAddNumber = (int(weektype) - nWeekDay) * 1440
    #define the date variable
    dRealDate = datetime.datetime(tRealDate[0], tRealDate[1], tRealDate[2])
    #define the monday variable
    dRealDate2 = dRealDate + datetime.timedelta(minutes=nAddNumber)
    #define the return number
    ndate = int(str(dRealDate2)[0:4] + str(dRealDate2)[5:7] + str(dRealDate2)[8:10])
    return ndate

# ------------------------------------------------------------------------------------------------    

NOW = lambda: time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
script_name = "oss_UserStorageCase.py"
    
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
    isNoLevel = False
    if len(argv) == 3:          # 传入 no_level 表示需要从 UserActiveCase 过程表关联用户等级
        isNoLevel = True if argv[2] == 'no_level' else False 
    
    global mth1days             # 本月共有多少天
    global mth2days             # 上个月有多少天
    global mth3days             # 上上个月有多少天
    
    global m_ullDayStorage
    global m_ullWeekStorage
    global m_ullDWeekStorage
    global m_ullMonthStorage
    global m_ullDMonthStorage
    
    global m_ullLastWeekStorage
    global m_ullLastDWeekStorage
    global m_ullLastMonthStorage
    
    global m_ullAntepenultWeekStorage
    global m_ullAntepenultDWeekStorage
    global m_ullAntepenultMonthStorage
    global m_ulNaturalMonthStorage      # 自然月开始（1日）到当前日期活跃
    global ucNaturalMonthDayNum     # 自然月开始（1日）到当前日期天数
    
    m_ullDayStorage = long("0x0000000000000001", 16)
    m_ullWeekStorage = long("0x000000000000007F", 16)
    m_ullDWeekStorage = long("0x0000000000003FFF", 16)
    m_ullLastWeekStorage = long("0x0000000000003F80", 16)
    m_ullLastDWeekStorage = long("0x000000000FFFC000", 16)
    m_ullAntepenultWeekStorage = long("0x00000000001FC000", 16)
    m_ullAntepenultDWeekStorage = long("0x000003FFF0000000", 16)
    ucNaturalMonthDayNum = int(statis_date[6:8])
    m_ulNaturalMonthStorage = (1 << ucNaturalMonthDayNum) - 1
    m_ullLastMonthStorage = 0
    
    if is_mth_end_day(statis_date):                         # 如果是月底最后一天，按自然月天数统计
        mth1days = int(statis_date[6:])
        mth2days = int(getDateDelta(statis_date, -mth1days)[6:])
        mth3days = int(getDateDelta(statis_date, -(mth1days + mth2days))[6:])
#        m_ullMonthStorage = long('0b' + '1' * mth1days, 2)
#        m_ullMonthStorage = long('0b111111111111111111111111111111', 2)
        m_ullMonthStorage = (1 << mth1days) - 1
        m_ullDMonthStorage = (1 << (mth1days + mth2days)) - 1
#        m_ullDMonthStorage = long('0b' + '1' * (mth1days + mth2days), 2)
#        m_ullDMonthStorage = long('0b1111111111111111111111111111111111111111111111111111111111111', 2)
        for i in range(mth1days, mth1days + mth2days):
            m_ullLastMonthStorage |= (1 << i)
            # '0b1111111111111111111111111111111000000000000000000000000000000'
        m_ullAntepenultMonthStorage = (1 << mth3days) - 1
#        m_ullAntepenultMonthStorage = long('0b' + '1' * mth3days, 2)
#        m_ullAntepenultMonthStorage = long('0b1111111111111111111111111111', 2)
    else:                                                   # 不是月底最后一天，按30天统计月指标
        mth1days = 30
        mth2days = 30
        mth3days = 30
        m_ullMonthStorage = long("0x000000003FFFFFFF", 16)
        m_ullDMonthStorage = long("0x0FFFFFFFFFFFFFFF", 16)         # 60 bit
        m_ullLastMonthStorage = long("0x0FFFFFFFC0000000", 16)      # 60 bit
        m_ullAntepenultMonthStorage = long("0x3FFFFFFF" , 16)       # 30 bit
    write_log('mth1days:%s, mth2days:%s, mth3days:%s' % (mth1days, mth2days, mth3days))
    





def delete_result(table=''):
    sql = "delete from %s where cast(dtStatDate as bigint)=cast(%s as bigint) and vGame='%s' " % (table, statis_date, sAppKey)
    _exec_sql(sql, need_raise=True)


def clean_result_and_query(result_table=None, sql=None):
    '''将清理已有结果数据、查询合并在一起，方便调用的一致性'''
    delete_result(result_table)
    sql = '''
    insert table %s %s''' % (result_table, sql) 
    _exec_sql(sql, need_raise=True)


def DayStorageStat():
    # --------------- DayStorageStat() ---------------
    sql = """
select 
%s,
'%s' as vgame,
255 worldid,
0 as izoneid,
1 as imoneytype,
0 as istore,
count(DISTINCT uin) as irolenum,
sum(CurrentMoney*10)
from
(
	select *,
	row_number() over(partition by uin order by unix_timestamp(dteventtime) desc) rownum
	from ieg_tdbank::ddz3d_dsl_currencydec_fht0
	where  tdbank_imp_date BETWEEN %s00 and %s24
)
where rownum=1
group by worldid
    """ % (statis_date, sAppKey, statis_date, statis_date)
    clean_result_and_query('oss_tbmoneystorage', sql)


    
    sql = """
--insert table oss_tbmoneystoragelvdis
select 
%s,
'%s' as vgame,
255 worldid,
0 as izoneid,
1 as imoneytype,
0 as irolejob,
0 as ilevel,
count(DISTINCT uin) as irolenum,
sum(CurrentMoney*10)
from
(
    select *,
    row_number() over(partition by uin order by unix_timestamp(dteventtime) desc) rownum
    from ieg_tdbank::ddz3d_dsl_currencydec_fht0
    where  tdbank_imp_date BETWEEN %s00 and %s24
)
where rownum=1
group by worldid
    """ % (statis_date, sAppKey, statis_date, statis_date)
    clean_result_and_query('oss_tbmoneystoragelvdis', sql)
    
    sql = "SELECT iSegment FROM oss_conf_tbmoneysegmentconf where vGame='%s' order by iSegment asc" % sAppKey
    segments = _exec_sql(sql, need_raise=True)
    write_log("segments: %s\n'" % segments)
    
    segment_sql = ''
    i = 0
    for seg in segments:
        if i == 0:                          # 第一个区间，左开右开
            segment_sql += """when iAmount>%s and iAmount<%s then %s
            """ % (seg, segments[i + 1], seg)
        elif i == len(segments) - 1:        # 最后一个区间，左闭
            segment_sql += '    else %s' % (seg)
        else:                               # 中间的区间，左闭右开
            segment_sql += """    when iAmount>=%s and iAmount<%s then %s
            """ % (seg, segments[i + 1], seg)
        i += 1 
    
    sql = """
    select %s as dtStatDate, 
    '%s' as vGame, 
    255 WorldId, 
    izoneid,
    imoneytype,
    ilevel,
    iSegment, 
    count(Uin) as iUserNum ,
    sum(iAmount) as istorage
    from
    (
        select WorldId, 
        Uin, 
        iAmount,             
        0 izoneid,
        0    imoneytype,
        0    ilevel,
        case %s end as iSegment
        
        from
           ( select *,CurrentMoney*10 as iAmount,
            row_number() over(partition by uin order by unix_timestamp(dteventtime) desc) rownum
            from ieg_tdbank::ddz3d_dsl_currencydec_fht0
            where  tdbank_imp_date BETWEEN %s00 and %s24
            and (WorldId is not null ) 
            )
            where  rownum=1  and     iAmount>0      
    ) t group by WorldId, iSegment,izoneid,imoneytype,ilevel
    """ % (statis_date, sAppKey, segment_sql, statis_date,  statis_date)
    clean_result_and_query('oss_tbmoneystorageroledis', sql)

    sql = """
    select dtStatDate, vGame, iWorldId, iSegment as iStorageAmount, iUserNum as iStorageerNum 
    from oss_tbmoneystorageroledis where dtStatDate=%s and vGame='%s' 
    """ % (statis_date, sAppKey)
#    clean_result_and_query('oss_tbDayStorageerStorageAmount', sql)
    # --------------- DayStorageStat() end ---------------


def DayNewStorageStat():
    # --------------- DayNewStorageStat() ---------------
    sql = """
    select %s as dtStatDate, '%s' as vGame, iWorldId, iDayNewStorageorNum, iStorageTimes, iStorageAmount 
    from 
    (
        select iWorldId, count(iUin) as iDayNewStorageorNum, sum(iStorageTimes) as iStorageTimes, sum(iAmount) as iStorageAmount 
        from u_ied_iplat::t_dw_%s_oss_tbUserStorage where statis_date=%s and length(strStorageDays)=1 
        group by iWorldId 
    ) 
    """ % (statis_date, sAppKey, sAppKey, statis_date, sAppKey, statis_date, sAppKey, statis_date)
    clean_result_and_query('oss_tbDayNewStorageer', sql)
   
    sql = """
    select %s as dtStatDate, '%s' as vGame, iWorldId, iStorageTimes, iStorageerNum 
    from 
    (
        select iWorldId, iStorageTimes, count(iUin) as iStorageerNum 
        from u_ied_iplat::t_dw_%s_oss_tbUserStorage where statis_date=%s and length(strStorageDays)=1 
        group by iWorldId, iStorageTimes 
    ) 
    """ % (statis_date, sAppKey, sAppKey, statis_date, sAppKey, statis_date, sAppKey, statis_date)
    clean_result_and_query('oss_tbDayNewStorageerStorageTimes', sql)
    
    sql = "SELECT iSegment FROM oss_tbMoneyegmentConf where vGame='%s' order by iSegment asc" % sAppKey
    segments = _exec_sql(sql, need_raise=True)
    write_log("segments: %s\n'" % segments)
    
    segment_sql = ''
    i = 0
    for seg in segments:
        if i == 0:                          # 第一个区间，左开右开
            segment_sql += """when iAmount>%s and iAmount<%s then %s
            """ % (seg, segments[i + 1], seg)
        elif i == len(segments) - 1:        # 最后一个区间，左闭
            segment_sql += '    else iAmount>=%s' % (seg)
        else:                               # 中间的区间，左闭右开
            segment_sql += """iAmount>=%s and iAmount<%s then %s
            """ % (seg, segments[i + 1])
        i += 1 
    
    sql = """
    select %s as dtStatDate, '%s' as vGame, iWorldId, iSegment as iStorageAmount, count(iUin) as iStorageerNum    
    from 
    (
        select iWorldId, iReceivedUin as iUin, 
            case %s end as iSegment
        from u_ied_iplat::t_dw_%s_oss_tbUserStorage
        where statis_date=%s and length(strStorageDays)=1 
    ) t group by iWorldId, iSegment   
    """ % (statis_date, sAppKey, segment_sql, sAppKey, statis_date)
    clean_result_and_query('oss_tbDayNewStorageerStorageAmount', sql)
    # --------------- DayNewStorageStat() end ---------------


def NewStorageStat():
    # --------------- NewStorageStat() begin ---------------
    sql = """
    select %s as dtStatDate, '%s' as vGame, iWorldId, iDayNewStorageNum, iWeekNewStorageNum, iDWeekNewStorageNum, iMonthNewStorageNum 
    from 
    (    -- strStorageDays 不可能有前置的 0，那么只要判断 length(strStorageDays) 即可知道是不是某个周期的新增充值 
        select iWorldId,  
                sum(case when length(strStorageDays)=1 and cast(conv(strStorageDays, 2, 10) as bigint)>0 then 1 else 0 end) as iDayNewStorageNum,
                sum(case when length(strStorageDays)<=7 and cast(conv(strStorageDays, 2, 10) as bigint)>0 then 1 else 0 end) as iWeekNewStorageNum,
                sum(case when length(strStorageDays)<=14 and cast(conv(strStorageDays, 2, 10) as bigint)>0 then 1 else 0 end) as iDWeekNewStorageNum,
                sum(case when length(strStorageDays)<=%s and cast(conv(strStorageDays, 2, 10) as bigint)>0 then 1 else 0 end) as iMonthNewStorageNum 
        from 
        (
            select iWorldId, iUin, 
                -- 如果超过 96 bit，取右边 96 bit 并去掉前置的 0，否则不变动，这与 PayCase 关注 96天前的历史的回流新增不同
                case when length(strStorageDays)>96 then regexp_replace(substr(strStorageDays, -96, 96), '^0+', '') 
                    else strStorageDays end as strStorageDays 
            from u_ied_iplat::t_dw_%s_oss_tbUserStorage where statis_date=%s 
        ) a 
        group by a.iWorldId 
    ) A 
    """ % (statis_date, sAppKey, mth1days, sAppKey, statis_date)
    clean_result_and_query('oss_tbNewStorageors', sql)
    # --------------- NewStorageStat() end ---------------


def StorageCaseStat():
    # --------------- StorageCaseStat() begin ---------------
    sql = """
    select %s as dtStatDate, '%s' as vGame, iWorldId, iAllStorageorNum, iDayStorageorNum, iWeekStorageorNum, iDWeekStorageorNum, iMonthStorageorNum, 
        iDMonthStorageorNum, iWeekLostNum, iDWeekLostNum, iMonthLostNum, iSilenceNum, iWeekBackNum, iDWeekBackNum, iMonthBackNum 
    from 
    (
        select iWorldId, count(iUin) as iAllStorageorNum, 
                sum(case when (cast(conv(substr(strStorageDays, -1, 1), 2, 10) as bigint) & 1) > 0 then 1 else 0 end) as iDayStorageorNum, 
                sum(case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>7 then -7 else 0 end, 7), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iWeekStorageorNum,  
                
                sum(case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>14 then -14 else 0 end, 14), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iDWeekStorageorNum,  
                
                sum(case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iMonthStorageorNum, 
                
                sum(case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iDMonthStorageorNum,
                
                sum(case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>14 then -14 else 0 end, 14), 2, 10) as bigint) & %s) > 0 
                        and (cast(conv(substr(strStorageDays, case when length(strStorageDays)>7 then -7 else 0 end, 7), 2, 10) as bigint) & %s) = 0 then 1 else 0 end) as iWeekLostNum, 
                        
                sum(case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>28 then -28 else 0 end, 28), 2, 10) as bigint) & %s) > 0 
                        and (cast(conv(substr(strStorageDays, case when length(strStorageDays)>14 then -14 else 0 end, 14), 2, 10) as bigint) & %s) = 0 then 1 else 0 end) as iDWeekLostNum, 
                        
                sum(case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) > 0 
                        and (cast(conv(substr(strStorageDays, case when length(strStorageDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) = 0 then 1 else 0 end) as iMonthLostNum, 
                        
                sum(case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) = 0 then 1 else 0 end) as iSilenceNum, 
                        
                sum(case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>21 then -21 else 0 end, 21), 2, 10) as bigint) & %s) > 0 
                        and (cast(conv(substr(strStorageDays, case when length(strStorageDays)>14 then -14 else 0 end, 14), 2, 10) as bigint) & %s) = 0 
                        and (cast(conv(substr(strStorageDays, case when length(strStorageDays)>7 then -7 else 0 end, 7), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iWeekBackNum, 
                        
                sum(case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>42 then -42 else 0 end, 42), 2, 10) as bigint) & %s) > 0 
                        and (cast(conv(substr(strStorageDays, case when length(strStorageDays)>28 then -28 else 0 end, 28), 2, 10) as bigint) & %s) = 0 
                        and (cast(conv(substr(strStorageDays, case when length(strStorageDays)>14 then -14 else 0 end, 14), 2, 10) as bigint) & %s) > 0 then 1 else 0 end) as iDWeekBackNum, 
                        
                sum(case when length(strStorageDays)<=%s then 0     -- 少于 2个月的位数，则倒数第三个月未付费过，直接判断为 0 
                        else (case when (cast(conv(substr(strStorageDays, case when length(strStorageDays)>%s then -%s else 0 end, %s), 2, 10) as bigint) & %s) > 0 
                                    and (cast(conv(substr(strStorageDays, -%s, %s), 2, 10) as bigint) & %s) = 0 
                                    and (cast(conv(substr(strStorageDays, -%s, %s), 2, 10) as bigint) & %s) > 0 then 1 else 0 
                            end)
                    end) as iMonthBackNum
        from u_ied_iplat::t_dw_%s_oss_tbUserStorage 
        where statis_date=%s group by iWorldId 
    ) A 
    """ % (statis_date, sAppKey, m_ullWeekStorage, m_ullDWeekStorage,
           mth1days, mth1days, mth1days, m_ullMonthStorage, # iMonthStorageNum
           mth1days + mth2days, mth1days + mth2days, mth1days + mth2days, m_ullDMonthStorage, # iDMonthStorageNum
           m_ullDWeekStorage, m_ullWeekStorage, # iWeekLostNum
           m_ullLastDWeekStorage, m_ullDWeekStorage, # iDWeekLostNum
           mth1days + mth2days, mth1days + mth2days, mth1days + mth2days, m_ullDMonthStorage, mth1days, mth1days, mth1days, m_ullMonthStorage, # iMonthLostNum
           mth1days + mth2days, mth1days + mth2days, mth1days + mth2days, m_ullDMonthStorage, # iSilenceNum
           m_ullAntepenultWeekStorage, m_ullLastWeekStorage, m_ullWeekStorage, # iWeekBackNum
           m_ullAntepenultDWeekStorage, m_ullLastDWeekStorage, m_ullDWeekStorage, # iDWeekBackNum
           mth1days + mth2days, mth1days + mth2days + mth3days, mth1days + mth2days + mth3days, mth3days, m_ullAntepenultMonthStorage,
           mth1days + mth2days, mth1days + mth2days, m_ullLastMonthStorage, mth1days, mth1days, m_ullMonthStorage,
           sAppKey, statis_date)
    clean_result_and_query('oss_tbStorageors', sql)
    # --------------- StorageCaseStat() end ---------------


def StorageScaleStat():
    # --------------- StorageScaleStat() begin ---------------
    sql = """
    insert table t_dw_%s_tbStorageScaleLvDis_mid 
    select %s as dtStatDate, iWorldId, iWeek, iDWeek, iMonth, iNaturalMonth, count(iUin) as iNum 
    from  
    (
        select iWorldId, iUin,  
            length(regexp_replace(substr(max(strStorageDays), case when length(max(strStorageDays))>7 then -7 else 0 end, 7), '0', '')) as iWeek,
            length(regexp_replace(substr(max(strStorageDays), case when length(max(strStorageDays))>14 then -14 else 0 end, 14), '0', '')) as iDWeek,
            length(regexp_replace(substr(max(strStorageDays), case when length(max(strStorageDays))>%s then -%s else 0 end, %s), '0', '')) as iMonth,
            length(regexp_replace(substr(max(strStorageDays), case when length(max(strStorageDays))>%s then -%s else 0 end, %s), '0', '')) as iNaturalMonth 
        from u_ied_iplat::t_dw_%s_oss_tbUserStorage 
        where statis_date=%s group by iWorldId, iUin 
    ) T 
    group by iWorldId, iWeek, iDWeek, iMonth, iNaturalMonth 
    """ % (sAppKey, statis_date,
           mth1days, mth1days, mth1days,
           ucNaturalMonthDayNum, ucNaturalMonthDayNum, m_ulNaturalMonthStorage,
           sAppKey, statis_date)
    _exec_sql(sql, need_raise=True)
    
    sql = """
    select %s as dtStatDate, '%s' as vGame, iWorldId, iWeek as iStorageDays, sum(iNum) as iStorageNum 
    from t_dw_%s_tbStorageScaleLvDis_mid where statis_date=%s and iWeek>0 
    group by iWorldId, iWeek 
    """ % (statis_date, sAppKey, sAppKey, statis_date)
    clean_result_and_query('oss_tbWeekStorageScaleLvDis', sql)
    
    sql = """
    select %s as dtStatDate, '%s' as vGame, iWorldId, iLevel, iDWeek as iStorageDays, sum(iNum) as iStorageNum 
    from t_dw_%s_tbStorageScaleLvDis_mid where statis_date=%s and iDWeek>0
    group by iWorldId, iDWeek 
    """ % (statis_date, sAppKey, sAppKey, statis_date)
    clean_result_and_query('oss_tbWeekStorageScaleLvDis', sql)
    
    sql = """
    insert table oss_tbMonthStorageScaleLvDis 
    select %s as dtStatDate, '%s' as vGame, iWorldId, iLevel, iMonth as iStorageDays, sum(iNum) as iStorageNum 
    from t_dw_%s_tbStorageScaleLvDis_mid where statis_date=%s and iMonth>0 
    group by iWorldId, iMonth
    """ % (statis_date, sAppKey, sAppKey, statis_date)
    clean_result_and_query('oss_tbMonthStorageScaleLvDis', sql)
    
    sql = """
    select %s as dtStatDate, '%s' as vGame, iWorldId, iNaturalMonth as iStorageDays, sum(iNum) as iStorageNum 
    from t_dw_%s_tbStorageScaleLvDis_mid where statis_date=%s and iNaturalMonth>1 
    group by iWorldId, iNaturalMonth 
    """ % (statis_date, sAppKey, sAppKey, statis_date)
    clean_result_and_query('oss_tbInEffectStorage', sql)
    # --------------- StorageScaleStat() end ---------------


def STAT():
    DayStorageStat()
#    DayNewStorageStat()
#    NewStorageStat()
#    StorageCaseStat()
#    StorageScaleStat()



def TDW_PL(tdw, argv=[]):
    '''主函数入口'''
    global tdw_obj      # 声明为全局变量
    tdw_obj = tdw
    write_log('argv: ' + str(argv))
    if len(argv) != 2:
        Usage()
        return 1
    write_log("start: Program %s start" % script_name)
    
    tdw_obj.execute("use u_ied_iplat")                    # 连接主库
    tdw_obj.execute("set fetch.execinfo.mode=no")       # 关闭返回SQL执行信息到结果集
    tdw_obj.execute("set hive.exec.parallel=true")      # 并行优化开关
    tdw_obj.execute("set hive.inputfiles.splitbylinenum=true")
    tdw_obj.execute("set mapred.reduce.tasks=500")
    
    # 2013-07-29 Richard chen  (whughchen@gmail.com) 修复 oss_tbStoreMoneyUserDis 结果表统计被注释未统计的bug
    # 2013-07-29 Richard chen  (whughchen@gmail.com) 去掉创建中间表的注释，以便其他业务通用
    # 2013-08-01 Richard chen  (whughchen@gmail.com) 优化：分段区间的 sql 用打标记+sum case 的方式统计，利用中间 PG 表保存重复的中间结果
    # 2013-11-01 Richard chen  (whughchen@gmail.com) update：增加 255大区汇总的统计
    
    """ ---------- 经分框架的 OssUserStorageCase 程序 ---------- """
    global_init(argv)
#    create_mid_table()
#    create_rs_table()
#    _add_partition()        # 先清理已有的分区数据
#    build_mid_data()
    STAT()
    
    
    write_log("end: Program %s end" % script_name)
