/*
 Navicat Premium Data Transfer

 Source Server         : 43.139.154.220
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : 43.139.154.220:3306
 Source Schema         : bms_boot

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 24/05/2023 12:53:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admins
-- ----------------------------
DROP TABLE IF EXISTS `t_admins`;
CREATE TABLE `t_admins`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员表的唯一标识',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码(MD5加密)',
  `admin_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员真实姓名',
  `status` int(1) NOT NULL COMMENT '1表示可用 0表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1624 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_admins
-- ----------------------------
INSERT INTO `t_admins` VALUES (1623, 'root', 'da4c189f916ae0b5aeb59389df4f0df0', '小白条', 1, '2023-02-03 19:41:47', '2023-02-03 19:41:47');

-- ----------------------------
-- Table structure for t_book_admins
-- ----------------------------
DROP TABLE IF EXISTS `t_book_admins`;
CREATE TABLE `t_book_admins`  (
  `book_admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书管理员表的唯一标识',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码md5加密',
  `book_admin_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书管理员真实姓名',
  `status` int(1) NOT NULL COMMENT '1表示可用 0表示禁用',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`book_admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1550 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_book_admins
-- ----------------------------
INSERT INTO `t_book_admins` VALUES (1546, 'admin1', 'da4c189f916ae0b5aeb59389df4f0df0', '张三', 1, '229@qq.com', '2023-05-13 14:50:06', '2023-05-13 14:50:06');
INSERT INTO `t_book_admins` VALUES (1547, '123456', 'da4c189f916ae0b5aeb59389df4f0df0', 'test', 1, '', '2023-05-15 09:10:13', '2023-05-15 09:10:13');
INSERT INTO `t_book_admins` VALUES (1549, 'admin', 'da4c189f916ae0b5aeb59389df4f0df0', '随性', 1, '2246317529@qq.com', '2023-05-17 14:22:28', '2023-05-17 14:22:28');

-- ----------------------------
-- Table structure for t_book_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_book_rule`;
CREATE TABLE `t_book_rule`  (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅规则记录的唯一标识',
  `book_rule_id` int(11) NOT NULL COMMENT '借阅规则编号',
  `book_days` int(11) NOT NULL COMMENT '借阅天数',
  `book_limit_number` int(11) NOT NULL COMMENT '限制借阅的本数',
  `book_limit_library` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '限制的图书馆',
  `book_overdue_fee` double NOT NULL COMMENT '图书借阅后每天逾期费用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_book_rule
-- ----------------------------
INSERT INTO `t_book_rule` VALUES (1, 188, 50, 1, '教师之家,南图,北图', 1.5, '2023-02-04 17:45:32', '2023-02-04 17:45:32');
INSERT INTO `t_book_rule` VALUES (2, 688, 150, 30, '教师之家,南图,北图', 0.5, '2023-02-04 17:46:19', '2023-02-04 17:46:19');
INSERT INTO `t_book_rule` VALUES (3, 88, 20, 5, '教师之家,南图,北图', 2.5, '2023-02-04 17:46:19', '2023-02-04 17:46:19');
INSERT INTO `t_book_rule` VALUES (4, 588, 100, 50, '南图,北图,教师之家', 3.2, '2023-02-15 14:01:00', '2023-02-15 14:01:00');

-- ----------------------------
-- Table structure for t_book_type
-- ----------------------------
DROP TABLE IF EXISTS `t_book_type`;
CREATE TABLE `t_book_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书类别唯一标识',
  `type_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借阅类别的昵称',
  `type_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '借阅类别的描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_book_type
-- ----------------------------
INSERT INTO `t_book_type` VALUES (2, '儿童读物', '儿童读物是指少年儿童阅读的文学作品、知识读物、连环画、游戏样式读物等的总称', '2023-02-04 17:43:30', '2023-02-04 17:43:30');
INSERT INTO `t_book_type` VALUES (3, '工具书', '工具书是专供查找知识信息的文献，是系统汇集某方面的资料，按特定方法加以编排，以供需要时查考使用。', '2023-02-04 17:43:30', '2023-02-04 17:43:30');
INSERT INTO `t_book_type` VALUES (5, '童话', '童话，儿童文学的一种体裁，通过丰富的想象、幻想和夸张来编写适合于儿童欣赏的故事。童话具有语言通俗生动，故事情节离奇曲折、引人入胜的特点。童话常采用拟人的手法，赋予鸟兽虫鱼花草树木等生命，使其拥有人的思想感情。', '2023-02-12 14:55:14', '2023-02-12 14:55:14');
INSERT INTO `t_book_type` VALUES (7, '教科书', '主要是用于更等院校教科书', '2023-05-17 15:16:46', '2023-05-17 15:16:46');

-- ----------------------------
-- Table structure for t_books
-- ----------------------------
DROP TABLE IF EXISTS `t_books`;
CREATE TABLE `t_books`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书表唯一标识',
  `book_number` bigint(11) NOT NULL COMMENT '图书编号 图书的唯一标识',
  `book_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书名称',
  `book_author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书作者',
  `book_library` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书所在图书馆名称',
  `book_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书类别',
  `book_location` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书位置',
  `book_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书状态',
  `book_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图书描述',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_books
-- ----------------------------
INSERT INTO `t_books` VALUES (1, 1234, '红楼梦', '曹雪芹', '南图', '小说', 'E1', '已借出', '《红楼梦》，原名《石头记》，中国古代章回体长篇小说，中国古典四大名著之一。', '2023-02-04 17:51:04', '2023-02-04 17:51:04');
INSERT INTO `t_books` VALUES (2, 1235, '百年孤独', '加西亚·马尔克斯', '北图', '小说', 'E2', '已借出', '《百年孤独》，是哥伦比亚作家加西亚·马尔克斯创作的长篇小说，是其代表作，也是拉丁美洲魔幻现实主义文学的代表作，被誉为“再现拉丁美洲历史社会图景的鸿篇巨著”。', '2023-02-04 17:53:27', '2023-02-04 17:53:27');
INSERT INTO `t_books` VALUES (3, 1236, '三体', '刘慈欣', '教师之家', '小说', 'F8', '已借出', '科幻小说，全名《地球往事三部曲》，是刘慈欣编写的史诗级巨作，是一部典型的硬科幻作品。', '2023-02-04 17:53:27', '2023-02-04 17:53:27');
INSERT INTO `t_books` VALUES (4, 1237, '战争与和平', '列夫·尼古拉耶维奇·托尔斯泰', '南图', '小说', 'A3', '已借出', '该作以1812年的卫国战争为中心，反映从1805到1820年间的重大历史事件。以鲍尔康斯、别祖霍夫、罗斯托夫和库拉金四大贵族的经历为主线，在战争与和平的交替描写中把众多的事件和人物串联起来', '2023-02-10 17:00:48', '2023-02-10 17:00:48');
INSERT INTO `t_books` VALUES (5, 1238, '巴黎圣母院', '雨果', '北图', '小说', 'B1', '未借出', '本书以1482年的法国为背景，塑造了一个个栩栩如生的形象——天真纯洁的吉普赛姑娘爱丝美拉达、年轻英俊...', '2023-02-10 17:03:32', '2023-02-10 17:03:32');
INSERT INTO `t_books` VALUES (7, 50970375442, '时间简史', '斯蒂芬·威廉·霍金', '教师之家', '小说', 'E66', '未借出', '讲述了关于宇宙本性的最前沿知识，包括：我们的宇宙图像、空间和时间、膨胀的宇宙、不确定性原理、黑洞、宇宙的起源和命运等内容，深入浅出地介绍了遥远星系、...', '2023-02-11 21:55:40', '2023-02-11 21:55:40');
INSERT INTO `t_books` VALUES (8, 78581515059, '三毛流浪记', '乐平', '北图', '儿童读物', 'A23', '未借出', '三毛流浪记》创作于1947年，当年在《大公报》上连载。作者凭着一只笔，几张画，无需一个文字甚至符号，把这个流浪儿童在旧社会被奴役、被欺负、被凌辱、被残踏的悲惨遭遇表现得淋漓尽致。', '2023-02-12 14:02:33', '2023-02-12 14:02:33');
INSERT INTO `t_books` VALUES (9, 74103469282, '银河帝国', '艾萨克·阿西莫夫', '教师之家', '科幻', 'B32', '未借出', '《银河帝国》，作者是艾萨克·阿西莫夫（英语：Isaac Asimov，1920年1月2日—1992年4月6日），在机器人的帮助下，人类迅速掌握了改造外星球的技术，开启了恢弘的星际殖民运动；人类在银河系如蝗虫般繁衍扩张，带着他们永不磨灭的愚昧与智慧、贪婪与良知，登上了一个个荒凉的星球，并将银河系卷入漫长的星际战国时代，直至整个银河被统一，一个统治超过2500万个住人行星、疆域横跨十万光年、总计数兆亿人口的庞大帝国崛起——银河帝国。', '2023-02-12 14:07:12', '2023-02-12 14:07:12');
INSERT INTO `t_books` VALUES (10, 7532651593, '海伯利安', '丹·西蒙斯', '北图', '科幻', 'G8', '未借出', '译许珀里翁、希贝里安、希佩里翁、许佩利翁、海柏利昂等，希腊神话中的泰坦十二神之一，大地女神盖亚（Gaea）和天穹之神乌拉诺斯（Uranus）之子。（十二泰坦为六男六女：河流之神俄刻阿诺斯、光明之神海伯利安、智慧之神科俄斯、时空之神克洛诺斯、生长之神克瑞斯、死亡之神伊阿佩托斯；海洋女神忒提斯、女神忒亚、月亮女神福柏、时光女神瑞亚、记忆女神谟涅摩叙涅、正义女神忒弥斯）。', '2023-02-12 14:10:11', '2023-02-12 14:10:11');
INSERT INTO `t_books` VALUES (11, 34619710875, '狼王梦', '沈石溪', '北图', '小说', 'N43', '未借出', '本书说的是大公狼黑桑想当狼王，和母狼紫岚一起想推翻旧狼王洛戛 [3]  ，可是这天黑桑不幸地陪同野猪丧命于鬼谷中。紫岚为黑桑生下了五个孩子，第一只在出生时，在冰冷的洪水中被冻死了。', '2023-02-12 14:12:49', '2023-02-12 14:12:49');
INSERT INTO `t_books` VALUES (14, 56029858563, '流行病的故事：从霍乱到埃博拉', '[美国] 索尼娅·沙阿', '北图', '小说', 'J78', '未借出', '过去数十年来，我们拥抱着工业化与全球化带来的全新生活方式，也比以往任何时候 更能感受到流行病的存在。然而，我们对流行病的认知充斥着误解、轻视或恐惧。 \n在《流行病的故事》中，屡获大奖的科普作家索尼娅·沙阿向我们展现了关于流行病鲜为人知的真相，深刻揭示了暗藏在每次疫情背后的气候、社会、文化等因素。流行病侵害着人类健康，有时甚至令国家陷入危机。但另一方面，它也改变了人类的进化轨迹，塑造了人类的行为与文明。 ', '2023-02-23 16:49:31', '2023-02-23 16:49:31');
INSERT INTO `t_books` VALUES (15, 23457140746, '危崖：生存性风险与人类的未来', '［澳］托比·奥德（Toby Ord）', '北图', '科幻', 'J64', '未借出', '未来100年，人类面临的生存性灾难概率是 六分之一！核战争、气候变化、生物技术、人工智能、基因工程、反乌托邦社会……哪一个最有可能让我们面临灭顶之灾？ ', '2023-02-23 16:50:08', '2023-02-23 16:50:08');
INSERT INTO `t_books` VALUES (40, 38980198460, 'SQL进阶教程（第2版）', '吴炎昌 侯振龙', '北图', '计算机', '052133C', '未借出', '本书是畅销书《SQL基础教程》的作者MICK为志在向中级进阶的数据库工程师编写的一本SQL技能提升指南。全书可分为两大部分。第一部分介绍了SQL语言不同寻常的使用技巧，带领读者重新认识CASE表达式、窗口函数、自连接、EXISTS谓词、HAVING子句、外连接、行间比较、集合运算、数列处理等SQL常用技术，发掘它们的新用法。这部分不仅穿插讲解了这些技巧背后的逻辑和相关知识，而且辅以丰富的示例程序，旨在帮助读者从面向过程的思维方式转换为面向集合的思维方式。第二部分介绍了关系数据库的发展史，并从集合论和逻辑', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (41, 2408369775, 'Excel机器学习', '李巧君', '北图', '计算机', '975407U', '未借出', '本书通过Excel示例介绍常用的机器学习算法和数据挖掘技术。许多机器学习任务的目的是找到数据中的隐藏模式。Excel能够清楚地展示机器学习建模过程的每一步及中间结果，让你不仅知其然，还知其所以然。第1章解释用Excel学习机器学习的益处。第2～12章分别介绍线性回归、k均值聚类、线性判别分析、交叉验证、logistic回归、k最近邻、朴素贝叶斯分类、决策树、关联分析、神经网络、文本挖掘。第13章总结全书内容，并为读者指出继续学习的方向。', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (43, 10242684046, '改变世界的17个方程', '劳佳', '南图', '计算机', '159635X', '未借出', '方程是世界的基本法则，改变了人类的命运，从波动方程、麦克斯韦方程组，到用于预测金融市场的布莱克–斯科尔斯方程，方程在生活中无处不在。毕达哥拉斯定理如何催生全球卫星定位系统？对数如何在建筑学中发挥应用？虚数为何对数码相机的发展至关重要？薛定谔的猫到底发生了什么？……\r\n本书选取17个对人类社会产生重要影响的方程，以生动有趣的笔触讲述了它们背后的历史故事，以及它们如何推动了人类文明的发展，并从数学的角度对地球万物进行了独创性的探索与阐释。', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (44, 25601652366, '学透Spring：从入门到项目实战', '', '北图', '计算机', '885175F', '未借出', '本书的目标是让大家又快又好地打包学透 Spring 技术栈，内容将涉及 Spring Framework、Spring Boot、 Spring Cloud 等 Spring 家族成员。 本书分为四部分：第一部分“Spring 入门”，先学习基本的 Spring IoC、AOP，随后过渡到当下热门的 Spring Boot ；第二部分“Spring 中的数据操作”，其中既有常规的 SQL、NoSQL 数据操作，也有进阶的数据源配置和缓存抽象；第三部分“使用 Spring 开发 Web 应用”，讲述 Sp', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (46, 3758465520, 'BERT基础教程：Transformer大模型实战', '周参', '南图', '计算机', '608176D', '未借出', '本书聚焦谷歌公司开发的BERT自然语言处理模型，由浅入深地介绍了BERT的工作原理、BERT的各种变体及其应用。本书呈现了大量示意图、代码和实例，详细解析了如何训练BERT模型、如何使用BERT模型执行自然语言推理任务、文本摘要任务、问答任务、命名实体识别任务等各种下游任务，以及如何将BERT模型应用于多种语言。通读本书后，读者不仅能够全面了解有关BERT的各种概念、术语和原理，还能够使用BERT模型及其变体执行各种自然语言处理任务。', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (47, 72721255493, '战略思维十二讲：影响关键决策的高维认知', '', '教师之家', '计算机', '446168J', '未借出', '·2016 年，很多消费电子公司的高层倡导全公司学习作者专栏文章《OPPO 和 vivo 的“人民战争”》；\r\n·2019 年，中国平安董事长马明哲针对周掌柜战略咨询团队的中国平安相关研究写了2000 多字读后感，还通过邮件群发并号召全公司20多万人阅读和学习；\r\n·德国博世、百度、OPPO、荣耀等公司曾积极评价和应用本书中的一些重要理念……\r\n\r\n成大功者，必有大战略。对于企业家来说如此，对于普通人来说亦如此。\r\n\r\n现在流行长期主义，其本质即战略稳定性，是找到了很湿的雪和很长的坡之后的滚雪球。但是，', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (49, 51561061281, '深度匹配学习：面向搜索与推荐', '朱小虎', '教师之家', '计算机', '615357Q', '未借出', '本书从语义匹配的角度解决搜索引擎和推荐系统的关键痛点，为构建解决语义匹配问题的深度学习模型提供了通用框架。第1章概述搜索和推荐中的语义匹配问题，以及近年来的研究进展。第2章介绍传统匹配模型，包括潜在空间模型。第3章介绍深度学习技术在构建匹配模型时的应用。第4章和第5章分别介绍用于搜索和推荐的深度匹配模型，并将当前的深度学习解决方案分为两类：表示学习方法和匹配函数学习方法。第6章对全书内容做了总结，并为读者指明进一步学习的方向。', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (50, 32652836403, '可编程网络自动化', '门佳，李巧君', '教师之家', '计算机', '050299S', '未借出', '本书提供了可编程网络自动化的基本技能，使用了包括Linux、Python、JSON和XML在内的一系列技术。本书涵盖以下内容：Python编程基础、网络自动化所需的Linux基础、数据格式和数据模型，并介绍了Jinja模板及其在创建网络设备配置中的适用性、应用程序接口在网络自动化中的作用、使用Git进行源代码管理以在自动化过程中管理代码更改，等等。', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (51, 23911384716, '不公平优势：如何找到阻力最小的成功路径', '王小皓', '南图', '计算机', '133514E', '未借出', '不管是个人，还是企业，要实现目标、获得成功，往往都要先构建自己的竞争优势。有些优势是我们未曾意识到自己本就拥有的，有些优势是我们明确知道自己尚未具备的，但是怎样的优势组合才是真正有效的？本书提出了不公平优势的概念与由5种不公平优势构成的MILES框架，并结合大量案例，介绍了如何利用自己的不公平优势获得商业上的成功，同时，作为成功的创业者，两位作者还非常贴心地提供了快速创业入门指南。\r\n\r\n本书适合个人贡献者和创业者阅读。', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (52, 61573544410, '时间序列分析实战：基于机器学习和统计学', '王祎 冯英睿', '北图', '计算机', '926036H', '未借出', '时间序列在现代生活中无处不在，它也是数据分析的重要对象。本书介绍时间序列分析的实用技巧，展示如何结合机器学习方法和传统的统计方法来分析各类时间序列数据，并提供Python示例和R示例。本书共有17章，首先概览时间序列分析的历史，然后介绍数据的获取、清洗、模拟和存储，接着关注可用于时间序列分析的建模技术，最后探讨时间序列分析在几个常见领域中的应用。', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (54, 2383181410, '微积分溯源：伟大思想的历程', '陈见柯 林开亮 叶卢庆', '教师之家', '计算机', '287018Y', '未借出', '本书讲述了一种理解和学习微积分的新思路。书中通过探索微积分发展历程背后的数学动机，展现了这一数学基本工具的魅力。作者根据自己研究和教授微积分的丰富经验，结合多年从事中学和大学数学教育的心得体会，对传统的微积分教学方式，即大多按照从极限、微分、积分到级数的顺序进行学习的方法提出了异议，探讨了一种更有趣、更易被接受和理解的学习方法。作者写过不少富有启发意义的微积分教材，此次利用自己在教学与研究方面的特长，写成了这本内容丰富、风格有趣的“小书”。本书适合中学以上水平的数学爱好者、学生和教师阅读。', '2023-03-19 15:35:36', '2023-03-19 15:35:36');
INSERT INTO `t_books` VALUES (86, 29012240157, 'BERT基础教程：Transformer大模型实战', '周参', '北图', '计算机', 'P254787', '未借出', '本书聚焦谷歌公司开发的BERT自然语言处理模型，由浅入深地介绍了BERT的工作原理、BERT的各种变体及其应用。本书呈现了大量示意图、代码和实例，详细解析了如何训练BERT模型、如何使用BERT模型执行自然语言推理任务、文本摘要任务、问答任务、命名实体识别任务等各种下游任务，以及如何将BERT模型应用于多种语言。通读本书后，读者不仅能够全面了解有关BERT的各种概念、术语和原理，还能够使用BERT模型及其变体执行各种自然语言处理任务。', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (87, 9378134736, '深度匹配学习：面向搜索与推荐', '朱小虎', '南图', '计算机', 'Q546746', '已借出', '本书从语义匹配的角度解决搜索引擎和推荐系统的关键痛点，为构建解决语义匹配问题的深度学习模型提供了通用框架。第1章概述搜索和推荐中的语义匹配问题，以及近年来的研究进展。第2章介绍传统匹配模型，包括潜在空间模型。第3章介绍深度学习技术在构建匹配模型时的应用。第4章和第5章分别介绍用于搜索和推荐的深度匹配模型，并将当前的深度学习解决方案分为两类：表示学习方法和匹配函数学习方法。第6章对全书内容做了总结，并为读者指明进一步学习的方向。', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (88, 17015709356, '时间序列分析实战：基于机器学习和统计学', '王祎 冯英睿', '南图', '计算机', 'X447307', '未借出', '时间序列在现代生活中无处不在，它也是数据分析的重要对象。本书介绍时间序列分析的实用技巧，展示如何结合机器学习方法和传统的统计方法来分析各类时间序列数据，并提供Python示例和R示例。本书共有17章，首先概览时间序列分析的历史，然后介绍数据的获取、清洗、模拟和存储，接着关注可用于时间序列分析的建模技术，最后探讨时间序列分析在几个常见领域中的应用。', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (89, 63868689083, '游戏化思维：从激励到沉浸', '', '北图', '计算机', 'Q037607', '未借出', '本书是通俗介绍“游戏化”的普及读物。书中通过梳理游戏化的相关研究，系统介绍了游戏化思维中的核心概念——激励和动机，并讲解了构建游戏化系统的基本要素和高级要素。作者不仅整理了经典游戏机制中的游戏化思维，还分析了社交平台、在线教育等互联网产品中对游戏化思维的运用，总结了实用的游戏化思维工具，可以帮助读者使用将其应用在工作和生活中，提升效率，增加乐趣。本书适合作为游戏化方向的研究者、培训师参考资料，也适合作游戏玩家、产品经理、教师阅读参考。', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (90, 57548855840, '用数据讲故事（修订版）', '陆昊 吴梦颖', '南图', '计算机', 'F103395', '未借出', '本书通过大量案例研究介绍数据可视化的基础知识，以及如何利用数据创造出吸引人的、信息量大的、有说服力的故事，进而达到有效沟通的目的。具体内容包括：如何充分理解上下文，如何选择合适的图表，如何消除杂乱，如何聚焦受众的视线，如何像设计师一样思考，以及如何用数据讲故事。', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (91, 37878499145, '计算机体系结构：量化研究方法（第6版）', '贾洪峰', '北图', '计算机', 'V381970', '未借出', '本书是权威的计算机体系结构著作，是久负盛名的经典作品。书中系统地介绍了计算机系统的设计基础、指令集系统结构、流水线和指令集并行技术、层次化存储系统与存储设备、互连网络以及多处理器系统等重要内容。这一版新增一章，专门介绍领域专用体系结构。本书对近些年火热的云计算、手机客户端技术、人工智能等相关内容也有涉猎。\r\n本书既可作为高等院校计算机专业本科生或研究生教材，也可作为从事计算机体系结构或计算机系统设计的工程技术人员的参考书。', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (92, 58736374811, '详解HTTP：协议基础与Go语言实现', '侯振龙', '南图', '计算机', 'O026111', '未借出', '本书沿着HTTP/1.0、HTTP/1.1、HTTP/2和HTTP/3的发展历史，从方法和路径、首部、主体、状态码这4个HTTP的基本元素讲起，详细介绍了浏览器内部的动作、浏览器与服务器进行交互的方法等。针对各个版本的HTTP，分别从语法和语义两个角度，通俗易懂地讲解了HTTP的协议规范，并结合用Go语言实现的具体的客户端代码示例，为读者阐明了HTTP是如何通过功能设计和扩展来实现高速化和安全性目标的。 本书内容全面，网罗了与HTTP相关的各种技术，包括简单的HTTP访问、表单的发送、缓存和Cookie', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (94, 29585198709, '中国游戏风云', '', '北图', '计算机', 'M917289', '未借出', '本书是系统梳理中国游戏史发展的通俗读物，书中为以时间为序，生动讲述了中国早期游戏市场、单机游戏、网络游戏、网页游戏、手机游戏及中国电子竞技行业的发展历程，描绘了中国游戏产业的演进趋势和发展脉络。此外，作者还整理、分析了游戏产业的环境变化及其影响因素，披露了大量不为大众所知的行业故事和行业数据，并结合当前市场对未来游戏世界的趋势做了预测。本书可作为游戏从业者、投资者、研究者的资料性读物，也适合游戏玩家阅读参考。', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (95, 7819287135, '面向对象是怎样工作的（第3版）', '侯振龙', '北图', '计算机', 'H215958', '未借出', '本书以图配文的形式，直观易懂地介绍了面向对象的全貌及其包含的各项技术，包括面向对象编程、框架、设计模式、UML、建模、面向对象设计和敏捷开发方法等。对于各项技术是如何使用的（How），书中只进行简要的说明，而重点介绍这些技术是什么（What），以及为什么需要这些技术（Why）。另外，“编程往事”专栏介绍了作者年轻时的一些经历；“对象的另一面”专栏以与正文不同的视角讲解面向对象这一概念普及的背景和原因，通俗有趣；“当今的OOP”专栏介绍了Java、Python、Ruby、JavaScript等当今流行的编', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (96, 41408706970, 'Vue.js技术内幕', '', '北图', '计算机', 'R767062', '未借出', '本书将带领读者阅读 Vue.js 3.0 的源码，通过大量注释、流程图，将每部分源码的前因后果呈现给大家，帮助工程师地体会 Vue 框架的设计思想。全书共七部分，24 章，作者结合实际用例，循序渐进地介绍了 Vue.js 的整体设计、组件、响应式原理、编译和优化、实用特性、内置组件、官方生态等内容。阅读本书不仅可以深入理解Vue.js 的内核实现，还能学习到阅读源码的技巧，提高业务逻辑分析能力和重构代码的能力。\r\n本书面向有 Vue.js、React 或者 Angular 等框架使用经验的，对源码设计感', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (97, 79237771329, 'Python深度学习（第2版）', '张亮', '教师之家', '计算机', 'G576319', '未借出', '本书由流行深度学习框架Keras之父弗朗索瓦·肖莱执笔，通过直观的解释和丰富的示例帮助你构建深度学习知识体系。作者避免使用数学符号，转而采用Python代码来解释深度学习的核心思想。全书共计14章，既涵盖了深度学习的基本原理，又体现了这一迅猛发展的领域在近几年里取得的重要进展，包括Transformer架构的原理和示例。读完本书后，你将能够使用Keras解决从计算机视觉到自然语言处理等现实世界的诸多问题，包括图像分类、图像分割、时间序列预测、文本分类、机器翻译、文本生成等。', '2023-03-19 15:45:07', '2023-03-19 15:45:07');
INSERT INTO `t_books` VALUES (98, 57968293915, '趣学贝叶斯统计：橡皮鸭、乐高和星球大战中的统计学', '王凌云', '北图', '计算机', 'W205811', '未借出', '本书通过简单的解释和有趣的示例帮助你全面了解贝叶斯统计。举几个例子：你可以评估UFO出现在自家后院中的可能性、《星球大战》中汉•索罗穿越小行星带幸存下来的可能性、抓鸭子中大奖游戏的公平性，并学会用乐高积木理解贝叶斯定理。通过阅读本书，你会学习如何衡量自己所持信念的不确定性，理解贝叶斯定理并了解它的作用，计算后验概率、似然和先验概率，计算分布以查看数据范围，比较假设并从中得出可靠的结论。', '2023-03-19 15:45:07', '2023-03-19 15:45:07');

-- ----------------------------
-- Table structure for t_books_borrow
-- ----------------------------
DROP TABLE IF EXISTS `t_books_borrow`;
CREATE TABLE `t_books_borrow`  (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅表唯一标识',
  `card_number` bigint(11) NOT NULL COMMENT '借阅证编号 固定11位随机生成 用户和图书关联的唯一标识',
  `book_number` bigint(11) NOT NULL COMMENT '图书编号 图书唯一标识',
  `borrow_date` datetime NOT NULL COMMENT '借阅日期',
  `close_date` datetime NOT NULL COMMENT '截止日期',
  `return_date` datetime NULL DEFAULT NULL COMMENT '归还日期',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`borrow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_books_borrow
-- ----------------------------
INSERT INTO `t_books_borrow` VALUES (1, 18012345678, 1234, '2023-02-05 18:48:19', '2023-03-27 18:48:19', '2023-02-25 18:48:19', '2023-02-05 18:48:19', '2023-02-05 18:48:19');
INSERT INTO `t_books_borrow` VALUES (2, 18012345678, 1235, '2023-02-05 18:48:51', '2023-03-27 18:48:51', '2023-02-28 18:48:51', '2023-02-05 18:48:51', '2023-02-05 18:48:51');
INSERT INTO `t_books_borrow` VALUES (3, 18012345678, 1236, '2023-02-05 18:48:51', '2023-03-27 18:48:51', '2023-03-05 18:48:51', '2023-02-05 18:48:51', '2023-02-05 18:48:51');
INSERT INTO `t_books_borrow` VALUES (11, 18012345678, 1234, '2023-02-08 19:06:05', '2023-03-30 19:06:05', '2023-02-08 19:44:21', '2023-02-08 19:06:05', '2023-02-08 19:06:05');
INSERT INTO `t_books_borrow` VALUES (12, 18012345678, 1235, '2023-02-08 19:49:14', '2023-03-30 19:49:14', '2023-02-08 19:49:45', '2023-02-08 19:49:14', '2023-02-08 19:49:14');
INSERT INTO `t_books_borrow` VALUES (13, 18012345678, 1236, '2023-02-08 19:51:07', '2023-03-30 19:51:07', '2023-02-12 19:46:17', '2023-02-08 19:51:08', '2023-02-08 19:51:08');
INSERT INTO `t_books_borrow` VALUES (14, 18012345678, 1234, '2023-02-08 20:28:39', '2023-03-30 20:28:39', '2023-02-12 19:46:07', '2023-02-08 20:28:39', '2023-02-08 20:28:39');
INSERT INTO `t_books_borrow` VALUES (15, 18012345678, 1235, '2023-02-08 20:28:46', '2023-03-30 20:28:46', '2023-02-12 19:46:12', '2023-02-08 20:28:46', '2023-02-08 20:28:46');
INSERT INTO `t_books_borrow` VALUES (16, 18012345678, 1234, '2023-02-12 19:53:14', '2023-04-03 19:53:14', '2023-02-12 19:53:35', '2023-02-12 19:53:15', '2023-02-12 19:53:15');
INSERT INTO `t_books_borrow` VALUES (17, 18012345678, 1235, '2023-02-12 19:53:26', '2023-04-03 19:53:26', '2023-02-12 19:58:28', '2023-02-12 19:53:27', '2023-02-12 19:53:27');
INSERT INTO `t_books_borrow` VALUES (18, 18012345678, 1234, '2023-02-12 19:59:23', '2023-04-03 19:59:23', '2023-02-12 19:59:33', '2023-02-12 19:59:23', '2023-02-12 19:59:23');
INSERT INTO `t_books_borrow` VALUES (19, 18012345678, 1234, '2023-02-12 20:09:55', '2023-04-03 20:09:55', '2023-02-12 20:10:03', '2023-02-12 20:09:56', '2023-02-12 20:09:56');
INSERT INTO `t_books_borrow` VALUES (30, 18012345678, 1234, '2023-04-13 15:12:39', '2023-06-02 15:12:39', '2023-05-10 20:02:53', '2023-04-13 15:12:42', '2023-04-13 15:12:42');
INSERT INTO `t_books_borrow` VALUES (42, 18012345678, 1236, '2023-05-10 20:13:30', '2023-06-29 20:13:30', '2023-05-10 20:13:40', '2023-05-10 20:13:31', '2023-05-10 20:13:31');
INSERT INTO `t_books_borrow` VALUES (43, 18012345678, 1234, '2023-05-10 20:18:24', '2023-06-29 20:18:24', NULL, '2023-05-10 20:18:24', '2023-05-10 20:18:24');
INSERT INTO `t_books_borrow` VALUES (44, 18012345678, 9378134736, '2023-05-20 09:54:24', '2023-07-09 09:54:24', '2023-05-20 14:21:23', '2023-05-20 09:54:25', '2023-05-20 09:54:25');
INSERT INTO `t_books_borrow` VALUES (45, 18012345678, 9378134736, '2023-05-20 14:21:36', '2023-07-09 14:21:36', NULL, '2023-05-20 14:21:37', '2023-05-20 14:21:37');
INSERT INTO `t_books_borrow` VALUES (46, 18012345678, 1235, '2023-05-20 14:22:01', '2023-07-09 14:22:01', NULL, '2023-05-20 14:22:03', '2023-05-20 14:22:03');
INSERT INTO `t_books_borrow` VALUES (47, 18012345678, 1236, '2023-05-20 14:22:07', '2023-07-09 14:22:07', NULL, '2023-05-20 14:22:08', '2023-05-20 14:22:08');
INSERT INTO `t_books_borrow` VALUES (48, 18012345678, 1237, '2023-05-20 14:22:12', '2023-07-09 14:22:12', NULL, '2023-05-20 14:22:13', '2023-05-20 14:22:13');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言表唯一标识',
  `comment_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言的头像 链接',
  `comment_barrage_style` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '弹幕的高度(样式)',
  `comment_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '弹幕的内容',
  `comment_time` int(11) NOT NULL COMMENT '留言的时间(控制速度)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'wubai', '好好学习,天天向上', 6, '2023-02-06 19:14:44', '2023-02-06 19:14:44');
INSERT INTO `t_comment` VALUES (2, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'sibai', '学习如逆水行舟,不进则退', 8, '2023-02-06 19:15:19', '2023-02-06 19:15:19');
INSERT INTO `t_comment` VALUES (3, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'sanbai', '平凡的生活亦能有非凡的人生', 7, '2023-02-06 19:15:19', '2023-02-06 19:15:19');
INSERT INTO `t_comment` VALUES (8, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'yiqian', '祝你天天开心', 7, '2023-02-06 21:26:32', '2023-02-06 21:26:32');
INSERT INTO `t_comment` VALUES (9, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'sibai', 'The only way to conquer a fear is to face it', 6, '2023-02-06 21:27:50', '2023-02-06 21:27:50');
INSERT INTO `t_comment` VALUES (10, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'qibai', '1', 9, '2023-02-24 23:51:36', '2023-02-24 23:51:36');
INSERT INTO `t_comment` VALUES (11, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'liubai', '书籍是人类进步的阶梯', 5, '2023-02-26 12:41:59', '2023-02-26 12:41:59');
INSERT INTO `t_comment` VALUES (12, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'wubai', '棒！！！', 6, '2023-02-26 16:38:53', '2023-02-26 16:38:53');
INSERT INTO `t_comment` VALUES (14, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'qibai', '11111', 9, '2023-03-08 11:18:05', '2023-03-08 11:18:05');
INSERT INTO `t_comment` VALUES (15, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'sibai', 'hahhahhhhhhhhhhhhhhhhh', 8, '2023-03-08 11:18:19', '2023-03-08 11:18:19');
INSERT INTO `t_comment` VALUES (16, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'sibai', 'sdfsd', 7, '2023-03-09 14:57:39', '2023-03-09 14:57:39');
INSERT INTO `t_comment` VALUES (18, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'erbai', '大佬加油', 9, '2023-03-10 08:26:39', '2023-03-10 08:26:39');
INSERT INTO `t_comment` VALUES (19, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'babai', '哈哈', 5, '2023-03-10 15:39:45', '2023-03-10 15:39:45');
INSERT INTO `t_comment` VALUES (20, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'jiubai', '牛啊,兄弟', 8, '2023-03-11 19:10:16', '2023-03-11 19:10:16');
INSERT INTO `t_comment` VALUES (21, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'liubai', '加油加油', 5, '2023-03-11 21:17:35', '2023-03-11 21:17:35');
INSERT INTO `t_comment` VALUES (25, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'liubai', '湿答答', 7, '2023-03-19 21:03:56', '2023-03-19 21:03:56');
INSERT INTO `t_comment` VALUES (29, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'yiqian', '我赶个图书管理，来抄一下代码', 7, '2023-03-28 17:50:25', '2023-03-28 17:50:25');
INSERT INTO `t_comment` VALUES (30, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'babai', 'hello', 7, '2023-03-29 20:16:27', '2023-03-29 20:16:27');
INSERT INTO `t_comment` VALUES (33, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'wubai', 'wee呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃呃', 9, '2023-04-01 21:31:20', '2023-04-01 21:31:20');
INSERT INTO `t_comment` VALUES (35, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'erbai', '576556', 6, '2023-04-02 02:08:18', '2023-04-02 02:08:18');
INSERT INTO `t_comment` VALUES (47, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'liubai', '你好', 9, '2023-04-10 14:18:10', '2023-04-10 14:18:10');
INSERT INTO `t_comment` VALUES (48, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'babai', '我们可以的，上', 6, '2023-04-12 20:02:19', '2023-04-12 20:02:19');
INSERT INTO `t_comment` VALUES (49, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'wubai', '123456', 5, '2023-05-06 17:21:31', '2023-05-06 17:21:31');
INSERT INTO `t_comment` VALUES (50, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'qibai', '双方都', 7, '2023-05-07 15:18:24', '2023-05-07 15:18:24');
INSERT INTO `t_comment` VALUES (51, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'qibai', '525', 7, '2023-05-08 12:58:24', '2023-05-08 12:58:24');
INSERT INTO `t_comment` VALUES (52, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'erbai', '在嘛？', 9, '2023-05-10 08:46:10', '2023-05-10 08:46:10');
INSERT INTO `t_comment` VALUES (53, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'babai', '1111111', 5, '2023-05-10 08:46:23', '2023-05-10 08:46:23');
INSERT INTO `t_comment` VALUES (54, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'babai', '在嘛', 9, '2023-05-10 08:46:37', '2023-05-10 08:46:37');
INSERT INTO `t_comment` VALUES (55, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'qibai', '总之结局是好的', 8, '2023-05-10 14:37:24', '2023-05-10 14:37:24');
INSERT INTO `t_comment` VALUES (56, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'qibai', 'JINTIANHAOKUN', 6, '2023-05-12 05:26:46', '2023-05-12 05:26:46');
INSERT INTO `t_comment` VALUES (57, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'qibai', '173173173', 5, '2023-05-12 05:27:11', '2023-05-12 05:27:11');
INSERT INTO `t_comment` VALUES (58, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'sibai', '123', 9, '2023-05-12 11:40:23', '2023-05-12 11:40:23');
INSERT INTO `t_comment` VALUES (59, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'erbai', '考虑了', 9, '2023-05-13 12:50:29', '2023-05-13 12:50:29');
INSERT INTO `t_comment` VALUES (60, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'sanbai', '毕业快乐呀', 9, '2023-05-13 14:51:13', '2023-05-13 14:51:13');
INSERT INTO `t_comment` VALUES (61, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'qibai', '希望图书馆更好', 5, '2023-05-16 13:00:58', '2023-05-16 13:00:58');
INSERT INTO `t_comment` VALUES (62, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'erbai', '', 6, '2023-05-16 13:01:18', '2023-05-16 13:01:18');
INSERT INTO `t_comment` VALUES (63, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'wubai', '生', 9, '2023-05-16 20:41:17', '2023-05-16 20:41:17');
INSERT INTO `t_comment` VALUES (64, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'liubai', '哎呀', 8, '2023-05-16 20:41:37', '2023-05-16 20:41:37');
INSERT INTO `t_comment` VALUES (65, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'babai', '11', 9, '2023-05-17 16:09:01', '2023-05-17 16:09:01');
INSERT INTO `t_comment` VALUES (66, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'erbai', '撒旦撒', 5, '2023-05-17 16:09:15', '2023-05-17 16:09:15');
INSERT INTO `t_comment` VALUES (67, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'liubai', '测试111', 6, '2023-05-17 16:09:23', '2023-05-17 16:09:23');
INSERT INTO `t_comment` VALUES (68, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'babai', '123', 8, '2023-05-17 16:20:16', '2023-05-17 16:20:16');
INSERT INTO `t_comment` VALUES (69, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'jiubai', '', 8, '2023-05-17 21:07:29', '2023-05-17 21:07:29');
INSERT INTO `t_comment` VALUES (70, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'liubai', '你好', 7, '2023-05-19 19:41:40', '2023-05-19 19:41:40');
INSERT INTO `t_comment` VALUES (71, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'yiqian', '不开心', 5, '2023-05-23 17:48:35', '2023-05-23 17:48:35');
INSERT INTO `t_comment` VALUES (72, 'https://img0.baidu.com/it/u=825023390,3429989944&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', 'erbai', '不高兴', 7, '2023-05-23 17:48:46', '2023-05-23 17:48:46');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告表唯一标识',
  `notice_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告题目',
  `notice_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `notice_admin_id` int(11) NOT NULL COMMENT '发布公告的管理员id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, '本项目前端源代码地址,欢迎star!', 'https://gitee.com/falle22222n-leaves/vue_-book-manage-system', 1623, '2023-02-05 16:11:40', '2023-02-05 16:11:40');
INSERT INTO `t_notice` VALUES (2, '注意事项', '发现项目BUG,可以提出issue，大佬请别恶意攻击，小项目承受不起，谢谢', 1623, '2023-02-05 16:13:31', '2023-02-05 16:13:31');
INSERT INTO `t_notice` VALUES (3, '本项目后端源代码地址，欢迎star', 'https://gitee.com/falle22222n-leaves/vue_-book-manage-system_backend', 1623, '2023-02-05 16:13:31', '2023-02-05 16:13:31');
INSERT INTO `t_notice` VALUES (4, '个人博客地址分享Java学习', 'https://luoye6.github.io/', 1623, '2023-05-01 11:10:44', '2023-05-01 11:10:46');

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表的唯一标识',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码 MD5加密',
  `card_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `card_number` bigint(11) NOT NULL COMMENT '借阅证编号 固定11位随机生成 非空',
  `rule_number` int(11) NOT NULL COMMENT '规则编号 可以自定义也就是权限功能',
  `status` int(1) NOT NULL COMMENT '1表示可用 0表示禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2544 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (1923, '相思断红肠', 'da4c189f916ae0b5aeb59389df4f0df0', '张三', 18012345678, 188, 1, '2023-02-02 16:12:05', '2023-02-02 16:12:05');
INSERT INTO `t_users` VALUES (2543, '落叶者', 'da4c189f916ae0b5aeb59389df4f0df0', '一鲲年', 18068834231, 88, 1, '2023-02-06 16:23:07', '2023-02-06 16:23:07');

-- ----------------------------
-- Table structure for t_violation
-- ----------------------------
DROP TABLE IF EXISTS `t_violation`;
CREATE TABLE `t_violation`  (
  `violation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '违章表唯一标识',
  `card_number` bigint(11) NOT NULL COMMENT '借阅证编号 11位 随机生成',
  `book_number` bigint(11) NOT NULL COMMENT '图书编号 图书唯一标识',
  `borrow_date` datetime NOT NULL COMMENT '借阅日期',
  `close_date` datetime NOT NULL COMMENT '截止日期',
  `return_date` datetime NULL DEFAULT NULL COMMENT '归还日期',
  `violation_message` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '违章信息',
  `violation_admin_id` int(11) NOT NULL COMMENT '违章信息管理员的id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`violation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_violation
-- ----------------------------
INSERT INTO `t_violation` VALUES (1, 18012345678, 1234, '2023-02-05 18:48:19', '2023-03-27 18:48:19', '2023-02-25 18:48:19', '', 1420, '2023-02-06 16:30:12', '2023-02-06 16:30:12');
INSERT INTO `t_violation` VALUES (2, 18012345678, 1235, '2023-02-05 18:48:19', '2023-03-27 18:48:19', '2023-02-28 18:48:19', '', 1420, '2023-02-06 16:31:00', '2023-02-06 16:31:00');
INSERT INTO `t_violation` VALUES (3, 18012345678, 1236, '2023-02-05 18:48:19', '2023-03-27 18:48:19', '2023-03-05 18:48:19', '', 1420, '2023-02-06 16:31:00', '2023-02-06 16:31:00');
INSERT INTO `t_violation` VALUES (4, 18012345678, 1234, '2023-02-08 19:06:05', '2023-03-30 19:06:05', '2023-02-08 19:44:21', '', 1420, '2023-02-08 19:06:05', '2023-02-08 19:06:05');
INSERT INTO `t_violation` VALUES (5, 18012345678, 1235, '2023-02-08 19:49:14', '2023-03-30 19:49:14', '2023-02-08 19:49:45', '书籍损坏', 1420, '2023-02-08 19:49:14', '2023-02-08 19:49:14');
INSERT INTO `t_violation` VALUES (6, 18012345678, 1236, '2023-02-08 19:51:07', '2023-03-30 19:51:07', '2023-02-12 19:46:17', '', 1420, '2023-02-08 19:51:08', '2023-02-08 19:51:08');
INSERT INTO `t_violation` VALUES (7, 18012345678, 1234, '2023-02-08 20:28:39', '2023-03-30 20:28:39', '2023-02-12 19:46:07', '', 1420, '2023-02-08 20:28:39', '2023-02-08 20:28:39');
INSERT INTO `t_violation` VALUES (8, 18012345678, 1235, '2023-02-08 20:28:46', '2023-03-30 20:28:46', '2023-02-12 19:46:12', '', 1420, '2023-02-08 20:28:46', '2023-02-08 20:28:46');
INSERT INTO `t_violation` VALUES (9, 18012345678, 1234, '2023-02-12 19:53:14', '2023-04-03 19:53:14', '2023-02-12 19:53:35', '', 1420, '2023-02-12 19:53:15', '2023-02-12 19:53:15');
INSERT INTO `t_violation` VALUES (10, 18012345678, 1235, '2023-02-12 19:53:26', '2023-04-03 19:53:26', '2023-02-12 19:58:28', '', 1420, '2023-02-12 19:53:27', '2023-02-12 19:53:27');
INSERT INTO `t_violation` VALUES (11, 18012345678, 1234, '2023-02-12 19:59:23', '2023-04-03 19:59:23', '2023-02-12 19:59:33', '', 1420, '2023-02-12 19:59:23', '2023-02-12 19:59:23');
INSERT INTO `t_violation` VALUES (12, 18012345678, 1234, '2023-02-12 20:09:55', '2023-04-03 20:09:55', '2023-02-12 20:10:03', '', 1543, '2023-02-12 20:09:56', '2023-02-12 20:09:56');
INSERT INTO `t_violation` VALUES (18, 18012345678, 1234, '2023-04-13 15:12:39', '2023-06-02 15:12:39', NULL, '', 1543, '2023-04-13 15:12:42', '2023-04-13 15:12:42');
INSERT INTO `t_violation` VALUES (19, 18012345678, 1235, '2023-04-13 15:13:06', '2023-06-02 15:13:06', NULL, '', 1420, '2023-04-13 15:13:07', '2023-04-13 15:13:07');
INSERT INTO `t_violation` VALUES (20, 18012345678, 1237, '2023-04-13 15:13:18', '2023-06-02 15:13:18', NULL, '', 1420, '2023-04-13 15:13:19', '2023-04-13 15:13:19');
INSERT INTO `t_violation` VALUES (21, 18012345678, 78581515059, '2023-04-16 20:37:03', '2023-06-05 20:37:03', NULL, '', 1420, '2023-04-16 20:37:03', '2023-04-16 20:37:03');
INSERT INTO `t_violation` VALUES (22, 18012345678, 74103469282, '2023-04-16 20:37:18', '2023-06-05 20:37:18', NULL, '', 1420, '2023-04-16 20:37:19', '2023-04-16 20:37:19');
INSERT INTO `t_violation` VALUES (23, 18012345678, 7532651593, '2023-04-16 20:37:32', '2023-06-05 20:37:32', NULL, '', 1420, '2023-04-16 20:37:33', '2023-04-16 20:37:33');
INSERT INTO `t_violation` VALUES (24, 18012345678, 38980198460, '2023-04-16 20:37:45', '2023-06-05 20:37:45', NULL, '', 1420, '2023-04-16 20:37:46', '2023-04-16 20:37:46');
INSERT INTO `t_violation` VALUES (25, 18012345678, 2408369775, '2023-05-06 12:27:45', '2023-06-25 12:27:45', NULL, '', 1420, '2023-05-06 12:27:49', '2023-05-06 12:27:49');
INSERT INTO `t_violation` VALUES (26, 18068834231, 51561061281, '2023-05-06 12:28:46', '2023-05-26 12:28:46', NULL, '', 1420, '2023-05-06 12:31:03', '2023-05-06 12:31:03');
INSERT INTO `t_violation` VALUES (27, 18068834231, 17015709356, '2023-05-06 12:38:02', '2023-05-26 12:38:02', NULL, '', 1420, '2023-05-06 12:41:42', '2023-05-06 12:41:42');
INSERT INTO `t_violation` VALUES (28, 18068834231, 41408706970, '2023-05-06 12:48:18', '2023-05-26 12:48:18', NULL, '', 1420, '2023-05-06 12:48:20', '2023-05-06 12:48:20');
INSERT INTO `t_violation` VALUES (29, 18012345678, 1238, '2023-05-16 12:00:00', '2023-07-05 12:00:00', NULL, '', 1543, '2023-05-16 16:00:38', '2023-05-16 16:00:38');
INSERT INTO `t_violation` VALUES (30, 18012345678, 1236, '2023-05-09 12:00:00', '2023-06-28 12:00:00', NULL, '', 1543, '2023-05-16 16:01:21', '2023-05-16 16:01:21');
INSERT INTO `t_violation` VALUES (31, 18012345678, 1234, '2023-05-17 12:00:00', '2023-07-06 12:00:00', NULL, '', 1549, '2023-05-17 21:29:24', '2023-05-17 21:29:24');
INSERT INTO `t_violation` VALUES (32, 18012345678, 50970375442, '2023-05-17 12:00:00', '2023-07-06 12:00:00', NULL, '', 1549, '2023-05-17 21:30:03', '2023-05-17 21:30:03');
INSERT INTO `t_violation` VALUES (33, 18012345678, 9378134736, '2023-05-20 09:54:24', '2023-07-09 09:54:24', '2023-05-20 14:21:23', '', 1549, '2023-05-20 09:54:25', '2023-05-20 09:54:25');
INSERT INTO `t_violation` VALUES (34, 18012345678, 9378134736, '2023-05-20 14:21:36', '2023-07-09 14:21:36', NULL, '', 1549, '2023-05-20 14:21:37', '2023-05-20 14:21:37');
INSERT INTO `t_violation` VALUES (35, 18012345678, 1235, '2023-05-20 14:22:01', '2023-07-09 14:22:01', NULL, '', 1549, '2023-05-20 14:22:03', '2023-05-20 14:22:03');
INSERT INTO `t_violation` VALUES (36, 18012345678, 1236, '2023-05-20 14:22:07', '2023-07-09 14:22:07', NULL, '', 1549, '2023-05-20 14:22:08', '2023-05-20 14:22:08');
INSERT INTO `t_violation` VALUES (37, 18012345678, 1237, '2023-05-20 14:22:12', '2023-07-09 14:22:12', NULL, '', 1549, '2023-05-20 14:22:13', '2023-05-20 14:22:13');

SET FOREIGN_KEY_CHECKS = 1;
