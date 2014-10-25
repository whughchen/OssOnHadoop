#!/usr/bin/env python
#-*- coding: utf-8 -*-
# ******************************************************************************
# 程序名称:     oss_UserActiveCase
# 功能描述:     
# 输入参数:     
# 目标表名:
# 数据源表:
# 创建人名:     Richard chen  (whughchen@gmail.com)
# 创建日期:     2013-4-18
# 版本说明:     v1.0
# 公司名称:     tencent
# 修改人名:
# 修改日期:
# 修改原因:
# ******************************************************************************

# -----------------------------------------------------------------------------
# Richard chen  (whughchen@gmail.com) - 20110602 - DNF的日活跃oss统计
# 依赖的表 t_dw_mkt_dnf_tblogin t_dw_mkt_dnf_tbworldpay
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# 加载两个系统模块
sys = __import__('sys')
os  = __import__('os')

# 加载两个时间操作模块和一个字符串操作模块
time     = __import__('time')
datetime = __import__('datetime')
string   = __import__('string')
# -----------------------------------------------------------------------------

# some global variables related to the shell script
res = ""

# some tool function 
def getDateDelta(baseTime, delta):
    # baseTime： is a string like "19700101"
    # delta：    1代表后一天 -1代表前一天
    d1 = datetime.datetime(string.atoi(baseTime[0:4]), string.atoi(baseTime[4:6]), string.atoi(baseTime[6:8]))
    d2 = d1 + datetime.timedelta(days=delta)
    deltaDate = d2.strftime("%Y%m%d")
    return deltaDate

def is_mth_end_day(day):
    '''判断所给日期(格式yyyymmdd)是否月末，是则返回True，否则返回False'''
    original_mth = day[4:6]
    after_day_mth = getDateDelta(day, 1)[4:6]
    # 如果前后的月份不同，说明是月末
    return original_mth != after_day_mth

#获取上2个月的总天数（包括本月）,传入参数必须月末，否则返回30
def get_l2mon_days(baseTime):
    if is_mth_end_day(baseTime) :
        d1 = datetime.datetime(string.atoi(baseTime[0:4]), string.atoi(baseTime[4:6]), string.atoi(baseTime[6:8]))
        d2 = d1 + datetime.timedelta(-32)
        d3 = datetime.datetime(string.atoi(d2.strftime("%Y")), string.atoi(d2.strftime("%m")), 01)
        return (d1-d3).days+1
    else:
        return 60

#获取上2个月的总天数（包括本月）,传入参数必须月末，否则返回90
def get_l3mon_days(baseTime):
    if is_mth_end_day(baseTime) :
        d1 = datetime.datetime(string.atoi(baseTime[0:4]), string.atoi(baseTime[4:6]), string.atoi(baseTime[6:8]))
        d2 = d1 + datetime.timedelta(-65)
        d3 = datetime.datetime(string.atoi(d2.strftime("%Y")), string.atoi(d2.strftime("%m")), 01)
        return (d1-d3).days+1
    else:
        return 90

# ------------------------------------------------------------------------------------------------    
# 显示给用户的提示信息
def usage():
    print sys.argv[0] + " [yyyymmdd] " + "[app_str(eg:dnf)]"


def check_input(argv):
    if len(argv) < 2:
        return 1
    return 0

# 打印日志
def write_log(msg):
    '''打日志'''
    tdw_obj.WriteLog("|oss_UserActiveCase.py|msg -> " + msg)

def _exec_sql(sql=''):
    '''执行 SQL 语句'''
    # 关闭返回SQL执行信息到结果集
    tdw_obj.execute("set fetch.execinfo.mode=no")
    write_log("running: \n" + sql)
    try:
        rs = tdw_obj.execute(sql)
        write_log("query result -> " + str(rs))
        return rs
    except Exception, e:
        write_log("ERROR execute sql failed: " + e.message)
        
def _exec_exception_sql(sql=''):
    '''执行 SQL 语句'''
    # 关闭返回SQL执行信息到结果集
    tdw_obj.execute("set fetch.execinfo.mode=no")
    write_log("running: \n" + sql)
    rs = tdw_obj.execute(sql)
    write_log("query result -> " + str(rs))
    return rs
        

