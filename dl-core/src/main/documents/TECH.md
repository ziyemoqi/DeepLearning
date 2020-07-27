一、采用阿里巴巴领域模型概念
    entity(数据模型层):实体类
    ~VO: 供前端展示
    ~Query: 查询入参类
    ~Form: 提交入参类
    dao(持久层):mapper.xml/mapper
    ~controller:前端控制器
    service:(Service/impl) 业务层
三、注解
    @Component: 指这个类需要被组件扫描器扫描到并实例化对象到IOC容器
    @Configuration: 指这个类是一个类似XML文件的配置类,里面用bean标签标记的方法需要被实例化到IOC容器中。
                    在SpringBoot中取消了XML文件并大量使用@Configuration注解的类来实现配置。
    @EnableCaching: 开启缓存
四、mall
    购买->选择商品->填写收货信息、确认金额->
    去结算(创建订单)->去支付,支付完成->跳转到我的订单页
五、日志输出
    1、application.properties同时配置Path和File,file胜;
       logging.path为D:/tmp/spring-boot.log/会发生很奇怪的事情,它会在D盘下，创建tmp目录(若不存在),
       在tmp目录下会创建”spring-boot.log#”目录,是以#替换/的;
    2、日志输出文件的加载顺序:logback.xml > application.properties > logback-spring.xml,最后加载的，会覆盖前者
六、微信小程序登录流程:
    涉及到微信服务器,开发者服务器,小程序
    第一步: 小程序通过wx.login()向微信服务器获取code
    第二步: 小程序通过wx.request()发送code到开发者服务器
    第三步: 开发者服务器接收小程序发送的code,并携带appid、appsecret(这两个需要到微信小程序后台查看)、code发送到微信服务器
    第四步: 微信服务器接收开发者服务器发送的appid、appsecret、code进行校验。校验通过后向开发者服务器发送session_key、openid
    第五步: 开发者服务器自己生成一个token(自定义登录状态)与openid、session_key进行关联，并存到数据库中(mysql、redis等)
    第六步: 开发者服务器返回生成token到小程序,小程序存储skey到本地,小程序后续的业务请求需携带token。
    第九步: 开发者服务器接收并校验小程序发送的token。
    第十步: 开发者服务器返回业务数据到小程序。
