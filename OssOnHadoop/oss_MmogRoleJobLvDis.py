#!/usr/bin/env python
#-*- coding: utf-8 -*-
#
#  Descripe: 
#  Auther: Richard chen  (whughchen@gmail.com)
#  Created Date: 2013-05-30
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
script_name = "oss_MmogRoleJobLvDis.py"
    
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
   

def create_rs_table():
    '''检查并创建结果表'''
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbRoleJobLvDis (
        dtStatDate bigint,
        vGame string,
        iWorldId bigint,
        cGender string,
        iJobId bigint,
        iLevel bigint,
        iRoleNum bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)
    
    sql = """
    CREATE EXTERNAL TABLE IF NOT EXISTS oss_tbDayActivityRoleJobLvDis (
        dtStatDate bigint,
        vGame string,
        iWorldId bigint,
        cGender string,
        iJobId bigint,
        iLevel bigint,
        iRoleNum bigint
    ) STORED AS PGDATA
    """
    _exec_sql(sql)


def delete_result(table='', dtStatDate=None):
    sql = "delete from %s where dtStatDate=%s and vGame='%s' " % (table, dtStatDate, sAppKey)
    _exec_sql(sql, need_raise=True)


def clean_result_and_query(result_table=None, sql=None, dtStatDate=None):
    '''将清理已有结果数据、查询合并在一起，方便调用的一致性'''
    delete_result(result_table, dtStatDate)
    sql = '''
    insert table %s %s''' % (result_table, sql) 
    _exec_sql(sql, need_raise=True)


def STAT():
    '''只是每逢周三拉取父任务 t_dw_XXX_oss_tbRoleInfo 的 statis_date 为周日的数据来进行统计，因为父任务是周二跑完的'''
    if getMondayOfWeek(statis_date, 3) != int(statis_date):
        write_log("%s 不是周三，无需统计。" % statis_date)
        return
    dtStatDate = getMondayOfWeek(statis_date, 0)
    
    # --------------- AllRoleJobLvStat() ---------------
    sql = """
    select %s as dtStatDate, '%s' as vGame, iWorldId, cGender, iJobId, iLevel, iRoleNum from 
    (
        select WorldId as iWorldId, 
            case iGender when 0 then 'M' when 1 then 'F' else '0' end as cGender, iJobId, iLevel, count(iUin) as iRoleNum 
        from hy::t_dw_%s_oss_tbRoleInfo where statis_date=%s and iRoleCreateTime<=unix_timestamp(%s235959, 'yyyyMMddHHmmss') 
        group by WorldId, iGender, iJobId, iLevel
    ) A 
    """ % (dtStatDate, sAppKey, sAppKey, dtStatDate, dtStatDate)
    clean_result_and_query('oss_tbRoleJobLvDis', sql, dtStatDate)

    # --------------- DayRoleJobLvStat() ---------------
    sql = """
    select %s as dtStatDate, '%s' as vGame, iWorldId, cGender, iJobId, iLevel, iRoleNum from 
    (
        select WorldId as iWorldId, 
            case iGender when 0 then 'M' when 1 then 'F' else '0' end as cGender, iJobId, iLevel, count(iUin) as iRoleNum 
        from hy::t_dw_%s_oss_tbRoleInfo 
        where statis_date=%s and iLastUpdateTime>=unix_timestamp(%s000000, 'yyyyMMddHHmmss') 
            and iLastUpdateTime<=unix_timestamp(%s235959, 'yyyyMMddHHmmss') 
            and iRoleCreateTime<=unix_timestamp(%s235959, 'yyyyMMddHHmmss') 
        group by WorldId, iGender, iJobId, iLevel
    ) A 
    """ % (dtStatDate, sAppKey, sAppKey, dtStatDate, dtStatDate, dtStatDate, dtStatDate)
    clean_result_and_query('oss_tbDayActivityRoleJobLvDis', sql, dtStatDate)


def global_init(argv):
    '''准备全局变量，获取参数'''
    global date_begin           # 统计起始日期
    global date_end             # 统计结束日期
    global statis_date          # 统计日期
    global sAppKey
    statis_date = argv[0]
    date_end = statis_date
    sAppKey = argv[1]


def TDW_PL(tdw, argv=[]):
    '''主函数入口'''
    global tdw_obj      # 声明为全局变量
    tdw_obj = tdw
    write_log('argv: ' + str(argv))
    if len(argv) != 2:
        print "Usage:%s <YYYYMMDD> <para>" % script_name
        return 1
    write_log("start: Program %s start" % script_name)
    
    tdw_obj.execute("use hy_dc_oss")                    # 连接主库
    tdw_obj.execute("set fetch.execinfo.mode=no")       # 关闭返回SQL执行信息到结果集
    tdw_obj.execute("set hive.exec.parallel=true")      # 并行优化开关
    tdw_obj.execute("set hive.inputfiles.splitbylinenum=true")
    tdw_obj.execute("set mapred.reduce.tasks=500")
    
    """ ---------- 经分框架的 MmogRoleJobLvDis 程序 ---------- """
    # 目前由于 t_dw_XXX_oss_tbRoleInfo 表是逢周二入库周日的数据，故该统计只能作为周任务一周统计周日一天的结果 by Richard chen  (whughchen@gmail.com) 2013-06-05
    global_init(argv)
#    create_rs_table()
    STAT()
    
    write_log("end: Program %s end" % script_name)