def set_valiable():
    global m_ullDayActivity
    global m_ullWeekActivity
    global m_ullDWeekActivity
    global m_ullLastWeekActivity
    global m_ullLastDWeekActivity
    global m_ullAntepenultWeekActivity
    global m_ullAntepenultDWeekActivity
    global m_ullMonthActivity
    global m_ullDMonthActivity
    global m_ullLastMonthActivity
    global m_ullAntepenultMonthActivity
    global m_ulNaturalMonthActivity
    m_ullDayActivity = long("0x01",16)
    m_ullWeekActivity = long("0x7F",16)
    m_ullDWeekActivity = long("0x3FFF",16)
    m_ullLastWeekActivity = long("0x3F80",16)
    m_ullLastDWeekActivity = long("0x0FFFC000",16)
    m_ullAntepenultWeekActivity = long("0x1FC000",16)
    m_ullAntepenultDWeekActivity = long("0x03FFF0000000",16)
    m_ulNaturalMonthActivity = 2 ** string.atoi(iDate[6:8]) - 1
    #由于如果从现在到上上月，那么天数超过64位，故只分析上上月，
    if is_mth_end_day(iDate) :
        m_ullMonthActivity = 2 ** string.atoi(iDate[6:8]) - 1
        m_ullDMonthActivity = 2 ** get_l2mon_days(iDate) - 1
        m_ullLastMonthActivity = m_ullDMonthActivity - m_ullMonthActivity
        m_ullAntepenultMonthActivity = 2 ** (get_l3mon_days(iDate)-string.atoi(iDate[6:8])) - 1
    else :
        m_ullMonthActivity = long("0x3FFFFFFF",16)
        m_ullDMonthActivity = long("0x0FFFFFFFFFFFFFFF",16)
        m_ullLastMonthActivity = long("0x0FFFFFFFC0000000",16)
        m_ullAntepenultMonthActivity = 2 ** (get_l3mon_days(iDate)-30) - 1
        
        
 
def config(argv):
    global iDate
    global sAppKey
    iDate = argv[0]
    sAppKey = argv[1]
    write_log("iDate: " + iDate)
    write_log("sAppKey: " + sAppKey)
 
# 创建过程表
def create_mid_table():
    sql = """
    CREATE TABLE IF NOT EXISTS  t_dw_mid_%s_oss_tbUserActive(
        statis_date BIGINT,
        iWorldId BIGINT,
        iUin BIGINT,
        iLevel BIGINT,
        iGroup BIGINT,
        iActivity STRING
    )
    PARTITION BY LIST(statis_date)
    (
        PARTITION default
    )    
    STORED AS FORMATFILE COMPRESS"""%(sAppKey)
    _exec_sql(sql)
    sql = """
    CREATE TABLE IF NOT EXISTS t_dw_mid_%s_oss_tbActivityScaleLvDis(
        statis_date BIGINT,
        iWorldId BIGINT,
        iLevel BIGINT,
        iWeekActivityDays BIGINT,
        iDWeekActivityDays BIGINT,
        iMonthActivityDays BIGINT,
        iInEffectActivityDays BIGINT,
        iActivityNum BIGINT
    ) 
    STORED AS FORMATFILE COMPRESS
    """%(sAppKey)
    _exec_sql(sql)
    
    
