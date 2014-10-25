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
# 依赖的表 : t_dw_mid_%s_oss_tbUserActive  t_dw_%s_oss_tbaccountday
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
    CREATE TABLE IF NOT EXISTS t_dw_%s_oss_tmp_OssUserRegisterCase_%s(
        statis_date BIGINT,
        dtRegDate BIGINT,
        vGame string,
        iDayNum BIGINT,
        iLevel BIGINT,
        iUserNum BIGINT
    )  
    STORED AS FORMATFILE COMPRESS"""%(sAppKey,iDate)
    _exec_sql(sql)
    return 0
    
    
def data_init():  
    #过程表数据准备
    #清空可能出现的结果数据（重跑时用到）
    sql=""" delete from oss_tbUserRegister where vGame='%s' and dtStatDate=%s """ %(sAppKey,iDate)
    _exec_sql(sql)
    sql=""" delete from oss_tbResidentUser where vGame='%s' and dtStatDate=%s """ %(sAppKey,iDate)
    _exec_sql(sql)
    sql=""" delete from oss_tbResidentUserLvDis where vGame='%s' and dtStatDate=%s """ %(sAppKey,iDate)
    _exec_sql(sql)
    sql=""" delete from oss_tbNewRegPayResident where vGame='%s' and dtStatDate=%s """ %(sAppKey,iDate)
    _exec_sql(sql)    
    sql=""" delete from oss_tbNewRegDepositResident where vGame='%s' and dtStatDate=%s """ %(sAppKey,iDate)
    _exec_sql(sql)
        
def userstat():
    return 0

def stat():
    write_log("stat start")
    global g_iAllRegNum
    global g_iDayRegNum
    global g_iWeekRegNum
    global g_iDWeekRegNum
    global g_iMonthRegNum
    g_iAllRegNum = 0
    g_iDayRegNum = 0
    g_iWeekRegNum = 0
    g_iDWeekRegNum = 0
    g_iMonthRegNum = 0
    
    # 月注册分析天（一般取30天，如果是月末，取自然月天）
    m1days = 30
    if is_mth_end_day(iDate) :
        m1days = string.atoi(iDate[6:8])
    month_start_date = getDateDelta(iDate,1-m1days)

    sql="""
        select count(case when statis_date = %s then iuin else null end) as iDayRegNum,
            count(case when statis_date > %s then iuin else null end) as iWeekRegNum,
            count(case when statis_date > %s then iuin else null end) as iDWeekRegNum,
            count(iuin) as iMonthRegNum
        from (
        select min(statis_date) as statis_date,iuin from t_dw_%s_oss_tbaccountday 
            where statis_date>=%s and statis_date<= %s group by iuin
        ) a 
    """%(iDate,getDateDelta(iDate,-7),getDateDelta(iDate,-14),sAppKey,month_start_date,iDate)
    results = _exec_exception_sql(sql)
    if len(results)>0 :
        tmp_results = results[0].split('\t')
        g_iDayRegNum = string.atoi(tmp_results[0])
        g_iWeekRegNum = string.atoi(tmp_results[1])
        g_iDWeekRegNum = string.atoi(tmp_results[2])
        g_iMonthRegNum = string.atoi(tmp_results[3])
    
    sql="""
        select iAllRegNum from oss_tbUserRegister where dtStatDate=%s and vGame='%s'
    """%(getDateDelta(iDate,-1),sAppKey)
    results = _exec_exception_sql(sql)
    g_iAllRegNum = g_iDayRegNum
    if len(results)>0 :
        tmp_results = results[0].split('\t')
        g_iAllRegNum = string.atoi(tmp_results[0]) + g_iDayRegNum
    
    sql="""
    insert into oss_tbUserRegister values (%s,'%s',%s,%s,%s,%s,%s)
    """%(iDate,sAppKey,g_iAllRegNum,g_iDayRegNum,g_iWeekRegNum,g_iDWeekRegNum,g_iMonthRegNum)
    _exec_exception_sql(sql)
 
    sql="""
        insert table t_dw_%s_oss_tmp_OssUserRegisterCase_%s
        select '%s',reg_date,'%s',idaynum,ilevel,sum(iuser) as iuser
        from (
        select reg_date,
            case when idaynum is null then 0 else datediff(%s,reg_date)-idaynum  end as idaynum,
            case when ilevel is null then 0 else ilevel end ilevel,
            count(a.iuin) as iuser
        from (
        select min(statis_date) as reg_date,iuin from t_dw_%s_oss_tbaccountday 
            where statis_date>=%s and statis_date<= %s group by iuin
        ) a 
        left join ( 
            select iUin,ilevel,
                length(iActivity)-length(regexp_replace(iActivity,"0+$","")) as idaynum
             from t_dw_mid_%s_oss_tbUserActive 
                where statis_date = %s and iworldid=255
        ) b on (a.iuin = b.iuin) group by reg_date,idaynum,ilevel
        )c group by reg_date,idaynum,ilevel
    """%(sAppKey,iDate,
         iDate,sAppKey,iDate,
         sAppKey,
         getDateDelta(iDate,-90),iDate,
         sAppKey,
         iDate)
    results = _exec_exception_sql(sql)
 
 
    sql="""
        insert table t_dw_%s_oss_tmp_OssUserRegisterCase_%s
        select '%s',reg_date,'%s',idaynum,ilevel,sum(iuser) as iuser
        from (
        select reg_date,
            case when idaynum is null then 0 else datediff(%s,reg_date)-idaynum  end as idaynum,
            case when ilevel is null then 0 else ilevel end ilevel,
            count(a.iuin) as iuser
        from (
        select min(statis_date) as reg_date,iuin from t_dw_%s_oss_tbaccountday 
            where statis_date>=%s and statis_date<= %s group by iuin
        ) a 
        left join ( 
            select iUin,ilevel,
                length(iActivity)-length(regexp_replace(iActivity,"0+$","")) as idaynum
             from t_dw_mid_%s_oss_tbUserActive 
                where statis_date = %s and iworldid=255
        ) b on (a.iuin = b.iuin) group by reg_date,idaynum,ilevel
        )c group by reg_date,idaynum,ilevel
    """%(sAppKey,iDate,
         iDate,sAppKey,iDate,
         sAppKey,
         getDateDelta(iDate,-30),iDate,
         sAppKey,
         iDate)
    results = _exec_exception_sql(sql)    
    
    sql="""
        insert table oss_tbResidentUserLvDis 
        select  aa.dtRegDate,aa.dtStatDate,aa.vGame,aa.iDayNum,aa.iLevel,aa.iUserNum,
            sum(case when iOtherLevel<=iLevel then iOtherUserNum else 0 end)
            from (
            select a.dtRegDate as dtRegDate,a.statis_date as dtStatDate,a.vGame as vGame,
                a.iDayNum as iDayNum,a.iLevel as iLevel,a.iUserNum as iUserNum,b.iLevel as iOtherLevel,
                b.iUserNum as iOtherUserNum
            from
            t_dw_%s_oss_tmp_OssUserRegisterCase_%s a
            left join 
            t_dw_%s_oss_tmp_OssUserRegisterCase_%s b on 
            (b.dtRegDate=a.dtRegDate and b.statis_date=a.statis_date
                            and b.vGame=a.vGame and b.iDayNum=a.iDayNum )
            )aa
            group by dtRegDate,dtStatDate,vGame,iDayNum,iLevel,iUserNum
    """%(sAppKey,iDate,
         sAppKey,iDate)
    results = _exec_exception_sql(sql)
    
    sql="""
        insert table oss_tbResidentUser
        select  aa.dtRegDate,aa.dtStatDate,aa.vGame,aa.iDayNum,aa.iUserNum,
            sum(case when iOtherDayNum<=iDayNum then iOtherUserNum else 0 end)
            from (
            select a.dtRegDate as dtRegDate,a.dtStatDate as dtStatDate,a.vGame as vGame,
                a.iDayNum as iDayNum,a.iUserNum as iUserNum,b.iDayNum as iOtherDayNum,
                b.iUserNum as iOtherUserNum
            from
            (select dtRegDate,statis_date dtStatDate,vGame,iDayNum,sum(iUserNum) iUserNum 
                from  t_dw_%s_oss_tmp_OssUserRegisterCase_%s
                group by dtRegDate,statis_date,vGame,iDayNum) a
            left join (select dtRegDate,statis_date dtStatDate,vGame,iDayNum,sum(iUserNum) iUserNum 
                from  t_dw_%s_oss_tmp_OssUserRegisterCase_%s
                group by dtRegDate,statis_date,vGame,iDayNum) b on 
            (b.dtRegDate=a.dtRegDate and b.dtStatDate=a.dtStatDate
                            and b.vGame=a.vGame)
            )aa group by dtRegDate,dtStatDate,vGame,iDayNum,iUserNum
    """%(sAppKey,iDate,
         sAppKey,iDate)
    results = _exec_exception_sql(sql)

    sql="""
        insert table oss_tbNewRegPayResident
