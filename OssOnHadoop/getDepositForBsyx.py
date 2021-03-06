#!/usr/bin/env python
#-*- coding: utf-8 -*-
# ******************************************************************************
# 程序名称:     getLoginForHlddc
# 功能描述:     获取霸世英雄的付费数据
# 输入参数:     
# 目标表名:
# 数据源表:
# 创建人名:     richard chen (whughchen@gmail.com)
# 创建日期:     2013-10-17
# 版本说明:     v1.0
# 公司名称:     tencent
# 修改人名:
# 修改日期:
# 修改原因:
# 依赖的表 :  dw_bo::t_dw_caccts_shanghaidq_water_5013 替换成：t_dw_caccts_shanghaidq_water_only_bsyx  20140303
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

# ------------------------------------------------------------------------------------------------    
# 显示给用户的提示信息
def usage():
    print sys.argv[0] + " [yyyymmdd] " + "[app_str(eg:ddc)]"


def check_input(argv):
    if len(argv) < 1:
        return 1
    return 0

# 打印日志
def write_log(msg):
    '''打日志'''
    tdw_obj.WriteLog("|getLoginForHlddc.py|msg -> " + msg)

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
    iDate = argv[0]
    write_log("iDate: " + iDate)

    
def data_init():  
    #过程表数据准备
    #清空可能出现的结果数据（重跑时用到）
    sql=""" alter table t_dw_bsyx_oss_tbworlddeposit add partition p_%s values in ('%s') """ %(iDate,iDate)
    _exec_sql(sql)
    sql=""" alter table t_dw_bsyx_oss_tbworlddeposit truncate partition (p_%s) """ %(iDate)
    _exec_sql(sql)
    
def stat():
    write_log("stat start")
    
    sql="""
    insert table t_dw_bsyx_oss_tbworlddeposit 
	    select %s, 
        fzoneid worldid,
        fuin iuin,fuin iuin,
        min(fcreate_time) as ipaytime,SUM(ftran_amt*10) as amount ,
        count(fuin) as itimes 
	    from dw_bo::t_dw_caccts_shanghaidq_water_only_bsyx  
	    where statis_date=%s and fextern_tran_type=1 --and  facct_id='YDZF000190'
	    group by fuin,fzoneid
    """%(iDate,iDate)
    _exec_exception_sql(sql)    
    
    write_log("stat end")
    return 0

def init(argv):
    config(argv)
    set_valiable()
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
    
    # 统计
    if stat() != 0:
        usage()
        return 1
    
    write_log("program end")