def data_init():  
    #过程表数据准备
    if getDateDelta(iDate,-9)[6:8] != "01" :
        sql=""" alter table t_dw_mid_%s_oss_tbUserActive drop partition (p_%s) """ %(sAppKey,getDateDelta(iDate,-10))
        _exec_sql(sql)
        
        # 添加日期分区【一级分区】, 如果存在则忽略
    sql=""" alter table t_dw_%s_oss_tbaccountday add partition p_%s values in ('%s') """ %(sAppKey,iDate, iDate)
    _exec_sql(sql)
    #清空过程表分区数据
    sql=""" alter table t_dw_%s_oss_tbaccountday truncate partition (p_%s) """ %(sAppKey,iDate)
    _exec_sql(sql)
    
    # 添加日期分区【一级分区】, 如果存在则忽略
    sql=""" alter table t_dw_mid_%s_oss_tbUserActive add partition p_%s values in ('%s') """ %(sAppKey,iDate, iDate)
    _exec_sql(sql)
    #清空过程表分区数据
    sql=""" alter table t_dw_mid_%s_oss_tbUserActive truncate partition (p_%s) """ %(sAppKey,iDate)
    _exec_sql(sql)
    
    #清空可能出现的结果数据（重跑时用到）
    sql=""" delete from oss_tbGroupLevelUserLogin where vGame='%s' """ %(sAppKey)
    _exec_sql(sql)
    sql=""" delete from oss_tbUserLogin where dtStatDate=%s and vGame='%s' """ %(iDate,sAppKey)
    _exec_sql(sql)
    sql=""" delete from oss_tbUserLoginLvDis where dtStatDate=%s and vGame='%s' """ %(iDate,sAppKey)
    _exec_sql(sql)
    sql=""" delete from oss_tbPayUserLoginLvDis where dtStatDate=%s and vGame='%s' """ %(iDate,sAppKey)
    _exec_sql(sql)
    sql=""" delete from oss_tbFreeUserLoginLvDis where dtStatDate=%s and vGame='%s' """ %(iDate,sAppKey)
    _exec_sql(sql)
    sql=""" delete from oss_tbWeekActivityScaleLvDis where dtStatDate=%s and vGame='%s' """ %(iDate,sAppKey)
    _exec_sql(sql)
    sql=""" delete from oss_tbDWeekActivityScaleLvDis where dtStatDate=%s and vGame='%s' """ %(iDate,sAppKey)
    _exec_sql(sql)
    sql=""" delete from oss_tbMonthActivityScaleLvDis where dtStatDate=%s and vGame='%s' """ %(iDate,sAppKey)
    _exec_sql(sql)
    sql=""" delete from oss_tbInEffectActivity where dtStatDate=%s and vGame='%s' """ %(iDate,sAppKey)
    _exec_sql(sql)
    
def userstat():
    write_log("userstat start")
    
    #先统计出注册数。
    sql="""
    insert table t_dw_%s_oss_tbaccountday
    select statis_date,a.iuin,ilogintime,iloginip,iloginway
    from (
        select statis_date,iuin,min(ilogintime) as ilogintime,min(iloginip) as iloginip,min(iloginway) as iloginway 
        from t_dw_%s_oss_tblogin
        WHERE statis_date=%s group by statis_date,iuin
        ) a
        left join 
            (select DISTINCT iuin from t_dw_%s_oss_tbaccountday where statis_date<%s
            UNION ALL
            select DISTINCT iuin from t_dw_%s_oss_tbaccountday PARTITION(DEFAULT)t
            ) b
        on a.iuin=b.iuin where b.iuin is null 
        group by statis_date,a.iuin,ilogintime,iloginip,iloginway
    """%(sAppKey,sAppKey,iDate,sAppKey,iDate,sAppKey)
    _exec_exception_sql(sql)
    
    sql="""
    insert table t_dw_mid_%s_oss_tbUserActive 
    select %s,iworldid,iuin,max(ilevel) as iLevel,max(igroup) as igroup,max(iactivity) as iactivity
    from (
        select a.iworldid as iworldid,a.iuin as iuin,ilevel,
            case when c.iuin is null and d.iuin is null then igroup else igroup | 1 end as igroup,
            case when b.iuin is null then concat(regexp_replace(iactivity,"^0+","0"),0) ELSE
            concat(regexp_replace(iactivity,"^0+","0"),1) end as iactivity
        from (
        select iworldid,iuin,ilevel,igroup,iactivity from t_dw_mid_%s_oss_tbUserActive where statis_date=%s
        union all select distinct worldid,iuin,ilevel,0,'0' from t_dw_%s_oss_tblogin where statis_date=%s
        union all select 255,iuin,max(ilevel),0,'0' from t_dw_%s_oss_tblogin where statis_date=%s group by iuin
        ) a 
        left join 
            (select distinct iuin,worldid from t_dw_%s_oss_tblogin where statis_date=%s
            union all select distinct iuin,255 from t_dw_%s_oss_tblogin where statis_date=%s) b 
        on (a.iworldid = b.worldid and a.iuin=b.iuin)
        left JOIN
            (select distinct iuin from t_dw_%s_oss_tbworldpay where statis_date=%s and (worldid=255 or worldid is null))c 
        on (a.iuin=c.iuin)
        left JOIN
            --(select distinct iuin,worldid from t_dw_s_oss_tbworldpay where statis_date=s and (worldid <> 255 and worldid is not null))d 
           (select distinct iuin,worldid from t_dw_%s_oss_tbworldpay where statis_date=%s and (worldid <> 255 and worldid is not null)
             union all 
             select iuin,255 as worldid from t_dw_%s_oss_tbworldpay where statis_date=%s group by iuin
            )d    
        on (a.iuin=d.iuin and a.iworldid = d.worldid )
    )aa group by iworldid,iuin 
    """%(sAppKey,iDate,sAppKey,getDateDelta(iDate,-1),sAppKey,iDate,sAppKey,iDate,sAppKey,iDate,
         sAppKey,iDate,sAppKey,iDate,sAppKey,iDate,sAppKey,iDate)
    _exec_exception_sql(sql)
    write_log("userstat end")
    return 0


