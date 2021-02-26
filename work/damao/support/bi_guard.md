## BI 值班

### 跳板机

- [找钢统一协作平台 (zhaogangren.com)](http://paas.zhaogangren.com/#/jumpserver/jumpserver)
- [胖猫分析 (zhaogang.com)](http://bi.zhaogang.com/index.action)

#### ORACLE 数据库

> ETLAUTO@10.80.12.90/ODS

### 晚上11点任务

```sql
SELECT etl_job, last_starttime, last_endtime, last_jobstatus 
FROM etl_job 
WHERE etl_job LIKE 'MNT_ALTER_ODS_TABLE';
```

### 凌晨3点任务

```sql
SELECT etl_job, last_starttime, last_endtime, last_jobstatus 
FROM etl_job 
WHERE etl_job IN (
    'HBC_ORD_ALL_SO_CUR', 
    'ORD_MALL_SO_CUR', 
    'ORD_ALL_SO_CUR', 
    'HBC_CST_ORG_DEPT_CUR', 
    'SCF_DWD_BH_ORDER_TWO', 
    'HTO_DWD_BH_ORDER_TWO'
);

SELECT etl_job, last_starttime, last_endtime, last_jobstatus 
FROM etl_job 
WHERE etl_job LIKE '%BH_%';
```

### 凌晨5点任务

```sql
SELECT etl_job, last_starttime, last_endtime, last_jobstatus 
FROM etl_job 
WHERE etl_job IN (
    'HBC_LGT_LO_ORD_CUR', 
    'SCF_DWD_BH_MALL_ORDER_TWO', 
    'SCF_DWD_BH_IOU_CUSTOMER_TWO', 
    'HRP_DWD_BH_MALL_ORDER_TWO', 
    'HTO_DWD_BH_IOU_CUSTOMER_TWO'
);
```