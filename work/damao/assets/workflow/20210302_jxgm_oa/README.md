## 津西国贸OA对接

> 外调介入日期：2021/03/02 9:00

### 页面开发

点击批量提交，弹出新页面。调用 `OA` 接口获取页面元数据，填充表单后调用 `OA` 接口提交流程。

`OA` 回调后触发原有的批准流程。


### 注意事项

1. 相同本方公司、营运站点才可以一起提交；
2. `OA` 接口的类名 `WorkFlowService`；
3. [代码仓库 - SYSTEMRESEARCH/sale](http://git.zhaogangren.com/SYSTEMRESEARCH/sale)，`dev-jxgm` 分支；
4. `com.zhaogang.proxy.oa.NewOaProxy`；

### 数据库

| 环境 | 实例                       | 认证信息                           |
| :--: | -------------------------- | ---------------------------------- |
| SIT  | mysql://`10.0.6.64`:`3306` | `ua_scm_sale` / `FJb7ch62jHIBwOfO` 	|