def stat():
    write_log("stat start")
    m1days = 30
    m2days = get_l2mon_days(iDate)
    m3days = get_l3mon_days(iDate)
    m_na_days = string.atoi(iDate[6:8])
    if is_mth_end_day(iDate) :
        m1days = string.atoi(iDate[6:8])
        
    #分大区统计总体活跃情况
    sql = """
insert table oss_tbGroupLevelUserLogin
select %s,'%s',iworldid,igroup,ilevel,
    sum(case when (cast(conv(substr(iactivity,-1,1),2,10) as bigint) & %s) > 0 then 1 else 0 end) as iDayActi,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>7 then -7 else 0 end,7),2,10) as bigint) & %s) > 0 then 1 else 0 end) as iWeekActi,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>14 then -14 else 0 end,14),2,10) as bigint) & %s) > 0 then 1 else 0 end) as iDWeekActi,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>%s then -%s else 0 end,%s),2,10) as bigint) & %s) > 0 then 1 else 0 end) as iMonthActi,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>%s then -%s else 0 end,%s),2,10) as bigint) & %s) > 0 then 1 else 0 end) as iDMonthActi,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>14 then -14 else 0 end,14),2,10) as bigint) & %s) > 0 
            and (cast(conv(substr(iactivity,case when length(iactivity)>7 then -7 else 0 end,7),2,10) as bigint) & %s) = 0  then 1 else 0 end) as iWeekLost,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>28 then -28 else 0 end,28),2,10) as bigint) & %s) > 0 
            and (cast(conv(substr(iactivity,case when length(iactivity)>14 then -14 else 0 end,14),2,10) as bigint) & %s) = 0  then 1 else 0 end) as iDWeekLost,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>%s then -%s else 0 end,%s),2,10) as bigint) & %s) > 0 
            and (cast(conv(substr(iactivity,case when length(iactivity)>%s then -%s else 0 end,%s),2,10) as bigint) & %s) = 0  then 1 else 0 end) as iMonthLost,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>%s then -%s else 0 end,%s),2,10) as bigint) & %s) = 0 then 1 else 0 end) as iSilence,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>21 then -21 else 0 end,21),2,10) as bigint) & %s) > 0  
            and (cast(conv(substr(iactivity,case when length(iactivity)>14 then -14 else 0 end,14),2,10) as bigint) & %s) = 0 
            and (cast(conv(substr(iactivity,case when length(iactivity)>7 then -7 else 0 end,7),2,10) as bigint) & %s) > 0  then 1 else 0 end) ,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>42 then -42 else 0 end,42),2,10) as bigint) & %s) > 0 
            and (cast(conv(substr(iactivity,case when length(iactivity)>28 then -28 else 0 end,28),2,10) as bigint) & %s) = 0 
            and (cast(conv(substr(iactivity,case when length(iactivity)>14 then -14 else 0 end,14),2,10) as bigint) & %s) > 0  then 1 else 0 end) ,
    sum(case when (cast(conv(substr(iactivity,case when length(iactivity)>%s then -%s else 0 end,
                        case when length(iactivity)>%s then %s 
                        when length(iactivity)>%s then length(iactivity)-%s else 0 end),2,10) as bigint) & %s) > 0 
            and (cast(conv(substr(iactivity,case when length(iactivity)>%s then -%s else 0 end,%s),2,10) as bigint) & %s) = 0 
            and (cast(conv(substr(iactivity,case when length(iactivity)>%s then -%s else 0 end,%s),2,10) as bigint) & %s) > 0  then 1 else 0 end)
from t_dw_mid_%s_oss_tbUserActive
where statis_date = %s group by iworldid,igroup,ilevel
"""%(iDate,sAppKey,m_ullDayActivity,m_ullWeekActivity,m_ullDWeekActivity,
     m1days,m1days,m1days,m_ullMonthActivity,m2days,m2days,m2days,m_ullDMonthActivity,
     m_ullLastWeekActivity,m_ullWeekActivity,m_ullLastDWeekActivity,m_ullDWeekActivity,
     m2days,m2days,m2days,m_ullLastMonthActivity,m1days,m1days,m1days,m_ullMonthActivity,
     m2days,m2days,m2days,m_ullDMonthActivity,m_ullAntepenultWeekActivity,m_ullLastWeekActivity,
     m_ullWeekActivity,m_ullAntepenultDWeekActivity,m_ullLastDWeekActivity,m_ullDWeekActivity,
     m3days,m3days,m3days,m3days-m1days,m1days,m1days,m_ullAntepenultMonthActivity,
     m2days,m2days,m2days,m_ullLastMonthActivity,
     m1days,m1days,m1days,m_ullMonthActivity,sAppKey,iDate)
    _exec_exception_sql(sql)
    
    #分大区统计活跃度
    sql = """
insert overwrite table t_dw_mid_%s_oss_tbActivityScaleLvDis
select %s,iworldid,ilevel,iWeek,iDWeek,iMonth,iNature,count(iUin) as iNum
from(
select iworldid,iUin,max(ilevel) as ilevel,
    length(regexp_replace(substr(max(iactivity),case when length(max(iactivity))>7 then -7 else 0 end,7), "0", ""))  iWeek,
    length(regexp_replace(substr(max(iactivity),case when length(max(iactivity))>14 then -14 else 0 end,14), "0", ""))  iDWeek,
    length(regexp_replace(substr(max(iactivity),case when length(max(iactivity))>%s then -%s else 0 end,%s), "0", ""))  iMonth,
    length(regexp_replace(substr(max(iactivity),case when length(max(iactivity))>%s then -%s else 0 end,%s), "0", ""))  iNature
from t_dw_mid_%s_oss_tbUserActive where statis_date = %s group by iworldid,iUin
)a group by iworldid,ilevel,iWeek,iDWeek,iMonth,iNature
"""%(sAppKey,iDate,m1days,m1days,m1days,m_na_days,m_na_days,m_na_days,sAppKey,iDate)
    _exec_exception_sql(sql)
    
    #移动统计结果到原来的表
    sql = """
    insert table oss_tbUserLogin
        select dtStatDate,vGame,iWorldId,sum(iDayActivityNum),sum(iWeekActivityNum),
            sum(iDWeekActivityNum),sum(iMonthActivityNum),sum(iDMonthActivityNum),
            sum(iWeekLostNum),sum(iDWeekLostNum),sum(iMonthLostNum),sum(iSilenceNum),
            sum(iWeekBackNum),sum(iDWeekBackNum),sum(iMonthBackNum)
        from oss_tbGroupLevelUserLogin where dtStatDate=%s and vGame='%s'
        group by dtStatDate,vGame,iWorldId
    """%(iDate,sAppKey)
    _exec_sql(sql)
    sql = """
    insert table oss_tbUserLoginLvDis
        select dtStatDate,vGame,iWorldId,ilevel,sum(iDayActivityNum),sum(iWeekActivityNum),
            sum(iDWeekActivityNum),sum(iMonthActivityNum),sum(iDMonthActivityNum),
            sum(iWeekLostNum),sum(iDWeekLostNum),sum(iMonthLostNum),sum(iSilenceNum),
            sum(iWeekBackNum),sum(iDWeekBackNum),sum(iMonthBackNum)
        from oss_tbGroupLevelUserLogin where dtStatDate=%s and vGame='%s'
        group by dtStatDate,vGame,iWorldId,ilevel
    """%(iDate,sAppKey)
    _exec_sql(sql)
    sql = """
    insert table oss_tbPayUserLoginLvDis
        select dtStatDate,vGame,
        --case when grouping(iWorldId)=1 then 255 else iWorldId end  
        iWorldId,
        ilevel,sum(iDayActivityNum),sum(iWeekActivityNum),
            sum(iDWeekActivityNum),sum(iMonthActivityNum),sum(iDMonthActivityNum),
            sum(iWeekLostNum),sum(iDWeekLostNum),sum(iMonthLostNum),sum(iSilenceNum),
            sum(iWeekBackNum),sum(iDWeekBackNum),sum(iMonthBackNum)
        from oss_tbGroupLevelUserLogin where dtStatDate=%s and vGame='%s' and (igroup & 1) > 0
        group by dtStatDate,vGame,iWorldId,ilevel
    """%(iDate,sAppKey)
    _exec_sql(sql)
    sql = """
    insert table oss_tbFreeUserLoginLvDis
        select dtStatDate,vGame,iWorldId,ilevel,sum(iDayActivityNum),sum(iWeekActivityNum),
            sum(iDWeekActivityNum),sum(iMonthActivityNum),sum(iDMonthActivityNum),
            sum(iWeekLostNum),sum(iDWeekLostNum),sum(iMonthLostNum),sum(iSilenceNum),
            sum(iWeekBackNum),sum(iDWeekBackNum),sum(iMonthBackNum)
        from oss_tbGroupLevelUserLogin where dtStatDate=%s and vGame='%s' and (igroup & 1) = 0
        group by dtStatDate,vGame,iWorldId,ilevel
    """%(iDate,sAppKey)
    _exec_sql(sql)

    sql = """
    insert table oss_tbWeekActivityScaleLvDis
        select statis_date,'%s',iWorldId,ilevel,iWeekActivityDays,sum(iActivityNum)
        from t_dw_mid_%s_oss_tbActivityScaleLvDis where statis_date=%s
        group by statis_date,iWorldId,ilevel,iWeekActivityDays
    """%(sAppKey,sAppKey,iDate)
    _exec_sql(sql)
    sql = """
    insert table oss_tbDWeekActivityScaleLvDis
        select statis_date,'%s',iWorldId,ilevel,iDWeekActivityDays,sum(iActivityNum)
        from t_dw_mid_%s_oss_tbActivityScaleLvDis where statis_date=%s 
        group by statis_date,iWorldId,ilevel,iDWeekActivityDays
    """%(sAppKey,sAppKey,iDate)
    _exec_sql(sql)
    sql = """
    insert table oss_tbMonthActivityScaleLvDis
        select statis_date,'%s',iWorldId,ilevel,iMonthActivityDays,sum(iActivityNum)
        from t_dw_mid_%s_oss_tbActivityScaleLvDis where statis_date=%s 
        group by statis_date,iWorldId,ilevel,iMonthActivityDays
    """%(sAppKey,sAppKey,iDate)
    _exec_sql(sql)
    sql = """
    insert table oss_tbInEffectActivity
        select statis_date,'%s',iWorldId,iInEffectActivityDays,sum(iActivityNum)
        from t_dw_mid_%s_oss_tbActivityScaleLvDis where statis_date=%s
        group by statis_date,iWorldId,iInEffectActivityDays
    """%(sAppKey,sAppKey,iDate)
    _exec_sql(sql)
    write_log("stat end")

