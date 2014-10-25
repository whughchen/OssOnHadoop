#!/usr/bin/env python
#-*- coding: utf-8 -*-
# ******************************************************************************
# 程序名称:     oss_RegionSPDis
# 功能描述:     
# 输入参数:     
# 目标表名:
# 数据源表:
# 创建人名:     Richard chen  (whughchen@gmail.com)
# 创建日期:     2013-5-6
# 版本说明:     v1.0
# 公司名称:     tencent
# 修改人名:    richghchen
# 修改日期:    2014-08-20
# 修改原因:    新接入3D斗地主需要有效用户类，而这个脚本父任务表名写错了，应该是t_dw_mid_%s_oss_tbaccountday
# 依赖的表 : t_dw_%s_oss_tbUserActive  t_dw_%s_oss_tbaccountday
# ******************************************************************************


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

#获取上月天数
def get_lmon_days(baseTime):
    d1 = datetime.datetime(string.atoi(baseTime[0:4]), string.atoi(baseTime[4:6]), string.atoi(baseTime[6:8]))
    d2 = d1 + datetime.timedelta(0-string.atoi(baseTime[6:8]))
    d3 = datetime.datetime(string.atoi(d2.strftime("%Y")), string.atoi(d2.strftime("%m")), 01)
    return (d2-d3).days+1

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
    return 0

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
    CREATE TABLE IF NOT EXISTS  t_dw_%s_oss_tbDbr(
        statis_date BIGINT,
        iWorldId BIGINT,
        iUin BIGINT,
        iLevel BIGINT,
        iNewMonthActi BIGINT,
        iEffective STRING
    )
    PARTITION BY LIST(statis_date)
    (
        PARTITION default
    )    
    STORED AS FORMATFILE COMPRESS"""%(sAppKey)
    _exec_sql(sql)
    return 0
    
# 创建结果表
def create_rs_table():
    #'''用PG外表，【注意】外表不允许创建分区，目前索引需要到外部IDE去创建'''
    #有效用户(不分等级)
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbEffectiveUser(
        dtStatDate BIGINT,
        vGame string,
        iWorldId BIGINT,
        iEffectiveNum BIGINT,
        iNewEffectiveNum BIGINT,
        iOldEffectiveNum BIGINT,
        iBackEffectiveNum BIGINT,
        iLostEffectiveNum BIGINT,
        iLastMonthEffectiveNum BIGINT,
        iNatureMonthRegisterNum BIGINT
    )
    STORED AS PGDATA"""
    _exec_sql(sql)
    #有效用户(分等级)
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbEffectiveUserLvDis(
        dtStatDate BIGINT,
        vGame string,
        iWorldId BIGINT,
        iLevel BIGINT,
        iEffectiveNum BIGINT,
        iNewEffectiveNum BIGINT,
        iOldEffectiveNum BIGINT,
        iBackEffectiveNum BIGINT,
        iLostEffectiveNum BIGINT,
        iLastMonthEffectiveNum BIGINT,
        iNatureMonthRegisterNum BIGINT
    )
    STORED AS PGDATA"""
    _exec_sql(sql)
    
    
def data_init():  
    #过程表数据准备
    if getDateDelta(iDate,-9)[6:8] != "01" :
        sql=""" alter table t_dw_%s_oss_tbDbr drop partition (p_%s) """ %(sAppKey,getDateDelta(iDate,-10))
        _exec_sql(sql)
    # 添加日期分区【一级分区】, 如果存在则忽略
    sql=""" alter table t_dw_%s_oss_tbDbr add partition p_%s values in ('%s') """ %(sAppKey,iDate, iDate)
    _exec_sql(sql)
    #清空过程表分区数据
    sql=""" alter table t_dw_%s_oss_tbDbr truncate partition (p_%s) """ %(sAppKey,iDate)
    _exec_sql(sql)
    #清空可能出现的结果数据（重跑时用到）
    sql=""" delete from oss_tbEffectiveUser where vGame='%s' and dtStatDate=%s """ %(sAppKey,iDate)
    _exec_sql(sql)
    sql=""" delete from oss_tbEffectiveUserLvDis where vGame='%s' and dtStatDate=%s """ %(sAppKey,iDate)
    _exec_sql(sql)
    
def userstat():
    write_log("userstat start")
    lmonth_days = get_lmon_days(iDate)
    m_na_days = string.atoi(iDate[6:8])
    substart = m_na_days
    subend30 = m_na_days
    global sql_ieff_acti
    global sql_ieff_select
    global sql_acti_select

    if m_na_days < 5 :
        substart = lmonth_days + m_na_days
        subend30 = lmonth_days
        
    if m_na_days < 5 :
        sql_ieff_acti="""
        case when length(a.iactivity)<=%s then ""
        else regexp_replace(substr(a.iactivity,case when length(a.iactivity)>%s then -%s else 0 end,
            case when length(a.iactivity)>%s then %s else length(a.iactivity)-%s end),"^0*","")
        end  as iActi30,
        case when length(a.iactivity)<=%s then ""
        else regexp_replace(substr(a.iactivity,case when length(a.iactivity)>%s then -%s else 0 end,
            case when length(a.iactivity)>%s then %s else length(a.iactivity) end),"^0*","")
        end  as iActi34
        """%(m_na_days,substart,substart,substart,subend30,m_na_days,
             m_na_days,substart,substart,substart,substart)
        sql_acti_select="""
        case when length(regexp_replace(iactivity,"^0+",""))>%s and 
            length(regexp_replace(iactivity,"^0+",""))<=%s
            then 1 else 0 end iNewMonthActi
        """%(m_na_days,substart)
    else:
        sql_ieff_acti="""
        regexp_replace(substr(a.iactivity,case when length(a.iactivity)>%s then -%s else 0 end,
            case when length(a.iactivity)>%s then %s else length(a.iactivity) end),"^0*","") as iActi30,
        regexp_replace(substr(a.iactivity,case when length(a.iactivity)>%s then -%s else 0 end,
            case when length(a.iactivity)>%s then %s else length(a.iactivity) end),"^0*","") as iActi34
        """%(substart,substart,substart,m_na_days,
             substart,substart,substart,m_na_days)
        sql_acti_select="""
        case when length(regexp_replace(iactivity,"^0+",""))<=%s
            then 1 else 0 end iNewMonthActi
        """%(m_na_days)
        
    if m_na_days != 5 :    
        sql_ieff_select="""
        case when (substr(ieffective,-2,1) = '1' and length(iActi30)>0)
            or ( (length(iActi34)-length(regexp_replace(iActi34,"11111","")))>0 )
            or ((length(iActi30))>=7 and (length(regexp_replace(substr(iActi30,6,26),"0","")))>=2 )
        then regexp_replace(((substr(ieffective,0,length(ieffective)-1)) || '1'),"^0+","00")
        else regexp_replace(((substr(ieffective,0,length(ieffective)-1)) || '0'),"^0+","00")
        end as ieffective
        """
    else:
        sql_ieff_select="""
        case when (substr(ieffective,-1,1) = '1' and length(iActi30)>0)
            or ( (length(iActi34)-length(regexp_replace(iActi34,"11111","")))>0 )
            or ((length(iActi30))>=7 and (length(regexp_replace(substr(iActi30,6,26),"0","")))>=2 )
        then regexp_replace((ieffective || '1'),"^0+","00")
        else regexp_replace((ieffective || '0'),"^0+","00")
        end as ieffective
        """
        
    #t_dw_%s_oss_tbuseractive 
    sql="""
    insert table u_ied_iplat::t_dw_%s_oss_tbDbr
    select %s,iworldid,iuin,ilevel as iLevel,%s,%s
    from (
        select a.iworldid as iworldid,a.iuin as iuin,ilevel,iactivity,%s,
        case when b.ieffective is null then '00' else b.ieffective end as ieffective
        from (
        select iworldid,iuin,ilevel,iactivity from u_ied_iplat::t_dw_mid_%s_oss_tbUserActive where statis_date=%s
        ) a 
        left join 
            (select iworldid,iuin,iEffective from u_ied_iplat::t_dw_%s_oss_tbDbr where statis_date=%s) b 
        on (a.iworldid = b.iworldid and a.iuin=b.iuin)
    )aa
    """%(sAppKey,iDate,sql_acti_select,sql_ieff_select,sql_ieff_acti,
         sAppKey,iDate,
         sAppKey,getDateDelta(iDate,-1))
    _exec_exception_sql(sql)
    
    write_log("userstat end")
    return 0

def stat():
    write_log("stat start")
    m_na_days = string.atoi(iDate[6:8])
    substart = m_na_days
    subend = 0
    
    if m_na_days < 5 :
        subend = m_na_days
        
    sql = """
    insert table oss_tbEffectiveUser
    select a.statis_date,'%s' as vgame,iWorldid,
        iEffectiveNum,iNewEffectiveNum,iOldEffectiveNum,iBackEffectiveNum,
        iLostEffectiveNum,iLastMonthEffectiveNum,iNatureMonthRegisterNum
    from 
        (select statis_date,iWorldid,
            sum(case when 
                    cast(conv(substr(ieffective,-1,1),2,10) as bigint) > 0 
                then 1 else 0 end
                ) as iEffectiveNum,
            sum(case when 
                    cast(conv(substr(ieffective,-1,1),2,10) as bigint) > 0 
                    and regexp_replace(ieffective,"0","") = '1'
                then 1 else 0 end
                ) as iNewEffectiveNum,
            sum(case when 
                    cast(conv(substr(ieffective,-2,2),2,10) as bigint) = 3
                then 1 else 0 end
                ) as iOldEffectiveNum,
            sum(case when 
                    cast(conv(substr(ieffective,-2,2),2,10) as bigint) = 1
                    and regexp_replace(ieffective,"0","") <> '1'
                then 1 else 0 end
                ) as iBackEffectiveNum,
            sum(case when 
                    cast(conv(substr(ieffective,-2,2),2,10) as bigint) = 2
                then 1 else 0 end
                ) as iLostEffectiveNum,
            sum(case when 
                    cast(conv(substr(ieffective,-2,1),2,10) as bigint) = 1
                then 1 else 0 end
                ) as iLastMonthEffectiveNum
            from u_ied_iplat::t_dw_%s_oss_tbDbr where statis_date=%s
            group by statis_date,iworldid
        )a 
        left join (select %s as statis_date,sum(iDayRegNum) as iNatureMonthRegisterNum 
            from oss_tbUserRegister 
            WHERE dtStatDate>=%s AND dtStatDate<=%s and vGame='%s')b
            on (a.statis_date=b.statis_date)
    """%(sAppKey,sAppKey,iDate,
         iDate,getDateDelta(iDate,1-substart),getDateDelta(iDate,0-subend),sAppKey)
    _exec_exception_sql(sql)
    
    sql = """
    insert table oss_tbEffectiveUserLvDis
    select statis_date,'%s',iWorldid,iLevel,
        sum(case when 
                cast(conv(substr(ieffective,-1,1),2,10) as bigint) > 0 
            then 1 else 0 end
            ) as iEffectiveNum,
        sum(case when 
                cast(conv(substr(ieffective,-1,1),2,10) as bigint) > 0 
                and regexp_replace(ieffective,"0","") = '1'
            then 1 else 0 end
            ) as iNewEffectiveNum,
        sum(case when 
                cast(conv(substr(ieffective,-2,2),2,10) as bigint) = 3
            then 1 else 0 end
            ) as iOldEffectiveNum,
        sum(case when 
                cast(conv(substr(ieffective,-2,2),2,10) as bigint) = 1
                and regexp_replace(ieffective,"0","") <> '1'
            then 1 else 0 end
            ) as iBackEffectiveNum,
        sum(case when 
                cast(conv(substr(ieffective,-2,2),2,10) as bigint) = 2
            then 1 else 0 end
            ) as iLostEffectiveNum,
        sum(case when 
                cast(conv(substr(ieffective,-2,1),2,10) as bigint) = 1
            then 1 else 0 end
            ) as iLastMonthEffectiveNum,
        sum(case when iNewMonthActi>0 then 1 else 0 end) as iNatureMonthRegisterNum
        from u_ied_iplat::t_dw_%s_oss_tbDbr where statis_date=%s
        group by statis_date,iworldid,iLevel
    """%(sAppKey,sAppKey,iDate)
    _exec_exception_sql(sql)
    
    
    write_log("stat end")
    return 0

def init(argv):
    config(argv)
    set_valiable()
    create_mid_table()
    create_rs_table()
    data_init()
    return 0

def clear():
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
    
    clear()
    
    write_log("program end")

