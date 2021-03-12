## 项目启动 :id=startup

- `Tomcat` 版本 - `IntelliJ IDEA` - `Smart Tomcat` 插件运行，`Context Path` 设置为 `/`。

### 通用JVM参数 :id=vm-args

```txt
-Dconfig.env=20 
-Dconfig.url=http://api.cc.arch.zhaogangren.com/service 
-Dspring.cloud.service-registry.auto-registration.enabled=false
```

### 配置中心环境编码 :id=env-codes

- `10`: 开发；
- `20`: 测试；
- `30`: UAT；
- `40`: 生产；
- `50`: MIT；
