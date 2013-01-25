-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- 主机: localhost
-- 生成日期: 2013 年 01 月 22 日 11:28
-- 服务器版本: 6.0.4
-- PHP 版本: 6.0.0-dev

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 数据库: `lottery`
-- 

-- --------------------------------------------------------

-- 
-- 表的结构 `by_current`
-- 

CREATE TABLE IF NOT EXISTS `by_current` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `curnum` int(5) NOT NULL COMMENT '剩余次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `by_current`
-- 

INSERT INTO `by_current` VALUES (1, 20);

-- --------------------------------------------------------

-- 
-- 表的结构 `by_prize`
-- 

CREATE TABLE IF NOT EXISTS `by_prize` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `prize` varchar(20) NOT NULL COMMENT '奖品名称',
  `num` int(5) NOT NULL COMMENT '奖品数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- 
-- 导出表中的数据 `by_prize`
-- 

INSERT INTO `by_prize` VALUES (1, '佳能 EOS 600D', 1);
INSERT INTO `by_prize` VALUES (2, 'IPHONE5', 2);
INSERT INTO `by_prize` VALUES (3, 'IPAD MINI', 4);
INSERT INTO `by_prize` VALUES (4, '三星I9300', 3);
INSERT INTO `by_prize` VALUES (5, '小米2', 3);
INSERT INTO `by_prize` VALUES (6, 'Jawbone ERA', 5);
INSERT INTO `by_prize` VALUES (7, 'JBL音箱', 4);
INSERT INTO `by_prize` VALUES (8, 'SKULLCANDY', 6);
INSERT INTO `by_prize` VALUES (9, 'iPod nano', 15);
INSERT INTO `by_prize` VALUES (10, '山地自行车', 10);
INSERT INTO `by_prize` VALUES (11, 'SJ-101E 除湿机', 10);
INSERT INTO `by_prize` VALUES (12, '移动硬盘', 20);
INSERT INTO `by_prize` VALUES (13, '拍立得', 20);
INSERT INTO `by_prize` VALUES (14, '豆浆机', 20);
INSERT INTO `by_prize` VALUES (15, '汉王电纸书', 10);
INSERT INTO `by_prize` VALUES (16, '带薪假两天', 30);
INSERT INTO `by_prize` VALUES (17, '飞利浦剃须刀', 20);
INSERT INTO `by_prize` VALUES (18, '苏泊尔电饭煲', 20);
INSERT INTO `by_prize` VALUES (19, 'iPod shuffle', 30);
INSERT INTO `by_prize` VALUES (20, '毛毯', 30);

-- --------------------------------------------------------

-- 
-- 表的结构 `by_user`
-- 