select 
'%s' as vgame,
reg_date,%s as statis_date,nvl(b.worldid,-1) as worldid,iregway,
    datediff(%s,reg_date) as idaynum,
    sum(nvl2(b.iuin,1,0)) as iuser,
    sum(nvl(b.ipayment,0)) as money
from (
select min(statis_date) as reg_date,iuin,iregway from t_dw_%s_oss_tbaccountday 
    where statis_date>=%s and statis_date<= %s 
    group by iuin,iregway
) a 
left join ( 
    select iUin,statis_date,sum(ipayment) as ipayment,worldid	        
     from t_dw_%s_oss_tbworldpay 
        where statis_date = %s 
        group by iUin,statis_date,worldid
) b on (a.iuin = b.iuin) 
group by reg_date,nvl(b.worldid,-1) ,iregway
having worldid<>-1
    """%(sAppKey,
         iDate,
         iDate,
         sAppKey,
         getDateDelta(iDate,-30),getDateDelta(iDate,-1),
         sAppKey,
         iDate)
    results = _exec_exception_sql(sql)    

    sql="""
        insert table oss_tbNewRegDepositResident
select 
'%s' as vgame,
reg_date,%s as statis_date,nvl(b.worldid,-1) as worldid,iregway,
    datediff(%s,reg_date) as idaynum,
    sum(nvl2(b.iuin,1,0)) as iuser,
    sum(nvl(b.ipayment,0)) as money
from (
select min(statis_date) as reg_date,iuin,iregway from t_dw_%s_oss_tbaccountday 
    where statis_date>=%s and statis_date<= %s 
    group by iuin,iregway
) a 
left join ( 
    select ireceiveduin as iuin,statis_date,sum(iamount) as ipayment ,   worldid            
     from t_dw_%s_oss_tbworlddeposit
        where statis_date = %s 
        group by ireceiveduin,statis_date,worldid
) b on (a.iuin = b.iuin) 
group by reg_date,nvl(b.worldid,-1) ,iregway
having worldid<>-1
    """%(sAppKey,
         iDate,
         iDate,
         sAppKey,
         getDateDelta(iDate,-30),getDateDelta(iDate,-1),
         sAppKey,
         iDate)
    results = _exec_exception_sql(sql) 
    
    write_log("stat end")
    return 0

def init(argv):
    config(argv)
    set_valiable()
    create_mid_table()
    data_init()
    return 0

def clear():
    sql = """
        drop table t_dw_%s_oss_tmp_OssUserRegisterCase_%s
    """%(sAppKey,iDate)
    _exec_sql(sql)
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

