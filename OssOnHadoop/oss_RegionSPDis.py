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
# 修改人名:
# 修改日期:
# 修改原因:
# ******************************************************************************

# -----------------------------------------------------------------------------
# dragoncai - 20110602 - 小白大作战的日活跃oss统计
# 依赖的任务：日活跃fat表的生成和日活跃调度任务的完成
#   任务id：103000300145，任务名称：t_fat_day_act_xbdz-execute 
#   任务id：103000300018，任务名称：t_oss_day_act-execute
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
    tdw_obj.WriteLog("|oss_RegionSPDis.py|msg -> " + msg)

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
    return 0
    
    
def data_init():  
    #过程表数据准备
    #清空可能出现的结果数据（重跑时用到）
    sql=""" delete from oss_tbDayLoginRegionDis where vGame='%s' and dtStatDate=%s """ %(sAppKey,iDate)
    _exec_sql(sql)
    sql=""" delete from oss_tbDayRegRegionDis where vGame='%s' and dtStatDate=%s """ %(sAppKey,iDate)
    _exec_sql(sql)
    sql=""" delete from oss_tbDayLoginSPDis where vGame='%s' and dtStatDate=%s """ %(sAppKey,iDate)
    _exec_sql(sql)
    
def userstat():
    return 0

def stat():
    write_log("stat start")
    sql="""
    insert table oss_tbDayLoginRegionDis
        select '%s','%s',iworldid,
               case when iregion is null then 0 else iregion end as iregion,
               count(iuin) as iNum
        from (
        select distinct worldid as iworldid,iuin,iloginip from t_dw_%s_oss_tblogin where statis_date=%s
        union all select 255,iuin,max(iloginip) as iloginip from t_dw_%s_oss_tblogin where statis_date=%s group by iuin
        ) a 
        left join hy_dc_oss::t_dw_oss_ipregion b
        on (a.iloginip = b.iip)
        group by iworldid,iregion 
    """%(iDate,sAppKey,sAppKey,iDate,sAppKey,iDate)
    _exec_exception_sql(sql)
    sql="""
    insert table oss_tbDayRegRegionDis
        select '%s','%s',
               case when iregion is null then 0 else iregion end as iregion,
               count(iuin) as iNum
        from (
        select distinct iuin,iregip from t_dw_%s_oss_tbaccountday where statis_date=%s
        ) a 
        left join hy_dc_oss::t_dw_oss_ipregion b
        on (a.iregip = b.iip)
        group by iregion 
    """%(iDate,sAppKey,sAppKey,iDate)
    _exec_exception_sql(sql)
    sql="""
    insert table oss_tbDayLoginSPDis
        select '%s','%s',iworldid,
               case when isp is null then 0 else isp end as isp,
               count(iuin) as iNum
        from (
        select distinct worldid as iworldid,iuin,iloginip from t_dw_%s_oss_tblogin where statis_date=%s
        union all select 255,iuin,max(iloginip) as iloginip from t_dw_%s_oss_tblogin where statis_date=%s group by iuin
        ) a 
        left join hy_dc_oss::t_dw_oss_ipsp b
        on (a.iloginip = b.iip)
        group by iworldid,isp 
    """%(iDate,sAppKey,sAppKey,iDate,sAppKey,iDate)
    _exec_exception_sql(sql)
    write_log("stat end")
    return 0

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

