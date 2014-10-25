#!/usr/bin/env python
#-*- coding: utf-8 -*-
# ******************************************************************************
# 程序名称:     oss_tbgoodsvendition_stat_xxxx.py
# 功能描述:     统计日的各道具销售情况
# 输入参数:     date 
# 目标表名:
# 数据源表:
# 创建人名:     richghchen
# 创建日期:     2014-09-14
# 版本说明:     v1.0
# 公司名称:     tencent
# 修改人名:
# 修改日期:
# 修改原因:
# 依赖的表 :  
# ******************************************************************************

# 加载两个系统模块
sys = __import__('sys')
os  = __import__('os')

# 加载两个时间操作模块和一个字符串操作模块
time     = __import__('time')
datetime = __import__('datetime')
string   = __import__('string')

iplattime = __import__('iplat_lib_time')
iplattdw = __import__('iplat_lib_tdw')
# -----------------------------------------------------------------------------


# ------------------------------------------------------------------------------------------------    
# 显示给用户的提示信息
def usage():
    print sys.argv[0] + " [yyyymmdd] [appname] [logtype]" 
    print "example:  " 
    print sys.argv[0] + " 20131223 happy round"


def check_input(argv):
    if len(argv) < 3:
        return 1
    if argv[0] == '' or argv[1] == '' or argv[2] == '':
        return 1
    return 0

# 打印日志
def write_log(msg):
    '''打日志'''
    iplattdw.write_log(msg)

def set_valiable():
    return 0

def config(argv):
    global iDate
    global iYesterday

    global vgamename
    
    vgamename='bsyx'

    if argv[0] == '':
#        iDate=getDateDelta(getToday(),-1)
        iDate='20140311'	
    else:
        iDate=argv[0]
    
    iYesterday=iplattime.get_datedelta(iDate,-1)

    
    write_log("iDate: " + iDate)
    

    
    

    
def userstat():
    return 0

def oss_tbgoodsvendition():
    
    write_log("delete data start")
    sql="delete from oss_tbgoodsvendition  where dtstatdate=%s and vgame='%s'" %(iDate,vgamename) 
    iplattdw.exec_exception_sql(sql)
    	
    write_log("stat start")
    sql=""" insert table oss_tbgoodsvendition
    select %s dtStatDate,
'%s' as vgame,
case when grouping(vzoneid)=1 then 255 else cast(vzoneid as int) end iWorldId,
imallid as iGoodsId,
0 as igoodstype,
0 as iterm,
0 as itype1,
0 as itype2,
0 as iType3,
sum(ibuycount) as iGoodsNum,
0 as ipaymentgold,
0 as ipaymentcoupon,
0 as ipaymentexp,
sum(itotalamount) as iPaymentGamePoint,
0 as ipaymentqpoint,
0 as ipaymentqb,
0 as ipaymenttenpay,
count(distinct iuin) as iPayUinCount,
count(distinct iuin) as iPayRoleCount 
from ieg_tdbank::herogame_dsl_userpay_fht0  where  
round(tdbank_imp_date/100)=%s group by cube(vzoneid),imallid
    """ % (
    iDate,vgamename,iDate
    )
    iplattdw.exec_exception_sql(sql)
    write_log("sql: " + sql)
    return 0
	

def init(argv):
    config(argv)
    set_valiable()
    return 0

# 固定的主函数名
def TDW_PL(tdw, argv=[]):
    iplattdw.init(tdw)
    write_log("argv: " + str(argv))
    # check input parameters
#    if check_input(argv) != 0:
#        usage()
#        return 1
    
    write_log ("program start")
    
    iplattdw.exec_sql("use u_ied_iplat")      # 连接主库
    
    # 初始化
    if init(argv) != 0:
        return 1
    
    
    # 统计的灵魂
    oss_tbgoodsvendition() #分渠道注册14日留存
    
    write_log("program end")