CREATE TABLE IF NOT EXISTS `by_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `codeid` varchar(20) DEFAULT NULL COMMENT '抽奖券编号',
  `prizeid` int(5) DEFAULT NULL COMMENT '奖品ID',
  `prizename` varchar(40) DEFAULT NULL COMMENT '领奖人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `by_user`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `by_users`
-- 

CREATE TABLE IF NOT EXISTS `by_users` (
  `code` varchar(20) NOT NULL COMMENT '工号',
  `cname` varchar(20) NOT NULL COMMENT '中文名',
  `username` varchar(20) NOT NULL COMMENT '英文名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `by_users`
-- 

INSERT INTO `by_users` VALUES ('00690', '高峻峰', 'JefferyGao');
INSERT INTO `by_users` VALUES ('00001', 'David Zhang', 'David');
INSERT INTO `by_users` VALUES ('00003', '索红彬', 'Psuo');
INSERT INTO `by_users` VALUES ('00036', '刘润绅', 'WesleyLiu');
INSERT INTO `by_users` VALUES ('00161', '黄海燕', 'EchoHuang');
INSERT INTO `by_users` VALUES ('00541', '李开', 'CathyLi');
INSERT INTO `by_users` VALUES ('00005', '谢慧明', 'Longlin');
INSERT INTO `by_users` VALUES ('00152', '于彤', 'YogaYu');
INSERT INTO `by_users` VALUES ('00710', '陈亚方', 'JanRoid');
INSERT INTO `by_users` VALUES ('00607', '罗晴', 'AmyLuo');
INSERT INTO `by_users` VALUES ('00513', '贡文柱', 'VicentGong');
INSERT INTO `by_users` VALUES ('00729', '孟骏', 'junmeng');
INSERT INTO `by_users` VALUES ('00245', '张强世', 'zhangqiangshi');
INSERT INTO `by_users` VALUES ('00602', '张飞鹏', 'TonyZhang');
INSERT INTO `by_users` VALUES ('00464', '何源', 'TyrionHe');
INSERT INTO `by_users` VALUES ('00561', '吴蔚钦', 'EricWu');
INSERT INTO `by_users` VALUES ('00174', '罗晓成', 'Shineflag');
INSERT INTO `by_users` VALUES ('00455', '张付伟', 'AveryZhang');
INSERT INTO `by_users` VALUES ('00439', '黄涵', 'HuangHan');
INSERT INTO `by_users` VALUES ('00434', '张桂盛', 'GuisonZhang');
INSERT INTO `by_users` VALUES ('00670', '王海涛', 'ArthurWang');
INSERT INTO `by_users` VALUES ('00126', '杨凯风', 'GaifyYang');
INSERT INTO `by_users` VALUES ('00283', '蔡成杰', 'JetCheng');
INSERT INTO `by_users` VALUES ('00331', '何凌', 'MonkeyHe');
INSERT INTO `by_users` VALUES ('00684', '张帆', 'MoyokiZhang');
INSERT INTO `by_users` VALUES ('00111', '黄文锋', 'VanfoHuang');
INSERT INTO `by_users` VALUES ('00310', '郑路路', 'MickZheng');
INSERT INTO `by_users` VALUES ('00286', '王欢', 'ThinkerWang');
INSERT INTO `by_users` VALUES ('00235', '戢晶晶', 'JIJingjing');
INSERT INTO `by_users` VALUES ('00241', '檀东平', 'TcellTan');
INSERT INTO `by_users` VALUES ('00042', '杨波', 'BoYang');
INSERT INTO `by_users` VALUES ('00169', '罗宗', 'LuoZong');
INSERT INTO `by_users` VALUES ('00364', '李佳', 'LiJia');
INSERT INTO `by_users` VALUES ('00234', '王延军', 'SblackWang');
INSERT INTO `by_users` VALUES ('00623', '熊胜奇', 'XshengQ');
INSERT INTO `by_users` VALUES ('00391', '郑云飞', 'AndrewZheng');
INSERT INTO `by_users` VALUES ('00179', '杜露', 'dulu');
INSERT INTO `by_users` VALUES ('00557', '罗新', 'RobertLuo');
INSERT INTO `by_users` VALUES ('00121', '谢俊良', 'JamesXie');
INSERT INTO `by_users` VALUES ('00387', '黄廷章', 'JackHuang');
INSERT INTO `by_users` VALUES ('00465', '陈博', 'AustinChen');
INSERT INTO `by_users` VALUES ('00223', '景洋', 'AlexJing');
INSERT INTO `by_users` VALUES ('00184', '段鹏飞', 'LeoDuan');
INSERT INTO `by_users` VALUES ('00123', '王一杰', 'PlutoWang');
INSERT INTO `by_users` VALUES ('00503', '谈正品', 'LeoTan');
INSERT INTO `by_users` VALUES ('00720', '温绍坚', 'BullardWong');
INSERT INTO `by_users` VALUES ('00572', '蒋克蓉', 'MellisaJiang');
INSERT INTO `by_users` VALUES ('00070', '刘茜', 'TinaLiu');
INSERT INTO `by_users` VALUES ('00524', '傅耀', 'FuYao');
INSERT INTO `by_users` VALUES ('00474', '徐波', 'JackXu');
INSERT INTO `by_users` VALUES ('00553', '刘晓辉', 'JayshonLiu');
INSERT INTO `by_users` VALUES ('00533', '李亮', 'KookLi');
INSERT INTO `by_users` VALUES ('00477', '马培娟', 'HanaMa');
INSERT INTO `by_users` VALUES ('00367', '钟明明', 'VicZhong');
INSERT INTO `by_users` VALUES ('00574', '张志刚', 'JackZhang');
INSERT INTO `by_users` VALUES ('00088', '贾金金', 'JimJia');
INSERT INTO `by_users` VALUES ('00118', '马治辉', 'ZacMa');
INSERT INTO `by_users` VALUES ('00551', '易政', 'YiZheng');
INSERT INTO `by_users` VALUES ('00624', '朱永丹', 'GrommZhu');
INSERT INTO `by_users` VALUES ('00612', '刘仕尧', 'SteveLiu');
INSERT INTO `by_users` VALUES ('00497', '张孝桂', 'LanderZhang');
INSERT INTO `by_users` VALUES ('00250', '史岳斌', 'ShiYuebin');
INSERT INTO `by_users` VALUES ('00639', '刘永恒', 'JohnLiu');
INSERT INTO `by_users` VALUES ('00640', '钟功福', 'Zhgflx');
INSERT INTO `by_users` VALUES ('00616', '池育龙', 'LawrenceChi');
INSERT INTO `by_users` VALUES ('00134', '罗慰', 'MarninLuo');
INSERT INTO `by_users` VALUES ('00307', '唐艳辉', 'SionTang');
INSERT INTO `by_users` VALUES ('00016', '张露思', 'LusiZhang');
INSERT INTO `by_users` VALUES ('00185', '郑达', 'ViperZheng');
INSERT INTO `by_users` VALUES ('00115', '邹华彪', 'BiaobiaoZou');
INSERT INTO `by_users` VALUES ('00119', '王平', 'PinchWang');
INSERT INTO `by_users` VALUES ('00133', '邱波', 'CruiseQiu');
INSERT INTO `by_users` VALUES ('00390', '黄鹤鸣', 'AuguestSnow');
INSERT INTO `by_users` VALUES ('00469', '梁承飞', 'FlyingLiang');
INSERT INTO `by_users` VALUES ('00472', '柴元', 'FlytonyChai');
INSERT INTO `by_users` VALUES ('00584', '唐志坤', 'KunkaTang');
INSERT INTO `by_users` VALUES ('00711', '刘济劲', 'JkinLiu');
INSERT INTO `by_users` VALUES ('00363', '杨苍义', 'Yangcy');
INSERT INTO `by_users` VALUES ('00724', '何一凡', 'YifanHe');
INSERT INTO `by_users` VALUES ('00593', '赵琪强', 'LennonZhao');
INSERT INTO `by_users` VALUES ('00586', '景淼淼', 'DamitaJing');
INSERT INTO `by_users` VALUES ('00592', '张利娜', 'LinaZhang');
INSERT INTO `by_users` VALUES ('00080', '张雄伟', 'PudgeZhang');
INSERT INTO `by_users` VALUES ('00290', '胡晓伟', 'HuXiaowei');
INSERT INTO `by_users` VALUES ('00388', '陶流昌', 'LiuchangTao');
INSERT INTO `by_users` VALUES ('00378', '易伟', 'HarryYi');
INSERT INTO `by_users` VALUES ('00457', '张林', 'GrayZhang');
INSERT INTO `by_users` VALUES ('00665', '洪玉材', 'BillowHong');
INSERT INTO `by_users` VALUES ('00473', '刘速成', 'SuchengLiu');
INSERT INTO `by_users` VALUES ('00605', '祁舟', 'KevinQi');
INSERT INTO `by_users` VALUES ('00599', '李炜彬', 'RavenLi');
INSERT INTO `by_users` VALUES ('00703', '夏志浩', 'BarretXia');
INSERT INTO `by_users` VALUES ('00168', '彭杰明', 'MikePeng');
INSERT INTO `by_users` VALUES ('00182', '沈烈超', 'SilenceShen');
INSERT INTO `by_users` VALUES ('00578', '梁炳辉', 'GaroLiang');
INSERT INTO `by_users` VALUES ('00730', '邢海娇', 'katyxing');
INSERT INTO `by_users` VALUES ('00255', '肖开颜', 'UniXiao');
INSERT INTO `by_users` VALUES ('00688', '曹宇', 'hughcao');
INSERT INTO `by_users` VALUES ('00573', '谭小龙', 'JamesTan');
INSERT INTO `by_users` VALUES ('00098', '陈伟学', 'FrankChen');
INSERT INTO `by_users` VALUES ('00122', '姜严', 'ZeusJiang');
INSERT INTO `by_users` VALUES ('00130', '尹艳秋', 'LouisYin');
INSERT INTO `by_users` VALUES ('00517', '宋伟', 'SovenSong');
INSERT INTO `by_users` VALUES ('00212', '章治鹏', 'TonyZzp');
INSERT INTO `by_users` VALUES ('00675', '熊琦洪', 'qihongxiong');
INSERT INTO `by_users` VALUES ('00659', '莫玉成', 'YCMO');
INSERT INTO `by_users` VALUES ('00107', '雷冰', 'BingLei');
INSERT INTO `by_users` VALUES ('00694', '袁力', 'YuanLi');
INSERT INTO `by_users` VALUES ('00708', '吴吉昌', 'JohnsonWu');
INSERT INTO `by_users` VALUES ('00516', '向鑫', 'XzeroXiang');
INSERT INTO `by_users` VALUES ('00700', '王斌', 'NickWang');
INSERT INTO `by_users` VALUES ('00246', '姚尊', 'yaozun');
INSERT INTO `by_users` VALUES ('00669', '杨云天', 'Greyyang');
INSERT INTO `by_users` VALUES ('00269', '黎晖', 'RyanLi');
INSERT INTO `by_users` VALUES ('00598', '马永斌', 'LeonMa');
INSERT INTO `by_users` VALUES ('00695', '郑燕燕', 'DaisyZheng');
INSERT INTO `by_users` VALUES ('00061', '周辅国', 'WilliamChau');
INSERT INTO `by_users` VALUES ('00347', '曾仁凤', 'JessicZeng');
INSERT INTO `by_users` VALUES ('00714', '严旅', 'HacsonYan');
INSERT INTO `by_users` VALUES ('00236', '吴子烨', 'WesleyWoo');
INSERT INTO `by_users` VALUES ('00723', '王博', 'WeberWang');
INSERT INTO `by_users` VALUES ('00141', '叶楚旭', 'LouisYe');
INSERT INTO `by_users` VALUES ('00317', '陈华孝', 'OttoChen');
INSERT INTO `by_users` VALUES ('00629', '陈庆炜', 'NeroChen');
INSERT INTO `by_users` VALUES ('00663', '李思远', 'KolaLi');
INSERT INTO `by_users` VALUES ('00404', '李明徽', 'SlarkLi');
INSERT INTO `by_users` VALUES ('00601', '曾日强', 'DanielZeng');
INSERT INTO `by_users` VALUES ('00582', '张妙', 'Serena');
INSERT INTO `by_users` VALUES ('00383', '罗凤波', 'LookyLuo');
INSERT INTO `by_users` VALUES ('00680', '肖伟涛', 'joeyxiao');
INSERT INTO `by_users` VALUES ('00611', '康骞文', 'SummerKang');
INSERT INTO `by_users` VALUES ('00691', '徐燊', 'NancyXu');
INSERT INTO `by_users` VALUES ('00563', '刘南杰', 'SvenLiu');
INSERT INTO `by_users` VALUES ('00438', '安凌志', 'AnLingZhi');
INSERT INTO `by_users` VALUES ('00676', '艾龙', 'AlenAl');
INSERT INTO `by_users` VALUES ('00642', '肖国平', 'Xiaogp');
INSERT INTO `by_users` VALUES ('00546', '吴品湖', 'SimonWu');
INSERT INTO `by_users` VALUES ('00326', '刘俊', 'LiuJ');
INSERT INTO `by_users` VALUES ('00677', '彭德琦', 'KiraPeng');
INSERT INTO `by_users` VALUES ('00520', '魏民强', 'MansurWei');
INSERT INTO `by_users` VALUES ('00662', '刘万峰', 'WangfengLiu');
INSERT INTO `by_users` VALUES ('00701', '许卓庭', 'CalvinXu');
INSERT INTO `by_users` VALUES ('00334', '易浩', 'SuperKrisy');
INSERT INTO `by_users` VALUES ('00540', '邢红贵', 'IterseXing');
INSERT INTO `by_users` VALUES ('00079', '徐国恒', 'GentlyXu');
INSERT INTO `by_users` VALUES ('00461', '陈远玉', 'TodChen');
INSERT INTO `by_users` VALUES ('00509', '陈勇勇', 'ElvaChan');
INSERT INTO `by_users` VALUES ('00191', '李燕', 'YanLi');
INSERT INTO `by_users` VALUES ('00696', '刘新锋', 'ViolinLiu');
INSERT INTO `by_users` VALUES ('00008', '曾志坚', 'CastielZeng');
INSERT INTO `by_users` VALUES ('00091', '李剑', 'JankerLi');
INSERT INTO `by_users` VALUES ('00145', '叶剑波', 'SamYip');
INSERT INTO `by_users` VALUES ('00470', '林辉', 'WebbLin');
INSERT INTO `by_users` VALUES ('00104', '盛辰光', 'SimonSheng');
INSERT INTO `by_users` VALUES ('00015', '张奎', 'DomZhang');
INSERT INTO `by_users` VALUES ('00429', '余欢', 'WadeYu');
INSERT INTO `by_users` VALUES ('00327', '李鹏辉', 'LiPenghui');
INSERT INTO `by_users` VALUES ('00459', '沈常平', 'PeterShen');
INSERT INTO `by_users` VALUES ('00265', '刘步高', 'BugerLiu');
INSERT INTO `by_users` VALUES ('00068', '李宏业', 'YeahLi');
INSERT INTO `by_users` VALUES ('00467', '谌冬华', 'DaveeChen');
INSERT INTO `by_users` VALUES ('00514', '韦思昌', 'WesionWei');
INSERT INTO `by_users` VALUES ('00374', '李小龙', 'BruceLi');
INSERT INTO `by_users` VALUES ('00591', '刘俊', 'JweenLau');
INSERT INTO `by_users` VALUES ('00172', '赖忠力', 'laizhongli');
INSERT INTO `by_users` VALUES ('00116', '于震达', 'DadaYu');
INSERT INTO `by_users` VALUES ('00139', '彭浩', 'LichkinyPeng');
INSERT INTO `by_users` VALUES ('00140', '肖领', 'SeanXiao');
INSERT INTO `by_users` VALUES ('00594', '陈冬莹', 'IsabellaChen');
INSERT INTO `by_users` VALUES ('00173', '肖凌西', 'WestXiao');
INSERT INTO `by_users` VALUES ('00266', '胡道庭', 'JeryHu');
INSERT INTO `by_users` VALUES ('00099', '朱林', 'JulinZhu');
INSERT INTO `by_users` VALUES ('00113', '周小雨', 'RainyChow');
INSERT INTO `by_users` VALUES ('00257', '黄兆阳', 'DarrenHuang');
INSERT INTO `by_users` VALUES ('00692', '吴伟扬', 'SkyWu');
INSERT INTO `by_users` VALUES ('00216', '朱立勇', 'ZhuLiyong');
INSERT INTO `by_users` VALUES ('00589', '高振杰', 'DannyGao');
INSERT INTO `by_users` VALUES ('00600', '熊蕙', 'FionaXiong');
INSERT INTO `by_users` VALUES ('00365', '刘海', 'OceanLiu');
INSERT INTO `by_users` VALUES ('00482', '胡秀明', 'HiramHu');
INSERT INTO `by_users` VALUES ('00353', '陀振华', 'PeterTuo');
INSERT INTO `by_users` VALUES ('00345', '王彦曦', 'VincentWang');
INSERT INTO `by_users` VALUES ('00198', '汤是春', 'StevTang');
INSERT INTO `by_users` VALUES ('00728', '刁志科', 'zhikediao');
INSERT INTO `by_users` VALUES ('00190', '欧阳柳', 'OuyangLiu');
INSERT INTO `by_users` VALUES ('00218', '李伟', 'WeickyLi');
INSERT INTO `by_users` VALUES ('00559', '陈贤俊', 'JimChen');
INSERT INTO `by_users` VALUES ('00657', '张瓒', 'ZzanZhang');
INSERT INTO `by_users` VALUES ('00092', '游婷', 'Yoyo');
INSERT INTO `by_users` VALUES ('00264', '崔鹏', 'cuipeng');
INSERT INTO `by_users` VALUES ('00006', '周坚', 'ColinZhou');
INSERT INTO `by_users` VALUES ('00066', '颜赳', 'JellyYan');
INSERT INTO `by_users` VALUES ('00153', '徐丽', 'ShirleyXu');
INSERT INTO `by_users` VALUES ('00394', '罗崇', 'LeoLuo');
INSERT INTO `by_users` VALUES ('00562', '李雪峰', 'HenryLee');
INSERT INTO `by_users` VALUES ('00117', '田铖', 'SkydTian');
INSERT INTO `by_users` VALUES ('00132', '任文韬', 'HeinekenRen');
INSERT INTO `by_users` VALUES ('00526', '郭华晶', 'AliceGuo');
INSERT INTO `by_users` VALUES ('00165', '段小龙', 'XiaolongDuan');
INSERT INTO `by_users` VALUES ('00056', '刘紫华', 'SevenLiu');
INSERT INTO `by_users` VALUES ('00532', '乔曌', 'DanielQiao');
INSERT INTO `by_users` VALUES ('00258', '王香怡', 'YummyWang');
INSERT INTO `by_users` VALUES ('00362', '石燕妮', 'EvelynShi');
INSERT INTO `by_users` VALUES ('00303', '谭萌', 'LarryTan');
INSERT INTO `by_users` VALUES ('00732', '陶豪', 'taohao');
INSERT INTO `by_users` VALUES ('00654', '石艳娇', 'GabyShi');
INSERT INTO `by_users` VALUES ('00110', '魏少容', 'DeliaWei');
INSERT INTO `by_users` VALUES ('00221', '刘紫微', 'ziwei.liu');
INSERT INTO `by_users` VALUES ('00400', '洪婉婷', 'WendyHong');
INSERT INTO `by_users` VALUES ('00726', '康雯雯', 'WenwenKang');
INSERT INTO `by_users` VALUES ('00097', '陈文苑', 'exclusivechen');
INSERT INTO `by_users` VALUES ('00034', '覃任平', 'PeterQin');
INSERT INTO `by_users` VALUES ('00049', '孙国强', 'AdminSun');
INSERT INTO `by_users` VALUES ('00339', '谢薇', 'VickyXie');
INSERT INTO `by_users` VALUES ('00064', '刘绿魏', 'MidiooLiu');
INSERT INTO `by_users` VALUES ('00105', '谢九华', 'FreeMan');
INSERT INTO `by_users` VALUES ('00409', '李忠鹏', 'ZippyLi');
INSERT INTO `by_users` VALUES ('00189', '魏翠霞', 'TracyWei');
INSERT INTO `by_users` VALUES ('00480', '郑松贤', 'SongxianZheng');
INSERT INTO `by_users` VALUES ('00679', '黄志伟', 'Ziwayhuang');
INSERT INTO `by_users` VALUES ('00302', '陈颖', 'chenying');
INSERT INTO `by_users` VALUES ('00306', '吴博', 'FloatingcloudsWu');
INSERT INTO `by_users` VALUES ('00188', '廖骏元', 'LiehanLiao');
INSERT INTO `by_users` VALUES ('00033', '解欢', 'KevinXie');
INSERT INTO `by_users` VALUES ('00194', '何曦', 'RomilaHe');
INSERT INTO `by_users` VALUES ('00219', '陈放', 'ChenFang');
INSERT INTO `by_users` VALUES ('00131', '卢棋', 'LucyLu');
INSERT INTO `by_users` VALUES ('00135', '刘晓风', 'CandyLiu');
INSERT INTO `by_users` VALUES ('00320', '宋伟坚', 'songweijian');
INSERT INTO `by_users` VALUES ('00181', '周甜', 'LinKoZhou');
INSERT INTO `by_users` VALUES ('00664', '梁洪斌', 'MoonyLiang');
INSERT INTO `by_users` VALUES ('00544', '钟树斌', 'EvanZhong');
INSERT INTO `by_users` VALUES ('00013', '曾燕芬', 'FannyZeng');
INSERT INTO `by_users` VALUES ('00051', '朱娜', 'AnnaZhu');
INSERT INTO `by_users` VALUES ('00337', '徐振开', 'KaiXu');
INSERT INTO `by_users` VALUES ('00102', '何佳玏', 'UltraHe');
INSERT INTO `by_users` VALUES ('00737', '陈炳均', 'BillChen');
INSERT INTO `by_users` VALUES ('00421', '林悦群', 'DarrenLin');
INSERT INTO `by_users` VALUES ('00430', '杨长兴', 'SimonYang');
INSERT INTO `by_users` VALUES ('00382', '杨时孟', 'YangShiMeng');
INSERT INTO `by_users` VALUES ('00405', '马春就', 'JoeMa');
INSERT INTO `by_users` VALUES ('00375', '黄炳豪', 'bingoohuang');
INSERT INTO `by_users` VALUES ('00024', '李云帆', 'YunfanLi');
INSERT INTO `by_users` VALUES ('00046', '曾祥清', 'FredZeng');
INSERT INTO `by_users` VALUES ('00187', '杨晓波', 'GoukiYang');
INSERT INTO `by_users` VALUES ('00039', '毛根金', 'TerryMao');
INSERT INTO `by_users` VALUES ('00071', '张俊杰', 'JsZhang');
INSERT INTO `by_users` VALUES ('00319', '张家慧', 'elinzhang');
INSERT INTO `by_users` VALUES ('00712', '李宇敏', 'VanssaLi');
INSERT INTO `by_users` VALUES ('00644', '苏莎', 'SusanSu');
INSERT INTO `by_users` VALUES ('00579', '陈师', 'NickChen');
INSERT INTO `by_users` VALUES ('00736', '王小娇', 'AngelinaWang');
INSERT INTO `by_users` VALUES ('00655', '崔颖', 'ElaineCui');
INSERT INTO `by_users` VALUES ('00491', '李诗谊', 'AmalaLi');
INSERT INTO `by_users` VALUES ('00595', '左敏红', 'ZoeyZuo');
INSERT INTO `by_users` VALUES ('00587', '陈璇', 'MiffyChen');
INSERT INTO `by_users` VALUES ('00650', '王博涵', 'BoboWang');
INSERT INTO `by_users` VALUES ('00580', '李冠龙', 'AvicinarLi');
INSERT INTO `by_users` VALUES ('00328', '于洁琼', 'LesleyYu');
INSERT INTO `by_users` VALUES ('00702', '胡晓婷', 'LarpeHu');
INSERT INTO `by_users` VALUES ('00227', '蔡文静', 'CaiWenjing');
INSERT INTO `by_users` VALUES ('00585', '李雪梅', 'MercyLi');
INSERT INTO `by_users` VALUES ('00259', '单露曦', 'ColleenShan');
INSERT INTO `by_users` VALUES ('00735', '张攀', 'panzhang');
INSERT INTO `by_users` VALUES ('00588', '彭传贞', 'IsabelPeng');
INSERT INTO `by_users` VALUES ('00550', '罗锋采', 'KenLuo');
INSERT INTO `by_users` VALUES ('00220', '黄涟漪', 'ElevenHuang');
INSERT INTO `by_users` VALUES ('80001', 'Arthorn Sinthornchai', 'Arthorn');
INSERT INTO `by_users` VALUES ('80005', 'Poorin Keawdongsang', 'Poorin.K');
INSERT INTO `by_users` VALUES ('80002', 'Jaitana Juntudom', 'Jaitana');
INSERT INTO `by_users` VALUES ('80004', 'Niracha Junsri', 'Niracha');
INSERT INTO `by_users` VALUES ('80003', 'Rachen Kulchorntawas', 'Rachen');
INSERT INTO `by_users` VALUES ('00424', '骆建华', 'RichardLuo');
INSERT INTO `by_users` VALUES ('00156', '韦仕珍', 'BellyWei');
INSERT INTO `by_users` VALUES ('00733', '阿威', 'AlkiviadisGuinis');
INSERT INTO `by_users` VALUES ('00686', '黄悄媚', 'mandyhuang');
INSERT INTO `by_users` VALUES ('00547', '黄红海', 'TyphonHuang');
INSERT INTO `by_users` VALUES ('00643', '符天君', 'AllenFu');
INSERT INTO `by_users` VALUES ('00635', '斯文', 'Siwen');
INSERT INTO `by_users` VALUES ('00402', '梅攀', 'GraceMay');
INSERT INTO `by_users` VALUES ('00538', '周妍君', 'AdaZhou');
INSERT INTO `by_users` VALUES ('00436', '梁婉婵', 'LinaLiang');
INSERT INTO `by_users` VALUES ('00718', '林婕', 'JessicaLin');
INSERT INTO `by_users` VALUES ('00312', '马彬', 'YeheyaMa');
INSERT INTO `by_users` VALUES ('00431', '杜龙飞', 'DerekDu');
INSERT INTO `by_users` VALUES ('00314', '李龙翔', 'KmfireLi');
INSERT INTO `by_users` VALUES ('00683', '高垒', 'TinaGao');
INSERT INTO `by_users` VALUES ('00577', '胡俊', 'LittleHu');
INSERT INTO `by_users` VALUES ('00576', '闫易修', 'LydiaYan');
INSERT INTO `by_users` VALUES ('00534', '范明凤', 'SallyFan');
INSERT INTO `by_users` VALUES ('00570', '田园', 'HeleneTian');
INSERT INTO `by_users` VALUES ('00230', '黄婧', 'SindiHuang');
INSERT INTO `by_users` VALUES ('00288', '朱明尚', 'AsherZhu');
INSERT INTO `by_users` VALUES ('00609', '潘虹西', 'SiszaPan');
INSERT INTO `by_users` VALUES ('00556', '李静玲', 'LilyLi');
INSERT INTO `by_users` VALUES ('00661', '黄钻坭', 'SofianaWijaya');
INSERT INTO `by_users` VALUES ('00619', '甘曼馨', 'ArumGan');
INSERT INTO `by_users` VALUES ('00376', '邓富玲', 'EdyDeng');
INSERT INTO `by_users` VALUES ('00617', '陆维维', 'JuwitaLu');
INSERT INTO `by_users` VALUES ('00050', '万倩芸', 'SaraWan');
INSERT INTO `by_users` VALUES ('00297', '潘晓锋', 'panxiaofeng');
INSERT INTO `by_users` VALUES ('00451', '李繁', 'ToffeeLee');
INSERT INTO `by_users` VALUES ('00468', '梁美华', 'AmberLiang');
INSERT INTO `by_users` VALUES ('00275', '梁桂丹', 'janeliang');
INSERT INTO `by_users` VALUES ('00666', '黄婷筠', 'BellaHuang');
INSERT INTO `by_users` VALUES ('00673', '李燕红', 'SaraLi');
INSERT INTO `by_users` VALUES ('00597', '严俊文', 'GermanYan');
INSERT INTO `by_users` VALUES ('00505', '田伊杉', 'MarciaTian');
INSERT INTO `by_users` VALUES ('00419', '蔡舟舟', 'PalinCai');
INSERT INTO `by_users` VALUES ('00490', '黄锦英', 'RebaccaHuang');
INSERT INTO `by_users` VALUES ('00407', '王运新', 'SamWang');
INSERT INTO `by_users` VALUES ('00081', '温丽芳', 'AmyWen');
INSERT INTO `by_users` VALUES ('00180', '谢涛', 'JackXie');
INSERT INTO `by_users` VALUES ('00706', '宛洁', 'JoyWan');
INSERT INTO `by_users` VALUES ('00475', '张晶', 'CherryZhang');
INSERT INTO `by_users` VALUES ('00462', '王丽', 'LisaWang');
INSERT INTO `by_users` VALUES ('00380', '高伟', 'TomGao');
INSERT INTO `by_users` VALUES ('00170', '黄红艳', 'HuangHongyan');
INSERT INTO `by_users` VALUES ('00647', '陈丹萍', 'FannyChen');
INSERT INTO `by_users` VALUES ('00433', '陈炳龙', 'AxiusChen');
INSERT INTO `by_users` VALUES ('00707', '郑宇杰', 'JasonZheng');
INSERT INTO `by_users` VALUES ('00543', '桂诗琼', 'FredGui');
INSERT INTO `by_users` VALUES ('00442', '彭万强', 'WanPeng');
INSERT INTO `by_users` VALUES ('00555', '王欣', 'WangXin');
INSERT INTO `by_users` VALUES ('00428', '罗于凯', 'PrayLuo');
INSERT INTO `by_users` VALUES ('00401', '欧阳献贤', 'ChecdouYang');
INSERT INTO `by_users` VALUES ('00646', '黎思琦', 'SalmanLi');
INSERT INTO `by_users` VALUES ('00648', '邝中云', 'KAKAKuang');
INSERT INTO `by_users` VALUES ('00652', '许瑶', 'EvaXu');
INSERT INTO `by_users` VALUES ('00697', '赵榜', 'zhaobang');
INSERT INTO `by_users` VALUES ('00441', '王博喻', 'WangBoyu');
INSERT INTO `by_users` VALUES ('00539', '秦卿', 'SayQin');
INSERT INTO `by_users` VALUES ('00522', '周庆', 'ZhouQing');
INSERT INTO `by_users` VALUES ('00536', '张忠喜', 'DesmondZhang');
INSERT INTO `by_users` VALUES ('00575', '严兵', 'EdwardYan');
INSERT INTO `by_users` VALUES ('00228', '成美霖', 'MelonChen');
INSERT INTO `by_users` VALUES ('00596', '张相泉', 'AbnerZhang');
INSERT INTO `by_users` VALUES ('00420', '王思源', 'LelouchWang');
INSERT INTO `by_users` VALUES ('00693', '艾文立', 'EwaDenisiuk');
INSERT INTO `by_users` VALUES ('00633', '吴霜霜', 'CindyWu');
INSERT INTO `by_users` VALUES ('00392', '梁爽', 'PatriciaLiang');
INSERT INTO `by_users` VALUES ('00545', '陶媛媛', 'CandyTao');
INSERT INTO `by_users` VALUES ('00437', 'Maggie Dziem', 'MaggieDziem');
INSERT INTO `by_users` VALUES ('00072', '陈境旺', 'PakeChen');
INSERT INTO `by_users` VALUES ('00460', '周颖圆', 'AnnaZhou');
INSERT INTO `by_users` VALUES ('00028', '向博华', 'AllenXiang');
INSERT INTO `by_users` VALUES ('00054', '许靖', 'EricXu');
INSERT INTO `by_users` VALUES ('00606', '李明月', 'MoniLi');
INSERT INTO `by_users` VALUES ('00372', '邹东东', 'zanelzou');
INSERT INTO `by_users` VALUES ('00422', '陈萍', 'MikoChen');
INSERT INTO `by_users` VALUES ('00022', '吕杜娟', 'MonicaLv');
INSERT INTO `by_users` VALUES ('00581', '宋健', 'ThomasSong');
INSERT INTO `by_users` VALUES ('00356', '李妍', 'LynnLi');
INSERT INTO `by_users` VALUES ('00004', 'Andy Zhang', 'Andy');
INSERT INTO `by_users` VALUES ('00330', '周兵', 'LubinZhou');
INSERT INTO `by_users` VALUES ('00027', '雷娟', 'AlbeeLei');
INSERT INTO `by_users` VALUES ('00418', '廖美昌', 'MarkLiao');
INSERT INTO `by_users` VALUES ('00029', '邓泽琨', 'JamesDeng');
INSERT INTO `by_users` VALUES ('00035', '毛宇', 'AngeliaMao');
INSERT INTO `by_users` VALUES ('00590', '苏敏', 'Suemin');
INSERT INTO `by_users` VALUES ('00215', '姜源', 'SevenJiang');
INSERT INTO `by_users` VALUES ('00500', '叶盈盈', 'FayYe');
INSERT INTO `by_users` VALUES ('00660', '曾梅', 'ZengMei');
INSERT INTO `by_users` VALUES ('00159', '陈琳', 'ViviChen');
INSERT INTO `by_users` VALUES ('00332', '汪飘华', 'PhilWang');
INSERT INTO `by_users` VALUES ('00370', '张健', 'SimplyZhang');
INSERT INTO `by_users` VALUES ('00249', '周建华', 'ZhouJianhua');
INSERT INTO `by_users` VALUES ('00719', '胡伟军', 'GondarHu');
INSERT INTO `by_users` VALUES ('00610', '马媛', 'MandyMa');
INSERT INTO `by_users` VALUES ('00645', '史丽娟', 'BetsyShi');
INSERT INTO `by_users` VALUES ('00164', '汪燕', 'LilyWang');
INSERT INTO `by_users` VALUES ('00158', '乔宇江', 'EruFeng');
INSERT INTO `by_users` VALUES ('00495', '谭智勇', 'TonyTan');
INSERT INTO `by_users` VALUES ('00260', '罗筱翠', 'IsabellaLuo');
INSERT INTO `by_users` VALUES ('00248', '陈伟', 'ChenWei');
INSERT INTO `by_users` VALUES ('00281', '徐旭', 'leoxu');
INSERT INTO `by_users` VALUES ('00692', '雷菲', 'LeiFei');
INSERT INTO `by_users` VALUES ('00261', '戴赛玉', 'DaisyDai');
INSERT INTO `by_users` VALUES ('00618', '陈泳文', 'ArvinChen');
INSERT INTO `by_users` VALUES ('00569', '魏婷', 'SherryWei');
INSERT INTO `by_users` VALUES ('00717', '胡娇红', 'JenniferHu');
INSERT INTO `by_users` VALUES ('00262', '黄倩', 'HaleyHuang');
INSERT INTO `by_users` VALUES ('00529', '王禹琪', 'Chrisyuqi');
INSERT INTO `by_users` VALUES ('00095', '龙力勤', 'KatyLong');
INSERT INTO `by_users` VALUES ('00238', '吴清泉', 'BirdWu');
INSERT INTO `by_users` VALUES ('00440', '廖伟清', 'Liaowq');
INSERT INTO `by_users` VALUES ('00496', '李佳星', 'LigaLi');
INSERT INTO `by_users` VALUES ('00734', '杨勇', 'yangyou');
INSERT INTO `by_users` VALUES ('00636', '谢贤敏', 'SianXie');
INSERT INTO `by_users` VALUES ('00604', '胡铁军', 'LukeHu');
INSERT INTO `by_users` VALUES ('00583', '莫正锣', 'MoreMo');
INSERT INTO `by_users` VALUES ('00045', '祝小振', 'JackZhu');
INSERT INTO `by_users` VALUES ('00466', '熊凯', 'StormXiong');
INSERT INTO `by_users` VALUES ('00225', '梅亮亮', 'MarkMei');
INSERT INTO `by_users` VALUES ('00343', '邬道锋', 'DeeWu');
INSERT INTO `by_users` VALUES ('00373', '孟建国', 'HopeMeng');
INSERT INTO `by_users` VALUES ('00638', '舒攀', 'FrankthShu');
INSERT INTO `by_users` VALUES ('00641', '余鹏', 'JasonYu');
INSERT INTO `by_users` VALUES ('00295', '全龙国', 'JakQuan');
INSERT INTO `by_users` VALUES ('00674', '王学煌', 'TimWang');
INSERT INTO `by_users` VALUES ('00253', '庄璐宇', 'luyuzhuang');
INSERT INTO `by_users` VALUES ('00129', '叶运友', 'Hardie');
INSERT INTO `by_users` VALUES ('00206', '董勇', 'FrankDong');
INSERT INTO `by_users` VALUES ('00667', '张丛斌', 'RobbyZhang');
INSERT INTO `by_users` VALUES ('00456', '胡文峰', 'JasonHu');
INSERT INTO `by_users` VALUES ('00443', '罗远金', 'JameLuo');
INSERT INTO `by_users` VALUES ('00026', '何达维', 'DaveyhookHe');
INSERT INTO `by_users` VALUES ('00560', '蔡琴', 'SelinaCai');
INSERT INTO `by_users` VALUES ('00239', '胡金', 'RebortsHu');
INSERT INTO `by_users` VALUES ('00626', '韦文德', 'DevenWei');
INSERT INTO `by_users` VALUES ('00671', '谭龙华', 'Tanlh');
INSERT INTO `by_users` VALUES ('00019', '刘少明', 'AndrewLiu');
INSERT INTO `by_users` VALUES ('00658', '李峙舟', 'LanceLi');
INSERT INTO `by_users` VALUES ('00615', '张莉敏', 'AnneZhang');
INSERT INTO `by_users` VALUES ('00487', '吴鹏生', 'SenWu');
INSERT INTO `by_users` VALUES ('00369', '唐霞萍', 'FunnyTang');
INSERT INTO `by_users` VALUES ('00276', '邱静', 'MayQiu');
INSERT INTO `by_users` VALUES ('00571', '杨超', 'SevenYang');
INSERT INTO `by_users` VALUES ('00209', '李习辉', 'SeaveyLee');
INSERT INTO `by_users` VALUES ('00058', '王喆', 'XiaoZWang');
INSERT INTO `by_users` VALUES ('00147', '赵小娟', 'JuanziZhao');
INSERT INTO `by_users` VALUES ('00530', '赵洁贞', 'JinZhao');
INSERT INTO `by_users` VALUES ('00523', '李兴', 'LonmoLee');
INSERT INTO `by_users` VALUES ('00018', '黄锦陵', 'EwaAi');
INSERT INTO `by_users` VALUES ('00681', '李捷', 'jasonlee');
INSERT INTO `by_users` VALUES ('00722', '吴业威', 'StephenWu');
INSERT INTO `by_users` VALUES ('00672', '赵洋', 'JoeCharles');
INSERT INTO `by_users` VALUES ('00096', '黄妍妍', 'YanyanWong');
INSERT INTO `by_users` VALUES ('00300', '樊施施', 'SisiCat');
INSERT INTO `by_users` VALUES ('00396', '孙鉴', 'SamJian');
INSERT INTO `by_users` VALUES ('00299', '李芳敏', 'fomesli');
INSERT INTO `by_users` VALUES ('00515', '刘咪', 'LiuMi');
INSERT INTO `by_users` VALUES ('00251', '邹荣霞', 'ZoeZou');
INSERT INTO `by_users` VALUES ('00613', '徐昌乾', 'KevinXu');
INSERT INTO `by_users` VALUES ('00699', '文添奇', 'TeekeayWen');
INSERT INTO `by_users` VALUES ('00052', '洪秋丽', 'AutumnHong');
INSERT INTO `by_users` VALUES ('00682', '莫志鹏', 'SilenceMo');
INSERT INTO `by_users` VALUES ('00329', '魏一丹', 'danierwei');
INSERT INTO `by_users` VALUES ('00277', '杜帅', 'AceDu');
INSERT INTO `by_users` VALUES ('00564', '曾令英', 'LysaZeng');
INSERT INTO `by_users` VALUES ('00525', '穆申', 'MuShen');
INSERT INTO `by_users` VALUES ('00628', '龚建飞', 'JerryGong');
INSERT INTO `by_users` VALUES ('00499', '贺军', 'HeJun');
INSERT INTO `by_users` VALUES ('00425', '梁之源', 'NatureLiang');
INSERT INTO `by_users` VALUES ('00244', '魏双飞', 'YyWei');
INSERT INTO `by_users` VALUES ('00725', '张瑞', 'ruizhang');
INSERT INTO `by_users` VALUES ('00414', '刘佳', 'EvaLiu');
INSERT INTO `by_users` VALUES ('00631', '熊虎', 'AllenXiong');
INSERT INTO `by_users` VALUES ('00709', '何江海', 'SamHe');
INSERT INTO `by_users` VALUES ('00073', '李涛', 'AguLee');
INSERT INTO `by_users` VALUES ('00222', '刘刚', 'LiuGang');
INSERT INTO `by_users` VALUES ('00412', '姚玉楠', 'NancyYao');
INSERT INTO `by_users` VALUES ('00011', '艾丽萍', 'AmyAi');
INSERT INTO `by_users` VALUES ('00162', '吴昌昱', 'wuchangyu');
INSERT INTO `by_users` VALUES ('00621', '朱蕾', 'ReeZhu');
INSERT INTO `by_users` VALUES ('00630', '陈月', 'ChrisChen');
INSERT INTO `by_users` VALUES ('00486', '敖锐', 'RayAo');
INSERT INTO `by_users` VALUES ('00625', '曾海霞', 'CandyZeng');
INSERT INTO `by_users` VALUES ('00489', '张爽', 'ShannonZhang');
INSERT INTO `by_users` VALUES ('00713', '巫森林', 'ForestWu');
INSERT INTO `by_users` VALUES ('00622', '文莲', 'JoannaWen');
INSERT INTO `by_users` VALUES ('00678', '陈映林', 'kenneychen');
INSERT INTO `by_users` VALUES ('00037', '王春菊', 'IvyWang');
INSERT INTO `by_users` VALUES ('00354', '肖颖', 'SophieXiao');
INSERT INTO `by_users` VALUES ('00154', '许胜华', 'JudyXu');
INSERT INTO `by_users` VALUES ('00195', '王旭', 'Wonderful');
INSERT INTO `by_users` VALUES ('00498', '曾禹', 'RainZeng');
INSERT INTO `by_users` VALUES ('00511', '陈婷婷', 'TinaChen');
INSERT INTO `by_users` VALUES ('00727', '巫晓娟', 'janetwu');
INSERT INTO `by_users` VALUES ('00548', '游添红', 'TeenYou');
INSERT INTO `by_users` VALUES ('00178', '赵小林', 'LisaZhao');
INSERT INTO `by_users` VALUES ('00685', '汤飞平', 'PinkTang');
INSERT INTO `by_users` VALUES ('00053', '卫丽华', 'EvaWei');
INSERT INTO `by_users` VALUES ('00519', '肖寒', 'IvyXiao');
INSERT INTO `by_users` VALUES ('00535', '唐莉', 'LilyTang');
INSERT INTO `by_users` VALUES ('00554', '李柳荫', 'VilaLi');
INSERT INTO `by_users` VALUES ('00634', '高玉蓉', 'NancyGao');
INSERT INTO `by_users` VALUES ('00731', '王姗娜', 'SabrinaWang');
INSERT INTO `by_users` VALUES ('00687', '周文', 'KevinZhou');
