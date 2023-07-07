
### 中午吃什么是每天的重要决策之一

### ☃️后端主要技术栈

| 技术及版本                         | 作用                                                         | 版本                              |
| ---------------------------------- | ------------------------------------------------------------ | --------------------------------- |
| SpringBoot                         | 应用开发框架                                                 | 2.7.8                             |
| JDK                                | Java 开发包                                                  | 1.8                               |
| MySQL                              | 提供后端数据库                                               | 8.0.23                            |
| MyBatisPlus                        | 提供连接数据库和快捷的增删改查                               | 3.5.1                             |
| SpringBoot-Configuration-processor | 配置处理器 定义的类和配置文件绑定一般没有提示，因此可以添加配置处理器，产生相对应的提示. |                                   |
| SpringBoot-Starter-Web             | 后端集成Tomcat MVC                                           | 用于和前端连接                    |
| SpringBoot-starter-test            | Junit4单元测试前端在调用接口前，后端先调用单元测试进行增删改查，注意Junit4和5的问题，注解@RunWith是否添加 |                                   |
| Lombok                             | 实体类方法的快速生成 简化代码                                |                                   |
| mybatis-plus-generator             | 代码生成器                                                   | 3.5.1                             |
| MyBatisX                           | MyBatisPlus插件直接生成mapper,实体类,service                 |                                   |
| jjwt                               | token工具包                                                  | 0.9.0                             |
| fastjson                           | 阿里巴巴的json对象转化工具                                   | 1.2.83                            |
| hutool                             | hutool工具包(简化开发工具类)                                 | [文档](https://hutool.cn/docs/#/) |

## ☀️项目简介

+ 主要使用Vue2和SpringBoot2实现
+ 项目权限控制分别为：用户借阅，图书管理员，系统管理员
+ 开发工具：IDEA2022.1.3(真不推荐用eclipse开发，IDEA项目可以导出为eclipse项目，二者不影响，但需要自己学教程)
+ [IDEA->Eclipse](https://blog.csdn.net/HD202202/article/details/128076400)
+ [Eclipse->IDEA](https://blog.csdn.net/q20010619/article/details/125096051)

+ 学校老师硬性要求软件的话，还是按要求来。可以先问一下是否可以选择其他软件开发。
+ 用户账号密码：  雨伞下的米粒 123456
+ 图书管理员账号密码:   admin 123456
+ 系统管理员账号密码:   root 123456

## ☀️项目详细介绍（亮点)

+ 本项目采用前后端分离的模式，前端构建页面，后端作数据接口，前端调用后端数据接口得到数据，重新渲染页面。
+ 后端已开启CORS跨域支持
+ API认证使用Token认证
+ 前端在Authorization字段提供token令牌
+ 使用HTTP Status Code表示状态
+ 数据返回格式使用JSON
+ 后端采用权限拦截器进行权限校验，并检查登录情况
+ 添加全局异常处理机制，捕获异常，增强系统健壮性
+ 前端用Echarts可视化库实现了图书借阅的分析图标（折线图、饼图），并通过loading配置提高加载体验。
+ 留言组件采用弹幕形式，贴合用户的喜好。
+ 引入knife4j依赖，使用 Swagger + Knife4j 自动生成 OpenAPI 规范的接口文档，前端可以在此基础上使用插件自动生成接口请求代码，降低前后端协作成本
+ 使用ElementUI组件库进行前端界面搭建，快速实现页面生成，并实现了前后端统一权限管理，多环境切换等能力。
+ 基于MyBatis Plus框架的QueryWrapper实现对MySQL数据库的灵活查询，并配合MyBatisX插件自动生成后端CRUD基础代码，减少重复工作。

## ☀️数据库表设计

### t_users表

| 列名          | 数据类型以及长度 | 备注                                              |
|-------------| ---------------- | ------------------------------------------------- |
| user_id     | int(11)          | 主键 非空 自增 用户表的唯一标识                       |
| username    | varchar(32)      | 用户名 非空                                       |
| password    | varchar(32)      | 密码(MD5加密) 非空                                |
| card_name   | varchar(10)      | 真实姓名 非空                                     |
| card_number | Bigint(11)       | 借阅证编号 固定 11位随机生成 非空(后文都改BigInt)     |
| rule_number | int(11)          | 规则编号 可以自定义 也就是权限功能                    |
| status      | int(1)           | 1表示可用 0表示禁用                               |
| create_time | datetime         | 创建时间 Java注解 JsonFormatter                   |
| update_time | datetime         | 更新时间 Java注解 JsonFormatter                   |
| salt        | varchar         | 存储密码哈希值的盐值                                 |

### t_admins表

| 列名        | 数据类型以及长度 | 备注                              |
| ----------- | ---------------- | --------------------------------- |
| admin_id    | int(11)          | 主键 非空 自增 管理员表的唯一标识 |
| username    | varchar(32)      | 用户名 非空                       |
| password    | varchar(32)      | 密码(MD5加密) 非空                |
| admin_name  | varchar(10)      | 管理员真实姓名 非空               |
| status      | int(1)           | 1表示可用 0表示禁用               |
| create_time | datetime         | 创建时间 Java注解 JsonFormatter   |
| update_time | datetime         | 更新时间 Java注解 JsonFormatter   |

### t_book_admins表

| 列名            | 数据类型以及长度 | 备注                            |
| --------------- | ---------------- | ------------------------------- |
| book_admin_id   | int(11)          | 主键 非空 自增 管理表的唯一标识 |
| username        | varchar(32)      | 用户名 非空                     |
| password        | varchar(32)      | 密码(MD5加密)非空               |
| book_admin_name | varchar(10)      | 图书管理员真实姓名 非空         |
| status          | int(1)           | 1表示可用 0表示禁用             |
| email           | varchar(255)     | 电子邮箱                        |
| create_time     | datetime         | 创建时间 Java注解 JsonFormatter |
| update_time     | datetime         | 更新时间 Java注解 JsonFormatter |

### t_books表

| 列名             | 数据类型以及长度 | 备注                            |
| ---------------- | ---------------- | ------------------------------- |
| book_id          | int(11)          | 主键 自增 非空 图书表的唯一标识 |
| book_number      | int(11)          | 图书编号 非空 图书的唯一标识    |
| book_name        | varchar(32)      | 图书名称 非空                   |
| book_author      | varchar(32)      | 图书作者 非空                   |
| book_library     | varchar(32)      | 图书所在图书馆的名称 非空       |
| book_type        | varchar(32)      | 图书类别 非空                   |
| book_location    | varchar(32)      | 图书位置 非空                   |
| book_status      | varchar(32)      | 图书状态(未借出/已借出)         |
| book_description | varchar(100)     | 图书描述                        |
| create_time      | datetime         | 创建时间 Java注解 JsonFormatter |
| update_time      | datetime         | 更新时间 Java注解 JsonFormatter |

### t_books_borrow表

| 列名        | 数据类型以及长度 | 备注                                                         |
| ----------- | ---------------- | ------------------------------------------------------------ |
| borrow_id   | int(11)          | 主键 自增 非空 借阅表的唯一标识                              |
| card_number | int(11)          | 借阅证编号 固定 11位随机生成 非空 用户与图书关联的的唯一标识 |
| book_number | int(11)          | 图书编号 非空 图书的唯一标识                                 |
| borrow_date | datetime         | 借阅日期 Java注解 JsonFormatter                              |
| close_date  | datetime         | 截止日期 Java注解 JsonFormatter                              |
| return_date | datetime         | 归还日期 Java注解 JsonFormatter                              |
| create_time | datetime         | 创建时间 Java注解 JsonFormatter                              |
| update_time | datetime         | 更新时间 Java注解 JsonFormatter                              |

### t_notice表

| 列名            | 数据类型以及长度 | 备注                                |
| --------------- | ---------------- | ----------------------------------- |
| notice_id       | int(11)          | 主键 非空 自增 公告表记录的唯一标识 |
| notice_title    | varchar(32)      | 公告的题目 非空                     |
| notice_content  | varchar(255)     | 公告的内容 非空                     |
| notice_admin_id | int(11)          | 发布公告的管理员的id                |
| create_time     | datetime         | 创建时间 Java注解 JsonFormatter     |
| update_time     | datetime         | 更新时间 Java注解 JsonFormatter     |

### t_violation表

| 列名               | 数据类型以及长度 | 备注                                |
| ------------------ | ---------------- | ----------------------------------- |
| violation_id       | int(11)          | 主键 非空 自增 违章表记录的唯一标识 |
| card_number        | int(11)          | 借阅证编号 固定 11位随机生成 非空   |
| book_number        | int(11)          | 图书编号 非空 图书的唯一标识        |
| borrow_date        | datetime         | 借阅日期 Java注解 JsonFormatter     |
| close_date         | datetime         | 截止日期 Java注解 JsonFormatter     |
| return_date        | datetime         | 归还日期 Java注解 JsonFormatter     |
| violation_message  | varchar(100)     | 违章信息 非空                       |
| violation_admin_id | int(11)          | 违章信息管理员的id                  |
| create_time        | datetime         | 创建时间 Java注解 JsonFormatter     |
| update_time        | datetime         | 更新时间 Java注解 JsonFormatter     |

### t_comment表

| 列名                  | 数据类型以及长度 | 备注                                |
| --------------------- | ---------------- | ----------------------------------- |
| comment_id            | int(11)          | 主键 非空 自增 留言表记录的唯一标识 |
| comment_avatar        | varchar(255)     | 留言的头像                          |
| comment_barrage_style | varchar(32)      | 弹幕的高度                          |
| comment_message       | varchar(255)     | 留言的内容                          |
| comment_time          | int(11)          | 留言的时间(控制速度)                |
| create_time           | datetime         | 创建时间 Java注解 JsonFormatter     |
| update_time           | datetime         | 更新时间 Java注解 JsonFormatter     |

### t_book_rule表

| 列名               | 数据类型以及长度 | 备注                                  |
| ------------------ | ---------------- | ------------------------------------- |
| rule_id            | int(11)          | 主键 非空 自增 借阅规则记录的唯一标识 |
| book_rule_id       | int(11)          | 借阅规则编号 非空                     |
| book_days          | int(11)          | 借阅天数 非空                         |
| book_limit_number  | int(11)          | 限制借阅的本数 非空                   |
| book_limit_library | varchar(255)     | 限制的图书馆 非空                     |
| book_overdue_fee   | double           | 图书借阅逾期后每天费用 非空           |
| create_time        | datetime         | 创建时间 Java注解 JsonFormatter       |
| update_time        | datetime         | 更新时间 Java注解 JsonFormatter       |

### t_book_type表

| 列名         | 数据类型以及长度 | 备注                                  |
| ------------ | ---------------- | ------------------------------------- |
| type_id      | int(11)          | 主键 非空 自增 图书类别记录的唯一标识 |
| type_name    | varchar(32)      | 借阅类别的昵称 非空                   |
| type_content | varchar(255)     | 借阅类别的描述 非空                   |
| create_time  | datetime         | 创建时间 Java注解 JsonFormatter       |
| update_time  | datetime         | 更新时间 Java注解 JsonFormatter       |