### 中午吃什么是每天的重要决策之一

## ☀️技术栈介绍

### ☃️前端主要技术栈

| 技术                         | 作用                                                         | 版本                                                 |
| ---------------------------- | ------------------------------------------------------------ | ---------------------------------------------------- |
| Vue                          | 提供前端交互                                                 | 2.6.14                                               |
| Vue-Router                   | 路由式编程导航                                               | 3.5.1                                                |
| Element-UI                   | 模块组件库，绘制界面                                         | 2.4.5                                                |
| Axios                        | 发送ajax请求给后端请求数据                                   | 1.2.1                                                |
| core-js                      | 兼容性更强，浏览器适配                                       | 3.8.3                                                |
| swiper                       | 轮播图插件（快速实现)                                        | 3.4.2                                                |
| vue-baberrage                | vue弹幕插件(实现留言功能)                                    | 3.2.4                                                |
| vue-json-excel               | 表格导出Excel                                                | 0.3.0                                                |
| html2canvas+jspdf            | 表格导出PDF                                                  | 1.4.1 2.5.1                                          |
| node-polyfill-webpack-plugin | webpack5中移除了nodejs核心模块的polyfill自动引入             | 2.0.1                                                |
| default-passive-events       | **Chrome** 增加了新的事件捕获机制 **Passive Event Listeners**（被动事件侦听器) | 让页面滑动更加流畅，主要用于提升移动端滑动行为的性能 |
| nprogress                    | 发送请求显示进度条(人机交互友好)                             | 0.2.0                                                |
| echarts                      | 数据转图标的好工具(功能强大)                                 | 5.4.1                                                |
| less lessloader              | 方便样式开发                                                 | 4.1.3 11.1.0                                         |

## ☀️项目简介

+ 主要使用Vue2和SpringBoot2实现
+ 项目权限控制分别为：用户借阅，图书管理员，系统管理员
+ 开发工具：IDEA2022.1.3(真不推荐用eclipse开发，IDEA项目可以导出为eclipse项目，二者不影响，但需要自己学教程) 
+ [IDEA->Eclipse](https://blog.csdn.net/HD202202/article/details/128076400)
+ [Eclipse->IDEA](https://blog.csdn.net/q20010619/article/details/125096051)

+ 学校老师硬性要求软件的话，还是按要求来。可以先问一下是否可以选择其他软件开发。
+ 用户账号密码：  相思断红肠 123456
+ 图书管理员账号密码:   admin 123456
+ 系统管理员账号密码:   root 123456
+ [前端样式参考](https://gitee.com/mingyuefusu/tushuguanlixitong)  感谢原作者**明月复苏**

+ 遇到交互功能错误，或者页面无法打开，请用开发者工具F12查看请求和响应状态码情况，当然可能小白不懂，那也没关系，可以加我**QQ：909088445**。白天上课，晚上有空才能回答，感谢体谅！⭐⭐⭐

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

### ⭐用户模块功能介绍

+ 图书查询功能：分页构造器缓解数据过大压力，后端可设置请求数防止爬虫请求数过大，服务器负载过大。模糊查询进行字段搜索。表格均可导出PDF和EXCEL。
+ 读者规则功能：查询现有的借阅规则，借阅规则包括：借阅编号，可借阅图书数量，可借阅天数，可借阅图书馆，过期扣费/天。
+ 查看公告: 可以查询图书管理员发布的公告列表，文字滑动⭐

+ 个人信息: 可以查看个人的借阅证编号，借阅证姓名，规则编号，状态，可以修改个人账户的密码。

+ 借阅信息: 可以查看自身借阅过的图书记录和归还情况
+ 违章信息: 可以查询自身归还的图书是否有违章信息
+ 读者留言: 实现留言功能并以弹幕形式显示

### ⭐图书管理员模块功能介绍

+ 借阅图书: 图书管理员输入借阅证号(用户)和要借的图书编号和当前的时间，点击借阅。
+ 归还图书: 输入图书编号查看图书是否逾期，并且可以设置违规信息，然后选择是否归还图书
+ 借书报表: 用于查询已经借阅并归还的书籍列表，同样使用分页构造器和模糊查询字段，显示借阅证编号，图书编号，借阅日期，截止日期，归还日期，违章信息，处理人。
+ 还书报表: 用于查询已经借阅但是还未归还的书籍列表，显示借阅证编号，图书编号，借阅日期，截止日期。

+ 发布公告: 可以查询当前发布的公告列表，并进行删除，修改，增加功能，分页构造器用于缓解数据量大的情况。

### ⭐系统管理员模块功能介绍

+ 书籍管理: 可以查询当前的所有图书，显示图书编号，图书昵称，作者，图书馆，分类，位置，状态，描述。可以进行添加，修改，删除图书。利用分页构造器实现批量查询。利用模糊查询实现图书搜索功能。利用插件实现PDF和EXCEL导出。
+ 书籍类型: 显示查询当前的所有图书类型，可以进行添加，修改，删除图书类型，利用分页构造器实现批量查询，缓解数据压力。
+ 借阅证管理: 可以查询当前的所有借阅证列表，也就是用户数量，可以进行添加，修改，删除操作。同样实现分页。
+ 借阅信息查询: 可以查询当前已经完成借阅和归还的记录，显示借阅证号，书籍编号，借阅日期，截止日期，归还日期，违章信息，处理人。分页功能，PDF和EXCEL导出。
+ 借阅规则管理: 可以查询当前所有的借阅规则，显示限制借阅天数，限制本数，限制图书馆，逾期费用，可以进行添加、删除、修改操作。
+ 图书管理员管理: 显示当前的图书管理员列表，显示账号，姓名，邮箱，可以进行添加、删除、修改操作。
+ 系统管理: 可以查询一个月内的借阅量，以一周为时间间隔，计算借阅量，用Echarts实现折线图的展示。

## ☀️数据库表设计

### t_users表

| 列名        | 数据类型以及长度 | 备注                                              |
| ----------- | ---------------- | ------------------------------------------------- |
| user_id     | int(11)          | 主键 非空 自增 用户表的唯一标识                   |
| username    | varchar(32)      | 用户名 非空                                       |
| password    | varchar(32)      | 密码(MD5加密) 非空                                |
| card_name   | varchar(10)      | 真实姓名 非空                                     |
| card_number | Bigint(11)       | 借阅证编号 固定 11位随机生成 非空(后文都改BigInt) |
| rule_number | int(11)          | 规则编号 可以自定义 也就是权限功能                |
| status      | int(1)           | 1表示可用 0表示禁用                               |
| create_time | datetime         | 创建时间 Java注解 JsonFormatter                   |
| update_time | datetime         | 更新时间 Java注解 JsonFormatter                   |

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