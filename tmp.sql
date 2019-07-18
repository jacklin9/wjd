create table st_taoxi_category_transform_stats(
    f_type int comment '统计类型，1：按日，2：按月',
    f_start_date date comment '统计开始日期',
    f_end_date date comment '统计结束日期',
    f_ent_id int comment '事业部编号',
    f_ent_name varchar(255) comment '事业部名称',
    f_category_id int comment '品类编号',
    f_category_name varchar(255) comment '品类名称',
    f_shop_name varchar(255) comment '店铺名称',
    f_visit_user int comment '访客数',
    f_last_year_visit_user int comment '去年同期访客数',
    f_card_user int comment '加购人数',
    f_last_year_card_user int comment '去年同期加购人数',
    f_collect_user int comment '收藏人数',
    f_last_year_collect_user int comment '去年同期收藏人数',
    f_buyer_user int comment '成交用户数',
    f_last_year_buyer_user int comment '去年同期成交用户数',
    f_silent_order_user int comment '静默下单用户数',
    f_last_silent_order_user int comment '去年同期静默下单用户数',
    KEY idx_date(f_start_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='淘系品类转化效果分析统计表';



create table crow_effect(
f_time date comment '时间',
crow_name varchar(255) comment '人群名称',
f_type varchar(255) comment '人群类型',
f_device varchar(255) comment   '推广设备',
f_product_line varchar(255) COMMENT    '产品线',
f_campaign varchar(255) comment '计划',
f_group  varchar(255) comment  '单元',
f_impression int comment  '展现数',
f_click int comment  '点击数',
f_click_rate float comment '点击率',
cost double(20,2) comment  '总费用',
ecpm  double(20,2) comment  '千次展现成本',
cpc double(20,2) COMMENT  '平均点击成本',
order_cnt int comment   '总订单行',
order_amt double(20,2) comment     '总订单金额',
cvr double(20,2) comment    '转化率',
roi double(20,2) comment  'ROI'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='京准通人群效果表';



SELECT
t.*,
t.click/t.impression as click_rate,
t.order_amt/t.cost as roi
FROM
(
select 
user_nick,
if(crow_name like '%九数%',if(f_type = '新标签人群', '九数竞品', '九数'), '非九数') as crow_type,
f_product_line,
sum(cost) as cost,
sum(f_impression) as impression,
sum(f_click)    as click,
sum(order_amt) as order_amt
from crow_effect
GROUP BY 
user_nick,
if(crow_name like '%九数%',if(f_type = '新标签人群', '九数竞品', '九数'), '非九数'),
f_product_line
ORDER BY
user_nick) t;


f_id
f_stats_day
f_stats_report_name
f_stats_type
f_actual_shop_count
f_stats_shop_count
f_actual_category_count
f_stats_category_count
f_actual_brand_count
f_stats_brand_count
f_mbi_component_id
f_stats_table_name
f_query_sql
f_data_count
f_monitor_hour
f_is_valid
f_valid_reason
f_mail_to
f_is_send_mail

str("""
insert into md_sales_statistics.st_monitor_collect_stats
select
{0} as f_id
,{1} as f_stats_day
,f_stats_report_name
,f_stats_type
,f_collect_name
,f_collect_type
,f_shop_count as f_actual_shop_count
,{2} as f_stats_shop_count
,f_category_count as f_actual_category_count
,{3} as f_stats_category_count
,f_brand_count as f_actual_brand_count
,{4} as f_stats_brand_count
,f_mbi_component_id
,f_stats_table_name
,f_query_sql
,f_data_count
,f_monitor_hour
,{5} as f_is_valid
,{6} as f_valid_reason
,f_mail_to
,{5} as f_is_send_mail
from md_sales_statistics.t_monitor_stats_config
where f_id = {0}
""").format(i, get_today(), self.fetched_fields[0], self.fetched_fields[1], self.fetched_fields[2], self.is_valid, self.reason)


update table report.t_web_component
    set f_data_update_time = 
    where f_component_id = 

f_stats_day,f_stats_report_name,f_stats_type,f_actual_shop_count,f_stats_shop_count,f_actual_category_count,f_stats_category_count,f_actual_brand_count,f_stats_brand_count,f_mbi_component_id,f_is_valid,f_valid_reason,f_mail_to

统计日期,统计报表名称,统计类型,实际店铺数,统计店铺数,实际品类数,统计品类数,实际品牌数,统计品牌数,mbi配置的统计报表组件id,是否异常,异常原因描述,异常邮件发送人



update t_monitor_collect_config set f_next_run_time = data_add(f_next_run_time, interval f_scan_cycle hour)
UPDATE t_monitor_collect_config set f_scan_cycle = 5
f_stats_day,f_stats_report_name,f_stats_type,f_actual_shop_count,f_stats_shop_count,f_actual_category_count,f_stats_category_count,f_actual_brand_count,f_stats_brand_count,f_mbi_component_id,f_stats_table_name,f_query_sql,f_data_count,f_monitor_hour,f_is_valid,f_valid_reason,f_mail_to,f_is_send_mail

f_stats_day,f_collect_name,f_collect_type,f_shop_count,f_category_count,f_brand_count,f_fetched_shop_num,f_fetched_cate_num,f_fetched_brand_num,f_collect_table_name,f_collect_way,f_query_sql,f_data_count,f_monitor_hour,f_is_valid,f_valid_reason,f_mail_to,f_is_send_mail