def init(argv):
    config(argv)
    set_valiable()
    create_mid_table()
    data_init()
    return 0

# 固定的主函数名
def TDW_PL(tdw, argv=[]):
    global tdw_obj
    tdw_obj = tdw
    write_log("argv: " + str(argv))
    # check input parameters
    if check_input(argv) != 0:
        usage()
        return 1
    
    write_log ("program start")
    
    _exec_sql("use u_ied_iplat")      # 连接主库
    #_exec_sql("set hive.exec.parallel=true")      
    #_exec_sql("set hive.inputfiles.splitbylinenum=true")
    #_exec_sql("set mapred.reduce.tasks=500")

    #host:rpt-bi-tdw (rpt-bi-tdw.oa.com windows访问)
    #db: ieg_oss
    #user: u_oss_dnf
    #passwd:dns@2013
    #_exec_sql("set pg_url=rpt-bi-tdw:5432/ieg_oss")
    #_exec_sql("set pgdata.user=u_oss_dnf")
    #_exec_sql("set pgdata.passwd=dnf@2013")

    
    # 初始化
    if init(argv) != 0:
        return 1
    
    #构造过程表
    if userstat() != 0:
        usage()
        return 1
    
    # 统计的灵魂
    if stat() != 0:
        usage()
        return 1
    
    write_log("program end")

