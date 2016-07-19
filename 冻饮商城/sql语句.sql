
#查询用户绑定的设备列表
select    d.device_type_name  as deviceTypeName ,u.reg_type as regType ,u.user_name as userName
from 
t_device  d  
left join  t_user_device tu 
on d.device_id=tu.user_id  and tu.user_id='3312'
left join t_user  u 
on tu.user_id=u.user_id 

#根据versionId查询版本信息

select app_version as appVersion,update_profile as updateProfile,
		update_detail as updateDetail,update_time as update_time
		from t_app_version
		where app_version=#{appVersion}


querySatrtTaskList

select  t.user_id as userId,t.device_id as deviceId,
		u.user_token as userToken,t.excute_cmd_start as excuteCmdStart,
		t.temperature as temperature
from t_timed_task t 
left join 
t_user u 
on 
t.user_id=u.user_id 
where 
t.task_start_time>=1468761692062 
and 
t.task_start_time<=1468761692066 
and t.excute_week_day =3








========================================================

{"name":"218001","value":"eyJ2YWx1ZSI6IjMxODAwMSJ9","type":0}  单

{"name":"000001","value":"eyJ2YWx1ZSI6W3sibmFtZSI6IjIyMzAwNiIsInZhbHVlIjoiMzIzMDAxIn0seyJuYW1lIjoiMjIzMDA1IiwidmFsdWUiOiIxMDAifSx7Im5hbWUiOiIyMjMwMDciLCJ2YWx1ZSI6IjgwMCJ9XX0",
"type":1} 组


//1.接口 （一份）
//2.线程 （多份）
//3.定时任务
//4.

1.海尔的接口让它只有一份
2.每个线程跑37定时任务



========================================================

表明
sup_group 区域管理

客户管理
supplier_base 经销商
terminal_base 终端店


order_base 订单基础表 

pay_record 支付提现表

 类的使用方法
ResourceUtil
getSessionUserName

select  * from supplier_base b 
left join sup_group g
on b.id=g.id

代码模板
public List<ProductPoolEntity> productPoolList (String parid,String catId,int page,int rows) {
		DataGrid<ProductPoolEntity> dataGrid = new DataGrid<ProductPoolEntity>();
		dataGrid.setPage(page);
		dataGrid.setRows(rows);
		StringBuilder sql = new StringBuilder("select * from product_pool p where 1=1");
		Map<String,Object> param = new HashMap<String,Object>();
		if (!StringUtils.isEmpty(parid)) {
			sql.append(" and p.partner_id =:partner_id");
			param.put("partner_id", parid);
		}
		if (!StringUtils.isEmpty(catId)) {
			sql.append(" and p.category_id =:category_id");
			param.put("category_id", catId);
		}
		dataGrid = simpleJdbcTemplate.dataGridList(sql.toString(), ProductPoolEntity.class, param, dataGrid);
		return dataGrid.getResults();
	}
