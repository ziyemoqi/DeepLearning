/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-08-19 17:28:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `banner_id` varchar(32) NOT NULL COMMENT '广告位ID',
  `pic` varchar(255) NOT NULL COMMENT '展示图片',
  `show_type` tinyint(1) NOT NULL COMMENT '展示形式 0:一行一个 1：轮播图 2：大图横向滚动',
  `link_type` varchar(32) DEFAULT NULL COMMENT '链接类型0: 无 1:外部链接 2:内部连接',
  `link_url` varchar(1024) DEFAULT NULL COMMENT '链接地址',
  `link_param` varchar(255) DEFAULT NULL COMMENT '链接参数',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `delete_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`banner_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告';

-- ----------------------------
-- Records of banner
-- ----------------------------

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `coupon_id` varchar(32) NOT NULL COMMENT '优惠券ID',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券金额',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `order_id` varchar(32) DEFAULT NULL COMMENT '订单ID',
  `is_used` bit(1) DEFAULT NULL COMMENT '是否使用 0未使用 1已使用',
  `used_time` timestamp NULL DEFAULT NULL COMMENT '使用时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`coupon_id`),
  KEY `FK_trade_coupon` (`user_id`),
  KEY `FK_trade_coupon2` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券';

-- ----------------------------
-- Records of coupon
-- ----------------------------

-- ----------------------------
-- Table structure for logistics
-- ----------------------------
DROP TABLE IF EXISTS `logistics`;
CREATE TABLE `logistics` (
  `logistics_id` varchar(32) NOT NULL COMMENT '物流模板ID',
  `name` varchar(32) NOT NULL COMMENT '模板名称',
  `calc_method` tinyint(4) NOT NULL COMMENT '计费方式@2.3',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`logistics_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物流模板';

-- ----------------------------
-- Records of logistics
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_area
-- ----------------------------
DROP TABLE IF EXISTS `logistics_area`;
CREATE TABLE `logistics_area` (
  `logistics_area_id` varchar(32) NOT NULL COMMENT '物流模板区域ID',
  `logistics_id` varchar(32) NOT NULL COMMENT '物流模板ID',
  `group_num` int(11) NOT NULL COMMENT '分组序号',
  `region_code` varchar(32) NOT NULL COMMENT '行政区划代码',
  `first_num` decimal(11,2) NOT NULL COMMENT '首件',
  `first_price` decimal(11,2) NOT NULL COMMENT '运费',
  `add_num` decimal(11,2) NOT NULL COMMENT '续件',
  `add_price` decimal(11,2) NOT NULL COMMENT '续费',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`logistics_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物流模板区域';

-- ----------------------------
-- Records of logistics_area
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_company
-- ----------------------------
DROP TABLE IF EXISTS `logistics_company`;
CREATE TABLE `logistics_company` (
  `code` varchar(32) NOT NULL COMMENT '物流代码',
  `name` varchar(32) NOT NULL COMMENT '物流名称',
  `sort` int(11) NOT NULL COMMENT '排序号',
  PRIMARY KEY (`code`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物流公司';

-- ----------------------------
-- Records of logistics_company
-- ----------------------------
INSERT INTO `logistics_company` VALUES ('AAEWEB', 'AAE', '100');
INSERT INTO `logistics_company` VALUES ('ACS', 'ACS雅仕快递', '420');
INSERT INTO `logistics_company` VALUES ('ADAPOST', '安达速递', '110');
INSERT INTO `logistics_company` VALUES ('ADODOXOM', '澳多多国际速递', '108');
INSERT INTO `logistics_company` VALUES ('ADP', 'ADP Express Tracking', '421');
INSERT INTO `logistics_company` VALUES ('AJWL', '安捷物流', '104');
INSERT INTO `logistics_company` VALUES ('AMAZON', '亚马逊', '391');
INSERT INTO `logistics_company` VALUES ('ANE', '安能', '138');
INSERT INTO `logistics_company` VALUES ('ANEEX', '安能快递', '140');
INSERT INTO `logistics_company` VALUES ('ANGUILAYOU', '安圭拉邮政', '382');
INSERT INTO `logistics_company` VALUES ('ANJELEX', '安捷快递', '136');
INSERT INTO `logistics_company` VALUES ('ANTS', 'ANTS', '105');
INSERT INTO `logistics_company` VALUES ('ANXINDA', '安信达', '142');
INSERT INTO `logistics_company` VALUES ('ANXL', '安迅物流', '102');
INSERT INTO `logistics_company` VALUES ('AOL', '澳通速递', '244');
INSERT INTO `logistics_company` VALUES ('AOMENYZ', '澳门邮政', '392');
INSERT INTO `logistics_company` VALUES ('AOTSD', '澳天速运', '101');
INSERT INTO `logistics_company` VALUES ('APAC', 'APAC', '383');
INSERT INTO `logistics_company` VALUES ('APEX', '全一', '127');
INSERT INTO `logistics_company` VALUES ('APLUSEX', 'Aplus物流', '109');
INSERT INTO `logistics_company` VALUES ('ARAMEX', 'Aramex', '114');
INSERT INTO `logistics_company` VALUES ('ASTEXPRESS', '安世通快递', '106');
INSERT INTO `logistics_company` VALUES ('AT', '奥地利邮政', '388');
INSERT INTO `logistics_company` VALUES ('AUSEXPRESS', '澳世速递', '111');
INSERT INTO `logistics_company` VALUES ('AUSTRALIA', 'Australia Post Tracking', '422');
INSERT INTO `logistics_company` VALUES ('AYCA', '澳邮专线(澳邮中国快运)', '213');
INSERT INTO `logistics_company` VALUES ('BCWELT', 'BCWELT', '432');
INSERT INTO `logistics_company` VALUES ('BDT', '八达通', '214');
INSERT INTO `logistics_company` VALUES ('BEL', '比利时邮政', '423');
INSERT INTO `logistics_company` VALUES ('BFAY', '八方安运', '396');
INSERT INTO `logistics_company` VALUES ('BHGJ', '贝海国际', '394');
INSERT INTO `logistics_company` VALUES ('BHT', 'BHT快递', '424');
INSERT INTO `logistics_company` VALUES ('BILUYOUZHE', '秘鲁邮政', '425');
INSERT INTO `logistics_company` VALUES ('BLACKDOG', '黑狗', '166');
INSERT INTO `logistics_company` VALUES ('BLUESKY', '蓝天', '199');
INSERT INTO `logistics_company` VALUES ('BN', '笨鸟国际', '433');
INSERT INTO `logistics_company` VALUES ('BQXHM', '北青小红帽', '395');
INSERT INTO `logistics_company` VALUES ('BR', '巴西邮政', '426');
INSERT INTO `logistics_company` VALUES ('BROADASIA', '亚风', '163');
INSERT INTO `logistics_company` VALUES ('BSKY', '百世快运', '148');
INSERT INTO `logistics_company` VALUES ('BUDANYOUZH', '不丹邮政', '427');
INSERT INTO `logistics_company` VALUES ('CA', '加拿大邮政', '437');
INSERT INTO `logistics_company` VALUES ('CAE', '民航', '389');
INSERT INTO `logistics_company` VALUES ('CCES', 'CCES快递', '393');
INSERT INTO `logistics_company` VALUES ('CDSTKY', '成都善途速运', '399');
INSERT INTO `logistics_company` VALUES ('CHINAPOST', '邮政包裹', '9');
INSERT INTO `logistics_company` VALUES ('CHINZ56', '秦远物流', '121');
INSERT INTO `logistics_company` VALUES ('CITY100', '城市100', '215');
INSERT INTO `logistics_company` VALUES ('CJGJ', '长江国际快递', '533');
INSERT INTO `logistics_company` VALUES ('CJKD', '城际快递', '216');
INSERT INTO `logistics_company` VALUES ('CNPL', '中邮', '204');
INSERT INTO `logistics_company` VALUES ('COE', '中国东方', '194');
INSERT INTO `logistics_company` VALUES ('CRE', '中铁快运', '196');
INSERT INTO `logistics_company` VALUES ('CSCY', '长沙创一', '398');
INSERT INTO `logistics_company` VALUES ('CTG', '联合运通', '400');
INSERT INTO `logistics_company` VALUES ('D4PX', '递四方速递', '217');
INSERT INTO `logistics_company` VALUES ('DANNIAO', '丹鸟快递', '532');
INSERT INTO `logistics_company` VALUES ('DEPPON', '德邦', '10');
INSERT INTO `logistics_company` VALUES ('DEXP', 'D速', '120');
INSERT INTO `logistics_company` VALUES ('DHL', 'DHL国内件', '116');
INSERT INTO `logistics_company` VALUES ('DHL_EN', 'DHL国际件', '117');
INSERT INTO `logistics_company` VALUES ('DJ56', '东骏快捷', '210');
INSERT INTO `logistics_company` VALUES ('DK', '丹麦邮政', '429');
INSERT INTO `logistics_company` VALUES ('DPD', 'DPD', '428');
INSERT INTO `logistics_company` VALUES ('DPEX', 'DPEX', '118');
INSERT INTO `logistics_company` VALUES ('DTW', '大田', '152');
INSERT INTO `logistics_company` VALUES ('EES', '百福东方', '144');
INSERT INTO `logistics_company` VALUES ('EFSPOST', '平安快递', '119');
INSERT INTO `logistics_company` VALUES ('EMS', 'EMS', '8');
INSERT INTO `logistics_company` VALUES ('ESHIPPER', 'EShipper', '431');
INSERT INTO `logistics_company` VALUES ('ETD', '易通达', '169');
INSERT INTO `logistics_company` VALUES ('EUASIA', '欧亚专线', '390');
INSERT INTO `logistics_company` VALUES ('EWE', 'EWE', '124');
INSERT INTO `logistics_company` VALUES ('EWINSHINE', '万象', '155');
INSERT INTO `logistics_company` VALUES ('EXFRESH', '安鲜达', '103');
INSERT INTO `logistics_company` VALUES ('FASTEXPRESS', '快捷', '197');
INSERT INTO `logistics_company` VALUES ('FEDEX', '联邦快递', '126');
INSERT INTO `logistics_company` VALUES ('FEDEXIN', 'FedEx国际', '128');
INSERT INTO `logistics_company` VALUES ('FEDEX_GJ', '联邦快递国际', '211');
INSERT INTO `logistics_company` VALUES ('FKD', '飞康达', '218');
INSERT INTO `logistics_company` VALUES ('FLYWAYEX', '程光', '150');
INSERT INTO `logistics_company` VALUES ('FTD', '富腾达', '160');
INSERT INTO `logistics_company` VALUES ('GCE', '飞洋', '156');
INSERT INTO `logistics_company` VALUES ('GD', '冠达', '401');
INSERT INTO `logistics_company` VALUES ('GDEMS', '广东邮政', '402');
INSERT INTO `logistics_company` VALUES ('GJEYB', '国际e邮宝', '430');
INSERT INTO `logistics_company` VALUES ('GLS', 'GLS', '245');
INSERT INTO `logistics_company` VALUES ('GSD', '共速达', '162');
INSERT INTO `logistics_company` VALUES ('GTO', '国通', '164');
INSERT INTO `logistics_company` VALUES ('GTSD', '高铁速递', '219');
INSERT INTO `logistics_company` VALUES ('GZWENJIE', '文捷航空', '157');
INSERT INTO `logistics_company` VALUES ('HEMA', '河马动力', '243');
INSERT INTO `logistics_company` VALUES ('HENGLU', '恒路', '168');
INSERT INTO `logistics_company` VALUES ('HFWL', '汇丰物流', '403');
INSERT INTO `logistics_company` VALUES ('HOAU', '天地华宇', '146');
INSERT INTO `logistics_company` VALUES ('HOTSCM', '鸿桥供应链', '397');
INSERT INTO `logistics_company` VALUES ('HPTEX', '海派通物流公司', '404');
INSERT INTO `logistics_company` VALUES ('hq568', '华强物流', '405');
INSERT INTO `logistics_company` VALUES ('HQKY', '华企', '172');
INSERT INTO `logistics_company` VALUES ('HQSY', '环球速运', '220');
INSERT INTO `logistics_company` VALUES ('HREX', '锦程快递', '184');
INSERT INTO `logistics_company` VALUES ('HTKY', '百世快递', '6');
INSERT INTO `logistics_company` VALUES ('HXLWL', '华夏龙物流', '407');
INSERT INTO `logistics_company` VALUES ('HXWL', '豪翔物流', '406');
INSERT INTO `logistics_company` VALUES ('HYE', '鸿远', '170');
INSERT INTO `logistics_company` VALUES ('HYLSD', '好来运快递', '221');
INSERT INTO `logistics_company` VALUES ('IADLSQDYZ', '安的列斯群岛邮政', '246');
INSERT INTO `logistics_company` VALUES ('IADLYYZ', '澳大利亚邮政', '247');
INSERT INTO `logistics_company` VALUES ('IAEBNYYZ', '阿尔巴尼亚邮政', '248');
INSERT INTO `logistics_company` VALUES ('IAEJLYYZ', '阿尔及利亚邮政', '249');
INSERT INTO `logistics_company` VALUES ('IAFHYZ', '阿富汗邮政', '250');
INSERT INTO `logistics_company` VALUES ('IAGLYZ', '安哥拉邮政', '251');
INSERT INTO `logistics_company` VALUES ('IAGTYZ', '阿根廷邮政', '252');
INSERT INTO `logistics_company` VALUES ('IAJYZ', '埃及邮政', '253');
INSERT INTO `logistics_company` VALUES ('IALBYZ', '阿鲁巴邮政', '254');
INSERT INTO `logistics_company` VALUES ('IALQDYZ', '奥兰群岛邮政', '255');
INSERT INTO `logistics_company` VALUES ('IALYYZ', '阿联酋邮政', '256');
INSERT INTO `logistics_company` VALUES ('IAMYZ', '阿曼邮政', '257');
INSERT INTO `logistics_company` VALUES ('IASBJYZ', '阿塞拜疆邮政', '258');
INSERT INTO `logistics_company` VALUES ('IASEBYYZ', '埃塞俄比亚邮政', '259');
INSERT INTO `logistics_company` VALUES ('IASNYYZ', '爱沙尼亚邮政', '260');
INSERT INTO `logistics_company` VALUES ('IASSDYZ', '阿森松岛邮政', '261');
INSERT INTO `logistics_company` VALUES ('IBCWNYZ', '博茨瓦纳邮政', '262');
INSERT INTO `logistics_company` VALUES ('IBDLGYZ', '波多黎各邮政', '263');
INSERT INTO `logistics_company` VALUES ('IBDYZ', '冰岛邮政', '264');
INSERT INTO `logistics_company` VALUES ('IBELSYZ', '白俄罗斯邮政', '265');
INSERT INTO `logistics_company` VALUES ('IBHYZ', '波黑邮政', '266');
INSERT INTO `logistics_company` VALUES ('IBJLYYZ', '保加利亚邮政', '267');
INSERT INTO `logistics_company` VALUES ('IBJSTYZ', '巴基斯坦邮政', '268');
INSERT INTO `logistics_company` VALUES ('IBLNYZ', '黎巴嫩邮政', '269');
INSERT INTO `logistics_company` VALUES ('IBLSD', '便利速递', '270');
INSERT INTO `logistics_company` VALUES ('IBLWYYZ', '玻利维亚邮政', '271');
INSERT INTO `logistics_company` VALUES ('IBLYZ', '巴林邮政', '272');
INSERT INTO `logistics_company` VALUES ('IBMDYZ', '百慕达邮政', '273');
INSERT INTO `logistics_company` VALUES ('IBOLYZ', '波兰邮政', '274');
INSERT INTO `logistics_company` VALUES ('IBTD', '宝通达', '275');
INSERT INTO `logistics_company` VALUES ('IBUY8', '爱拜物流', '107');
INSERT INTO `logistics_company` VALUES ('IBYB', '贝邮宝', '276');
INSERT INTO `logistics_company` VALUES ('ICKY', '出口易', '277');
INSERT INTO `logistics_company` VALUES ('IDFWL', '达方物流', '278');
INSERT INTO `logistics_company` VALUES ('IDGYZ', '德国邮政', '279');
INSERT INTO `logistics_company` VALUES ('IE', '爱尔兰邮政', '280');
INSERT INTO `logistics_company` VALUES ('IEGDEYZ', '厄瓜多尔邮政', '281');
INSERT INTO `logistics_company` VALUES ('IELSYZ', '俄罗斯邮政', '282');
INSERT INTO `logistics_company` VALUES ('IELTLYYZ', '厄立特里亚邮政', '283');
INSERT INTO `logistics_company` VALUES ('IFTWL', '飞特物流', '284');
INSERT INTO `logistics_company` VALUES ('IGDLPDEMS', '瓜德罗普岛EMS', '285');
INSERT INTO `logistics_company` VALUES ('IGDLPDYZ', '瓜德罗普岛邮政', '286');
INSERT INTO `logistics_company` VALUES ('IGJESD', '俄速递', '287');
INSERT INTO `logistics_company` VALUES ('IGLBYYZ', '哥伦比亚邮政', '288');
INSERT INTO `logistics_company` VALUES ('IGLLYZ', '格陵兰邮政', '289');
INSERT INTO `logistics_company` VALUES ('IGSDLJYZ', '哥斯达黎加邮政', '290');
INSERT INTO `logistics_company` VALUES ('IHGYZ', '韩国邮政', '291');
INSERT INTO `logistics_company` VALUES ('IHHWL', '华翰物流', '292');
INSERT INTO `logistics_company` VALUES ('IHLY', '互联易', '293');
INSERT INTO `logistics_company` VALUES ('IHSKSTYZ', '哈萨克斯坦邮政', '294');
INSERT INTO `logistics_company` VALUES ('IHSYZ', '黑山邮政', '295');
INSERT INTO `logistics_company` VALUES ('IJBBWYZ', '津巴布韦邮政', '296');
INSERT INTO `logistics_company` VALUES ('IJEJSSTYZ', '吉尔吉斯斯坦邮政', '297');
INSERT INTO `logistics_company` VALUES ('IJKYZ', '捷克邮政', '298');
INSERT INTO `logistics_company` VALUES ('IJNYZ', '加纳邮政', '299');
INSERT INTO `logistics_company` VALUES ('IJPZYZ', '柬埔寨邮政', '300');
INSERT INTO `logistics_company` VALUES ('IKNDYYZ', '克罗地亚邮政', '301');
INSERT INTO `logistics_company` VALUES ('IKNYYZ', '肯尼亚邮政', '302');
INSERT INTO `logistics_company` VALUES ('IKTDWEMS', '科特迪瓦EMS', '303');
INSERT INTO `logistics_company` VALUES ('IKTDWYZ', '科特迪瓦邮政', '304');
INSERT INTO `logistics_company` VALUES ('IKTEYZ', '卡塔尔邮政', '305');
INSERT INTO `logistics_company` VALUES ('ILBYYZ', '利比亚邮政', '306');
INSERT INTO `logistics_company` VALUES ('ILKKD', '林克快递', '307');
INSERT INTO `logistics_company` VALUES ('ILMNYYZ', '罗马尼亚邮政', '308');
INSERT INTO `logistics_company` VALUES ('ILSBYZ', '卢森堡邮政', '309');
INSERT INTO `logistics_company` VALUES ('ILTWYYZ', '拉脱维亚邮政', '310');
INSERT INTO `logistics_company` VALUES ('ILTWYZ', '立陶宛邮政', '311');
INSERT INTO `logistics_company` VALUES ('ILZDSDYZ', '列支敦士登邮政', '312');
INSERT INTO `logistics_company` VALUES ('IMEDFYZ', '马尔代夫邮政', '313');
INSERT INTO `logistics_company` VALUES ('IMEDWYZ', '摩尔多瓦邮政', '314');
INSERT INTO `logistics_company` VALUES ('IMETYZ', '马耳他邮政', '315');
INSERT INTO `logistics_company` VALUES ('IMJLGEMS', '孟加拉国EMS', '316');
INSERT INTO `logistics_company` VALUES ('IMLGYZ', '摩洛哥邮政', '317');
INSERT INTO `logistics_company` VALUES ('IMLQSYZ', '毛里求斯邮政', '318');
INSERT INTO `logistics_company` VALUES ('IMLXYEMS', '马来西亚EMS', '319');
INSERT INTO `logistics_company` VALUES ('IMLXYYZ', '马来西亚邮政', '320');
INSERT INTO `logistics_company` VALUES ('IMQDYZ', '马其顿邮政', '321');
INSERT INTO `logistics_company` VALUES ('IMTNKEMS', '马提尼克EMS', '322');
INSERT INTO `logistics_company` VALUES ('IMTNKYZ', '马提尼克邮政', '323');
INSERT INTO `logistics_company` VALUES ('IMXGYZ', '墨西哥邮政', '324');
INSERT INTO `logistics_company` VALUES ('INFYZ', '南非邮政', '325');
INSERT INTO `logistics_company` VALUES ('INRLYYZ', '尼日利亚邮政', '326');
INSERT INTO `logistics_company` VALUES ('INTMAIL', '邮政国际包裹', '209');
INSERT INTO `logistics_company` VALUES ('INWYZ', '挪威邮政', '327');
INSERT INTO `logistics_company` VALUES ('IPTYYZ', '葡萄牙邮政', '328');
INSERT INTO `logistics_company` VALUES ('IQQKD', '全球快递', '329');
INSERT INTO `logistics_company` VALUES ('IQTWL', '全通物流', '330');
INSERT INTO `logistics_company` VALUES ('ISDYZ', '苏丹邮政', '331');
INSERT INTO `logistics_company` VALUES ('ISEWDYZ', '萨尔瓦多邮政', '332');
INSERT INTO `logistics_company` VALUES ('ISEWYYZ', '塞尔维亚邮政', '333');
INSERT INTO `logistics_company` VALUES ('ISLFKYZ', '斯洛伐克邮政', '334');
INSERT INTO `logistics_company` VALUES ('ISLWNYYZ', '斯洛文尼亚邮政', '335');
INSERT INTO `logistics_company` VALUES ('ISNJEYZ', '塞内加尔邮政', '336');
INSERT INTO `logistics_company` VALUES ('ISPLSYZ', '塞浦路斯邮政', '337');
INSERT INTO `logistics_company` VALUES ('ISTALBYZ', '沙特阿拉伯邮政', '338');
INSERT INTO `logistics_company` VALUES ('ITEQYZ', '土耳其邮政', '339');
INSERT INTO `logistics_company` VALUES ('ITGYZ', '泰国邮政', '340');
INSERT INTO `logistics_company` VALUES ('ITLNDHDBGE', '特立尼达和多巴哥EMS', '341');
INSERT INTO `logistics_company` VALUES ('ITNSYZ', '突尼斯邮政', '342');
INSERT INTO `logistics_company` VALUES ('ITSNYYZ', '坦桑尼亚邮政', '343');
INSERT INTO `logistics_company` VALUES ('IWDMLYZ', '危地马拉邮政', '344');
INSERT INTO `logistics_company` VALUES ('IWGDYZ', '乌干达邮政', '345');
INSERT INTO `logistics_company` VALUES ('IWKLEMS', '乌克兰EMS', '346');
INSERT INTO `logistics_company` VALUES ('IWKLYZ', '乌克兰邮政', '347');
INSERT INTO `logistics_company` VALUES ('IWLGYZ', '乌拉圭邮政', '348');
INSERT INTO `logistics_company` VALUES ('IWLYZ', '文莱邮政', '349');
INSERT INTO `logistics_company` VALUES ('IWZBKSTEMS', '乌兹别克斯坦EMS', '350');
INSERT INTO `logistics_company` VALUES ('IWZBKSTYZ', '乌兹别克斯坦邮政', '351');
INSERT INTO `logistics_company` VALUES ('IXBYYZ', '西班牙邮政', '352');
INSERT INTO `logistics_company` VALUES ('IXFLWL', '小飞龙物流', '353');
INSERT INTO `logistics_company` VALUES ('IXGLDNYYZ', '新喀里多尼亚邮政', '354');
INSERT INTO `logistics_company` VALUES ('IXJPEMS', '新加坡EMS', '355');
INSERT INTO `logistics_company` VALUES ('IXJPYZ', '新加坡邮政', '356');
INSERT INTO `logistics_company` VALUES ('IXLYYZ', '叙利亚邮政', '357');
INSERT INTO `logistics_company` VALUES ('IXLYZ', '希腊邮政', '358');
INSERT INTO `logistics_company` VALUES ('IXPSJ', '夏浦世纪', '359');
INSERT INTO `logistics_company` VALUES ('IXPWL', '夏浦物流', '360');
INSERT INTO `logistics_company` VALUES ('IXXLYZ', '新西兰邮政', '361');
INSERT INTO `logistics_company` VALUES ('IXYLYZ', '匈牙利邮政', '362');
INSERT INTO `logistics_company` VALUES ('IYDLYZ', '意大利邮政', '363');
INSERT INTO `logistics_company` VALUES ('IYDNXYYZ', '印度尼西亚邮政', '364');
INSERT INTO `logistics_company` VALUES ('IYDYZ', '印度邮政', '365');
INSERT INTO `logistics_company` VALUES ('IYGYZ', '英国邮政', '366');
INSERT INTO `logistics_company` VALUES ('IYLYZ', '伊朗邮政', '367');
INSERT INTO `logistics_company` VALUES ('IYMNYYZ', '亚美尼亚邮政', '368');
INSERT INTO `logistics_company` VALUES ('IYMYZ', '也门邮政', '369');
INSERT INTO `logistics_company` VALUES ('IYNYZ', '越南邮政', '370');
INSERT INTO `logistics_company` VALUES ('IYSLYZ', '以色列邮政', '371');
INSERT INTO `logistics_company` VALUES ('IYTG', '易通关', '372');
INSERT INTO `logistics_company` VALUES ('IYWWL', '燕文物流', '373');
INSERT INTO `logistics_company` VALUES ('IZBLTYZ', '直布罗陀邮政', '374');
INSERT INTO `logistics_company` VALUES ('IZLYZ', '智利邮政', '375');
INSERT INTO `logistics_company` VALUES ('JAD', '捷安达', '222');
INSERT INTO `logistics_company` VALUES ('JD', '京东', '189');
INSERT INTO `logistics_company` VALUES ('JGWL', '景光物流', '224');
INSERT INTO `logistics_company` VALUES ('JIAJI', '佳吉', '178');
INSERT INTO `logistics_company` VALUES ('JIAYI', '佳怡', '180');
INSERT INTO `logistics_company` VALUES ('JITU', '极兔速递', '534');
INSERT INTO `logistics_company` VALUES ('JIUYESCM', '九曳', '193');
INSERT INTO `logistics_company` VALUES ('JOUST', '急先达', '174');
INSERT INTO `logistics_company` VALUES ('JP', '日本邮政', '376');
INSERT INTO `logistics_company` VALUES ('JTKD', '捷特快递', '223');
INSERT INTO `logistics_company` VALUES ('KERRY', '嘉里物流', '182');
INSERT INTO `logistics_company` VALUES ('KKE', '京广', '191');
INSERT INTO `logistics_company` VALUES ('KYEXPRESS', '跨越速运', '195');
INSERT INTO `logistics_company` VALUES ('LBEX', '龙邦', '202');
INSERT INTO `logistics_company` VALUES ('LTS', '联昊通', '201');
INSERT INTO `logistics_company` VALUES ('MAXEEDEXPRESS', '澳洲迈速快递', '112');
INSERT INTO `logistics_company` VALUES ('MB', '民邦快递', '225');
INSERT INTO `logistics_company` VALUES ('MK', '美快', '226');
INSERT INTO `logistics_company` VALUES ('MLWL', '明亮物流', '227');
INSERT INTO `logistics_company` VALUES ('ND56', '能达', '115');
INSERT INTO `logistics_company` VALUES ('NF', '南方', '409');
INSERT INTO `logistics_company` VALUES ('NL', '荷兰邮政', '377');
INSERT INTO `logistics_company` VALUES ('ONTRAC', 'ONTRAC', '378');
INSERT INTO `logistics_company` VALUES ('ONWAY', '昂威物流', '113');
INSERT INTO `logistics_company` VALUES ('PADTF', '平安达腾飞快递', '228');
INSERT INTO `logistics_company` VALUES ('PANEX', '泛捷快递', '229');
INSERT INTO `logistics_company` VALUES ('PCA', 'PCA', '130');
INSERT INTO `logistics_company` VALUES ('PEISI', '配思航宇', '212');
INSERT INTO `logistics_company` VALUES ('PEWKEE', '晋越', '186');
INSERT INTO `logistics_company` VALUES ('PHOENIXEXP', '凤凰', '158');
INSERT INTO `logistics_company` VALUES ('PJKD', '品骏快递', '206');
INSERT INTO `logistics_company` VALUES ('QCKD', '全晨', '123');
INSERT INTO `logistics_company` VALUES ('QEXPRESS', '易达通', '167');
INSERT INTO `logistics_company` VALUES ('QFKD', '全峰', '125');
INSERT INTO `logistics_company` VALUES ('QQYZ', '全球邮政', '379');
INSERT INTO `logistics_company` VALUES ('QRT', '全日通快递', '230');
INSERT INTO `logistics_company` VALUES ('QXT', '全信通', '231');
INSERT INTO `logistics_company` VALUES ('RDSE', '瑞典邮政', '380');
INSERT INTO `logistics_company` VALUES ('RFD', '如风达', '129');
INSERT INTO `logistics_company` VALUES ('RFEX', '瑞丰速递', '232');
INSERT INTO `logistics_company` VALUES ('RRS', '日日顺物流', '207');
INSERT INTO `logistics_company` VALUES ('SAD', '赛澳递', '233');
INSERT INTO `logistics_company` VALUES ('SAWL', '圣安物流', '234');
INSERT INTO `logistics_company` VALUES ('SBWL', '盛邦物流', '408');
INSERT INTO `logistics_company` VALUES ('SDEX', '顺达快递', '139');
INSERT INTO `logistics_company` VALUES ('SDEZ', '速递e站', '411');
INSERT INTO `logistics_company` VALUES ('SDWL', '上大物流', '235');
INSERT INTO `logistics_company` VALUES ('SFC', '三态', '131');
INSERT INTO `logistics_company` VALUES ('SFEXPRESS', '顺丰', '7');
INSERT INTO `logistics_company` VALUES ('SFWL', '盛丰', '135');
INSERT INTO `logistics_company` VALUES ('SHENGHUI', '盛辉', '137');
INSERT INTO `logistics_company` VALUES ('ST', '速通物流', '236');
INSERT INTO `logistics_company` VALUES ('STO', '申通', '1');
INSERT INTO `logistics_company` VALUES ('STWL', '速腾快递', '237');
INSERT INTO `logistics_company` VALUES ('SUBIDA', '速必达物流', '238');
INSERT INTO `logistics_company` VALUES ('SUNING', '苏宁', '143');
INSERT INTO `logistics_company` VALUES ('SURE', '速尔', '145');
INSERT INTO `logistics_company` VALUES ('SWCH', '瑞士邮政', '381');
INSERT INTO `logistics_company` VALUES ('SXJE', '顺心捷达', '535');
INSERT INTO `logistics_company` VALUES ('TAIWANYZ', '台湾邮政', '410');
INSERT INTO `logistics_company` VALUES ('TMS', '加运美', '176');
INSERT INTO `logistics_company` VALUES ('TNT', 'TNT', '132');
INSERT INTO `logistics_company` VALUES ('TTKDEX', '天天快递', '5');
INSERT INTO `logistics_company` VALUES ('UC56', '优速', '171');
INSERT INTO `logistics_company` VALUES ('UEQ', 'UEQ Express', '412');
INSERT INTO `logistics_company` VALUES ('UEX', 'UEX', '434');
INSERT INTO `logistics_company` VALUES ('UPS', 'UPS', '134');
INSERT INTO `logistics_company` VALUES ('USPS', 'USPS美国邮政', '384');
INSERT INTO `logistics_company` VALUES ('VANGEN', '万庚', '151');
INSERT INTO `logistics_company` VALUES ('WANJIA', '万家物流', '153');
INSERT INTO `logistics_company` VALUES ('WJK', '万家康', '239');
INSERT INTO `logistics_company` VALUES ('XBWL', '新邦', '159');
INSERT INTO `logistics_company` VALUES ('XCWL', '迅驰物流', '413');
INSERT INTO `logistics_company` VALUES ('XFEXPRESS', '信丰', '161');
INSERT INTO `logistics_company` VALUES ('XJ', '新杰物流', '240');
INSERT INTO `logistics_company` VALUES ('XYT', '希优特', '415');
INSERT INTO `logistics_company` VALUES ('YADEX', '源安达', '179');
INSERT INTO `logistics_company` VALUES ('YAMA', '日本大和运输(Yamato)', '385');
INSERT INTO `logistics_company` VALUES ('YCGWL', '远成', '181');
INSERT INTO `logistics_company` VALUES ('YDH', '义达国际物流', '414');
INSERT INTO `logistics_company` VALUES ('YFEXPRESS', '越丰', '183');
INSERT INTO `logistics_company` VALUES ('YFHEX', '原飞航', '175');
INSERT INTO `logistics_company` VALUES ('YIEXPRESS', '宜送', '165');
INSERT INTO `logistics_company` VALUES ('YIMIDIDA', '壹米滴答', '205');
INSERT INTO `logistics_company` VALUES ('YODEL', 'YODEL', '386');
INSERT INTO `logistics_company` VALUES ('YTEXPRESS', '运通', '185');
INSERT INTO `logistics_company` VALUES ('YTO', '圆通', '2');
INSERT INTO `logistics_company` VALUES ('YUEDANYOUZ', '约旦邮政', '387');
INSERT INTO `logistics_company` VALUES ('YUNDA', '韵达快递', '4');
INSERT INTO `logistics_company` VALUES ('YUNDA56', '韵达快运', '188');
INSERT INTO `logistics_company` VALUES ('YUNDX', '运东西', '416');
INSERT INTO `logistics_company` VALUES ('YXKD', '亿翔快递', '417');
INSERT INTO `logistics_company` VALUES ('YXWL', '宇鑫物流', '208');
INSERT INTO `logistics_company` VALUES ('ZENY', '增益快递', '241');
INSERT INTO `logistics_company` VALUES ('ZHQKD', '汇强快递', '418');
INSERT INTO `logistics_company` VALUES ('ZJS', '宅急送', '190');
INSERT INTO `logistics_company` VALUES ('ZMKMEX', '芝麻开门', '192');
INSERT INTO `logistics_company` VALUES ('ZTE', '众通快递', '419');
INSERT INTO `logistics_company` VALUES ('ZTKY', '中铁物流', '198');
INSERT INTO `logistics_company` VALUES ('ZTO', '中通', '3');
INSERT INTO `logistics_company` VALUES ('ZTO56', '中通快运', '203');
INSERT INTO `logistics_company` VALUES ('ZYWL', '中邮物流', '242');
INSERT INTO `logistics_company` VALUES ('ZY_AG', '爱购转运', '435');
INSERT INTO `logistics_company` VALUES ('ZY_AOZ', '爱欧洲', '436');
INSERT INTO `logistics_company` VALUES ('ZY_AXO', 'AXO', '438');
INSERT INTO `logistics_company` VALUES ('ZY_AZY', '澳转运', '439');
INSERT INTO `logistics_company` VALUES ('ZY_BDA', '八达网', '440');
INSERT INTO `logistics_company` VALUES ('ZY_BEE', '蜜蜂速递', '441');
INSERT INTO `logistics_company` VALUES ('ZY_BH', '贝海速递', '442');
INSERT INTO `logistics_company` VALUES ('ZY_BL', '百利快递', '443');
INSERT INTO `logistics_company` VALUES ('ZY_BM', '斑马物流', '444');
INSERT INTO `logistics_company` VALUES ('ZY_BOZ', '败欧洲', '445');
INSERT INTO `logistics_company` VALUES ('ZY_BT', '百通物流', '446');
INSERT INTO `logistics_company` VALUES ('ZY_BYECO', '贝易购', '447');
INSERT INTO `logistics_company` VALUES ('ZY_CM', '策马转运', '448');
INSERT INTO `logistics_company` VALUES ('ZY_CTM', '赤兔马转运', '449');
INSERT INTO `logistics_company` VALUES ('ZY_CUL', 'CUL中美速递', '450');
INSERT INTO `logistics_company` VALUES ('ZY_DGHT', '德国海淘之家', '451');
INSERT INTO `logistics_company` VALUES ('ZY_DYW', '德运网', '452');
INSERT INTO `logistics_company` VALUES ('ZY_EFS', 'EFS POST', '453');
INSERT INTO `logistics_company` VALUES ('ZY_ESONG', '宜送转运', '454');
INSERT INTO `logistics_company` VALUES ('ZY_ETD', 'ETD', '455');
INSERT INTO `logistics_company` VALUES ('ZY_FD', '飞碟快递', '456');
INSERT INTO `logistics_company` VALUES ('ZY_FG', '飞鸽快递', '457');
INSERT INTO `logistics_company` VALUES ('ZY_FLSD', '风雷速递', '458');
INSERT INTO `logistics_company` VALUES ('ZY_FX', '风行快递', '459');
INSERT INTO `logistics_company` VALUES ('ZY_HC', '皓晨快递', '460');
INSERT INTO `logistics_company` VALUES ('ZY_HCYD', '皓晨优递', '461');
INSERT INTO `logistics_company` VALUES ('ZY_HDB', '海带宝', '462');
INSERT INTO `logistics_company` VALUES ('ZY_HFMZ', '汇丰美中速递', '463');
INSERT INTO `logistics_company` VALUES ('ZY_HJSD', '豪杰速递', '464');
INSERT INTO `logistics_company` VALUES ('ZY_HTAO', '360hitao转运', '465');
INSERT INTO `logistics_company` VALUES ('ZY_HTCUN', '海淘村', '466');
INSERT INTO `logistics_company` VALUES ('ZY_HTKE', '365海淘客', '467');
INSERT INTO `logistics_company` VALUES ('ZY_HTONG', '华通快运', '468');
INSERT INTO `logistics_company` VALUES ('ZY_HXKD', '海星桥快递', '469');
INSERT INTO `logistics_company` VALUES ('ZY_HXSY', '华兴速运', '470');
INSERT INTO `logistics_company` VALUES ('ZY_HYSD', '海悦速递', '471');
INSERT INTO `logistics_company` VALUES ('ZY_JA', '君安快递', '472');
INSERT INTO `logistics_company` VALUES ('ZY_JD', '时代转运', '473');
INSERT INTO `logistics_company` VALUES ('ZY_JDKD', '骏达快递', '474');
INSERT INTO `logistics_company` VALUES ('ZY_JDZY', '骏达转运', '475');
INSERT INTO `logistics_company` VALUES ('ZY_JH', '久禾快递', '476');
INSERT INTO `logistics_company` VALUES ('ZY_JHT', '金海淘', '477');
INSERT INTO `logistics_company` VALUES ('ZY_LBZY', '联邦转运FedRoad', '478');
INSERT INTO `logistics_company` VALUES ('ZY_LPZ', '领跑者快递', '479');
INSERT INTO `logistics_company` VALUES ('ZY_LX', '龙象快递', '480');
INSERT INTO `logistics_company` VALUES ('ZY_LZWL', '量子物流', '481');
INSERT INTO `logistics_company` VALUES ('ZY_MBZY', '明邦转运', '482');
INSERT INTO `logistics_company` VALUES ('ZY_MGZY', '美国转运', '483');
INSERT INTO `logistics_company` VALUES ('ZY_MJ', '美嘉快递', '484');
INSERT INTO `logistics_company` VALUES ('ZY_MST', '美速通', '485');
INSERT INTO `logistics_company` VALUES ('ZY_MXZY', '美西转运', '486');
INSERT INTO `logistics_company` VALUES ('ZY_MZ', '168 美中快递', '487');
INSERT INTO `logistics_company` VALUES ('ZY_OEJ', '欧e捷', '488');
INSERT INTO `logistics_company` VALUES ('ZY_OZF', '欧洲疯', '489');
INSERT INTO `logistics_company` VALUES ('ZY_OZGO', '欧洲GO', '490');
INSERT INTO `logistics_company` VALUES ('ZY_QMT', '全美通', '491');
INSERT INTO `logistics_company` VALUES ('ZY_QQEX', 'QQ-EX', '492');
INSERT INTO `logistics_company` VALUES ('ZY_RDGJ', '润东国际快线', '493');
INSERT INTO `logistics_company` VALUES ('ZY_RT', '瑞天快递', '494');
INSERT INTO `logistics_company` VALUES ('ZY_RTSD', '瑞天速递', '495');
INSERT INTO `logistics_company` VALUES ('ZY_SCS', 'SCS国际物流', '496');
INSERT INTO `logistics_company` VALUES ('ZY_SDKD', '速达快递', '497');
INSERT INTO `logistics_company` VALUES ('ZY_SFZY', '四方转运', '498');
INSERT INTO `logistics_company` VALUES ('ZY_SOHO', 'SOHO苏豪国际', '499');
INSERT INTO `logistics_company` VALUES ('ZY_SONIC', 'Sonic-Ex速递', '500');
INSERT INTO `logistics_company` VALUES ('ZY_ST', '上腾快递', '501');
INSERT INTO `logistics_company` VALUES ('ZY_TCM', '通诚美中快递', '502');
INSERT INTO `logistics_company` VALUES ('ZY_TJ', '天际快递', '503');
INSERT INTO `logistics_company` VALUES ('ZY_TM', '天马转运', '504');
INSERT INTO `logistics_company` VALUES ('ZY_TN', '滕牛快递', '505');
INSERT INTO `logistics_company` VALUES ('ZY_TPAK', 'TrakPak', '506');
INSERT INTO `logistics_company` VALUES ('ZY_TPY', '太平洋快递', '507');
INSERT INTO `logistics_company` VALUES ('ZY_TSZ', '唐三藏转运', '508');
INSERT INTO `logistics_company` VALUES ('ZY_TTHT', '天天海淘', '509');
INSERT INTO `logistics_company` VALUES ('ZY_TWC', 'TWC转运世界', '510');
INSERT INTO `logistics_company` VALUES ('ZY_TX', '同心快递', '511');
INSERT INTO `logistics_company` VALUES ('ZY_TY', '天翼快递', '512');
INSERT INTO `logistics_company` VALUES ('ZY_TZH', '同舟快递', '513');
INSERT INTO `logistics_company` VALUES ('ZY_UCS', 'UCS合众快递', '514');
INSERT INTO `logistics_company` VALUES ('ZY_WDCS', '文达国际DCS', '515');
INSERT INTO `logistics_company` VALUES ('ZY_XC', '星辰快递', '516');
INSERT INTO `logistics_company` VALUES ('ZY_XDKD', '迅达快递', '517');
INSERT INTO `logistics_company` VALUES ('ZY_XDSY', '信达速运', '518');
INSERT INTO `logistics_company` VALUES ('ZY_XF', '先锋快递', '519');
INSERT INTO `logistics_company` VALUES ('ZY_XGX', '新干线快递', '520');
INSERT INTO `logistics_company` VALUES ('ZY_XIYJ', '西邮寄', '521');
INSERT INTO `logistics_company` VALUES ('ZY_XJ', '信捷转运', '522');
INSERT INTO `logistics_company` VALUES ('ZY_YGKD', '优购快递', '523');
INSERT INTO `logistics_company` VALUES ('ZY_YJSD', '友家速递(UCS)', '524');
INSERT INTO `logistics_company` VALUES ('ZY_YPW', '云畔网', '525');
INSERT INTO `logistics_company` VALUES ('ZY_YQ', '云骑快递', '526');
INSERT INTO `logistics_company` VALUES ('ZY_YQWL', '一柒物流', '527');
INSERT INTO `logistics_company` VALUES ('ZY_YSSD', '优晟速递', '528');
INSERT INTO `logistics_company` VALUES ('ZY_YSW', '易送网', '529');
INSERT INTO `logistics_company` VALUES ('ZY_YTUSA', '运淘美国', '530');
INSERT INTO `logistics_company` VALUES ('ZY_ZCSD', '至诚速递', '531');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` varchar(32) NOT NULL COMMENT '通知通告ID',
  `level` tinyint(4) NOT NULL COMMENT '重要程度 0普通 1紧急',
  `content` varchar(255) NOT NULL COMMENT '通知内容',
  `show_flag` bit(1) DEFAULT NULL COMMENT '是否显示',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知通告';

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` varchar(32) NOT NULL DEFAULT '' COMMENT '订单id',
  `order_no` varchar(64) NOT NULL COMMENT '订单编号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) NOT NULL COMMENT '支付金额',
  `postage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `pay_type` tinyint(1) DEFAULT NULL COMMENT '支付方式：0->支付宝；1->微信',
  `state` tinyint(1) NOT NULL COMMENT '订单状态：0-已取消 5. 未确认 10-未付款，20-已付款(待发货)，40-已发货，50-交易成功(已收货)，60-交易关闭(超时)  70-无效 80-退款',
  `order_type` tinyint(11) NOT NULL DEFAULT '0' COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `receiver_name` varchar(32) NOT NULL COMMENT '收货人',
  `receiver_phone` varchar(11) NOT NULL COMMENT '联系电话',
  `receiver_province` varchar(20) NOT NULL COMMENT '收货省份',
  `receiver_city` varchar(20) NOT NULL COMMENT '收货城市',
  `receiver_area` varchar(20) NOT NULL COMMENT '收货区域',
  `region_code` varchar(255) NOT NULL COMMENT '行政编码',
  `receiver_address` varchar(255) NOT NULL COMMENT '详细地址',
  `confirm_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '确认收货状态：0->未确认；1->已确认',
  `confirm_time` datetime DEFAULT NULL COMMENT '订单确认时间',
  `coupon_id` varchar(32) DEFAULT NULL COMMENT '优惠券ID',
  `coupon_money` decimal(10,2) DEFAULT NULL COMMENT '优惠券金额',
  `use_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `create_user_id` varchar(32) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `order_good_id` varchar(32) NOT NULL COMMENT '主键',
  `sys_user_id` varchar(32) NOT NULL COMMENT '用户id',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `order_no` varchar(64) NOT NULL COMMENT '订单编号',
  `product_id` varchar(32) NOT NULL COMMENT '商品id',
  `product_name` varchar(200) NOT NULL COMMENT '商品名称',
  `product_pic` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `product_price` decimal(10,2) NOT NULL COMMENT '单价',
  `product_num` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`order_good_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单详情';

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for order_log
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log` (
  `order_log_id` varchar(32) NOT NULL COMMENT '主键',
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `state` tinyint(1) NOT NULL COMMENT '订单状态：0-已取消 5. 未确认 10-未付款，20-已付款(待发货)，40-已发货，50-交易成功(已收货)，60-交易关闭(超时)  70-无效 80-退款',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(100) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`order_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单操作记录表';

-- ----------------------------
-- Records of order_log
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` varchar(32) NOT NULL COMMENT '主键',
  `category_id` varchar(32) NOT NULL COMMENT '商品类目',
  `name` varchar(64) NOT NULL COMMENT '商品名称',
  `sub_title` varchar(150) CHARACTER SET utf8 DEFAULT NULL COMMENT '副标题',
  `pic` varchar(255) NOT NULL COMMENT '图片',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品状态(0:待审核 1:已通过 2：已拒绝 3:已上架 4-已下架 5-删除)',
  `is_recommand` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `sort` int(5) NOT NULL DEFAULT '100' COMMENT '排序',
  `sale` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `start_num` int(11) NOT NULL DEFAULT '1' COMMENT '起售件数',
  `logistics_unify_price` decimal(10,2) DEFAULT NULL COMMENT '物流统一价',
  `logistics_id` varchar(32) DEFAULT NULL COMMENT '物流模板ID',
  `del_flag` tinyint(1) NOT NULL COMMENT '删除状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`product_id`) USING BTREE,
  KEY `index_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品信息';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('09d4fb247ca5571637ae9ed83', 'A0001A0001', '苹果3', null, '20200613140921000001.jpg', '2', '0', '122', '4', '1', null, null, '0', '全球直采', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('09d4fb247ca5571637ae9ed8312', 'A0001A0001', '苹果1', null, '20200613140921000001.jpg', '2', '0', '122', '4', '1', null, null, '0', '全球直采', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('09d4fb247ca5571637ae9ed8312084eb', 'A0001A0001', '苹果', null, '20200613140921000001.jpg', '2', '0', '122', '4', '1', null, null, '0', '全球直采', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('09d4fb247ca5571637ae9ed8312084ed', 'A0001A0001', '苹果2', null, '20200613140921000001.jpg', '2', '0', '122', '4', '1', null, null, '0', '全球直采', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('09d4fb247ca5571637ae9ed8312084ek', 'A0001A0001', '苹果4', null, '20200613140921000001.jpg', '2', '0', '122', '4', '1', null, null, '0', '全球直采', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('1a291461243feaf147b2ed1d5562cfc7', 'A0002A0001', '1221', null, '20200810152248000001.jpg', '0', '0', '12', '0', '1', null, null, '0', '12', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('f80e45d3a11618938ca8812f0c28fa10', 'A0001A0001', 'C罗手办', null, '20200613141308000001.jpg', '0', '0', '1', '0', '1', null, null, '0', null, '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('f80e45d3a11618938ca8812f0c28fa3', 'A0001A0001', 'MacBook', null, '20200613141729000001.jpg', '3', '0', '1', '1', '1', null, null, '0', '外套', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('f80e45d3a11618938ca8812f0c28fa4', 'A0001A0001', '卡西欧手表', null, '20200613141544000002.jpg', '3', '0', '1', '1', '1', null, null, '0', '外套', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('f80e45d3a11618938ca8812f0c28fa5', 'A0001A0001', '原味咖喱[新鲜]', null, '20200613141354000002.jpg', '3', '0', '1', '3', '1', null, null, '0', '海鲜', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('f80e45d3a11618938ca8812f0c28fa6', 'A0001A0001', '福临门寒地大米', null, '20200613141119000001.jpg', '3', '0', '1', '2', '1', null, null, '0', '主食', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('f80e45d3a11618938ca8812f0c28fa7', 'A0001A0001', '有机花菜[新鲜]', null, '20200613141045000002.jpg', '3', '0', '1', '10', '1', null, null, '0', '蔬菜', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('f80e45d3a11618938ca8812f0c28fa8', 'A0001A0001', '新鲜鸡蛋', null, '20200613141005000001.jpg', '3', '0', '1', '17', '1', null, null, '0', '蔬菜', '2020-08-17 17:36:06', '2020-08-17 17:36:06');
INSERT INTO `product` VALUES ('f80e45d3a11618938ca8812f0c28fa9', 'A0001A0001', '小米 9 Pro', null, '20200613141228000001.jpg', '0', '0', '100', '1', '1', null, null, '0', '小米手机', '2020-08-17 17:36:06', '2020-08-17 17:36:06');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `product_category_id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '类目名称',
  `parent_id` varchar(32) NOT NULL COMMENT '父级类目',
  `level` int(1) NOT NULL DEFAULT '0' COMMENT '等级',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort` int(1) DEFAULT NULL COMMENT '状态(0：正常 1:废弃 )',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('0', '类目管理', '#', '0', null, '0', '0');
INSERT INTO `product_category` VALUES ('A0001', '新鲜蔬果', '0', '0', null, '100', '0');
INSERT INTO `product_category` VALUES ('A0001A0001', '苹果', 'A0001', '0', null, '100', '0');
INSERT INTO `product_category` VALUES ('A0001A0002', '香蕉', 'A0001', '0', null, '1', '0');
INSERT INTO `product_category` VALUES ('A0002', '服装', '0', '0', null, '2', '0');
INSERT INTO `product_category` VALUES ('A0002A0001', '外套', 'A0002', '0', null, '1', '0');
INSERT INTO `product_category` VALUES ('A0002A0002', '休闲裤', 'A0002', '0', null, '2', '0');
INSERT INTO `product_category` VALUES ('A0002A0003', '衬衫', 'A0002', '0', null, '3', '0');
INSERT INTO `product_category` VALUES ('A0003', '家用电器', '0', '0', null, '3', '0');
INSERT INTO `product_category` VALUES ('A0003A0001', '电视', 'A0003', '0', null, '1', '0');
INSERT INTO `product_category` VALUES ('A0003A0002', '空调', 'A0003', '0', null, '2', '0');
INSERT INTO `product_category` VALUES ('A0003A0003', '洗衣机', 'A0003', '0', null, '3', '0');
INSERT INTO `product_category` VALUES ('A0004', '家具家装', '0', '0', null, '4', '0');
INSERT INTO `product_category` VALUES ('A0004A0001', '厨房卫浴', 'A0004', '0', null, '100', '0');
INSERT INTO `product_category` VALUES ('A0004A0002', '五金工具', 'A0004', '0', null, '100', '0');

-- ----------------------------
-- Table structure for product_detail
-- ----------------------------
DROP TABLE IF EXISTS `product_detail`;
CREATE TABLE `product_detail` (
  `product_detail_id` varchar(32) NOT NULL COMMENT '主键',
  `product_id` varchar(32) NOT NULL COMMENT '商品ID',
  `detail` longtext NOT NULL COMMENT '描述',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '当前时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`product_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品描述';

-- ----------------------------
-- Records of product_detail
-- ----------------------------

-- ----------------------------
-- Table structure for product_pic
-- ----------------------------
DROP TABLE IF EXISTS `product_pic`;
CREATE TABLE `product_pic` (
  `product_pic_id` varchar(32) NOT NULL COMMENT '主键',
  `product_id` varchar(32) NOT NULL COMMENT '产品ID',
  `pic_path` varchar(255) NOT NULL COMMENT '图片路径',
  `pic_main_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否主图',
  `sort` int(2) NOT NULL COMMENT '序号',
  `del_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`product_pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品图片';

-- ----------------------------
-- Records of product_pic
-- ----------------------------

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku` (
  `product_sku_id` varchar(32) NOT NULL COMMENT '商品SKUID',
  `product_id` varchar(32) NOT NULL COMMENT '商品ID',
  `code` varchar(32) DEFAULT NULL COMMENT '商品SKU代码',
  `value` varchar(32) DEFAULT NULL COMMENT '商品SKU名称',
  `supply_price` decimal(11,2) NOT NULL COMMENT '供货价',
  `price` decimal(11,2) NOT NULL COMMENT '零售价',
  `stock` int(11) NOT NULL COMMENT '库存',
  `weight` decimal(11,2) DEFAULT NULL COMMENT '重量',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `sort` int(11) DEFAULT NULL COMMENT '排序号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`product_sku_id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品SKU';

-- ----------------------------
-- Records of product_sku
-- ----------------------------

-- ----------------------------
-- Table structure for product_sku_spec
-- ----------------------------
DROP TABLE IF EXISTS `product_sku_spec`;
CREATE TABLE `product_sku_spec` (
  `product_sku_spec_id` varchar(32) NOT NULL COMMENT '商品SKU规格ID',
  `product_sku_id` varchar(32) NOT NULL COMMENT '商品SKUID',
  `product_spec_id` varchar(32) NOT NULL COMMENT '商品规格ID',
  `product_spec_option_id` varchar(32) NOT NULL COMMENT '商品规格选项ID',
  PRIMARY KEY (`product_sku_spec_id`),
  KEY `idx_product_sku_id` (`product_sku_id`),
  KEY `idx_product_spec_id` (`product_spec_id`),
  KEY `idx_product_spec_option_id` (`product_spec_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品SKU规格';

-- ----------------------------
-- Records of product_sku_spec
-- ----------------------------

-- ----------------------------
-- Table structure for product_spec
-- ----------------------------
DROP TABLE IF EXISTS `product_spec`;
CREATE TABLE `product_spec` (
  `product_spec_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '主键',
  `product_id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '商品ID',
  `code` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '规格代码',
  `name` varchar(32) NOT NULL COMMENT '规格名称',
  `sort` int(11) NOT NULL COMMENT '序号',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`product_spec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品规格';

-- ----------------------------
-- Records of product_spec
-- ----------------------------

-- ----------------------------
-- Table structure for product_spec_option
-- ----------------------------
DROP TABLE IF EXISTS `product_spec_option`;
CREATE TABLE `product_spec_option` (
  `product_spec_option_id` varchar(32) NOT NULL COMMENT '商品规格选项ID',
  `product_spec_id` varchar(32) NOT NULL COMMENT '商品规格ID',
  `code` varchar(32) NOT NULL COMMENT '规格选项代码',
  `value` varchar(32) NOT NULL COMMENT '规格选项值',
  `sort` int(11) NOT NULL COMMENT '排序号',
  PRIMARY KEY (`product_spec_option_id`),
  KEY `idx_product_spec_id` (`product_spec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品规格选项';

-- ----------------------------
-- Records of product_spec_option
-- ----------------------------

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` varchar(36) NOT NULL COMMENT '行政区划ID',
  `region_code` varchar(32) NOT NULL COMMENT '行政区编码，编码规则遵照国家发布的“村级全国行政区划代码”。行政区划编码不能重复。全国的编码特定为0；省编码规则：xx0000000000（大于10的两位数字+10个0）；市编码规则：两位数字（省编码前两位数） +xx00000000（大于0的两位数字+8个0)；县编码规则：四位数字（市编码前4位数） +xx000000（大于0的两位数字+6个0)；乡镇编码规则：六位数字（县编码前6位数） +xxx000（大于0的三位数字+3个0)；村编码规则：九位数字（乡镇编码前9位数） +xxx（大于0的三位数字)；',
  `region_pcode` varchar(36) DEFAULT NULL COMMENT '父节点编码',
  `region_name` varchar(128) NOT NULL COMMENT '行政区名称',
  `region_level` varchar(32) NOT NULL COMMENT '行政级别：数据字典【行政区划级别】编码，含义：\r\n            0-国、1-省、2-市、3-县/区、4-乡/镇、5-村；\r\n            行政区划编码长度为1，行政区划级别为0；\r\n            行政区划编码长度为2，行政区划级别为1；\r\n            行政区划编码长度为4，行政区划级别为2；\r\n            行政区划编码长度为6，行政区划级别为3；\r\n            行政区划编码长度为9，行政区划级别为4；\r\n            行政区划编码',
  `region_initial` varchar(32) NOT NULL COMMENT '行政区划首字母',
  `sort` int(11) DEFAULT '100' COMMENT '排序号',
  PRIMARY KEY (`region_id`) USING BTREE,
  KEY `index_pcode` (`region_pcode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行政区划表';

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('110000000000', '11', 'root', '北京市', '1', 'B', '0');
INSERT INTO `region` VALUES ('110100000000', '1101', '11', '北京市', '2', 'B', '0');
INSERT INTO `region` VALUES ('110101000000', '110101', '1101', '东城区', '3', 'D', '0');
INSERT INTO `region` VALUES ('110102000000', '110102', '1101', '西城区', '3', 'X', '1');
INSERT INTO `region` VALUES ('110103000000', '110103', '1101', '崇文区', '3', 'C', '2');
INSERT INTO `region` VALUES ('110104000000', '110104', '1101', '宣武区', '3', 'X', '3');
INSERT INTO `region` VALUES ('110105000000', '110105', '1101', '朝阳区', '3', 'C', '4');
INSERT INTO `region` VALUES ('110106000000', '110106', '1101', '丰台区', '3', 'F', '5');
INSERT INTO `region` VALUES ('110107000000', '110107', '1101', '石景山区', '3', 'S', '6');
INSERT INTO `region` VALUES ('110108000000', '110108', '1101', '海淀区', '3', 'H', '7');
INSERT INTO `region` VALUES ('110109000000', '110109', '1101', '门头沟区', '3', 'M', '8');
INSERT INTO `region` VALUES ('110111000000', '110111', '1101', '房山区', '3', 'F', '9');
INSERT INTO `region` VALUES ('110112000000', '110112', '1101', '通州区', '3', 'T', '10');
INSERT INTO `region` VALUES ('110113000000', '110113', '1101', '顺义区', '3', 'S', '11');
INSERT INTO `region` VALUES ('110114000000', '110114', '1101', '昌平区', '3', 'C', '12');
INSERT INTO `region` VALUES ('110115000000', '110115', '1101', '大兴区', '3', 'D', '13');
INSERT INTO `region` VALUES ('110116000000', '110116', '1101', '怀柔区', '3', 'H', '14');
INSERT INTO `region` VALUES ('110117000000', '110117', '1101', '平谷区', '3', 'P', '15');
INSERT INTO `region` VALUES ('110228000000', '110228', '1102', '密云县', '3', 'M', '16');
INSERT INTO `region` VALUES ('110229000000', '110229', '1102', '延庆县', '3', 'Y', '17');
INSERT INTO `region` VALUES ('120000000000', '12', 'root', '天津市', '1', 'T', '1');
INSERT INTO `region` VALUES ('120100000000', '1201', '12', '天津市', '2', 'T', '1');
INSERT INTO `region` VALUES ('120101000000', '120101', '1201', '和平区', '3', 'H', '18');
INSERT INTO `region` VALUES ('120102000000', '120102', '1201', '河东区', '3', 'H', '19');
INSERT INTO `region` VALUES ('120103000000', '120103', '1201', '河西区', '3', 'H', '20');
INSERT INTO `region` VALUES ('120104000000', '120104', '1201', '南开区', '3', 'N', '21');
INSERT INTO `region` VALUES ('120105000000', '120105', '1201', '河北区', '3', 'H', '22');
INSERT INTO `region` VALUES ('120106000000', '120106', '1201', '红桥区', '3', 'H', '23');
INSERT INTO `region` VALUES ('120107000000', '120107', '1201', '塘沽区', '3', 'T', '24');
INSERT INTO `region` VALUES ('120108000000', '120108', '1201', '汉沽区', '3', 'H', '25');
INSERT INTO `region` VALUES ('120109000000', '120109', '1201', '大港区', '3', 'D', '26');
INSERT INTO `region` VALUES ('120110000000', '120110', '1201', '东丽区', '3', 'D', '27');
INSERT INTO `region` VALUES ('120111000000', '120111', '1201', '西青区', '3', 'X', '28');
INSERT INTO `region` VALUES ('120112000000', '120112', '1201', '津南区', '3', 'J', '29');
INSERT INTO `region` VALUES ('120113000000', '120113', '1201', '北辰区', '3', 'B', '30');
INSERT INTO `region` VALUES ('120114000000', '120114', '1201', '武清区', '3', 'W', '31');
INSERT INTO `region` VALUES ('120115000000', '120115', '1201', '宝坻区', '3', 'B', '32');
INSERT INTO `region` VALUES ('120116000000', '120116', '1201', '滨海新区', '3', 'B', '33');
INSERT INTO `region` VALUES ('120221000000', '120221', '1202', '宁河县', '3', 'N', '34');
INSERT INTO `region` VALUES ('120223000000', '120223', '1202', '静海县', '3', 'J', '35');
INSERT INTO `region` VALUES ('120225000000', '120225', '1202', '蓟县', '3', 'J', '36');
INSERT INTO `region` VALUES ('130000000000', '13', 'root', '河北省', '1', 'H', '2');
INSERT INTO `region` VALUES ('130100000000', '1301', '13', '石家庄市', '2', 'S', '2');
INSERT INTO `region` VALUES ('130101000000', '130101', '1301', '市辖区', '3', 'S', '37');
INSERT INTO `region` VALUES ('130102000000', '130102', '1301', '长安区', '3', 'C', '38');
INSERT INTO `region` VALUES ('130103000000', '130103', '1301', '桥东区', '3', 'Q', '39');
INSERT INTO `region` VALUES ('130104000000', '130104', '1301', '桥西区', '3', 'Q', '40');
INSERT INTO `region` VALUES ('130105000000', '130105', '1301', '新华区', '3', 'X', '41');
INSERT INTO `region` VALUES ('130107000000', '130107', '1301', '井陉矿区', '3', 'J', '42');
INSERT INTO `region` VALUES ('130108000000', '130108', '1301', '裕华区', '3', 'Y', '43');
INSERT INTO `region` VALUES ('130121000000', '130121', '1301', '井陉县', '3', 'J', '44');
INSERT INTO `region` VALUES ('130123000000', '130123', '1301', '正定县', '3', 'Z', '45');
INSERT INTO `region` VALUES ('130124000000', '130124', '1301', '栾城县', '3', 'Z', '46');
INSERT INTO `region` VALUES ('130125000000', '130125', '1301', '行唐县', '3', 'X', '47');
INSERT INTO `region` VALUES ('130126000000', '130126', '1301', '灵寿县', '3', 'L', '48');
INSERT INTO `region` VALUES ('130127000000', '130127', '1301', '高邑县', '3', 'G', '49');
INSERT INTO `region` VALUES ('130128000000', '130128', '1301', '深泽县', '3', 'S', '50');
INSERT INTO `region` VALUES ('130129000000', '130129', '1301', '赞皇县', '3', 'Z', '51');
INSERT INTO `region` VALUES ('130130000000', '130130', '1301', '无极县', '3', 'W', '52');
INSERT INTO `region` VALUES ('130131000000', '130131', '1301', '平山县', '3', 'P', '53');
INSERT INTO `region` VALUES ('130132000000', '130132', '1301', '元氏县', '3', 'Y', '54');
INSERT INTO `region` VALUES ('130133000000', '130133', '1301', '赵县', '3', 'Z', '55');
INSERT INTO `region` VALUES ('130181000000', '130181', '1301', '辛集市', '3', 'X', '56');
INSERT INTO `region` VALUES ('130182000000', '130182', '1301', '藁城市', '3', 'Z', '57');
INSERT INTO `region` VALUES ('130183000000', '130183', '1301', '晋州市', '3', 'J', '58');
INSERT INTO `region` VALUES ('130184000000', '130184', '1301', '新乐市', '3', 'X', '59');
INSERT INTO `region` VALUES ('130185000000', '130185', '1301', '鹿泉市', '3', 'L', '60');
INSERT INTO `region` VALUES ('130200000000', '1302', '13', '唐山市', '2', 'T', '3');
INSERT INTO `region` VALUES ('130201000000', '130201', '1302', '市辖区', '3', 'S', '61');
INSERT INTO `region` VALUES ('130202000000', '130202', '1302', '路南区', '3', 'L', '62');
INSERT INTO `region` VALUES ('130203000000', '130203', '1302', '路北区', '3', 'L', '63');
INSERT INTO `region` VALUES ('130204000000', '130204', '1302', '古冶区', '3', 'G', '64');
INSERT INTO `region` VALUES ('130205000000', '130205', '1302', '开平区', '3', 'K', '65');
INSERT INTO `region` VALUES ('130207000000', '130207', '1302', '丰南区', '3', 'F', '66');
INSERT INTO `region` VALUES ('130208000000', '130208', '1302', '丰润区', '3', 'F', '67');
INSERT INTO `region` VALUES ('130223000000', '130223', '1302', '滦县', '3', 'L', '68');
INSERT INTO `region` VALUES ('130224000000', '130224', '1302', '滦南县', '3', 'L', '69');
INSERT INTO `region` VALUES ('130225000000', '130225', '1302', '乐亭县', '3', 'L', '70');
INSERT INTO `region` VALUES ('130227000000', '130227', '1302', '迁西县', '3', 'Q', '71');
INSERT INTO `region` VALUES ('130229000000', '130229', '1302', '玉田县', '3', 'Y', '72');
INSERT INTO `region` VALUES ('130230000000', '130230', '1302', '唐海县', '3', 'T', '73');
INSERT INTO `region` VALUES ('130281000000', '130281', '1302', '遵化市', '3', 'Z', '74');
INSERT INTO `region` VALUES ('130283000000', '130283', '1302', '迁安市', '3', 'Q', '75');
INSERT INTO `region` VALUES ('130300000000', '1303', '13', '秦皇岛市', '2', 'Q', '4');
INSERT INTO `region` VALUES ('130301000000', '130301', '1303', '市辖区', '3', 'S', '76');
INSERT INTO `region` VALUES ('130302000000', '130302', '1303', '海港区', '3', 'H', '77');
INSERT INTO `region` VALUES ('130303000000', '130303', '1303', '山海关区', '3', 'S', '78');
INSERT INTO `region` VALUES ('130304000000', '130304', '1303', '北戴河区', '3', 'B', '79');
INSERT INTO `region` VALUES ('130321000000', '130321', '1303', '青龙满族自治县', '3', 'Q', '80');
INSERT INTO `region` VALUES ('130322000000', '130322', '1303', '昌黎县', '3', 'C', '81');
INSERT INTO `region` VALUES ('130323000000', '130323', '1303', '抚宁县', '3', 'F', '82');
INSERT INTO `region` VALUES ('130324000000', '130324', '1303', '卢龙县', '3', 'L', '83');
INSERT INTO `region` VALUES ('130400000000', '1304', '13', '邯郸市', '2', 'H', '5');
INSERT INTO `region` VALUES ('130401000000', '130401', '1304', '市辖区', '3', 'S', '84');
INSERT INTO `region` VALUES ('130402000000', '130402', '1304', '邯山区', '3', 'H', '85');
INSERT INTO `region` VALUES ('130403000000', '130403', '1304', '丛台区', '3', 'C', '86');
INSERT INTO `region` VALUES ('130404000000', '130404', '1304', '复兴区', '3', 'F', '87');
INSERT INTO `region` VALUES ('130406000000', '130406', '1304', '峰峰矿区', '3', 'F', '88');
INSERT INTO `region` VALUES ('130421000000', '130421', '1304', '邯郸县', '3', 'H', '89');
INSERT INTO `region` VALUES ('130423000000', '130423', '1304', '临漳县', '3', 'L', '90');
INSERT INTO `region` VALUES ('130424000000', '130424', '1304', '成安县', '3', 'C', '91');
INSERT INTO `region` VALUES ('130425000000', '130425', '1304', '大名县', '3', 'D', '92');
INSERT INTO `region` VALUES ('130426000000', '130426', '1304', '涉县', '3', 'S', '93');
INSERT INTO `region` VALUES ('130427000000', '130427', '1304', '磁县', '3', 'C', '94');
INSERT INTO `region` VALUES ('130428000000', '130428', '1304', '肥乡县', '3', 'F', '95');
INSERT INTO `region` VALUES ('130429000000', '130429', '1304', '永年县', '3', 'Y', '96');
INSERT INTO `region` VALUES ('130430000000', '130430', '1304', '邱县', '3', 'Q', '97');
INSERT INTO `region` VALUES ('130431000000', '130431', '1304', '鸡泽县', '3', 'J', '98');
INSERT INTO `region` VALUES ('130432000000', '130432', '1304', '广平县', '3', 'G', '99');
INSERT INTO `region` VALUES ('130433000000', '130433', '1304', '馆陶县', '3', 'G', '100');
INSERT INTO `region` VALUES ('130434000000', '130434', '1304', '魏县', '3', 'W', '101');
INSERT INTO `region` VALUES ('130435000000', '130435', '1304', '曲周县', '3', 'Q', '102');
INSERT INTO `region` VALUES ('130481000000', '130481', '1304', '武安市', '3', 'W', '103');
INSERT INTO `region` VALUES ('130500000000', '1305', '13', '邢台市', '2', 'X', '6');
INSERT INTO `region` VALUES ('130501000000', '130501', '1305', '市辖区', '3', 'S', '104');
INSERT INTO `region` VALUES ('130502000000', '130502', '1305', '桥东区', '3', 'Q', '105');
INSERT INTO `region` VALUES ('130503000000', '130503', '1305', '桥西区', '3', 'Q', '106');
INSERT INTO `region` VALUES ('130521000000', '130521', '1305', '邢台县', '3', 'X', '107');
INSERT INTO `region` VALUES ('130522000000', '130522', '1305', '临城县', '3', 'L', '108');
INSERT INTO `region` VALUES ('130523000000', '130523', '1305', '内丘县', '3', 'N', '109');
INSERT INTO `region` VALUES ('130524000000', '130524', '1305', '柏乡县', '3', 'B', '110');
INSERT INTO `region` VALUES ('130525000000', '130525', '1305', '隆尧县', '3', 'L', '111');
INSERT INTO `region` VALUES ('130526000000', '130526', '1305', '任县', '3', 'R', '112');
INSERT INTO `region` VALUES ('130527000000', '130527', '1305', '南和县', '3', 'N', '113');
INSERT INTO `region` VALUES ('130528000000', '130528', '1305', '宁晋县', '3', 'N', '114');
INSERT INTO `region` VALUES ('130529000000', '130529', '1305', '巨鹿县', '3', 'J', '115');
INSERT INTO `region` VALUES ('130530000000', '130530', '1305', '新河县', '3', 'X', '116');
INSERT INTO `region` VALUES ('130531000000', '130531', '1305', '广宗县', '3', 'G', '117');
INSERT INTO `region` VALUES ('130532000000', '130532', '1305', '平乡县', '3', 'P', '118');
INSERT INTO `region` VALUES ('130533000000', '130533', '1305', '威县', '3', 'W', '119');
INSERT INTO `region` VALUES ('130534000000', '130534', '1305', '清河县', '3', 'Q', '120');
INSERT INTO `region` VALUES ('130535000000', '130535', '1305', '临西县', '3', 'L', '121');
INSERT INTO `region` VALUES ('130581000000', '130581', '1305', '南宫市', '3', 'N', '122');
INSERT INTO `region` VALUES ('130582000000', '130582', '1305', '沙河市', '3', 'S', '123');
INSERT INTO `region` VALUES ('130600000000', '1306', '13', '保定市', '2', 'B', '7');
INSERT INTO `region` VALUES ('130601000000', '130601', '1306', '市辖区', '3', 'S', '124');
INSERT INTO `region` VALUES ('130602000000', '130602', '1306', '新市区', '3', 'X', '125');
INSERT INTO `region` VALUES ('130603000000', '130603', '1306', '北市区', '3', 'B', '126');
INSERT INTO `region` VALUES ('130604000000', '130604', '1306', '南市区', '3', 'N', '127');
INSERT INTO `region` VALUES ('130621000000', '130621', '1306', '满城县', '3', 'M', '128');
INSERT INTO `region` VALUES ('130622000000', '130622', '1306', '清苑县', '3', 'Q', '129');
INSERT INTO `region` VALUES ('130623000000', '130623', '1306', '涞水县', '3', 'Z', '130');
INSERT INTO `region` VALUES ('130624000000', '130624', '1306', '阜平县', '3', 'F', '131');
INSERT INTO `region` VALUES ('130625000000', '130625', '1306', '徐水县', '3', 'X', '132');
INSERT INTO `region` VALUES ('130626000000', '130626', '1306', '定兴县', '3', 'D', '133');
INSERT INTO `region` VALUES ('130627000000', '130627', '1306', '唐县', '3', 'T', '134');
INSERT INTO `region` VALUES ('130628000000', '130628', '1306', '高阳县', '3', 'G', '135');
INSERT INTO `region` VALUES ('130629000000', '130629', '1306', '容城县', '3', 'R', '136');
INSERT INTO `region` VALUES ('130630000000', '130630', '1306', '涞源县', '3', 'Z', '137');
INSERT INTO `region` VALUES ('130631000000', '130631', '1306', '望都县', '3', 'W', '138');
INSERT INTO `region` VALUES ('130632000000', '130632', '1306', '安新县', '3', 'A', '139');
INSERT INTO `region` VALUES ('130633000000', '130633', '1306', '易县', '3', 'Y', '140');
INSERT INTO `region` VALUES ('130634000000', '130634', '1306', '曲阳县', '3', 'Q', '141');
INSERT INTO `region` VALUES ('130635000000', '130635', '1306', '蠡县', '3', 'Z', '142');
INSERT INTO `region` VALUES ('130636000000', '130636', '1306', '顺平县', '3', 'S', '143');
INSERT INTO `region` VALUES ('130637000000', '130637', '1306', '博野县', '3', 'B', '144');
INSERT INTO `region` VALUES ('130638000000', '130638', '1306', '雄县', '3', 'X', '145');
INSERT INTO `region` VALUES ('130681000000', '130681', '1306', '涿州市', '3', 'Z', '146');
INSERT INTO `region` VALUES ('130682000000', '130682', '1306', '定州市', '3', 'D', '147');
INSERT INTO `region` VALUES ('130683000000', '130683', '1306', '安国市', '3', 'A', '148');
INSERT INTO `region` VALUES ('130684000000', '130684', '1306', '高碑店市', '3', 'G', '149');
INSERT INTO `region` VALUES ('130700000000', '1307', '13', '张家口市', '2', 'Z', '8');
INSERT INTO `region` VALUES ('130701000000', '130701', '1307', '市辖区', '3', 'S', '150');
INSERT INTO `region` VALUES ('130702000000', '130702', '1307', '桥东区', '3', 'Q', '151');
INSERT INTO `region` VALUES ('130703000000', '130703', '1307', '桥西区', '3', 'Q', '152');
INSERT INTO `region` VALUES ('130705000000', '130705', '1307', '宣化区', '3', 'X', '153');
INSERT INTO `region` VALUES ('130706000000', '130706', '1307', '下花园区', '3', 'X', '154');
INSERT INTO `region` VALUES ('130721000000', '130721', '1307', '宣化县', '3', 'X', '155');
INSERT INTO `region` VALUES ('130722000000', '130722', '1307', '张北县', '3', 'Z', '156');
INSERT INTO `region` VALUES ('130723000000', '130723', '1307', '康保县', '3', 'K', '157');
INSERT INTO `region` VALUES ('130724000000', '130724', '1307', '沽源县', '3', 'G', '158');
INSERT INTO `region` VALUES ('130725000000', '130725', '1307', '尚义县', '3', 'S', '159');
INSERT INTO `region` VALUES ('130726000000', '130726', '1307', '蔚县', '3', 'W', '160');
INSERT INTO `region` VALUES ('130727000000', '130727', '1307', '阳原县', '3', 'Y', '161');
INSERT INTO `region` VALUES ('130728000000', '130728', '1307', '怀安县', '3', 'H', '162');
INSERT INTO `region` VALUES ('130729000000', '130729', '1307', '万全县', '3', 'W', '163');
INSERT INTO `region` VALUES ('130730000000', '130730', '1307', '怀来县', '3', 'H', '164');
INSERT INTO `region` VALUES ('130731000000', '130731', '1307', '涿鹿县', '3', 'Z', '165');
INSERT INTO `region` VALUES ('130732000000', '130732', '1307', '赤城县', '3', 'C', '166');
INSERT INTO `region` VALUES ('130733000000', '130733', '1307', '崇礼县', '3', 'C', '167');
INSERT INTO `region` VALUES ('130800000000', '1308', '13', '承德市', '2', 'C', '9');
INSERT INTO `region` VALUES ('130801000000', '130801', '1308', '市辖区', '3', 'S', '168');
INSERT INTO `region` VALUES ('130802000000', '130802', '1308', '双桥区', '3', 'S', '169');
INSERT INTO `region` VALUES ('130803000000', '130803', '1308', '双滦区', '3', 'S', '170');
INSERT INTO `region` VALUES ('130804000000', '130804', '1308', '鹰手营子矿区', '3', 'Y', '171');
INSERT INTO `region` VALUES ('130821000000', '130821', '1308', '承德县', '3', 'C', '172');
INSERT INTO `region` VALUES ('130822000000', '130822', '1308', '兴隆县', '3', 'X', '173');
INSERT INTO `region` VALUES ('130823000000', '130823', '1308', '平泉县', '3', 'P', '174');
INSERT INTO `region` VALUES ('130824000000', '130824', '1308', '滦平县', '3', 'L', '175');
INSERT INTO `region` VALUES ('130825000000', '130825', '1308', '隆化县', '3', 'L', '176');
INSERT INTO `region` VALUES ('130826000000', '130826', '1308', '丰宁满族自治县', '3', 'F', '177');
INSERT INTO `region` VALUES ('130827000000', '130827', '1308', '宽城满族自治县', '3', 'K', '178');
INSERT INTO `region` VALUES ('130828000000', '130828', '1308', '围场满族蒙古族自治县', '3', 'W', '179');
INSERT INTO `region` VALUES ('130900000000', '1309', '13', '沧州市', '2', 'C', '10');
INSERT INTO `region` VALUES ('130901000000', '130901', '1309', '市辖区', '3', 'S', '180');
INSERT INTO `region` VALUES ('130902000000', '130902', '1309', '新华区', '3', 'X', '181');
INSERT INTO `region` VALUES ('130903000000', '130903', '1309', '运河区', '3', 'Y', '182');
INSERT INTO `region` VALUES ('130921000000', '130921', '1309', '沧县', '3', 'C', '183');
INSERT INTO `region` VALUES ('130922000000', '130922', '1309', '青县', '3', 'Q', '184');
INSERT INTO `region` VALUES ('130923000000', '130923', '1309', '东光县', '3', 'D', '185');
INSERT INTO `region` VALUES ('130924000000', '130924', '1309', '海兴县', '3', 'H', '186');
INSERT INTO `region` VALUES ('130925000000', '130925', '1309', '盐山县', '3', 'Y', '187');
INSERT INTO `region` VALUES ('130926000000', '130926', '1309', '肃宁县', '3', 'S', '188');
INSERT INTO `region` VALUES ('130927000000', '130927', '1309', '南皮县', '3', 'N', '189');
INSERT INTO `region` VALUES ('130928000000', '130928', '1309', '吴桥县', '3', 'W', '190');
INSERT INTO `region` VALUES ('130929000000', '130929', '1309', '献县', '3', 'X', '191');
INSERT INTO `region` VALUES ('130930000000', '130930', '1309', '孟村回族自治县', '3', 'M', '192');
INSERT INTO `region` VALUES ('130981000000', '130981', '1309', '泊头市', '3', 'B', '193');
INSERT INTO `region` VALUES ('130982000000', '130982', '1309', '任丘市', '3', 'R', '194');
INSERT INTO `region` VALUES ('130983000000', '130983', '1309', '黄骅市', '3', 'H', '195');
INSERT INTO `region` VALUES ('130984000000', '130984', '1309', '河间市', '3', 'H', '196');
INSERT INTO `region` VALUES ('131000000000', '1310', '13', '廊坊市', '2', 'L', '11');
INSERT INTO `region` VALUES ('131001000000', '131001', '1310', '市辖区', '3', 'S', '197');
INSERT INTO `region` VALUES ('131002000000', '131002', '1310', '安次区', '3', 'A', '198');
INSERT INTO `region` VALUES ('131003000000', '131003', '1310', '广阳区', '3', 'G', '199');
INSERT INTO `region` VALUES ('131022000000', '131022', '1310', '固安县', '3', 'G', '200');
INSERT INTO `region` VALUES ('131023000000', '131023', '1310', '永清县', '3', 'Y', '201');
INSERT INTO `region` VALUES ('131024000000', '131024', '1310', '香河县', '3', 'X', '202');
INSERT INTO `region` VALUES ('131025000000', '131025', '1310', '大城县', '3', 'D', '203');
INSERT INTO `region` VALUES ('131026000000', '131026', '1310', '文安县', '3', 'W', '204');
INSERT INTO `region` VALUES ('131028000000', '131028', '1310', '大厂回族自治县', '3', 'D', '205');
INSERT INTO `region` VALUES ('131081000000', '131081', '1310', '霸州市', '3', 'B', '206');
INSERT INTO `region` VALUES ('131082000000', '131082', '1310', '三河市', '3', 'S', '207');
INSERT INTO `region` VALUES ('131100000000', '1311', '13', '衡水市', '2', 'H', '12');
INSERT INTO `region` VALUES ('131101000000', '131101', '1311', '市辖区', '3', 'S', '208');
INSERT INTO `region` VALUES ('131102000000', '131102', '1311', '桃城区', '3', 'T', '209');
INSERT INTO `region` VALUES ('131121000000', '131121', '1311', '枣强县', '3', 'Z', '210');
INSERT INTO `region` VALUES ('131122000000', '131122', '1311', '武邑县', '3', 'W', '211');
INSERT INTO `region` VALUES ('131123000000', '131123', '1311', '武强县', '3', 'W', '212');
INSERT INTO `region` VALUES ('131124000000', '131124', '1311', '饶阳县', '3', 'R', '213');
INSERT INTO `region` VALUES ('131125000000', '131125', '1311', '安平县', '3', 'A', '214');
INSERT INTO `region` VALUES ('131126000000', '131126', '1311', '故城县', '3', 'G', '215');
INSERT INTO `region` VALUES ('131127000000', '131127', '1311', '景县', '3', 'J', '216');
INSERT INTO `region` VALUES ('131128000000', '131128', '1311', '阜城县', '3', 'F', '217');
INSERT INTO `region` VALUES ('131181000000', '131181', '1311', '冀州市', '3', 'J', '218');
INSERT INTO `region` VALUES ('131182000000', '131182', '1311', '深州市', '3', 'S', '219');
INSERT INTO `region` VALUES ('140000000000', '14', 'root', '山西省', '1', 'S', '3');
INSERT INTO `region` VALUES ('140100000000', '1401', '14', '太原市', '2', 'T', '13');
INSERT INTO `region` VALUES ('140101000000', '140101', '1401', '市辖区', '3', 'S', '220');
INSERT INTO `region` VALUES ('140105000000', '140105', '1401', '小店区', '3', 'X', '221');
INSERT INTO `region` VALUES ('140106000000', '140106', '1401', '迎泽区', '3', 'Y', '222');
INSERT INTO `region` VALUES ('140107000000', '140107', '1401', '杏花岭区', '3', 'X', '223');
INSERT INTO `region` VALUES ('140108000000', '140108', '1401', '尖草坪区', '3', 'J', '224');
INSERT INTO `region` VALUES ('140109000000', '140109', '1401', '万柏林区', '3', 'W', '225');
INSERT INTO `region` VALUES ('140110000000', '140110', '1401', '晋源区', '3', 'J', '226');
INSERT INTO `region` VALUES ('140121000000', '140121', '1401', '清徐县', '3', 'Q', '227');
INSERT INTO `region` VALUES ('140122000000', '140122', '1401', '阳曲县', '3', 'Y', '228');
INSERT INTO `region` VALUES ('140123000000', '140123', '1401', '娄烦县', '3', 'L', '229');
INSERT INTO `region` VALUES ('140181000000', '140181', '1401', '古交市', '3', 'G', '230');
INSERT INTO `region` VALUES ('140200000000', '1402', '14', '大同市', '2', 'D', '14');
INSERT INTO `region` VALUES ('140201000000', '140201', '1402', '市辖区', '3', 'S', '231');
INSERT INTO `region` VALUES ('140202000000', '140202', '1402', '城区', '3', 'C', '232');
INSERT INTO `region` VALUES ('140203000000', '140203', '1402', '矿区', '3', 'K', '233');
INSERT INTO `region` VALUES ('140211000000', '140211', '1402', '南郊区', '3', 'N', '234');
INSERT INTO `region` VALUES ('140212000000', '140212', '1402', '新荣区', '3', 'X', '235');
INSERT INTO `region` VALUES ('140221000000', '140221', '1402', '阳高县', '3', 'Y', '236');
INSERT INTO `region` VALUES ('140222000000', '140222', '1402', '天镇县', '3', 'T', '237');
INSERT INTO `region` VALUES ('140223000000', '140223', '1402', '广灵县', '3', 'G', '238');
INSERT INTO `region` VALUES ('140224000000', '140224', '1402', '灵丘县', '3', 'L', '239');
INSERT INTO `region` VALUES ('140225000000', '140225', '1402', '浑源县', '3', 'H', '240');
INSERT INTO `region` VALUES ('140226000000', '140226', '1402', '左云县', '3', 'Z', '241');
INSERT INTO `region` VALUES ('140227000000', '140227', '1402', '大同县', '3', 'D', '242');
INSERT INTO `region` VALUES ('140300000000', '1403', '14', '阳泉市', '2', 'Y', '15');
INSERT INTO `region` VALUES ('140301000000', '140301', '1403', '市辖区', '3', 'S', '243');
INSERT INTO `region` VALUES ('140302000000', '140302', '1403', '城区', '3', 'C', '244');
INSERT INTO `region` VALUES ('140303000000', '140303', '1403', '矿区', '3', 'K', '245');
INSERT INTO `region` VALUES ('140311000000', '140311', '1403', '郊区', '3', 'J', '246');
INSERT INTO `region` VALUES ('140321000000', '140321', '1403', '平定县', '3', 'P', '247');
INSERT INTO `region` VALUES ('140322000000', '140322', '1403', '盂县', '3', 'Y', '248');
INSERT INTO `region` VALUES ('140400000000', '1404', '14', '长治市', '2', 'C', '16');
INSERT INTO `region` VALUES ('140401000000', '140401', '1404', '市辖区', '3', 'S', '249');
INSERT INTO `region` VALUES ('140402000000', '140402', '1404', '城区', '3', 'C', '250');
INSERT INTO `region` VALUES ('140411000000', '140411', '1404', '郊区', '3', 'J', '251');
INSERT INTO `region` VALUES ('140421000000', '140421', '1404', '长治县', '3', 'C', '252');
INSERT INTO `region` VALUES ('140423000000', '140423', '1404', '襄垣县', '3', 'X', '253');
INSERT INTO `region` VALUES ('140424000000', '140424', '1404', '屯留县', '3', 'T', '254');
INSERT INTO `region` VALUES ('140425000000', '140425', '1404', '平顺县', '3', 'P', '255');
INSERT INTO `region` VALUES ('140426000000', '140426', '1404', '黎城县', '3', 'L', '256');
INSERT INTO `region` VALUES ('140427000000', '140427', '1404', '壶关县', '3', 'H', '257');
INSERT INTO `region` VALUES ('140428000000', '140428', '1404', '长子县', '3', 'C', '258');
INSERT INTO `region` VALUES ('140429000000', '140429', '1404', '武乡县', '3', 'W', '259');
INSERT INTO `region` VALUES ('140430000000', '140430', '1404', '沁县', '3', 'Q', '260');
INSERT INTO `region` VALUES ('140431000000', '140431', '1404', '沁源县', '3', 'Q', '261');
INSERT INTO `region` VALUES ('140481000000', '140481', '1404', '潞城市', '3', 'L', '262');
INSERT INTO `region` VALUES ('140500000000', '1405', '14', '晋城市', '2', 'J', '17');
INSERT INTO `region` VALUES ('140501000000', '140501', '1405', '晋城市市辖区', '3', 'J', '263');
INSERT INTO `region` VALUES ('140502000000', '140502', '1405', '城区', '3', 'C', '264');
INSERT INTO `region` VALUES ('140521000000', '140521', '1405', '沁水县', '3', 'Q', '265');
INSERT INTO `region` VALUES ('140522000000', '140522', '1405', '阳城县', '3', 'Y', '266');
INSERT INTO `region` VALUES ('140524000000', '140524', '1405', '陵川县', '3', 'L', '267');
INSERT INTO `region` VALUES ('140525000000', '140525', '1405', '泽州县', '3', 'Z', '268');
INSERT INTO `region` VALUES ('140581000000', '140581', '1405', '高平市', '3', 'G', '269');
INSERT INTO `region` VALUES ('140600000000', '1406', '14', '朔州市', '2', 'S', '18');
INSERT INTO `region` VALUES ('140601000000', '140601', '1406', '市辖区', '3', 'S', '270');
INSERT INTO `region` VALUES ('140602000000', '140602', '1406', '朔城区', '3', 'S', '271');
INSERT INTO `region` VALUES ('140603000000', '140603', '1406', '平鲁区', '3', 'P', '272');
INSERT INTO `region` VALUES ('140621000000', '140621', '1406', '山阴县', '3', 'S', '273');
INSERT INTO `region` VALUES ('140622000000', '140622', '1406', '应县', '3', 'Y', '274');
INSERT INTO `region` VALUES ('140623000000', '140623', '1406', '右玉县', '3', 'Y', '275');
INSERT INTO `region` VALUES ('140624000000', '140624', '1406', '怀仁县', '3', 'H', '276');
INSERT INTO `region` VALUES ('140700000000', '1407', '14', '晋中市', '2', 'J', '19');
INSERT INTO `region` VALUES ('140701000000', '140701', '1407', '市辖区', '3', 'S', '277');
INSERT INTO `region` VALUES ('140702000000', '140702', '1407', '榆次区', '3', 'Y', '278');
INSERT INTO `region` VALUES ('140721000000', '140721', '1407', '榆社县', '3', 'Y', '279');
INSERT INTO `region` VALUES ('140722000000', '140722', '1407', '左权县', '3', 'Z', '280');
INSERT INTO `region` VALUES ('140723000000', '140723', '1407', '和顺县', '3', 'H', '281');
INSERT INTO `region` VALUES ('140724000000', '140724', '1407', '昔阳县', '3', 'X', '282');
INSERT INTO `region` VALUES ('140725000000', '140725', '1407', '寿阳县', '3', 'S', '283');
INSERT INTO `region` VALUES ('140726000000', '140726', '1407', '太谷县', '3', 'T', '284');
INSERT INTO `region` VALUES ('140727000000', '140727', '1407', '祁县', '3', 'Q', '285');
INSERT INTO `region` VALUES ('140728000000', '140728', '1407', '平遥县', '3', 'P', '286');
INSERT INTO `region` VALUES ('140729000000', '140729', '1407', '灵石县', '3', 'L', '287');
INSERT INTO `region` VALUES ('140781000000', '140781', '1407', '介休市', '3', 'J', '288');
INSERT INTO `region` VALUES ('140800000000', '1408', '14', '运城市', '2', 'Y', '20');
INSERT INTO `region` VALUES ('140801000000', '140801', '1408', '市辖区', '3', 'S', '289');
INSERT INTO `region` VALUES ('140802000000', '140802', '1408', '盐湖区', '3', 'Y', '290');
INSERT INTO `region` VALUES ('140821000000', '140821', '1408', '临猗县', '3', 'L', '291');
INSERT INTO `region` VALUES ('140822000000', '140822', '1408', '万荣县', '3', 'W', '292');
INSERT INTO `region` VALUES ('140823000000', '140823', '1408', '闻喜县', '3', 'W', '293');
INSERT INTO `region` VALUES ('140824000000', '140824', '1408', '稷山县', '3', 'Z', '294');
INSERT INTO `region` VALUES ('140825000000', '140825', '1408', '新绛县', '3', 'X', '295');
INSERT INTO `region` VALUES ('140826000000', '140826', '1408', '绛县', '3', 'Z', '296');
INSERT INTO `region` VALUES ('140827000000', '140827', '1408', '垣曲县', '3', 'Y', '297');
INSERT INTO `region` VALUES ('140828000000', '140828', '1408', '夏县', '3', 'X', '298');
INSERT INTO `region` VALUES ('140829000000', '140829', '1408', '平陆县', '3', 'P', '299');
INSERT INTO `region` VALUES ('140830000000', '140830', '1408', '芮城县', '3', 'Z', '300');
INSERT INTO `region` VALUES ('140881000000', '140881', '1408', '永济市', '3', 'Y', '301');
INSERT INTO `region` VALUES ('140882000000', '140882', '1408', '河津市', '3', 'H', '302');
INSERT INTO `region` VALUES ('140900000000', '1409', '14', '忻州市', '2', 'X', '21');
INSERT INTO `region` VALUES ('140901000000', '140901', '1409', '市辖区', '3', 'S', '303');
INSERT INTO `region` VALUES ('140902000000', '140902', '1409', '忻府区', '3', 'X', '304');
INSERT INTO `region` VALUES ('140921000000', '140921', '1409', '定襄县', '3', 'D', '305');
INSERT INTO `region` VALUES ('140922000000', '140922', '1409', '五台县', '3', 'W', '306');
INSERT INTO `region` VALUES ('140923000000', '140923', '1409', '代县', '3', 'D', '307');
INSERT INTO `region` VALUES ('140924000000', '140924', '1409', '繁峙县', '3', 'F', '308');
INSERT INTO `region` VALUES ('140925000000', '140925', '1409', '宁武县', '3', 'N', '309');
INSERT INTO `region` VALUES ('140926000000', '140926', '1409', '静乐县', '3', 'J', '310');
INSERT INTO `region` VALUES ('140927000000', '140927', '1409', '神池县', '3', 'S', '311');
INSERT INTO `region` VALUES ('140928000000', '140928', '1409', '五寨县', '3', 'W', '312');
INSERT INTO `region` VALUES ('140929000000', '140929', '1409', '岢岚县', '3', 'Z', '313');
INSERT INTO `region` VALUES ('140930000000', '140930', '1409', '河曲县', '3', 'H', '314');
INSERT INTO `region` VALUES ('140931000000', '140931', '1409', '保德县', '3', 'B', '315');
INSERT INTO `region` VALUES ('140932000000', '140932', '1409', '偏关县', '3', 'P', '316');
INSERT INTO `region` VALUES ('140981000000', '140981', '1409', '原平市', '3', 'Y', '317');
INSERT INTO `region` VALUES ('141000000000', '1410', '14', '临汾市', '2', 'L', '22');
INSERT INTO `region` VALUES ('141001000000', '141001', '1410', '市辖区', '3', 'S', '318');
INSERT INTO `region` VALUES ('141002000000', '141002', '1410', '尧都区', '3', 'Y', '319');
INSERT INTO `region` VALUES ('141021000000', '141021', '1410', '曲沃县', '3', 'Q', '320');
INSERT INTO `region` VALUES ('141022000000', '141022', '1410', '翼城县', '3', 'Y', '321');
INSERT INTO `region` VALUES ('141023000000', '141023', '1410', '襄汾县', '3', 'X', '322');
INSERT INTO `region` VALUES ('141024000000', '141024', '1410', '洪洞县', '3', 'H', '323');
INSERT INTO `region` VALUES ('141025000000', '141025', '1410', '古县', '3', 'G', '324');
INSERT INTO `region` VALUES ('141026000000', '141026', '1410', '安泽县', '3', 'A', '325');
INSERT INTO `region` VALUES ('141027000000', '141027', '1410', '浮山县', '3', 'F', '326');
INSERT INTO `region` VALUES ('141028000000', '141028', '1410', '吉县', '3', 'J', '327');
INSERT INTO `region` VALUES ('141029000000', '141029', '1410', '乡宁县', '3', 'X', '328');
INSERT INTO `region` VALUES ('141030000000', '141030', '1410', '大宁县', '3', 'D', '329');
INSERT INTO `region` VALUES ('141031000000', '141031', '1410', '隰县', '3', 'Z', '330');
INSERT INTO `region` VALUES ('141032000000', '141032', '1410', '永和县', '3', 'Y', '331');
INSERT INTO `region` VALUES ('141033000000', '141033', '1410', '蒲县', '3', 'P', '332');
INSERT INTO `region` VALUES ('141034000000', '141034', '1410', '汾西县', '3', 'F', '333');
INSERT INTO `region` VALUES ('141081000000', '141081', '1410', '侯马市', '3', 'H', '334');
INSERT INTO `region` VALUES ('141082000000', '141082', '1410', '霍州市', '3', 'H', '335');
INSERT INTO `region` VALUES ('141100000000', '1411', '14', '吕梁市', '2', 'L', '23');
INSERT INTO `region` VALUES ('141101000000', '141101', '1411', '市辖区', '3', 'S', '336');
INSERT INTO `region` VALUES ('141102000000', '141102', '1411', '离石区', '3', 'L', '337');
INSERT INTO `region` VALUES ('141121000000', '141121', '1411', '文水县', '3', 'W', '338');
INSERT INTO `region` VALUES ('141122000000', '141122', '1411', '交城县', '3', 'J', '339');
INSERT INTO `region` VALUES ('141123000000', '141123', '1411', '兴县', '3', 'X', '340');
INSERT INTO `region` VALUES ('141124000000', '141124', '1411', '临县', '3', 'L', '341');
INSERT INTO `region` VALUES ('141125000000', '141125', '1411', '柳林县', '3', 'L', '342');
INSERT INTO `region` VALUES ('141126000000', '141126', '1411', '石楼县', '3', 'S', '343');
INSERT INTO `region` VALUES ('141127000000', '141127', '1411', '岚县', '3', 'Z', '344');
INSERT INTO `region` VALUES ('141128000000', '141128', '1411', '方山县', '3', 'F', '345');
INSERT INTO `region` VALUES ('141129000000', '141129', '1411', '中阳县', '3', 'Z', '346');
INSERT INTO `region` VALUES ('141130000000', '141130', '1411', '交口县', '3', 'J', '347');
INSERT INTO `region` VALUES ('141181000000', '141181', '1411', '孝义市', '3', 'X', '348');
INSERT INTO `region` VALUES ('141182000000', '141182', '1411', '汾阳市', '3', 'F', '349');
INSERT INTO `region` VALUES ('150000000000', '15', 'root', '内蒙古自治区', '1', 'N', '4');
INSERT INTO `region` VALUES ('150100000000', '1501', '15', '呼和浩特市', '2', 'H', '24');
INSERT INTO `region` VALUES ('150101000000', '150101', '1501', '市辖区', '3', 'S', '350');
INSERT INTO `region` VALUES ('150102000000', '150102', '1501', '新城区', '3', 'X', '351');
INSERT INTO `region` VALUES ('150103000000', '150103', '1501', '回民区', '3', 'H', '352');
INSERT INTO `region` VALUES ('150104000000', '150104', '1501', '玉泉区', '3', 'Y', '353');
INSERT INTO `region` VALUES ('150105000000', '150105', '1501', '赛罕区', '3', 'S', '354');
INSERT INTO `region` VALUES ('150121000000', '150121', '1501', '土默特左旗', '3', 'T', '355');
INSERT INTO `region` VALUES ('150122000000', '150122', '1501', '托克托县', '3', 'T', '356');
INSERT INTO `region` VALUES ('150123000000', '150123', '1501', '和林格尔县', '3', 'H', '357');
INSERT INTO `region` VALUES ('150124000000', '150124', '1501', '清水河县', '3', 'Q', '358');
INSERT INTO `region` VALUES ('150125000000', '150125', '1501', '武川县', '3', 'W', '359');
INSERT INTO `region` VALUES ('150200000000', '1502', '15', '包头市', '2', 'B', '25');
INSERT INTO `region` VALUES ('150201000000', '150201', '1502', '市辖区', '3', 'S', '360');
INSERT INTO `region` VALUES ('150202000000', '150202', '1502', '东河区', '3', 'D', '361');
INSERT INTO `region` VALUES ('150203000000', '150203', '1502', '昆都仑区', '3', 'K', '362');
INSERT INTO `region` VALUES ('150204000000', '150204', '1502', '青山区', '3', 'Q', '363');
INSERT INTO `region` VALUES ('150205000000', '150205', '1502', '石拐区', '3', 'S', '364');
INSERT INTO `region` VALUES ('150206000000', '150206', '1502', '白云鄂博矿区', '3', 'B', '365');
INSERT INTO `region` VALUES ('150207000000', '150207', '1502', '九原区', '3', 'J', '366');
INSERT INTO `region` VALUES ('150221000000', '150221', '1502', '土默特右旗', '3', 'T', '367');
INSERT INTO `region` VALUES ('150222000000', '150222', '1502', '固阳县', '3', 'G', '368');
INSERT INTO `region` VALUES ('150223000000', '150223', '1502', '达尔罕茂明安联合旗', '3', 'D', '369');
INSERT INTO `region` VALUES ('150300000000', '1503', '15', '乌海市', '2', 'W', '26');
INSERT INTO `region` VALUES ('150301000000', '150301', '1503', '市辖区', '3', 'S', '370');
INSERT INTO `region` VALUES ('150302000000', '150302', '1503', '海勃湾区', '3', 'H', '371');
INSERT INTO `region` VALUES ('150303000000', '150303', '1503', '海南区', '3', 'H', '372');
INSERT INTO `region` VALUES ('150304000000', '150304', '1503', '乌达区', '3', 'W', '373');
INSERT INTO `region` VALUES ('150400000000', '1504', '15', '赤峰市', '2', 'C', '27');
INSERT INTO `region` VALUES ('150401000000', '150401', '1504', '市辖区', '3', 'S', '374');
INSERT INTO `region` VALUES ('150402000000', '150402', '1504', '红山区', '3', 'H', '375');
INSERT INTO `region` VALUES ('150403000000', '150403', '1504', '元宝山区', '3', 'Y', '376');
INSERT INTO `region` VALUES ('150404000000', '150404', '1504', '松山区', '3', 'S', '377');
INSERT INTO `region` VALUES ('150421000000', '150421', '1504', '阿鲁科尔沁旗', '3', 'A', '378');
INSERT INTO `region` VALUES ('150422000000', '150422', '1504', '巴林左旗', '3', 'B', '379');
INSERT INTO `region` VALUES ('150423000000', '150423', '1504', '巴林右旗', '3', 'B', '380');
INSERT INTO `region` VALUES ('150424000000', '150424', '1504', '林西县', '3', 'L', '381');
INSERT INTO `region` VALUES ('150425000000', '150425', '1504', '克什克腾旗', '3', 'K', '382');
INSERT INTO `region` VALUES ('150426000000', '150426', '1504', '翁牛特旗', '3', 'W', '383');
INSERT INTO `region` VALUES ('150428000000', '150428', '1504', '喀喇沁旗', '3', 'K', '384');
INSERT INTO `region` VALUES ('150429000000', '150429', '1504', '宁城县', '3', 'N', '385');
INSERT INTO `region` VALUES ('150430000000', '150430', '1504', '敖汉旗', '3', 'A', '386');
INSERT INTO `region` VALUES ('150500000000', '1505', '15', '通辽市', '2', 'T', '28');
INSERT INTO `region` VALUES ('150501000000', '150501', '1505', '市辖区', '3', 'S', '387');
INSERT INTO `region` VALUES ('150502000000', '150502', '1505', '科尔沁区', '3', 'K', '388');
INSERT INTO `region` VALUES ('150521000000', '150521', '1505', '科尔沁左翼中旗', '3', 'K', '389');
INSERT INTO `region` VALUES ('150522000000', '150522', '1505', '科尔沁左翼后旗', '3', 'K', '390');
INSERT INTO `region` VALUES ('150523000000', '150523', '1505', '开鲁县', '3', 'K', '391');
INSERT INTO `region` VALUES ('150524000000', '150524', '1505', '库伦旗', '3', 'K', '392');
INSERT INTO `region` VALUES ('150525000000', '150525', '1505', '奈曼旗', '3', 'N', '393');
INSERT INTO `region` VALUES ('150526000000', '150526', '1505', '扎鲁特旗', '3', 'Z', '394');
INSERT INTO `region` VALUES ('150581000000', '150581', '1505', '霍林郭勒市', '3', 'H', '395');
INSERT INTO `region` VALUES ('150600000000', '1506', '15', '鄂尔多斯市', '2', 'E', '29');
INSERT INTO `region` VALUES ('150601000000', '150601', '1506', '市辖区', '3', 'S', '396');
INSERT INTO `region` VALUES ('150602000000', '150602', '1506', '东胜区', '3', 'D', '397');
INSERT INTO `region` VALUES ('150621000000', '150621', '1506', '达拉特旗', '3', 'D', '398');
INSERT INTO `region` VALUES ('150622000000', '150622', '1506', '准格尔旗', '3', 'Z', '399');
INSERT INTO `region` VALUES ('150623000000', '150623', '1506', '鄂托克前旗', '3', 'E', '400');
INSERT INTO `region` VALUES ('150624000000', '150624', '1506', '鄂托克旗', '3', 'E', '401');
INSERT INTO `region` VALUES ('150625000000', '150625', '1506', '杭锦旗', '3', 'H', '402');
INSERT INTO `region` VALUES ('150626000000', '150626', '1506', '乌审旗', '3', 'W', '403');
INSERT INTO `region` VALUES ('150627000000', '150627', '1506', '伊金霍洛旗', '3', 'Y', '404');
INSERT INTO `region` VALUES ('150700000000', '1507', '15', '呼伦贝尔市', '2', 'H', '30');
INSERT INTO `region` VALUES ('150701000000', '150701', '1507', '市辖区', '3', 'S', '405');
INSERT INTO `region` VALUES ('150702000000', '150702', '1507', '海拉尔区', '3', 'H', '406');
INSERT INTO `region` VALUES ('150721000000', '150721', '1507', '阿荣旗', '3', 'A', '407');
INSERT INTO `region` VALUES ('150722000000', '150722', '1507', '莫力达瓦达斡尔族自治旗', '3', 'M', '408');
INSERT INTO `region` VALUES ('150723000000', '150723', '1507', '鄂伦春自治旗', '3', 'E', '409');
INSERT INTO `region` VALUES ('150724000000', '150724', '1507', '鄂温克族自治旗', '3', 'E', '410');
INSERT INTO `region` VALUES ('150725000000', '150725', '1507', '陈巴尔虎旗', '3', 'C', '411');
INSERT INTO `region` VALUES ('150726000000', '150726', '1507', '新巴尔虎左旗', '3', 'X', '412');
INSERT INTO `region` VALUES ('150727000000', '150727', '1507', '新巴尔虎右旗', '3', 'X', '413');
INSERT INTO `region` VALUES ('150781000000', '150781', '1507', '满洲里市', '3', 'M', '414');
INSERT INTO `region` VALUES ('150782000000', '150782', '1507', '牙克石市', '3', 'Y', '415');
INSERT INTO `region` VALUES ('150783000000', '150783', '1507', '扎兰屯市', '3', 'Z', '416');
INSERT INTO `region` VALUES ('150784000000', '150784', '1507', '额尔古纳市', '3', 'E', '417');
INSERT INTO `region` VALUES ('150785000000', '150785', '1507', '根河市', '3', 'G', '418');
INSERT INTO `region` VALUES ('150800000000', '1508', '15', '巴彦淖尔市', '2', 'B', '31');
INSERT INTO `region` VALUES ('150801000000', '150801', '1508', '市辖区', '3', 'S', '419');
INSERT INTO `region` VALUES ('150802000000', '150802', '1508', '临河区', '3', 'L', '420');
INSERT INTO `region` VALUES ('150821000000', '150821', '1508', '五原县', '3', 'W', '421');
INSERT INTO `region` VALUES ('150822000000', '150822', '1508', '磴口县', '3', 'Z', '422');
INSERT INTO `region` VALUES ('150823000000', '150823', '1508', '乌拉特前旗', '3', 'W', '423');
INSERT INTO `region` VALUES ('150824000000', '150824', '1508', '乌拉特中旗', '3', 'W', '424');
INSERT INTO `region` VALUES ('150825000000', '150825', '1508', '乌拉特后旗', '3', 'W', '425');
INSERT INTO `region` VALUES ('150826000000', '150826', '1508', '杭锦后旗', '3', 'H', '426');
INSERT INTO `region` VALUES ('150900000000', '1509', '15', '乌兰察布市', '2', 'W', '32');
INSERT INTO `region` VALUES ('150901000000', '150901', '1509', '市辖区', '3', 'S', '427');
INSERT INTO `region` VALUES ('150902000000', '150902', '1509', '集宁区', '3', 'J', '428');
INSERT INTO `region` VALUES ('150921000000', '150921', '1509', '卓资县', '3', 'Z', '429');
INSERT INTO `region` VALUES ('150922000000', '150922', '1509', '化德县', '3', 'H', '430');
INSERT INTO `region` VALUES ('150923000000', '150923', '1509', '商都县', '3', 'S', '431');
INSERT INTO `region` VALUES ('150924000000', '150924', '1509', '兴和县', '3', 'X', '432');
INSERT INTO `region` VALUES ('150925000000', '150925', '1509', '凉城县', '3', 'L', '433');
INSERT INTO `region` VALUES ('150926000000', '150926', '1509', '察哈尔右翼前旗', '3', 'C', '434');
INSERT INTO `region` VALUES ('150927000000', '150927', '1509', '察哈尔右翼中旗', '3', 'C', '435');
INSERT INTO `region` VALUES ('150928000000', '150928', '1509', '察哈尔右翼后旗', '3', 'C', '436');
INSERT INTO `region` VALUES ('150929000000', '150929', '1509', '四子王旗', '3', 'S', '437');
INSERT INTO `region` VALUES ('150981000000', '150981', '1509', '丰镇市', '3', 'F', '438');
INSERT INTO `region` VALUES ('152200000000', '1522', '15', '兴安盟', '2', 'X', '33');
INSERT INTO `region` VALUES ('152201000000', '152201', '1522', '乌兰浩特市', '3', 'W', '439');
INSERT INTO `region` VALUES ('152202000000', '152202', '1522', '阿尔山市', '3', 'A', '440');
INSERT INTO `region` VALUES ('152221000000', '152221', '1522', '科尔沁右翼前旗', '3', 'K', '441');
INSERT INTO `region` VALUES ('152222000000', '152222', '1522', '科尔沁右翼中旗', '3', 'K', '442');
INSERT INTO `region` VALUES ('152223000000', '152223', '1522', '扎赉特旗', '3', 'Z', '443');
INSERT INTO `region` VALUES ('152224000000', '152224', '1522', '突泉县', '3', 'T', '444');
INSERT INTO `region` VALUES ('152500000000', '1525', '15', '锡林郭勒盟', '2', 'X', '34');
INSERT INTO `region` VALUES ('152501000000', '152501', '1525', '二连浩特市', '3', 'E', '445');
INSERT INTO `region` VALUES ('152502000000', '152502', '1525', '锡林浩特市', '3', 'X', '446');
INSERT INTO `region` VALUES ('152522000000', '152522', '1525', '阿巴嘎旗', '3', 'A', '447');
INSERT INTO `region` VALUES ('152523000000', '152523', '1525', '苏尼特左旗', '3', 'S', '448');
INSERT INTO `region` VALUES ('152524000000', '152524', '1525', '苏尼特右旗', '3', 'S', '449');
INSERT INTO `region` VALUES ('152525000000', '152525', '1525', '东乌珠穆沁旗', '3', 'D', '450');
INSERT INTO `region` VALUES ('152526000000', '152526', '1525', '西乌珠穆沁旗', '3', 'X', '451');
INSERT INTO `region` VALUES ('152527000000', '152527', '1525', '太仆寺旗', '3', 'T', '452');
INSERT INTO `region` VALUES ('152528000000', '152528', '1525', '镶黄旗', '3', 'X', '453');
INSERT INTO `region` VALUES ('152529000000', '152529', '1525', '正镶白旗', '3', 'Z', '454');
INSERT INTO `region` VALUES ('152530000000', '152530', '1525', '正蓝旗', '3', 'Z', '455');
INSERT INTO `region` VALUES ('152531000000', '152531', '1525', '多伦县', '3', 'D', '456');
INSERT INTO `region` VALUES ('152900000000', '1529', '15', '阿拉善盟', '2', 'A', '35');
INSERT INTO `region` VALUES ('152921000000', '152921', '1529', '阿拉善左旗', '3', 'A', '457');
INSERT INTO `region` VALUES ('152922000000', '152922', '1529', '阿拉善右旗', '3', 'A', '458');
INSERT INTO `region` VALUES ('152923000000', '152923', '1529', '额济纳旗', '3', 'E', '459');
INSERT INTO `region` VALUES ('210000000000', '21', 'root', '辽宁省', '1', 'L', '5');
INSERT INTO `region` VALUES ('210100000000', '2101', '21', '沈阳市', '2', 'S', '36');
INSERT INTO `region` VALUES ('210101000000', '210101', '2101', '市辖区', '3', 'S', '460');
INSERT INTO `region` VALUES ('210102000000', '210102', '2101', '和平区', '3', 'H', '461');
INSERT INTO `region` VALUES ('210103000000', '210103', '2101', '沈河区', '3', 'S', '462');
INSERT INTO `region` VALUES ('210104000000', '210104', '2101', '大东区', '3', 'D', '463');
INSERT INTO `region` VALUES ('210105000000', '210105', '2101', '皇姑区', '3', 'H', '464');
INSERT INTO `region` VALUES ('210106000000', '210106', '2101', '铁西区', '3', 'T', '465');
INSERT INTO `region` VALUES ('210111000000', '210111', '2101', '苏家屯区', '3', 'S', '466');
INSERT INTO `region` VALUES ('210112000000', '210112', '2101', '东陵区', '3', 'D', '467');
INSERT INTO `region` VALUES ('210113000000', '210113', '2101', '沈北新区', '3', 'S', '468');
INSERT INTO `region` VALUES ('210114000000', '210114', '2101', '于洪区', '3', 'Y', '469');
INSERT INTO `region` VALUES ('210122000000', '210122', '2101', '辽中县', '3', 'L', '470');
INSERT INTO `region` VALUES ('210123000000', '210123', '2101', '康平县', '3', 'K', '471');
INSERT INTO `region` VALUES ('210124000000', '210124', '2101', '法库县', '3', 'F', '472');
INSERT INTO `region` VALUES ('210181000000', '210181', '2101', '新民市', '3', 'X', '473');
INSERT INTO `region` VALUES ('210200000000', '2102', '21', '大连市', '2', 'D', '37');
INSERT INTO `region` VALUES ('210201000000', '210201', '2102', '市辖区', '3', 'S', '474');
INSERT INTO `region` VALUES ('210202000000', '210202', '2102', '中山区', '3', 'Z', '475');
INSERT INTO `region` VALUES ('210203000000', '210203', '2102', '西岗区', '3', 'X', '476');
INSERT INTO `region` VALUES ('210204000000', '210204', '2102', '沙河口区', '3', 'S', '477');
INSERT INTO `region` VALUES ('210211000000', '210211', '2102', '甘井子区', '3', 'G', '478');
INSERT INTO `region` VALUES ('210212000000', '210212', '2102', '旅顺口区', '3', 'L', '479');
INSERT INTO `region` VALUES ('210213000000', '210213', '2102', '金州区', '3', 'J', '480');
INSERT INTO `region` VALUES ('210224000000', '210224', '2102', '长海县', '3', 'C', '481');
INSERT INTO `region` VALUES ('210281000000', '210281', '2102', '瓦房店市', '3', 'W', '482');
INSERT INTO `region` VALUES ('210282000000', '210282', '2102', '普兰店市', '3', 'P', '483');
INSERT INTO `region` VALUES ('210283000000', '210283', '2102', '庄河市', '3', 'Z', '484');
INSERT INTO `region` VALUES ('210300000000', '2103', '21', '鞍山市', '2', 'A', '38');
INSERT INTO `region` VALUES ('210301000000', '210301', '2103', '市辖区', '3', 'S', '485');
INSERT INTO `region` VALUES ('210302000000', '210302', '2103', '铁东区', '3', 'T', '486');
INSERT INTO `region` VALUES ('210303000000', '210303', '2103', '铁西区', '3', 'T', '487');
INSERT INTO `region` VALUES ('210304000000', '210304', '2103', '立山区', '3', 'L', '488');
INSERT INTO `region` VALUES ('210311000000', '210311', '2103', '千山区', '3', 'Q', '489');
INSERT INTO `region` VALUES ('210321000000', '210321', '2103', '台安县', '3', 'T', '490');
INSERT INTO `region` VALUES ('210323000000', '210323', '2103', '岫岩满族自治县', '3', 'Z', '491');
INSERT INTO `region` VALUES ('210381000000', '210381', '2103', '海城市', '3', 'H', '492');
INSERT INTO `region` VALUES ('210400000000', '2104', '21', '抚顺市', '2', 'F', '39');
INSERT INTO `region` VALUES ('210401000000', '210401', '2104', '市辖区', '3', 'S', '493');
INSERT INTO `region` VALUES ('210402000000', '210402', '2104', '新抚区', '3', 'X', '494');
INSERT INTO `region` VALUES ('210403000000', '210403', '2104', '东洲区', '3', 'D', '495');
INSERT INTO `region` VALUES ('210404000000', '210404', '2104', '望花区', '3', 'W', '496');
INSERT INTO `region` VALUES ('210411000000', '210411', '2104', '顺城区', '3', 'S', '497');
INSERT INTO `region` VALUES ('210421000000', '210421', '2104', '抚顺县', '3', 'F', '498');
INSERT INTO `region` VALUES ('210422000000', '210422', '2104', '新宾满族自治县', '3', 'X', '499');
INSERT INTO `region` VALUES ('210423000000', '210423', '2104', '清原满族自治县', '3', 'Q', '500');
INSERT INTO `region` VALUES ('210500000000', '2105', '21', '本溪市', '2', 'B', '40');
INSERT INTO `region` VALUES ('210501000000', '210501', '2105', '市辖区', '3', 'S', '501');
INSERT INTO `region` VALUES ('210502000000', '210502', '2105', '平山区', '3', 'P', '502');
INSERT INTO `region` VALUES ('210503000000', '210503', '2105', '溪湖区', '3', 'X', '503');
INSERT INTO `region` VALUES ('210504000000', '210504', '2105', '明山区', '3', 'M', '504');
INSERT INTO `region` VALUES ('210505000000', '210505', '2105', '南芬区', '3', 'N', '505');
INSERT INTO `region` VALUES ('210521000000', '210521', '2105', '本溪满族自治县', '3', 'B', '506');
INSERT INTO `region` VALUES ('210522000000', '210522', '2105', '桓仁满族自治县', '3', 'H', '507');
INSERT INTO `region` VALUES ('210600000000', '2106', '21', '丹东市', '2', 'D', '41');
INSERT INTO `region` VALUES ('210601000000', '210601', '2106', '市辖区', '3', 'S', '508');
INSERT INTO `region` VALUES ('210602000000', '210602', '2106', '元宝区', '3', 'Y', '509');
INSERT INTO `region` VALUES ('210603000000', '210603', '2106', '振兴区', '3', 'Z', '510');
INSERT INTO `region` VALUES ('210604000000', '210604', '2106', '振安区', '3', 'Z', '511');
INSERT INTO `region` VALUES ('210624000000', '210624', '2106', '宽甸满族自治县', '3', 'K', '512');
INSERT INTO `region` VALUES ('210681000000', '210681', '2106', '东港市', '3', 'D', '513');
INSERT INTO `region` VALUES ('210682000000', '210682', '2106', '凤城市', '3', 'F', '514');
INSERT INTO `region` VALUES ('210700000000', '2107', '21', '锦州市', '2', 'J', '42');
INSERT INTO `region` VALUES ('210701000000', '210701', '2107', '市辖区', '3', 'S', '515');
INSERT INTO `region` VALUES ('210702000000', '210702', '2107', '古塔区', '3', 'G', '516');
INSERT INTO `region` VALUES ('210703000000', '210703', '2107', '凌河区', '3', 'L', '517');
INSERT INTO `region` VALUES ('210711000000', '210711', '2107', '太和区', '3', 'T', '518');
INSERT INTO `region` VALUES ('210726000000', '210726', '2107', '黑山县', '3', 'H', '519');
INSERT INTO `region` VALUES ('210727000000', '210727', '2107', '义县', '3', 'Y', '520');
INSERT INTO `region` VALUES ('210781000000', '210781', '2107', '凌海市', '3', 'L', '521');
INSERT INTO `region` VALUES ('210782000000', '210782', '2107', '北镇市', '3', 'B', '522');
INSERT INTO `region` VALUES ('210800000000', '2108', '21', '营口市', '2', 'Y', '43');
INSERT INTO `region` VALUES ('210801000000', '210801', '2108', '市辖区', '3', 'S', '523');
INSERT INTO `region` VALUES ('210802000000', '210802', '2108', '站前区', '3', 'Z', '524');
INSERT INTO `region` VALUES ('210803000000', '210803', '2108', '西市区', '3', 'X', '525');
INSERT INTO `region` VALUES ('210804000000', '210804', '2108', '鲅鱼圈区', '3', 'Z', '526');
INSERT INTO `region` VALUES ('210811000000', '210811', '2108', '老边区', '3', 'L', '527');
INSERT INTO `region` VALUES ('210881000000', '210881', '2108', '盖州市', '3', 'G', '528');
INSERT INTO `region` VALUES ('210882000000', '210882', '2108', '大石桥市', '3', 'D', '529');
INSERT INTO `region` VALUES ('210900000000', '2109', '21', '阜新市', '2', 'F', '44');
INSERT INTO `region` VALUES ('210901000000', '210901', '2109', '市辖区', '3', 'S', '530');
INSERT INTO `region` VALUES ('210902000000', '210902', '2109', '海州区', '3', 'H', '531');
INSERT INTO `region` VALUES ('210903000000', '210903', '2109', '新邱区', '3', 'X', '532');
INSERT INTO `region` VALUES ('210904000000', '210904', '2109', '太平区', '3', 'T', '533');
INSERT INTO `region` VALUES ('210905000000', '210905', '2109', '清河门区', '3', 'Q', '534');
INSERT INTO `region` VALUES ('210911000000', '210911', '2109', '细河区', '3', 'X', '535');
INSERT INTO `region` VALUES ('210921000000', '210921', '2109', '阜新蒙古族自治县', '3', 'F', '536');
INSERT INTO `region` VALUES ('210922000000', '210922', '2109', '彰武县', '3', 'Z', '537');
INSERT INTO `region` VALUES ('211000000000', '2110', '21', '辽阳市', '2', 'L', '45');
INSERT INTO `region` VALUES ('211001000000', '211001', '2110', '市辖区', '3', 'S', '538');
INSERT INTO `region` VALUES ('211002000000', '211002', '2110', '白塔区', '3', 'B', '539');
INSERT INTO `region` VALUES ('211003000000', '211003', '2110', '文圣区', '3', 'W', '540');
INSERT INTO `region` VALUES ('211004000000', '211004', '2110', '宏伟区', '3', 'H', '541');
INSERT INTO `region` VALUES ('211005000000', '211005', '2110', '弓长岭区', '3', 'G', '542');
INSERT INTO `region` VALUES ('211011000000', '211011', '2110', '太子河区', '3', 'T', '543');
INSERT INTO `region` VALUES ('211021000000', '211021', '2110', '辽阳县', '3', 'L', '544');
INSERT INTO `region` VALUES ('211081000000', '211081', '2110', '灯塔市', '3', 'D', '545');
INSERT INTO `region` VALUES ('211100000000', '2111', '21', '盘锦市', '2', 'P', '46');
INSERT INTO `region` VALUES ('211101000000', '211101', '2111', '市辖区', '3', 'S', '546');
INSERT INTO `region` VALUES ('211102000000', '211102', '2111', '双台子区', '3', 'S', '547');
INSERT INTO `region` VALUES ('211103000000', '211103', '2111', '兴隆台区', '3', 'X', '548');
INSERT INTO `region` VALUES ('211121000000', '211121', '2111', '大洼县', '3', 'D', '549');
INSERT INTO `region` VALUES ('211122000000', '211122', '2111', '盘山县', '3', 'P', '550');
INSERT INTO `region` VALUES ('211200000000', '2112', '21', '铁岭市', '2', 'T', '47');
INSERT INTO `region` VALUES ('211201000000', '211201', '2112', '市辖区', '3', 'S', '551');
INSERT INTO `region` VALUES ('211202000000', '211202', '2112', '银州区', '3', 'Y', '552');
INSERT INTO `region` VALUES ('211204000000', '211204', '2112', '清河区', '3', 'Q', '553');
INSERT INTO `region` VALUES ('211221000000', '211221', '2112', '铁岭县', '3', 'T', '554');
INSERT INTO `region` VALUES ('211223000000', '211223', '2112', '西丰县', '3', 'X', '555');
INSERT INTO `region` VALUES ('211224000000', '211224', '2112', '昌图县', '3', 'C', '556');
INSERT INTO `region` VALUES ('211281000000', '211281', '2112', '调兵山市', '3', 'D', '557');
INSERT INTO `region` VALUES ('211282000000', '211282', '2112', '开原市', '3', 'K', '558');
INSERT INTO `region` VALUES ('211300000000', '2113', '21', '朝阳市', '2', 'C', '48');
INSERT INTO `region` VALUES ('211301000000', '211301', '2113', '市辖区', '3', 'S', '559');
INSERT INTO `region` VALUES ('211302000000', '211302', '2113', '双塔区', '3', 'S', '560');
INSERT INTO `region` VALUES ('211303000000', '211303', '2113', '龙城区', '3', 'L', '561');
INSERT INTO `region` VALUES ('211321000000', '211321', '2113', '朝阳县', '3', 'C', '562');
INSERT INTO `region` VALUES ('211322000000', '211322', '2113', '建平县', '3', 'J', '563');
INSERT INTO `region` VALUES ('211324000000', '211324', '2113', '喀喇沁左翼蒙古族自治县', '3', 'K', '564');
INSERT INTO `region` VALUES ('211381000000', '211381', '2113', '北票市', '3', 'B', '565');
INSERT INTO `region` VALUES ('211382000000', '211382', '2113', '凌源市', '3', 'L', '566');
INSERT INTO `region` VALUES ('211400000000', '2114', '21', '葫芦岛市', '2', 'H', '49');
INSERT INTO `region` VALUES ('211401000000', '211401', '2114', '市辖区', '3', 'S', '567');
INSERT INTO `region` VALUES ('211402000000', '211402', '2114', '连山区', '3', 'L', '568');
INSERT INTO `region` VALUES ('211403000000', '211403', '2114', '龙港区', '3', 'L', '569');
INSERT INTO `region` VALUES ('211404000000', '211404', '2114', '南票区', '3', 'N', '570');
INSERT INTO `region` VALUES ('211421000000', '211421', '2114', '绥中县', '3', 'S', '571');
INSERT INTO `region` VALUES ('211422000000', '211422', '2114', '建昌县', '3', 'J', '572');
INSERT INTO `region` VALUES ('211481000000', '211481', '2114', '兴城市', '3', 'X', '573');
INSERT INTO `region` VALUES ('220000000000', '22', 'root', '吉林省', '1', 'J', '6');
INSERT INTO `region` VALUES ('220100000000', '2201', '22', '长春市', '2', 'C', '50');
INSERT INTO `region` VALUES ('220101000000', '220101', '2201', '市辖区', '3', 'S', '574');
INSERT INTO `region` VALUES ('220102000000', '220102', '2201', '南关区', '3', 'N', '575');
INSERT INTO `region` VALUES ('220103000000', '220103', '2201', '宽城区', '3', 'K', '576');
INSERT INTO `region` VALUES ('220104000000', '220104', '2201', '朝阳区', '3', 'C', '577');
INSERT INTO `region` VALUES ('220105000000', '220105', '2201', '二道区', '3', 'E', '578');
INSERT INTO `region` VALUES ('220106000000', '220106', '2201', '绿园区', '3', 'L', '579');
INSERT INTO `region` VALUES ('220112000000', '220112', '2201', '双阳区', '3', 'S', '580');
INSERT INTO `region` VALUES ('220122000000', '220122', '2201', '农安县', '3', 'N', '581');
INSERT INTO `region` VALUES ('220181000000', '220181', '2201', '九台市', '3', 'J', '582');
INSERT INTO `region` VALUES ('220182000000', '220182', '2201', '榆树市', '3', 'Y', '583');
INSERT INTO `region` VALUES ('220183000000', '220183', '2201', '德惠市', '3', 'D', '584');
INSERT INTO `region` VALUES ('220200000000', '2202', '22', '吉林市', '2', 'J', '51');
INSERT INTO `region` VALUES ('220201000000', '220201', '2202', '市辖区', '3', 'S', '585');
INSERT INTO `region` VALUES ('220202000000', '220202', '2202', '昌邑区', '3', 'C', '586');
INSERT INTO `region` VALUES ('220203000000', '220203', '2202', '龙潭区', '3', 'L', '587');
INSERT INTO `region` VALUES ('220204000000', '220204', '2202', '船营区', '3', 'C', '588');
INSERT INTO `region` VALUES ('220211000000', '220211', '2202', '丰满区', '3', 'F', '589');
INSERT INTO `region` VALUES ('220221000000', '220221', '2202', '永吉县', '3', 'Y', '590');
INSERT INTO `region` VALUES ('220281000000', '220281', '2202', '蛟河市', '3', 'Z', '591');
INSERT INTO `region` VALUES ('220282000000', '220282', '2202', '桦甸市', '3', 'Z', '592');
INSERT INTO `region` VALUES ('220283000000', '220283', '2202', '舒兰市', '3', 'S', '593');
INSERT INTO `region` VALUES ('220284000000', '220284', '2202', '磐石市', '3', 'P', '594');
INSERT INTO `region` VALUES ('220300000000', '2203', '22', '四平市', '2', 'S', '52');
INSERT INTO `region` VALUES ('220301000000', '220301', '2203', '市辖区', '3', 'S', '595');
INSERT INTO `region` VALUES ('220302000000', '220302', '2203', '铁西区', '3', 'T', '596');
INSERT INTO `region` VALUES ('220303000000', '220303', '2203', '铁东区', '3', 'T', '597');
INSERT INTO `region` VALUES ('220322000000', '220322', '2203', '梨树县', '3', 'L', '598');
INSERT INTO `region` VALUES ('220323000000', '220323', '2203', '伊通满族自治县', '3', 'Y', '599');
INSERT INTO `region` VALUES ('220381000000', '220381', '2203', '公主岭市', '3', 'G', '600');
INSERT INTO `region` VALUES ('220382000000', '220382', '2203', '双辽市', '3', 'S', '601');
INSERT INTO `region` VALUES ('220400000000', '2204', '22', '辽源市', '2', 'L', '53');
INSERT INTO `region` VALUES ('220401000000', '220401', '2204', '市辖区', '3', 'S', '602');
INSERT INTO `region` VALUES ('220402000000', '220402', '2204', '龙山区', '3', 'L', '603');
INSERT INTO `region` VALUES ('220403000000', '220403', '2204', '西安区', '3', 'X', '604');
INSERT INTO `region` VALUES ('220421000000', '220421', '2204', '东丰县', '3', 'D', '605');
INSERT INTO `region` VALUES ('220422000000', '220422', '2204', '东辽县', '3', 'D', '606');
INSERT INTO `region` VALUES ('220500000000', '2205', '22', '通化市', '2', 'T', '54');
INSERT INTO `region` VALUES ('220501000000', '220501', '2205', '市辖区', '3', 'S', '607');
INSERT INTO `region` VALUES ('220502000000', '220502', '2205', '东昌区', '3', 'D', '608');
INSERT INTO `region` VALUES ('220503000000', '220503', '2205', '二道江区', '3', 'E', '609');
INSERT INTO `region` VALUES ('220521000000', '220521', '2205', '通化县', '3', 'T', '610');
INSERT INTO `region` VALUES ('220523000000', '220523', '2205', '辉南县', '3', 'H', '611');
INSERT INTO `region` VALUES ('220524000000', '220524', '2205', '柳河县', '3', 'L', '612');
INSERT INTO `region` VALUES ('220581000000', '220581', '2205', '梅河口市', '3', 'M', '613');
INSERT INTO `region` VALUES ('220582000000', '220582', '2205', '集安市', '3', 'J', '614');
INSERT INTO `region` VALUES ('220600000000', '2206', '22', '白山市', '2', 'B', '55');
INSERT INTO `region` VALUES ('220601000000', '220601', '2206', '市辖区', '3', 'S', '615');
INSERT INTO `region` VALUES ('220602000000', '220602', '2206', '八道江区', '3', 'B', '616');
INSERT INTO `region` VALUES ('220605000000', '220605', '2206', '江源区', '3', 'J', '617');
INSERT INTO `region` VALUES ('220621000000', '220621', '2206', '抚松县', '3', 'F', '618');
INSERT INTO `region` VALUES ('220622000000', '220622', '2206', '靖宇县', '3', 'J', '619');
INSERT INTO `region` VALUES ('220623000000', '220623', '2206', '长白朝鲜族自治县', '3', 'C', '620');
INSERT INTO `region` VALUES ('220681000000', '220681', '2206', '临江市', '3', 'L', '621');
INSERT INTO `region` VALUES ('220700000000', '2207', '22', '松原市', '2', 'S', '56');
INSERT INTO `region` VALUES ('220701000000', '220701', '2207', '市辖区', '3', 'S', '622');
INSERT INTO `region` VALUES ('220702000000', '220702', '2207', '宁江区', '3', 'N', '623');
INSERT INTO `region` VALUES ('220721000000', '220721', '2207', '前郭尔罗斯蒙古族自治县', '3', 'Q', '624');
INSERT INTO `region` VALUES ('220722000000', '220722', '2207', '长岭县', '3', 'C', '625');
INSERT INTO `region` VALUES ('220723000000', '220723', '2207', '乾安县', '3', 'Q', '626');
INSERT INTO `region` VALUES ('220724000000', '220724', '2207', '扶余县', '3', 'F', '627');
INSERT INTO `region` VALUES ('220800000000', '2208', '22', '白城市', '2', 'B', '57');
INSERT INTO `region` VALUES ('220801000000', '220801', '2208', '市辖区', '3', 'S', '628');
INSERT INTO `region` VALUES ('220802000000', '220802', '2208', '洮北区', '3', 'Z', '629');
INSERT INTO `region` VALUES ('220821000000', '220821', '2208', '镇赉县', '3', 'Z', '630');
INSERT INTO `region` VALUES ('220822000000', '220822', '2208', '通榆县', '3', 'T', '631');
INSERT INTO `region` VALUES ('220881000000', '220881', '2208', '洮南市', '3', 'Z', '632');
INSERT INTO `region` VALUES ('220882000000', '220882', '2208', '大安市', '3', 'D', '633');
INSERT INTO `region` VALUES ('222400000000', '2224', '22', '延边朝鲜族自治州', '2', 'Y', '58');
INSERT INTO `region` VALUES ('222401000000', '222401', '2224', '延吉市', '3', 'Y', '634');
INSERT INTO `region` VALUES ('222402000000', '222402', '2224', '图们市', '3', 'T', '635');
INSERT INTO `region` VALUES ('222403000000', '222403', '2224', '敦化市', '3', 'D', '636');
INSERT INTO `region` VALUES ('222404000000', '222404', '2224', '珲春市', '3', 'Z', '637');
INSERT INTO `region` VALUES ('222405000000', '222405', '2224', '龙井市', '3', 'L', '638');
INSERT INTO `region` VALUES ('222406000000', '222406', '2224', '和龙市', '3', 'H', '639');
INSERT INTO `region` VALUES ('222424000000', '222424', '2224', '汪清县', '3', 'W', '640');
INSERT INTO `region` VALUES ('222426000000', '222426', '2224', '安图县', '3', 'A', '641');
INSERT INTO `region` VALUES ('230000000000', '23', 'root', '黑龙江省', '1', 'H', '7');
INSERT INTO `region` VALUES ('230100000000', '2301', '23', '哈尔滨市', '2', 'H', '59');
INSERT INTO `region` VALUES ('230101000000', '230101', '2301', '市辖区', '3', 'S', '642');
INSERT INTO `region` VALUES ('230102000000', '230102', '2301', '道里区', '3', 'D', '643');
INSERT INTO `region` VALUES ('230103000000', '230103', '2301', '南岗区', '3', 'N', '644');
INSERT INTO `region` VALUES ('230104000000', '230104', '2301', '道外区', '3', 'D', '645');
INSERT INTO `region` VALUES ('230108000000', '230108', '2301', '平房区', '3', 'P', '646');
INSERT INTO `region` VALUES ('230109000000', '230109', '2301', '松北区', '3', 'S', '647');
INSERT INTO `region` VALUES ('230110000000', '230110', '2301', '香坊区', '3', 'X', '648');
INSERT INTO `region` VALUES ('230111000000', '230111', '2301', '呼兰区', '3', 'H', '649');
INSERT INTO `region` VALUES ('230112000000', '230112', '2301', '阿城区', '3', 'A', '650');
INSERT INTO `region` VALUES ('230123000000', '230123', '2301', '依兰县', '3', 'Y', '651');
INSERT INTO `region` VALUES ('230124000000', '230124', '2301', '方正县', '3', 'F', '652');
INSERT INTO `region` VALUES ('230125000000', '230125', '2301', '宾县', '3', 'B', '653');
INSERT INTO `region` VALUES ('230126000000', '230126', '2301', '巴彦县', '3', 'B', '654');
INSERT INTO `region` VALUES ('230127000000', '230127', '2301', '木兰县', '3', 'M', '655');
INSERT INTO `region` VALUES ('230128000000', '230128', '2301', '通河县', '3', 'T', '656');
INSERT INTO `region` VALUES ('230129000000', '230129', '2301', '延寿县', '3', 'Y', '657');
INSERT INTO `region` VALUES ('230182000000', '230182', '2301', '双城市', '3', 'S', '658');
INSERT INTO `region` VALUES ('230183000000', '230183', '2301', '尚志市', '3', 'S', '659');
INSERT INTO `region` VALUES ('230184000000', '230184', '2301', '五常市', '3', 'W', '660');
INSERT INTO `region` VALUES ('230200000000', '2302', '23', '齐齐哈尔市', '2', 'Q', '60');
INSERT INTO `region` VALUES ('230201000000', '230201', '2302', '市辖区', '3', 'S', '661');
INSERT INTO `region` VALUES ('230202000000', '230202', '2302', '龙沙区', '3', 'L', '662');
INSERT INTO `region` VALUES ('230203000000', '230203', '2302', '建华区', '3', 'J', '663');
INSERT INTO `region` VALUES ('230204000000', '230204', '2302', '铁锋区', '3', 'T', '664');
INSERT INTO `region` VALUES ('230205000000', '230205', '2302', '昂昂溪区', '3', 'A', '665');
INSERT INTO `region` VALUES ('230206000000', '230206', '2302', '富拉尔基区', '3', 'F', '666');
INSERT INTO `region` VALUES ('230207000000', '230207', '2302', '碾子山区', '3', 'N', '667');
INSERT INTO `region` VALUES ('230208000000', '230208', '2302', '梅里斯达斡尔族区', '3', 'M', '668');
INSERT INTO `region` VALUES ('230221000000', '230221', '2302', '龙江县', '3', 'L', '669');
INSERT INTO `region` VALUES ('230223000000', '230223', '2302', '依安县', '3', 'Y', '670');
INSERT INTO `region` VALUES ('230224000000', '230224', '2302', '泰来县', '3', 'T', '671');
INSERT INTO `region` VALUES ('230225000000', '230225', '2302', '甘南县', '3', 'G', '672');
INSERT INTO `region` VALUES ('230227000000', '230227', '2302', '富裕县', '3', 'F', '673');
INSERT INTO `region` VALUES ('230229000000', '230229', '2302', '克山县', '3', 'K', '674');
INSERT INTO `region` VALUES ('230230000000', '230230', '2302', '克东县', '3', 'K', '675');
INSERT INTO `region` VALUES ('230231000000', '230231', '2302', '拜泉县', '3', 'B', '676');
INSERT INTO `region` VALUES ('230281000000', '230281', '2302', '讷河市', '3', 'Z', '677');
INSERT INTO `region` VALUES ('230300000000', '2303', '23', '鸡西市', '2', 'J', '61');
INSERT INTO `region` VALUES ('230301000000', '230301', '2303', '市辖区', '3', 'S', '678');
INSERT INTO `region` VALUES ('230302000000', '230302', '2303', '鸡冠区', '3', 'J', '679');
INSERT INTO `region` VALUES ('230303000000', '230303', '2303', '恒山区', '3', 'H', '680');
INSERT INTO `region` VALUES ('230304000000', '230304', '2303', '滴道区', '3', 'D', '681');
INSERT INTO `region` VALUES ('230305000000', '230305', '2303', '梨树区', '3', 'L', '682');
INSERT INTO `region` VALUES ('230306000000', '230306', '2303', '城子河区', '3', 'C', '683');
INSERT INTO `region` VALUES ('230307000000', '230307', '2303', '麻山区', '3', 'M', '684');
INSERT INTO `region` VALUES ('230321000000', '230321', '2303', '鸡东县', '3', 'J', '685');
INSERT INTO `region` VALUES ('230381000000', '230381', '2303', '虎林市', '3', 'H', '686');
INSERT INTO `region` VALUES ('230382000000', '230382', '2303', '密山市', '3', 'M', '687');
INSERT INTO `region` VALUES ('230400000000', '2304', '23', '鹤岗市', '2', 'H', '62');
INSERT INTO `region` VALUES ('230401000000', '230401', '2304', '市辖区', '3', 'S', '688');
INSERT INTO `region` VALUES ('230402000000', '230402', '2304', '向阳区', '3', 'X', '689');
INSERT INTO `region` VALUES ('230403000000', '230403', '2304', '工农区', '3', 'G', '690');
INSERT INTO `region` VALUES ('230404000000', '230404', '2304', '南山区', '3', 'N', '691');
INSERT INTO `region` VALUES ('230405000000', '230405', '2304', '兴安区', '3', 'X', '692');
INSERT INTO `region` VALUES ('230406000000', '230406', '2304', '东山区', '3', 'D', '693');
INSERT INTO `region` VALUES ('230407000000', '230407', '2304', '兴山区', '3', 'X', '694');
INSERT INTO `region` VALUES ('230421000000', '230421', '2304', '萝北县', '3', 'L', '695');
INSERT INTO `region` VALUES ('230422000000', '230422', '2304', '绥滨县', '3', 'S', '696');
INSERT INTO `region` VALUES ('230500000000', '2305', '23', '双鸭山市', '2', 'S', '63');
INSERT INTO `region` VALUES ('230501000000', '230501', '2305', '市辖区', '3', 'S', '697');
INSERT INTO `region` VALUES ('230502000000', '230502', '2305', '尖山区', '3', 'J', '698');
INSERT INTO `region` VALUES ('230503000000', '230503', '2305', '岭东区', '3', 'L', '699');
INSERT INTO `region` VALUES ('230505000000', '230505', '2305', '四方台区', '3', 'S', '700');
INSERT INTO `region` VALUES ('230506000000', '230506', '2305', '宝山区', '3', 'B', '701');
INSERT INTO `region` VALUES ('230521000000', '230521', '2305', '集贤县', '3', 'J', '702');
INSERT INTO `region` VALUES ('230522000000', '230522', '2305', '友谊县', '3', 'Y', '703');
INSERT INTO `region` VALUES ('230523000000', '230523', '2305', '宝清县', '3', 'B', '704');
INSERT INTO `region` VALUES ('230524000000', '230524', '2305', '饶河县', '3', 'R', '705');
INSERT INTO `region` VALUES ('230600000000', '2306', '23', '大庆市', '2', 'D', '64');
INSERT INTO `region` VALUES ('230601000000', '230601', '2306', '市辖区', '3', 'S', '706');
INSERT INTO `region` VALUES ('230602000000', '230602', '2306', '萨尔图区', '3', 'S', '707');
INSERT INTO `region` VALUES ('230603000000', '230603', '2306', '龙凤区', '3', 'L', '708');
INSERT INTO `region` VALUES ('230604000000', '230604', '2306', '让胡路区', '3', 'R', '709');
INSERT INTO `region` VALUES ('230605000000', '230605', '2306', '红岗区', '3', 'H', '710');
INSERT INTO `region` VALUES ('230606000000', '230606', '2306', '大同区', '3', 'D', '711');
INSERT INTO `region` VALUES ('230621000000', '230621', '2306', '肇州县', '3', 'Z', '712');
INSERT INTO `region` VALUES ('230622000000', '230622', '2306', '肇源县', '3', 'Z', '713');
INSERT INTO `region` VALUES ('230623000000', '230623', '2306', '林甸县', '3', 'L', '714');
INSERT INTO `region` VALUES ('230624000000', '230624', '2306', '杜尔伯特蒙古族自治县', '3', 'D', '715');
INSERT INTO `region` VALUES ('230700000000', '2307', '23', '伊春市', '2', 'Y', '65');
INSERT INTO `region` VALUES ('230701000000', '230701', '2307', '市辖区', '3', 'S', '716');
INSERT INTO `region` VALUES ('230702000000', '230702', '2307', '伊春区', '3', 'Y', '717');
INSERT INTO `region` VALUES ('230703000000', '230703', '2307', '南岔区', '3', 'N', '718');
INSERT INTO `region` VALUES ('230704000000', '230704', '2307', '友好区', '3', 'Y', '719');
INSERT INTO `region` VALUES ('230705000000', '230705', '2307', '西林区', '3', 'X', '720');
INSERT INTO `region` VALUES ('230706000000', '230706', '2307', '翠峦区', '3', 'C', '721');
INSERT INTO `region` VALUES ('230707000000', '230707', '2307', '新青区', '3', 'X', '722');
INSERT INTO `region` VALUES ('230708000000', '230708', '2307', '美溪区', '3', 'M', '723');
INSERT INTO `region` VALUES ('230709000000', '230709', '2307', '金山屯区', '3', 'J', '724');
INSERT INTO `region` VALUES ('230710000000', '230710', '2307', '五营区', '3', 'W', '725');
INSERT INTO `region` VALUES ('230711000000', '230711', '2307', '乌马河区', '3', 'W', '726');
INSERT INTO `region` VALUES ('230712000000', '230712', '2307', '汤旺河区', '3', 'T', '727');
INSERT INTO `region` VALUES ('230713000000', '230713', '2307', '带岭区', '3', 'D', '728');
INSERT INTO `region` VALUES ('230714000000', '230714', '2307', '乌伊岭区', '3', 'W', '729');
INSERT INTO `region` VALUES ('230715000000', '230715', '2307', '红星区', '3', 'H', '730');
INSERT INTO `region` VALUES ('230716000000', '230716', '2307', '上甘岭区', '3', 'S', '731');
INSERT INTO `region` VALUES ('230722000000', '230722', '2307', '嘉荫县', '3', 'J', '732');
INSERT INTO `region` VALUES ('230781000000', '230781', '2307', '铁力市', '3', 'T', '733');
INSERT INTO `region` VALUES ('230800000000', '2308', '23', '佳木斯市', '2', 'J', '66');
INSERT INTO `region` VALUES ('230801000000', '230801', '2308', '市辖区', '3', 'S', '734');
INSERT INTO `region` VALUES ('230803000000', '230803', '2308', '向阳区', '3', 'X', '735');
INSERT INTO `region` VALUES ('230804000000', '230804', '2308', '前进区', '3', 'Q', '736');
INSERT INTO `region` VALUES ('230805000000', '230805', '2308', '东风区', '3', 'D', '737');
INSERT INTO `region` VALUES ('230811000000', '230811', '2308', '郊区', '3', 'J', '738');
INSERT INTO `region` VALUES ('230822000000', '230822', '2308', '桦南县', '3', 'Z', '739');
INSERT INTO `region` VALUES ('230826000000', '230826', '2308', '桦川县', '3', 'Z', '740');
INSERT INTO `region` VALUES ('230828000000', '230828', '2308', '汤原县', '3', 'T', '741');
INSERT INTO `region` VALUES ('230833000000', '230833', '2308', '抚远县', '3', 'F', '742');
INSERT INTO `region` VALUES ('230881000000', '230881', '2308', '同江市', '3', 'T', '743');
INSERT INTO `region` VALUES ('230882000000', '230882', '2308', '富锦市', '3', 'F', '744');
INSERT INTO `region` VALUES ('230900000000', '2309', '23', '七台河市', '2', 'Q', '67');
INSERT INTO `region` VALUES ('230901000000', '230901', '2309', '市辖区', '3', 'S', '745');
INSERT INTO `region` VALUES ('230902000000', '230902', '2309', '新兴区', '3', 'X', '746');
INSERT INTO `region` VALUES ('230903000000', '230903', '2309', '桃山区', '3', 'T', '747');
INSERT INTO `region` VALUES ('230904000000', '230904', '2309', '茄子河区', '3', 'Q', '748');
INSERT INTO `region` VALUES ('230921000000', '230921', '2309', '勃利县', '3', 'B', '749');
INSERT INTO `region` VALUES ('231000000000', '2310', '23', '牡丹江市', '2', 'M', '68');
INSERT INTO `region` VALUES ('231001000000', '231001', '2310', '市辖区', '3', 'S', '750');
INSERT INTO `region` VALUES ('231002000000', '231002', '2310', '东安区', '3', 'D', '751');
INSERT INTO `region` VALUES ('231003000000', '231003', '2310', '阳明区', '3', 'Y', '752');
INSERT INTO `region` VALUES ('231004000000', '231004', '2310', '爱民区', '3', 'A', '753');
INSERT INTO `region` VALUES ('231005000000', '231005', '2310', '西安区', '3', 'X', '754');
INSERT INTO `region` VALUES ('231024000000', '231024', '2310', '东宁县', '3', 'D', '755');
INSERT INTO `region` VALUES ('231025000000', '231025', '2310', '林口县', '3', 'L', '756');
INSERT INTO `region` VALUES ('231081000000', '231081', '2310', '绥芬河市', '3', 'S', '757');
INSERT INTO `region` VALUES ('231083000000', '231083', '2310', '海林市', '3', 'H', '758');
INSERT INTO `region` VALUES ('231084000000', '231084', '2310', '宁安市', '3', 'N', '759');
INSERT INTO `region` VALUES ('231085000000', '231085', '2310', '穆棱市', '3', 'M', '760');
INSERT INTO `region` VALUES ('231100000000', '2311', '23', '黑河市', '2', 'H', '69');
INSERT INTO `region` VALUES ('231101000000', '231101', '2311', '市辖区', '3', 'S', '761');
INSERT INTO `region` VALUES ('231102000000', '231102', '2311', '爱辉区', '3', 'A', '762');
INSERT INTO `region` VALUES ('231121000000', '231121', '2311', '嫩江县', '3', 'N', '763');
INSERT INTO `region` VALUES ('231123000000', '231123', '2311', '逊克县', '3', 'X', '764');
INSERT INTO `region` VALUES ('231124000000', '231124', '2311', '孙吴县', '3', 'S', '765');
INSERT INTO `region` VALUES ('231181000000', '231181', '2311', '北安市', '3', 'B', '766');
INSERT INTO `region` VALUES ('231182000000', '231182', '2311', '五大连池市', '3', 'W', '767');
INSERT INTO `region` VALUES ('231200000000', '2312', '23', '绥化市', '2', 'S', '70');
INSERT INTO `region` VALUES ('231201000000', '231201', '2312', '市辖区', '3', 'S', '768');
INSERT INTO `region` VALUES ('231202000000', '231202', '2312', '北林区', '3', 'B', '769');
INSERT INTO `region` VALUES ('231221000000', '231221', '2312', '望奎县', '3', 'W', '770');
INSERT INTO `region` VALUES ('231222000000', '231222', '2312', '兰西县', '3', 'L', '771');
INSERT INTO `region` VALUES ('231223000000', '231223', '2312', '青冈县', '3', 'Q', '772');
INSERT INTO `region` VALUES ('231224000000', '231224', '2312', '庆安县', '3', 'Q', '773');
INSERT INTO `region` VALUES ('231225000000', '231225', '2312', '明水县', '3', 'M', '774');
INSERT INTO `region` VALUES ('231226000000', '231226', '2312', '绥棱县', '3', 'S', '775');
INSERT INTO `region` VALUES ('231281000000', '231281', '2312', '安达市', '3', 'A', '776');
INSERT INTO `region` VALUES ('231282000000', '231282', '2312', '肇东市', '3', 'Z', '777');
INSERT INTO `region` VALUES ('231283000000', '231283', '2312', '海伦市', '3', 'H', '778');
INSERT INTO `region` VALUES ('232700000000', '2327', '23', '大兴安岭地区', '2', 'D', '71');
INSERT INTO `region` VALUES ('232701000000', '232701', '2327', '加格达奇区', '3', 'J', '779');
INSERT INTO `region` VALUES ('232702000000', '232702', '2327', '松岭区', '3', 'S', '780');
INSERT INTO `region` VALUES ('232703000000', '232703', '2327', '新林区', '3', 'X', '781');
INSERT INTO `region` VALUES ('232704000000', '232704', '2327', '呼中区', '3', 'H', '782');
INSERT INTO `region` VALUES ('232721000000', '232721', '2327', '呼玛县', '3', 'H', '783');
INSERT INTO `region` VALUES ('232722000000', '232722', '2327', '塔河县', '3', 'T', '784');
INSERT INTO `region` VALUES ('232723000000', '232723', '2327', '漠河县', '3', 'M', '785');
INSERT INTO `region` VALUES ('310000000000', '31', 'root', '上海市', '1', 'S', '8');
INSERT INTO `region` VALUES ('310100000000', '3101', '31', '上海市', '2', 'S', '72');
INSERT INTO `region` VALUES ('310101000000', '310101', '3101', '黄浦区', '3', 'H', '786');
INSERT INTO `region` VALUES ('310103000000', '310103', '3101', '卢湾区', '3', 'L', '787');
INSERT INTO `region` VALUES ('310104000000', '310104', '3101', '徐汇区', '3', 'X', '788');
INSERT INTO `region` VALUES ('310105000000', '310105', '3101', '长宁区', '3', 'C', '789');
INSERT INTO `region` VALUES ('310106000000', '310106', '3101', '静安区', '3', 'J', '790');
INSERT INTO `region` VALUES ('310107000000', '310107', '3101', '普陀区', '3', 'P', '791');
INSERT INTO `region` VALUES ('310108000000', '310108', '3101', '闸北区', '3', 'Z', '792');
INSERT INTO `region` VALUES ('310109000000', '310109', '3101', '虹口区', '3', 'H', '793');
INSERT INTO `region` VALUES ('310110000000', '310110', '3101', '杨浦区', '3', 'Y', '794');
INSERT INTO `region` VALUES ('310112000000', '310112', '3101', '闵行区', '3', 'Z', '795');
INSERT INTO `region` VALUES ('310113000000', '310113', '3101', '宝山区', '3', 'B', '796');
INSERT INTO `region` VALUES ('310114000000', '310114', '3101', '嘉定区', '3', 'J', '797');
INSERT INTO `region` VALUES ('310115000000', '310115', '3101', '浦东新区', '3', 'P', '798');
INSERT INTO `region` VALUES ('310116000000', '310116', '3101', '金山区', '3', 'J', '799');
INSERT INTO `region` VALUES ('310117000000', '310117', '3101', '松江区', '3', 'S', '800');
INSERT INTO `region` VALUES ('310118000000', '310118', '3101', '青浦区', '3', 'Q', '801');
INSERT INTO `region` VALUES ('310120000000', '310120', '3101', '奉贤区', '3', 'F', '802');
INSERT INTO `region` VALUES ('310230000000', '310230', '3102', '崇明县', '3', 'C', '803');
INSERT INTO `region` VALUES ('320000000000', '32', 'root', '江苏省', '1', 'J', '9');
INSERT INTO `region` VALUES ('320100000000', '3201', '32', '南京市', '2', 'N', '73');
INSERT INTO `region` VALUES ('320101000000', '320101', '3201', '市辖区', '3', 'S', '804');
INSERT INTO `region` VALUES ('320102000000', '320102', '3201', '玄武区', '3', 'X', '805');
INSERT INTO `region` VALUES ('320103000000', '320103', '3201', '白下区', '3', 'B', '806');
INSERT INTO `region` VALUES ('320104000000', '320104', '3201', '秦淮区', '3', 'Q', '807');
INSERT INTO `region` VALUES ('320105000000', '320105', '3201', '建邺区', '3', 'J', '808');
INSERT INTO `region` VALUES ('320106000000', '320106', '3201', '鼓楼区', '3', 'G', '809');
INSERT INTO `region` VALUES ('320107000000', '320107', '3201', '下关区', '3', 'X', '810');
INSERT INTO `region` VALUES ('320111000000', '320111', '3201', '浦口区', '3', 'P', '811');
INSERT INTO `region` VALUES ('320113000000', '320113', '3201', '栖霞区', '3', 'Q', '812');
INSERT INTO `region` VALUES ('320114000000', '320114', '3201', '雨花台区', '3', 'Y', '813');
INSERT INTO `region` VALUES ('320115000000', '320115', '3201', '江宁区', '3', 'J', '814');
INSERT INTO `region` VALUES ('320116000000', '320116', '3201', '六合区', '3', 'L', '815');
INSERT INTO `region` VALUES ('320124000000', '320124', '3201', '溧水县', '3', 'Z', '816');
INSERT INTO `region` VALUES ('320125000000', '320125', '3201', '高淳县', '3', 'G', '817');
INSERT INTO `region` VALUES ('320200000000', '3202', '32', '无锡市', '2', 'W', '74');
INSERT INTO `region` VALUES ('320201000000', '320201', '3202', '市辖区', '3', 'S', '818');
INSERT INTO `region` VALUES ('320202000000', '320202', '3202', '崇安区', '3', 'C', '819');
INSERT INTO `region` VALUES ('320203000000', '320203', '3202', '南长区', '3', 'N', '820');
INSERT INTO `region` VALUES ('320204000000', '320204', '3202', '北塘区', '3', 'B', '821');
INSERT INTO `region` VALUES ('320205000000', '320205', '3202', '锡山区', '3', 'X', '822');
INSERT INTO `region` VALUES ('320206000000', '320206', '3202', '惠山区', '3', 'H', '823');
INSERT INTO `region` VALUES ('320211000000', '320211', '3202', '滨湖区', '3', 'B', '824');
INSERT INTO `region` VALUES ('320281000000', '320281', '3202', '江阴市', '3', 'J', '825');
INSERT INTO `region` VALUES ('320282000000', '320282', '3202', '宜兴市', '3', 'Y', '826');
INSERT INTO `region` VALUES ('320300000000', '3203', '32', '徐州市', '2', 'X', '75');
INSERT INTO `region` VALUES ('320301000000', '320301', '3203', '市辖区', '3', 'S', '827');
INSERT INTO `region` VALUES ('320302000000', '320302', '3203', '鼓楼区', '3', 'G', '828');
INSERT INTO `region` VALUES ('320303000000', '320303', '3203', '云龙区', '3', 'Y', '829');
INSERT INTO `region` VALUES ('320304000000', '320304', '3203', '九里区', '3', 'J', '830');
INSERT INTO `region` VALUES ('320305000000', '320305', '3203', '贾汪区', '3', 'J', '831');
INSERT INTO `region` VALUES ('320311000000', '320311', '3203', '泉山区', '3', 'Q', '832');
INSERT INTO `region` VALUES ('320321000000', '320321', '3203', '丰县', '3', 'F', '833');
INSERT INTO `region` VALUES ('320322000000', '320322', '3203', '沛县', '3', 'P', '834');
INSERT INTO `region` VALUES ('320323000000', '320323', '3203', '铜山县', '3', 'T', '835');
INSERT INTO `region` VALUES ('320324000000', '320324', '3203', '睢宁县', '3', 'Z', '836');
INSERT INTO `region` VALUES ('320381000000', '320381', '3203', '新沂市', '3', 'X', '837');
INSERT INTO `region` VALUES ('320382000000', '320382', '3203', '邳州市', '3', 'Z', '838');
INSERT INTO `region` VALUES ('320400000000', '3204', '32', '常州市', '2', 'C', '76');
INSERT INTO `region` VALUES ('320401000000', '320401', '3204', '市辖区', '3', 'S', '839');
INSERT INTO `region` VALUES ('320402000000', '320402', '3204', '天宁区', '3', 'T', '840');
INSERT INTO `region` VALUES ('320404000000', '320404', '3204', '钟楼区', '3', 'Z', '841');
INSERT INTO `region` VALUES ('320405000000', '320405', '3204', '戚墅堰区', '3', 'Q', '842');
INSERT INTO `region` VALUES ('320411000000', '320411', '3204', '新北区', '3', 'X', '843');
INSERT INTO `region` VALUES ('320412000000', '320412', '3204', '武进区', '3', 'W', '844');
INSERT INTO `region` VALUES ('320481000000', '320481', '3204', '溧阳市', '3', 'Z', '845');
INSERT INTO `region` VALUES ('320482000000', '320482', '3204', '金坛市', '3', 'J', '846');
INSERT INTO `region` VALUES ('320500000000', '3205', '32', '苏州市', '2', 'S', '77');
INSERT INTO `region` VALUES ('320501000000', '320501', '3205', '市辖区', '3', 'S', '847');
INSERT INTO `region` VALUES ('320502000000', '320502', '3205', '沧浪区', '3', 'C', '848');
INSERT INTO `region` VALUES ('320503000000', '320503', '3205', '平江区', '3', 'P', '849');
INSERT INTO `region` VALUES ('320504000000', '320504', '3205', '金阊区', '3', 'J', '850');
INSERT INTO `region` VALUES ('320505000000', '320505', '3205', '虎丘区', '3', 'H', '851');
INSERT INTO `region` VALUES ('320506000000', '320506', '3205', '吴中区', '3', 'W', '852');
INSERT INTO `region` VALUES ('320507000000', '320507', '3205', '相城区', '3', 'X', '853');
INSERT INTO `region` VALUES ('320581000000', '320581', '3205', '常熟市', '3', 'C', '854');
INSERT INTO `region` VALUES ('320582000000', '320582', '3205', '张家港市', '3', 'Z', '855');
INSERT INTO `region` VALUES ('320583000000', '320583', '3205', '昆山市', '3', 'K', '856');
INSERT INTO `region` VALUES ('320584000000', '320584', '3205', '吴江市', '3', 'W', '857');
INSERT INTO `region` VALUES ('320585000000', '320585', '3205', '太仓市', '3', 'T', '858');
INSERT INTO `region` VALUES ('320600000000', '3206', '32', '南通市', '2', 'N', '78');
INSERT INTO `region` VALUES ('320601000000', '320601', '3206', '市辖区', '3', 'S', '859');
INSERT INTO `region` VALUES ('320602000000', '320602', '3206', '崇川区', '3', 'C', '860');
INSERT INTO `region` VALUES ('320611000000', '320611', '3206', '港闸区', '3', 'G', '861');
INSERT INTO `region` VALUES ('320612000000', '320612', '3206', '通州区', '3', 'T', '862');
INSERT INTO `region` VALUES ('320621000000', '320621', '3206', '海安县', '3', 'H', '863');
INSERT INTO `region` VALUES ('320623000000', '320623', '3206', '如东县', '3', 'R', '864');
INSERT INTO `region` VALUES ('320681000000', '320681', '3206', '启东市', '3', 'Q', '865');
INSERT INTO `region` VALUES ('320682000000', '320682', '3206', '如皋市', '3', 'R', '866');
INSERT INTO `region` VALUES ('320684000000', '320684', '3206', '海门市', '3', 'H', '867');
INSERT INTO `region` VALUES ('320700000000', '3207', '32', '连云港市', '2', 'L', '79');
INSERT INTO `region` VALUES ('320701000000', '320701', '3207', '市辖区', '3', 'S', '868');
INSERT INTO `region` VALUES ('320703000000', '320703', '3207', '连云区', '3', 'L', '869');
INSERT INTO `region` VALUES ('320705000000', '320705', '3207', '新浦区', '3', 'X', '870');
INSERT INTO `region` VALUES ('320706000000', '320706', '3207', '海州区', '3', 'H', '871');
INSERT INTO `region` VALUES ('320721000000', '320721', '3207', '赣榆县', '3', 'G', '872');
INSERT INTO `region` VALUES ('320722000000', '320722', '3207', '东海县', '3', 'D', '873');
INSERT INTO `region` VALUES ('320723000000', '320723', '3207', '灌云县', '3', 'G', '874');
INSERT INTO `region` VALUES ('320724000000', '320724', '3207', '灌南县', '3', 'G', '875');
INSERT INTO `region` VALUES ('320800000000', '3208', '32', '淮安市', '2', 'H', '80');
INSERT INTO `region` VALUES ('320801000000', '320801', '3208', '市辖区', '3', 'S', '876');
INSERT INTO `region` VALUES ('320802000000', '320802', '3208', '清河区', '3', 'Q', '877');
INSERT INTO `region` VALUES ('320803000000', '320803', '3208', '楚州区', '3', 'C', '878');
INSERT INTO `region` VALUES ('320804000000', '320804', '3208', '淮阴区', '3', 'H', '879');
INSERT INTO `region` VALUES ('320811000000', '320811', '3208', '清浦区', '3', 'Q', '880');
INSERT INTO `region` VALUES ('320826000000', '320826', '3208', '涟水县', '3', 'L', '881');
INSERT INTO `region` VALUES ('320829000000', '320829', '3208', '洪泽县', '3', 'H', '882');
INSERT INTO `region` VALUES ('320830000000', '320830', '3208', '盱眙县', '3', 'Z', '883');
INSERT INTO `region` VALUES ('320831000000', '320831', '3208', '金湖县', '3', 'J', '884');
INSERT INTO `region` VALUES ('320900000000', '3209', '32', '盐城市', '2', 'Y', '81');
INSERT INTO `region` VALUES ('320901000000', '320901', '3209', '市辖区', '3', 'S', '885');
INSERT INTO `region` VALUES ('320902000000', '320902', '3209', '亭湖区', '3', 'T', '886');
INSERT INTO `region` VALUES ('320903000000', '320903', '3209', '盐都区', '3', 'Y', '887');
INSERT INTO `region` VALUES ('320921000000', '320921', '3209', '响水县', '3', 'X', '888');
INSERT INTO `region` VALUES ('320922000000', '320922', '3209', '滨海县', '3', 'B', '889');
INSERT INTO `region` VALUES ('320923000000', '320923', '3209', '阜宁县', '3', 'F', '890');
INSERT INTO `region` VALUES ('320924000000', '320924', '3209', '射阳县', '3', 'S', '891');
INSERT INTO `region` VALUES ('320925000000', '320925', '3209', '建湖县', '3', 'J', '892');
INSERT INTO `region` VALUES ('320981000000', '320981', '3209', '东台市', '3', 'D', '893');
INSERT INTO `region` VALUES ('320982000000', '320982', '3209', '大丰市', '3', 'D', '894');
INSERT INTO `region` VALUES ('321000000000', '3210', '32', '扬州市', '2', 'Y', '82');
INSERT INTO `region` VALUES ('321001000000', '321001', '3210', '市辖区', '3', 'S', '895');
INSERT INTO `region` VALUES ('321002000000', '321002', '3210', '广陵区', '3', 'G', '896');
INSERT INTO `region` VALUES ('321003000000', '321003', '3210', '邗江区', '3', 'Z', '897');
INSERT INTO `region` VALUES ('321011000000', '321011', '3210', '维扬区', '3', 'W', '898');
INSERT INTO `region` VALUES ('321023000000', '321023', '3210', '宝应县', '3', 'B', '899');
INSERT INTO `region` VALUES ('321081000000', '321081', '3210', '仪征市', '3', 'Y', '900');
INSERT INTO `region` VALUES ('321084000000', '321084', '3210', '高邮市', '3', 'G', '901');
INSERT INTO `region` VALUES ('321088000000', '321088', '3210', '江都市', '3', 'J', '902');
INSERT INTO `region` VALUES ('321100000000', '3211', '32', '镇江市', '2', 'Z', '83');
INSERT INTO `region` VALUES ('321101000000', '321101', '3211', '市辖区', '3', 'S', '903');
INSERT INTO `region` VALUES ('321102000000', '321102', '3211', '京口区', '3', 'J', '904');
INSERT INTO `region` VALUES ('321111000000', '321111', '3211', '润州区', '3', 'R', '905');
INSERT INTO `region` VALUES ('321112000000', '321112', '3211', '丹徒区', '3', 'D', '906');
INSERT INTO `region` VALUES ('321181000000', '321181', '3211', '丹阳市', '3', 'D', '907');
INSERT INTO `region` VALUES ('321182000000', '321182', '3211', '扬中市', '3', 'Y', '908');
INSERT INTO `region` VALUES ('321183000000', '321183', '3211', '句容市', '3', 'J', '909');
INSERT INTO `region` VALUES ('321200000000', '3212', '32', '泰州市', '2', 'T', '84');
INSERT INTO `region` VALUES ('321201000000', '321201', '3212', '市辖区', '3', 'S', '910');
INSERT INTO `region` VALUES ('321202000000', '321202', '3212', '海陵区', '3', 'H', '911');
INSERT INTO `region` VALUES ('321203000000', '321203', '3212', '高港区', '3', 'G', '912');
INSERT INTO `region` VALUES ('321281000000', '321281', '3212', '兴化市', '3', 'X', '913');
INSERT INTO `region` VALUES ('321282000000', '321282', '3212', '靖江市', '3', 'J', '914');
INSERT INTO `region` VALUES ('321283000000', '321283', '3212', '泰兴市', '3', 'T', '915');
INSERT INTO `region` VALUES ('321284000000', '321284', '3212', '姜堰市', '3', 'J', '916');
INSERT INTO `region` VALUES ('321300000000', '3213', '32', '宿迁市', '2', 'S', '85');
INSERT INTO `region` VALUES ('321301000000', '321301', '3213', '市辖区', '3', 'S', '917');
INSERT INTO `region` VALUES ('321302000000', '321302', '3213', '宿城区', '3', 'S', '918');
INSERT INTO `region` VALUES ('321311000000', '321311', '3213', '宿豫区', '3', 'S', '919');
INSERT INTO `region` VALUES ('321322000000', '321322', '3213', '沭阳县', '3', 'Z', '920');
INSERT INTO `region` VALUES ('321323000000', '321323', '3213', '泗阳县', '3', 'Z', '921');
INSERT INTO `region` VALUES ('321324000000', '321324', '3213', '泗洪县', '3', 'Z', '922');
INSERT INTO `region` VALUES ('330000000000', '33', 'root', '浙江省', '1', 'Z', '10');
INSERT INTO `region` VALUES ('330100000000', '3301', '33', '杭州市', '2', 'H', '86');
INSERT INTO `region` VALUES ('330101000000', '330101', '3301', '市辖区', '3', 'S', '923');
INSERT INTO `region` VALUES ('330102000000', '330102', '3301', '上城区', '3', 'S', '924');
INSERT INTO `region` VALUES ('330103000000', '330103', '3301', '下城区', '3', 'X', '925');
INSERT INTO `region` VALUES ('330104000000', '330104', '3301', '江干区', '3', 'J', '926');
INSERT INTO `region` VALUES ('330105000000', '330105', '3301', '拱墅区', '3', 'G', '927');
INSERT INTO `region` VALUES ('330106000000', '330106', '3301', '西湖区', '3', 'X', '928');
INSERT INTO `region` VALUES ('330108000000', '330108', '3301', '滨江区', '3', 'B', '929');
INSERT INTO `region` VALUES ('330109000000', '330109', '3301', '萧山区', '3', 'X', '930');
INSERT INTO `region` VALUES ('330110000000', '330110', '3301', '余杭区', '3', 'Y', '931');
INSERT INTO `region` VALUES ('330122000000', '330122', '3301', '桐庐县', '3', 'T', '932');
INSERT INTO `region` VALUES ('330127000000', '330127', '3301', '淳安县', '3', 'C', '933');
INSERT INTO `region` VALUES ('330182000000', '330182', '3301', '建德市', '3', 'J', '934');
INSERT INTO `region` VALUES ('330183000000', '330183', '3301', '富阳市', '3', 'F', '935');
INSERT INTO `region` VALUES ('330185000000', '330185', '3301', '临安市', '3', 'L', '936');
INSERT INTO `region` VALUES ('330200000000', '3302', '33', '宁波市', '2', 'N', '87');
INSERT INTO `region` VALUES ('330201000000', '330201', '3302', '市辖区', '3', 'S', '937');
INSERT INTO `region` VALUES ('330203000000', '330203', '3302', '海曙区', '3', 'H', '938');
INSERT INTO `region` VALUES ('330204000000', '330204', '3302', '江东区', '3', 'J', '939');
INSERT INTO `region` VALUES ('330205000000', '330205', '3302', '江北区', '3', 'J', '940');
INSERT INTO `region` VALUES ('330206000000', '330206', '3302', '北仑区', '3', 'B', '941');
INSERT INTO `region` VALUES ('330211000000', '330211', '3302', '镇海区', '3', 'Z', '942');
INSERT INTO `region` VALUES ('330212000000', '330212', '3302', '鄞州区', '3', 'Z', '943');
INSERT INTO `region` VALUES ('330225000000', '330225', '3302', '象山县', '3', 'X', '944');
INSERT INTO `region` VALUES ('330226000000', '330226', '3302', '宁海县', '3', 'N', '945');
INSERT INTO `region` VALUES ('330281000000', '330281', '3302', '余姚市', '3', 'Y', '946');
INSERT INTO `region` VALUES ('330282000000', '330282', '3302', '慈溪市', '3', 'C', '947');
INSERT INTO `region` VALUES ('330283000000', '330283', '3302', '奉化市', '3', 'F', '948');
INSERT INTO `region` VALUES ('330300000000', '3303', '33', '温州市', '2', 'W', '88');
INSERT INTO `region` VALUES ('330301000000', '330301', '3303', '市辖区', '3', 'S', '949');
INSERT INTO `region` VALUES ('330302000000', '330302', '3303', '鹿城区', '3', 'L', '950');
INSERT INTO `region` VALUES ('330303000000', '330303', '3303', '龙湾区', '3', 'L', '951');
INSERT INTO `region` VALUES ('330304000000', '330304', '3303', '瓯海区', '3', 'Z', '952');
INSERT INTO `region` VALUES ('330322000000', '330322', '3303', '洞头县', '3', 'D', '953');
INSERT INTO `region` VALUES ('330324000000', '330324', '3303', '永嘉县', '3', 'Y', '954');
INSERT INTO `region` VALUES ('330326000000', '330326', '3303', '平阳县', '3', 'P', '955');
INSERT INTO `region` VALUES ('330327000000', '330327', '3303', '苍南县', '3', 'C', '956');
INSERT INTO `region` VALUES ('330328000000', '330328', '3303', '文成县', '3', 'W', '957');
INSERT INTO `region` VALUES ('330329000000', '330329', '3303', '泰顺县', '3', 'T', '958');
INSERT INTO `region` VALUES ('330381000000', '330381', '3303', '瑞安市', '3', 'R', '959');
INSERT INTO `region` VALUES ('330382000000', '330382', '3303', '乐清市', '3', 'L', '960');
INSERT INTO `region` VALUES ('330400000000', '3304', '33', '嘉兴市', '2', 'J', '89');
INSERT INTO `region` VALUES ('330401000000', '330401', '3304', '市辖区', '3', 'S', '961');
INSERT INTO `region` VALUES ('330402000000', '330402', '3304', '南湖区', '3', 'N', '962');
INSERT INTO `region` VALUES ('330411000000', '330411', '3304', '秀洲区', '3', 'X', '963');
INSERT INTO `region` VALUES ('330421000000', '330421', '3304', '嘉善县', '3', 'J', '964');
INSERT INTO `region` VALUES ('330424000000', '330424', '3304', '海盐县', '3', 'H', '965');
INSERT INTO `region` VALUES ('330481000000', '330481', '3304', '海宁市', '3', 'H', '966');
INSERT INTO `region` VALUES ('330482000000', '330482', '3304', '平湖市', '3', 'P', '967');
INSERT INTO `region` VALUES ('330483000000', '330483', '3304', '桐乡市', '3', 'T', '968');
INSERT INTO `region` VALUES ('330500000000', '3305', '33', '湖州市', '2', 'H', '90');
INSERT INTO `region` VALUES ('330501000000', '330501', '3305', '市辖区', '3', 'S', '969');
INSERT INTO `region` VALUES ('330502000000', '330502', '3305', '吴兴区', '3', 'W', '970');
INSERT INTO `region` VALUES ('330503000000', '330503', '3305', '南浔区', '3', 'N', '971');
INSERT INTO `region` VALUES ('330521000000', '330521', '3305', '德清县', '3', 'D', '972');
INSERT INTO `region` VALUES ('330522000000', '330522', '3305', '长兴县', '3', 'C', '973');
INSERT INTO `region` VALUES ('330523000000', '330523', '3305', '安吉县', '3', 'A', '974');
INSERT INTO `region` VALUES ('330600000000', '3306', '33', '绍兴市', '2', 'S', '91');
INSERT INTO `region` VALUES ('330601000000', '330601', '3306', '市辖区', '3', 'S', '975');
INSERT INTO `region` VALUES ('330602000000', '330602', '3306', '越城区', '3', 'Y', '976');
INSERT INTO `region` VALUES ('330621000000', '330621', '3306', '绍兴县', '3', 'S', '977');
INSERT INTO `region` VALUES ('330624000000', '330624', '3306', '新昌县', '3', 'X', '978');
INSERT INTO `region` VALUES ('330681000000', '330681', '3306', '诸暨市', '3', 'Z', '979');
INSERT INTO `region` VALUES ('330682000000', '330682', '3306', '上虞市', '3', 'S', '980');
INSERT INTO `region` VALUES ('330683000000', '330683', '3306', '嵊州市', '3', 'Z', '981');
INSERT INTO `region` VALUES ('330700000000', '3307', '33', '金华市', '2', 'J', '92');
INSERT INTO `region` VALUES ('330701000000', '330701', '3307', '市辖区', '3', 'S', '982');
INSERT INTO `region` VALUES ('330702000000', '330702', '3307', '婺城区', '3', 'Z', '983');
INSERT INTO `region` VALUES ('330703000000', '330703', '3307', '金东区', '3', 'J', '984');
INSERT INTO `region` VALUES ('330723000000', '330723', '3307', '武义县', '3', 'W', '985');
INSERT INTO `region` VALUES ('330726000000', '330726', '3307', '浦江县', '3', 'P', '986');
INSERT INTO `region` VALUES ('330727000000', '330727', '3307', '磐安县', '3', 'P', '987');
INSERT INTO `region` VALUES ('330781000000', '330781', '3307', '兰溪市', '3', 'L', '988');
INSERT INTO `region` VALUES ('330782000000', '330782', '3307', '义乌市', '3', 'Y', '989');
INSERT INTO `region` VALUES ('330783000000', '330783', '3307', '东阳市', '3', 'D', '990');
INSERT INTO `region` VALUES ('330784000000', '330784', '3307', '永康市', '3', 'Y', '991');
INSERT INTO `region` VALUES ('330800000000', '3308', '33', '衢州市', '2', 'Z', '93');
INSERT INTO `region` VALUES ('330801000000', '330801', '3308', '市辖区', '3', 'S', '992');
INSERT INTO `region` VALUES ('330802000000', '330802', '3308', '柯城区', '3', 'K', '993');
INSERT INTO `region` VALUES ('330803000000', '330803', '3308', '衢江区', '3', 'Z', '994');
INSERT INTO `region` VALUES ('330822000000', '330822', '3308', '常山县', '3', 'C', '995');
INSERT INTO `region` VALUES ('330824000000', '330824', '3308', '开化县', '3', 'K', '996');
INSERT INTO `region` VALUES ('330825000000', '330825', '3308', '龙游县', '3', 'L', '997');
INSERT INTO `region` VALUES ('330881000000', '330881', '3308', '江山市', '3', 'J', '998');
INSERT INTO `region` VALUES ('330900000000', '3309', '33', '舟山市', '2', 'Z', '94');
INSERT INTO `region` VALUES ('330901000000', '330901', '3309', '市辖区', '3', 'S', '999');
INSERT INTO `region` VALUES ('330902000000', '330902', '3309', '定海区', '3', 'D', '1000');
INSERT INTO `region` VALUES ('330903000000', '330903', '3309', '普陀区', '3', 'P', '1001');
INSERT INTO `region` VALUES ('330921000000', '330921', '3309', '岱山县', '3', 'Z', '1002');
INSERT INTO `region` VALUES ('330922000000', '330922', '3309', '嵊泗县', '3', 'Z', '1003');
INSERT INTO `region` VALUES ('331000000000', '3310', '33', '台州市', '2', 'T', '95');
INSERT INTO `region` VALUES ('331001000000', '331001', '3310', '市辖区', '3', 'S', '1004');
INSERT INTO `region` VALUES ('331002000000', '331002', '3310', '椒江区', '3', 'J', '1005');
INSERT INTO `region` VALUES ('331003000000', '331003', '3310', '黄岩区', '3', 'H', '1006');
INSERT INTO `region` VALUES ('331004000000', '331004', '3310', '路桥区', '3', 'L', '1007');
INSERT INTO `region` VALUES ('331021000000', '331021', '3310', '玉环县', '3', 'Y', '1008');
INSERT INTO `region` VALUES ('331022000000', '331022', '3310', '三门县', '3', 'S', '1009');
INSERT INTO `region` VALUES ('331023000000', '331023', '3310', '天台县', '3', 'T', '1010');
INSERT INTO `region` VALUES ('331024000000', '331024', '3310', '仙居县', '3', 'X', '1011');
INSERT INTO `region` VALUES ('331081000000', '331081', '3310', '温岭市', '3', 'W', '1012');
INSERT INTO `region` VALUES ('331082000000', '331082', '3310', '临海市', '3', 'L', '1013');
INSERT INTO `region` VALUES ('331100000000', '3311', '33', '丽水市', '2', 'L', '96');
INSERT INTO `region` VALUES ('331101000000', '331101', '3311', '市辖区', '3', 'S', '1014');
INSERT INTO `region` VALUES ('331102000000', '331102', '3311', '莲都区', '3', 'L', '1015');
INSERT INTO `region` VALUES ('331121000000', '331121', '3311', '青田县', '3', 'Q', '1016');
INSERT INTO `region` VALUES ('331122000000', '331122', '3311', '缙云县', '3', 'Z', '1017');
INSERT INTO `region` VALUES ('331123000000', '331123', '3311', '遂昌县', '3', 'S', '1018');
INSERT INTO `region` VALUES ('331124000000', '331124', '3311', '松阳县', '3', 'S', '1019');
INSERT INTO `region` VALUES ('331125000000', '331125', '3311', '云和县', '3', 'Y', '1020');
INSERT INTO `region` VALUES ('331126000000', '331126', '3311', '庆元县', '3', 'Q', '1021');
INSERT INTO `region` VALUES ('331127000000', '331127', '3311', '景宁畲族自治县', '3', 'J', '1022');
INSERT INTO `region` VALUES ('331181000000', '331181', '3311', '龙泉市', '3', 'L', '1023');
INSERT INTO `region` VALUES ('340000000000', '34', 'root', '安徽省', '1', 'A', '11');
INSERT INTO `region` VALUES ('340100000000', '3401', '34', '合肥市', '2', 'H', '97');
INSERT INTO `region` VALUES ('340101000000', '340101', '3401', '市辖区', '3', 'S', '1024');
INSERT INTO `region` VALUES ('340102000000', '340102', '3401', '瑶海区', '3', 'Y', '1025');
INSERT INTO `region` VALUES ('340103000000', '340103', '3401', '庐阳区', '3', 'L', '1026');
INSERT INTO `region` VALUES ('340104000000', '340104', '3401', '蜀山区', '3', 'S', '1027');
INSERT INTO `region` VALUES ('340111000000', '340111', '3401', '包河区', '3', 'B', '1028');
INSERT INTO `region` VALUES ('340121000000', '340121', '3401', '长丰县', '3', 'C', '1029');
INSERT INTO `region` VALUES ('340122000000', '340122', '3401', '肥东县', '3', 'F', '1030');
INSERT INTO `region` VALUES ('340123000000', '340123', '3401', '肥西县', '3', 'F', '1031');
INSERT INTO `region` VALUES ('340200000000', '3402', '34', '芜湖市', '2', 'W', '98');
INSERT INTO `region` VALUES ('340201000000', '340201', '3402', '市辖区', '3', 'S', '1032');
INSERT INTO `region` VALUES ('340202000000', '340202', '3402', '镜湖区', '3', 'J', '1033');
INSERT INTO `region` VALUES ('340203000000', '340203', '3402', '弋江区', '3', 'Z', '1034');
INSERT INTO `region` VALUES ('340207000000', '340207', '3402', '鸠江区', '3', 'Z', '1035');
INSERT INTO `region` VALUES ('340208000000', '340208', '3402', '三山区', '3', 'S', '1036');
INSERT INTO `region` VALUES ('340221000000', '340221', '3402', '芜湖县', '3', 'W', '1037');
INSERT INTO `region` VALUES ('340222000000', '340222', '3402', '繁昌县', '3', 'F', '1038');
INSERT INTO `region` VALUES ('340223000000', '340223', '3402', '南陵县', '3', 'N', '1039');
INSERT INTO `region` VALUES ('340300000000', '3403', '34', '蚌埠市', '2', 'B', '99');
INSERT INTO `region` VALUES ('340301000000', '340301', '3403', '市辖区', '3', 'S', '1040');
INSERT INTO `region` VALUES ('340302000000', '340302', '3403', '龙子湖区', '3', 'L', '1041');
INSERT INTO `region` VALUES ('340303000000', '340303', '3403', '蚌山区', '3', 'B', '1042');
INSERT INTO `region` VALUES ('340304000000', '340304', '3403', '禹会区', '3', 'Y', '1043');
INSERT INTO `region` VALUES ('340311000000', '340311', '3403', '淮上区', '3', 'H', '1044');
INSERT INTO `region` VALUES ('340321000000', '340321', '3403', '怀远县', '3', 'H', '1045');
INSERT INTO `region` VALUES ('340322000000', '340322', '3403', '五河县', '3', 'W', '1046');
INSERT INTO `region` VALUES ('340323000000', '340323', '3403', '固镇县', '3', 'G', '1047');
INSERT INTO `region` VALUES ('340400000000', '3404', '34', '淮南市', '2', 'H', '100');
INSERT INTO `region` VALUES ('340401000000', '340401', '3404', '市辖区', '3', 'S', '1048');
INSERT INTO `region` VALUES ('340402000000', '340402', '3404', '大通区', '3', 'D', '1049');
INSERT INTO `region` VALUES ('340403000000', '340403', '3404', '田家庵区', '3', 'T', '1050');
INSERT INTO `region` VALUES ('340404000000', '340404', '3404', '谢家集区', '3', 'X', '1051');
INSERT INTO `region` VALUES ('340405000000', '340405', '3404', '八公山区', '3', 'B', '1052');
INSERT INTO `region` VALUES ('340406000000', '340406', '3404', '潘集区', '3', 'P', '1053');
INSERT INTO `region` VALUES ('340421000000', '340421', '3404', '凤台县', '3', 'F', '1054');
INSERT INTO `region` VALUES ('340500000000', '3405', '34', '马鞍山市', '2', 'M', '101');
INSERT INTO `region` VALUES ('340501000000', '340501', '3405', '市辖区', '3', 'S', '1055');
INSERT INTO `region` VALUES ('340502000000', '340502', '3405', '金家庄区', '3', 'J', '1056');
INSERT INTO `region` VALUES ('340503000000', '340503', '3405', '花山区', '3', 'H', '1057');
INSERT INTO `region` VALUES ('340504000000', '340504', '3405', '雨山区', '3', 'Y', '1058');
INSERT INTO `region` VALUES ('340521000000', '340521', '3405', '当涂县', '3', 'D', '1059');
INSERT INTO `region` VALUES ('340600000000', '3406', '34', '淮北市', '2', 'H', '102');
INSERT INTO `region` VALUES ('340601000000', '340601', '3406', '市辖区', '3', 'S', '1060');
INSERT INTO `region` VALUES ('340602000000', '340602', '3406', '杜集区', '3', 'D', '1061');
INSERT INTO `region` VALUES ('340603000000', '340603', '3406', '相山区', '3', 'X', '1062');
INSERT INTO `region` VALUES ('340604000000', '340604', '3406', '烈山区', '3', 'L', '1063');
INSERT INTO `region` VALUES ('340621000000', '340621', '3406', '濉溪县', '3', 'Z', '1064');
INSERT INTO `region` VALUES ('340700000000', '3407', '34', '铜陵市', '2', 'T', '103');
INSERT INTO `region` VALUES ('340701000000', '340701', '3407', '市辖区', '3', 'S', '1065');
INSERT INTO `region` VALUES ('340702000000', '340702', '3407', '铜官山区', '3', 'T', '1066');
INSERT INTO `region` VALUES ('340703000000', '340703', '3407', '狮子山区', '3', 'S', '1067');
INSERT INTO `region` VALUES ('340711000000', '340711', '3407', '郊区', '3', 'J', '1068');
INSERT INTO `region` VALUES ('340721000000', '340721', '3407', '铜陵县', '3', 'T', '1069');
INSERT INTO `region` VALUES ('340800000000', '3408', '34', '安庆市', '2', 'A', '104');
INSERT INTO `region` VALUES ('340801000000', '340801', '3408', '市辖区', '3', 'S', '1070');
INSERT INTO `region` VALUES ('340802000000', '340802', '3408', '迎江区', '3', 'Y', '1071');
INSERT INTO `region` VALUES ('340803000000', '340803', '3408', '大观区', '3', 'D', '1072');
INSERT INTO `region` VALUES ('340811000000', '340811', '3408', '宜秀区', '3', 'Y', '1073');
INSERT INTO `region` VALUES ('340822000000', '340822', '3408', '怀宁县', '3', 'H', '1074');
INSERT INTO `region` VALUES ('340823000000', '340823', '3408', '枞阳县', '3', 'Z', '1075');
INSERT INTO `region` VALUES ('340824000000', '340824', '3408', '潜山县', '3', 'Q', '1076');
INSERT INTO `region` VALUES ('340825000000', '340825', '3408', '太湖县', '3', 'T', '1077');
INSERT INTO `region` VALUES ('340826000000', '340826', '3408', '宿松县', '3', 'S', '1078');
INSERT INTO `region` VALUES ('340827000000', '340827', '3408', '望江县', '3', 'W', '1079');
INSERT INTO `region` VALUES ('340828000000', '340828', '3408', '岳西县', '3', 'Y', '1080');
INSERT INTO `region` VALUES ('340881000000', '340881', '3408', '桐城市', '3', 'T', '1081');
INSERT INTO `region` VALUES ('341000000000', '3410', '34', '黄山市', '2', 'H', '105');
INSERT INTO `region` VALUES ('341001000000', '341001', '3410', '市辖区', '3', 'S', '1082');
INSERT INTO `region` VALUES ('341002000000', '341002', '3410', '屯溪区', '3', 'T', '1083');
INSERT INTO `region` VALUES ('341003000000', '341003', '3410', '黄山区', '3', 'H', '1084');
INSERT INTO `region` VALUES ('341004000000', '341004', '3410', '徽州区', '3', 'H', '1085');
INSERT INTO `region` VALUES ('341021000000', '341021', '3410', '歙县', '3', 'Z', '1086');
INSERT INTO `region` VALUES ('341022000000', '341022', '3410', '休宁县', '3', 'X', '1087');
INSERT INTO `region` VALUES ('341023000000', '341023', '3410', '黟县', '3', 'Z', '1088');
INSERT INTO `region` VALUES ('341024000000', '341024', '3410', '祁门县', '3', 'Q', '1089');
INSERT INTO `region` VALUES ('341100000000', '3411', '34', '滁州市', '2', 'C', '106');
INSERT INTO `region` VALUES ('341101000000', '341101', '3411', '市辖区', '3', 'S', '1090');
INSERT INTO `region` VALUES ('341102000000', '341102', '3411', '琅琊区', '3', 'L', '1091');
INSERT INTO `region` VALUES ('341103000000', '341103', '3411', '南谯区', '3', 'N', '1092');
INSERT INTO `region` VALUES ('341122000000', '341122', '3411', '来安县', '3', 'L', '1093');
INSERT INTO `region` VALUES ('341124000000', '341124', '3411', '全椒县', '3', 'Q', '1094');
INSERT INTO `region` VALUES ('341125000000', '341125', '3411', '定远县', '3', 'D', '1095');
INSERT INTO `region` VALUES ('341126000000', '341126', '3411', '凤阳县', '3', 'F', '1096');
INSERT INTO `region` VALUES ('341181000000', '341181', '3411', '天长市', '3', 'T', '1097');
INSERT INTO `region` VALUES ('341182000000', '341182', '3411', '明光市', '3', 'M', '1098');
INSERT INTO `region` VALUES ('341200000000', '3412', '34', '阜阳市', '2', 'F', '107');
INSERT INTO `region` VALUES ('341201000000', '341201', '3412', '市辖区', '3', 'S', '1099');
INSERT INTO `region` VALUES ('341202000000', '341202', '3412', '颍州区', '3', 'Z', '1100');
INSERT INTO `region` VALUES ('341203000000', '341203', '3412', '颍东区', '3', 'Z', '1101');
INSERT INTO `region` VALUES ('341204000000', '341204', '3412', '颍泉区', '3', 'Z', '1102');
INSERT INTO `region` VALUES ('341221000000', '341221', '3412', '临泉县', '3', 'L', '1103');
INSERT INTO `region` VALUES ('341222000000', '341222', '3412', '太和县', '3', 'T', '1104');
INSERT INTO `region` VALUES ('341225000000', '341225', '3412', '阜南县', '3', 'F', '1105');
INSERT INTO `region` VALUES ('341226000000', '341226', '3412', '颍上县', '3', 'Z', '1106');
INSERT INTO `region` VALUES ('341282000000', '341282', '3412', '界首市', '3', 'J', '1107');
INSERT INTO `region` VALUES ('341300000000', '3413', '34', '宿州市', '2', 'S', '108');
INSERT INTO `region` VALUES ('341301000000', '341301', '3413', '市辖区', '3', 'S', '1108');
INSERT INTO `region` VALUES ('341302000000', '341302', '3413', '埇桥区', '3', 'Y', '1109');
INSERT INTO `region` VALUES ('341321000000', '341321', '3413', '砀山县', '3', 'Z', '1110');
INSERT INTO `region` VALUES ('341322000000', '341322', '3413', '萧县', '3', 'X', '1111');
INSERT INTO `region` VALUES ('341323000000', '341323', '3413', '灵璧县', '3', 'L', '1112');
INSERT INTO `region` VALUES ('341324000000', '341324', '3413', '泗县', '3', 'Z', '1113');
INSERT INTO `region` VALUES ('341400000000', '3414', '34', '巢湖市', '2', 'C', '109');
INSERT INTO `region` VALUES ('341401000000', '341401', '3414', '市辖区', '3', 'S', '1114');
INSERT INTO `region` VALUES ('341402000000', '341402', '3414', '居巢区', '3', 'J', '1115');
INSERT INTO `region` VALUES ('341421000000', '341421', '3414', '庐江县', '3', 'L', '1116');
INSERT INTO `region` VALUES ('341422000000', '341422', '3414', '无为县', '3', 'W', '1117');
INSERT INTO `region` VALUES ('341423000000', '341423', '3414', '含山县', '3', 'H', '1118');
INSERT INTO `region` VALUES ('341424000000', '341424', '3414', '和县', '3', 'H', '1119');
INSERT INTO `region` VALUES ('341500000000', '3415', '34', '六安市', '2', 'L', '110');
INSERT INTO `region` VALUES ('341501000000', '341501', '3415', '市辖区', '3', 'S', '1120');
INSERT INTO `region` VALUES ('341502000000', '341502', '3415', '金安区', '3', 'J', '1121');
INSERT INTO `region` VALUES ('341503000000', '341503', '3415', '裕安区', '3', 'Y', '1122');
INSERT INTO `region` VALUES ('341521000000', '341521', '3415', '寿县', '3', 'S', '1123');
INSERT INTO `region` VALUES ('341522000000', '341522', '3415', '霍邱县', '3', 'H', '1124');
INSERT INTO `region` VALUES ('341523000000', '341523', '3415', '舒城县', '3', 'S', '1125');
INSERT INTO `region` VALUES ('341524000000', '341524', '3415', '金寨县', '3', 'J', '1126');
INSERT INTO `region` VALUES ('341525000000', '341525', '3415', '霍山县', '3', 'H', '1127');
INSERT INTO `region` VALUES ('341600000000', '3416', '34', '亳州市', '2', 'Z', '111');
INSERT INTO `region` VALUES ('341601000000', '341601', '3416', '市辖区', '3', 'S', '1128');
INSERT INTO `region` VALUES ('341602000000', '341602', '3416', '谯城区', '3', 'Z', '1129');
INSERT INTO `region` VALUES ('341621000000', '341621', '3416', '涡阳县', '3', 'W', '1130');
INSERT INTO `region` VALUES ('341622000000', '341622', '3416', '蒙城县', '3', 'M', '1131');
INSERT INTO `region` VALUES ('341623000000', '341623', '3416', '利辛县', '3', 'L', '1132');
INSERT INTO `region` VALUES ('341700000000', '3417', '34', '池州市', '2', 'C', '112');
INSERT INTO `region` VALUES ('341701000000', '341701', '3417', '市辖区', '3', 'S', '1133');
INSERT INTO `region` VALUES ('341702000000', '341702', '3417', '贵池区', '3', 'G', '1134');
INSERT INTO `region` VALUES ('341721000000', '341721', '3417', '东至县', '3', 'D', '1135');
INSERT INTO `region` VALUES ('341722000000', '341722', '3417', '石台县', '3', 'S', '1136');
INSERT INTO `region` VALUES ('341723000000', '341723', '3417', '青阳县', '3', 'Q', '1137');
INSERT INTO `region` VALUES ('341800000000', '3418', '34', '宣城市', '2', 'X', '113');
INSERT INTO `region` VALUES ('341801000000', '341801', '3418', '市辖区', '3', 'S', '1138');
INSERT INTO `region` VALUES ('341802000000', '341802', '3418', '宣州区', '3', 'X', '1139');
INSERT INTO `region` VALUES ('341821000000', '341821', '3418', '郎溪县', '3', 'L', '1140');
INSERT INTO `region` VALUES ('341822000000', '341822', '3418', '广德县', '3', 'G', '1141');
INSERT INTO `region` VALUES ('341823000000', '341823', '3418', '泾县', '3', 'Z', '1142');
INSERT INTO `region` VALUES ('341824000000', '341824', '3418', '绩溪县', '3', 'J', '1143');
INSERT INTO `region` VALUES ('341825000000', '341825', '3418', '旌德县', '3', 'Z', '1144');
INSERT INTO `region` VALUES ('341881000000', '341881', '3418', '宁国市', '3', 'N', '1145');
INSERT INTO `region` VALUES ('350000000000', '35', 'root', '福建省', '1', 'F', '12');
INSERT INTO `region` VALUES ('350100000000', '3501', '35', '福州市', '2', 'F', '114');
INSERT INTO `region` VALUES ('350101000000', '350101', '3501', '市辖区', '3', 'S', '1146');
INSERT INTO `region` VALUES ('350102000000', '350102', '3501', '鼓楼区', '3', 'G', '1147');
INSERT INTO `region` VALUES ('350103000000', '350103', '3501', '台江区', '3', 'T', '1148');
INSERT INTO `region` VALUES ('350104000000', '350104', '3501', '仓山区', '3', 'C', '1149');
INSERT INTO `region` VALUES ('350105000000', '350105', '3501', '马尾区', '3', 'M', '1150');
INSERT INTO `region` VALUES ('350111000000', '350111', '3501', '晋安区', '3', 'J', '1151');
INSERT INTO `region` VALUES ('350121000000', '350121', '3501', '闽侯县', '3', 'M', '1152');
INSERT INTO `region` VALUES ('350122000000', '350122', '3501', '连江县', '3', 'L', '1153');
INSERT INTO `region` VALUES ('350123000000', '350123', '3501', '罗源县', '3', 'L', '1154');
INSERT INTO `region` VALUES ('350124000000', '350124', '3501', '闽清县', '3', 'M', '1155');
INSERT INTO `region` VALUES ('350125000000', '350125', '3501', '永泰县', '3', 'Y', '1156');
INSERT INTO `region` VALUES ('350128000000', '350128', '3501', '平潭县', '3', 'P', '1157');
INSERT INTO `region` VALUES ('350181000000', '350181', '3501', '福清市', '3', 'F', '1158');
INSERT INTO `region` VALUES ('350182000000', '350182', '3501', '长乐市', '3', 'C', '1159');
INSERT INTO `region` VALUES ('350200000000', '3502', '35', '厦门市', '2', 'X', '115');
INSERT INTO `region` VALUES ('350201000000', '350201', '3502', '市辖区', '3', 'S', '1160');
INSERT INTO `region` VALUES ('350203000000', '350203', '3502', '思明区', '3', 'S', '1161');
INSERT INTO `region` VALUES ('350205000000', '350205', '3502', '海沧区', '3', 'H', '1162');
INSERT INTO `region` VALUES ('350206000000', '350206', '3502', '湖里区', '3', 'H', '1163');
INSERT INTO `region` VALUES ('350211000000', '350211', '3502', '集美区', '3', 'J', '1164');
INSERT INTO `region` VALUES ('350212000000', '350212', '3502', '同安区', '3', 'T', '1165');
INSERT INTO `region` VALUES ('350213000000', '350213', '3502', '翔安区', '3', 'X', '1166');
INSERT INTO `region` VALUES ('350300000000', '3503', '35', '莆田市', '2', 'P', '116');
INSERT INTO `region` VALUES ('350301000000', '350301', '3503', '市辖区', '3', 'S', '1167');
INSERT INTO `region` VALUES ('350302000000', '350302', '3503', '城厢区', '3', 'C', '1168');
INSERT INTO `region` VALUES ('350303000000', '350303', '3503', '涵江区', '3', 'H', '1169');
INSERT INTO `region` VALUES ('350304000000', '350304', '3503', '荔城区', '3', 'L', '1170');
INSERT INTO `region` VALUES ('350305000000', '350305', '3503', '秀屿区', '3', 'X', '1171');
INSERT INTO `region` VALUES ('350322000000', '350322', '3503', '仙游县', '3', 'X', '1172');
INSERT INTO `region` VALUES ('350400000000', '3504', '35', '三明市', '2', 'S', '117');
INSERT INTO `region` VALUES ('350401000000', '350401', '3504', '市辖区', '3', 'S', '1173');
INSERT INTO `region` VALUES ('350402000000', '350402', '3504', '梅列区', '3', 'M', '1174');
INSERT INTO `region` VALUES ('350403000000', '350403', '3504', '三元区', '3', 'S', '1175');
INSERT INTO `region` VALUES ('350421000000', '350421', '3504', '明溪县', '3', 'M', '1176');
INSERT INTO `region` VALUES ('350423000000', '350423', '3504', '清流县', '3', 'Q', '1177');
INSERT INTO `region` VALUES ('350424000000', '350424', '3504', '宁化县', '3', 'N', '1178');
INSERT INTO `region` VALUES ('350425000000', '350425', '3504', '大田县', '3', 'D', '1179');
INSERT INTO `region` VALUES ('350426000000', '350426', '3504', '尤溪县', '3', 'Y', '1180');
INSERT INTO `region` VALUES ('350427000000', '350427', '3504', '沙县', '3', 'S', '1181');
INSERT INTO `region` VALUES ('350428000000', '350428', '3504', '将乐县', '3', 'J', '1182');
INSERT INTO `region` VALUES ('350429000000', '350429', '3504', '泰宁县', '3', 'T', '1183');
INSERT INTO `region` VALUES ('350430000000', '350430', '3504', '建宁县', '3', 'J', '1184');
INSERT INTO `region` VALUES ('350481000000', '350481', '3504', '永安市', '3', 'Y', '1185');
INSERT INTO `region` VALUES ('350500000000', '3505', '35', '泉州市', '2', 'Q', '118');
INSERT INTO `region` VALUES ('350501000000', '350501', '3505', '市辖区', '3', 'S', '1186');
INSERT INTO `region` VALUES ('350502000000', '350502', '3505', '鲤城区', '3', 'L', '1187');
INSERT INTO `region` VALUES ('350503000000', '350503', '3505', '丰泽区', '3', 'F', '1188');
INSERT INTO `region` VALUES ('350504000000', '350504', '3505', '洛江区', '3', 'L', '1189');
INSERT INTO `region` VALUES ('350505000000', '350505', '3505', '泉港区', '3', 'Q', '1190');
INSERT INTO `region` VALUES ('350521000000', '350521', '3505', '惠安县', '3', 'H', '1191');
INSERT INTO `region` VALUES ('350524000000', '350524', '3505', '安溪县', '3', 'A', '1192');
INSERT INTO `region` VALUES ('350525000000', '350525', '3505', '永春县', '3', 'Y', '1193');
INSERT INTO `region` VALUES ('350526000000', '350526', '3505', '德化县', '3', 'D', '1194');
INSERT INTO `region` VALUES ('350527000000', '350527', '3505', '金门县', '3', 'J', '1195');
INSERT INTO `region` VALUES ('350581000000', '350581', '3505', '石狮市', '3', 'S', '1196');
INSERT INTO `region` VALUES ('350582000000', '350582', '3505', '晋江市', '3', 'J', '1197');
INSERT INTO `region` VALUES ('350583000000', '350583', '3505', '南安市', '3', 'N', '1198');
INSERT INTO `region` VALUES ('350600000000', '3506', '35', '漳州市', '2', 'Z', '119');
INSERT INTO `region` VALUES ('350601000000', '350601', '3506', '市辖区', '3', 'S', '1199');
INSERT INTO `region` VALUES ('350602000000', '350602', '3506', '芗城区', '3', 'Z', '1200');
INSERT INTO `region` VALUES ('350603000000', '350603', '3506', '龙文区', '3', 'L', '1201');
INSERT INTO `region` VALUES ('350622000000', '350622', '3506', '云霄县', '3', 'Y', '1202');
INSERT INTO `region` VALUES ('350623000000', '350623', '3506', '漳浦县', '3', 'Z', '1203');
INSERT INTO `region` VALUES ('350624000000', '350624', '3506', '诏安县', '3', 'Z', '1204');
INSERT INTO `region` VALUES ('350625000000', '350625', '3506', '长泰县', '3', 'C', '1205');
INSERT INTO `region` VALUES ('350626000000', '350626', '3506', '东山县', '3', 'D', '1206');
INSERT INTO `region` VALUES ('350627000000', '350627', '3506', '南靖县', '3', 'N', '1207');
INSERT INTO `region` VALUES ('350628000000', '350628', '3506', '平和县', '3', 'P', '1208');
INSERT INTO `region` VALUES ('350629000000', '350629', '3506', '华安县', '3', 'H', '1209');
INSERT INTO `region` VALUES ('350681000000', '350681', '3506', '龙海市', '3', 'L', '1210');
INSERT INTO `region` VALUES ('350700000000', '3507', '35', '南平市', '2', 'N', '120');
INSERT INTO `region` VALUES ('350701000000', '350701', '3507', '市辖区', '3', 'S', '1211');
INSERT INTO `region` VALUES ('350702000000', '350702', '3507', '延平区', '3', 'Y', '1212');
INSERT INTO `region` VALUES ('350721000000', '350721', '3507', '顺昌县', '3', 'S', '1213');
INSERT INTO `region` VALUES ('350722000000', '350722', '3507', '浦城县', '3', 'P', '1214');
INSERT INTO `region` VALUES ('350723000000', '350723', '3507', '光泽县', '3', 'G', '1215');
INSERT INTO `region` VALUES ('350724000000', '350724', '3507', '松溪县', '3', 'S', '1216');
INSERT INTO `region` VALUES ('350725000000', '350725', '3507', '政和县', '3', 'Z', '1217');
INSERT INTO `region` VALUES ('350781000000', '350781', '3507', '邵武市', '3', 'S', '1218');
INSERT INTO `region` VALUES ('350782000000', '350782', '3507', '武夷山市', '3', 'W', '1219');
INSERT INTO `region` VALUES ('350783000000', '350783', '3507', '建瓯市', '3', 'J', '1220');
INSERT INTO `region` VALUES ('350784000000', '350784', '3507', '建阳市', '3', 'J', '1221');
INSERT INTO `region` VALUES ('350800000000', '3508', '35', '龙岩市', '2', 'L', '121');
INSERT INTO `region` VALUES ('350801000000', '350801', '3508', '市辖区', '3', 'S', '1222');
INSERT INTO `region` VALUES ('350802000000', '350802', '3508', '新罗区', '3', 'X', '1223');
INSERT INTO `region` VALUES ('350821000000', '350821', '3508', '长汀县', '3', 'C', '1224');
INSERT INTO `region` VALUES ('350822000000', '350822', '3508', '永定县', '3', 'Y', '1225');
INSERT INTO `region` VALUES ('350823000000', '350823', '3508', '上杭县', '3', 'S', '1226');
INSERT INTO `region` VALUES ('350824000000', '350824', '3508', '武平县', '3', 'W', '1227');
INSERT INTO `region` VALUES ('350825000000', '350825', '3508', '连城县', '3', 'L', '1228');
INSERT INTO `region` VALUES ('350881000000', '350881', '3508', '漳平市', '3', 'Z', '1229');
INSERT INTO `region` VALUES ('350900000000', '3509', '35', '宁德市', '2', 'N', '122');
INSERT INTO `region` VALUES ('350901000000', '350901', '3509', '市辖区', '3', 'S', '1230');
INSERT INTO `region` VALUES ('350902000000', '350902', '3509', '蕉城区', '3', 'J', '1231');
INSERT INTO `region` VALUES ('350921000000', '350921', '3509', '霞浦县', '3', 'X', '1232');
INSERT INTO `region` VALUES ('350922000000', '350922', '3509', '古田县', '3', 'G', '1233');
INSERT INTO `region` VALUES ('350923000000', '350923', '3509', '屏南县', '3', 'P', '1234');
INSERT INTO `region` VALUES ('350924000000', '350924', '3509', '寿宁县', '3', 'S', '1235');
INSERT INTO `region` VALUES ('350925000000', '350925', '3509', '周宁县', '3', 'Z', '1236');
INSERT INTO `region` VALUES ('350926000000', '350926', '3509', '柘荣县', '3', 'Z', '1237');
INSERT INTO `region` VALUES ('350981000000', '350981', '3509', '福安市', '3', 'F', '1238');
INSERT INTO `region` VALUES ('350982000000', '350982', '3509', '福鼎市', '3', 'F', '1239');
INSERT INTO `region` VALUES ('360000000000', '36', 'root', '江西省', '1', 'J', '13');
INSERT INTO `region` VALUES ('360100000000', '3601', '36', '南昌市', '2', 'N', '123');
INSERT INTO `region` VALUES ('360101000000', '360101', '3601', '市辖区', '3', 'S', '1240');
INSERT INTO `region` VALUES ('360102000000', '360102', '3601', '东湖区', '3', 'D', '1241');
INSERT INTO `region` VALUES ('360103000000', '360103', '3601', '西湖区', '3', 'X', '1242');
INSERT INTO `region` VALUES ('360104000000', '360104', '3601', '青云谱区', '3', 'Q', '1243');
INSERT INTO `region` VALUES ('360105000000', '360105', '3601', '湾里区', '3', 'W', '1244');
INSERT INTO `region` VALUES ('360111000000', '360111', '3601', '青山湖区', '3', 'Q', '1245');
INSERT INTO `region` VALUES ('360121000000', '360121', '3601', '南昌县', '3', 'N', '1246');
INSERT INTO `region` VALUES ('360122000000', '360122', '3601', '新建县', '3', 'X', '1247');
INSERT INTO `region` VALUES ('360123000000', '360123', '3601', '安义县', '3', 'A', '1248');
INSERT INTO `region` VALUES ('360124000000', '360124', '3601', '进贤县', '3', 'J', '1249');
INSERT INTO `region` VALUES ('360200000000', '3602', '36', '景德镇市', '2', 'J', '124');
INSERT INTO `region` VALUES ('360201000000', '360201', '3602', '市辖区', '3', 'S', '1250');
INSERT INTO `region` VALUES ('360202000000', '360202', '3602', '昌江区', '3', 'C', '1251');
INSERT INTO `region` VALUES ('360203000000', '360203', '3602', '珠山区', '3', 'Z', '1252');
INSERT INTO `region` VALUES ('360222000000', '360222', '3602', '浮梁县', '3', 'F', '1253');
INSERT INTO `region` VALUES ('360281000000', '360281', '3602', '乐平市', '3', 'L', '1254');
INSERT INTO `region` VALUES ('360300000000', '3603', '36', '萍乡市', '2', 'P', '125');
INSERT INTO `region` VALUES ('360301000000', '360301', '3603', '市辖区', '3', 'S', '1255');
INSERT INTO `region` VALUES ('360302000000', '360302', '3603', '安源区', '3', 'A', '1256');
INSERT INTO `region` VALUES ('360313000000', '360313', '3603', '湘东区', '3', 'X', '1257');
INSERT INTO `region` VALUES ('360321000000', '360321', '3603', '莲花县', '3', 'L', '1258');
INSERT INTO `region` VALUES ('360322000000', '360322', '3603', '上栗县', '3', 'S', '1259');
INSERT INTO `region` VALUES ('360323000000', '360323', '3603', '芦溪县', '3', 'L', '1260');
INSERT INTO `region` VALUES ('360400000000', '3604', '36', '九江市', '2', 'J', '126');
INSERT INTO `region` VALUES ('360401000000', '360401', '3604', '市辖区', '3', 'S', '1261');
INSERT INTO `region` VALUES ('360402000000', '360402', '3604', '庐山区', '3', 'L', '1262');
INSERT INTO `region` VALUES ('360403000000', '360403', '3604', '浔阳区', '3', 'Z', '1263');
INSERT INTO `region` VALUES ('360421000000', '360421', '3604', '九江县', '3', 'J', '1264');
INSERT INTO `region` VALUES ('360423000000', '360423', '3604', '武宁县', '3', 'W', '1265');
INSERT INTO `region` VALUES ('360424000000', '360424', '3604', '修水县', '3', 'X', '1266');
INSERT INTO `region` VALUES ('360425000000', '360425', '3604', '永修县', '3', 'Y', '1267');
INSERT INTO `region` VALUES ('360426000000', '360426', '3604', '德安县', '3', 'D', '1268');
INSERT INTO `region` VALUES ('360427000000', '360427', '3604', '星子县', '3', 'X', '1269');
INSERT INTO `region` VALUES ('360428000000', '360428', '3604', '都昌县', '3', 'D', '1270');
INSERT INTO `region` VALUES ('360429000000', '360429', '3604', '湖口县', '3', 'H', '1271');
INSERT INTO `region` VALUES ('360430000000', '360430', '3604', '彭泽县', '3', 'P', '1272');
INSERT INTO `region` VALUES ('360481000000', '360481', '3604', '瑞昌市', '3', 'R', '1273');
INSERT INTO `region` VALUES ('360500000000', '3605', '36', '新余市', '2', 'X', '127');
INSERT INTO `region` VALUES ('360501000000', '360501', '3605', '市辖区', '3', 'S', '1274');
INSERT INTO `region` VALUES ('360502000000', '360502', '3605', '渝水区', '3', 'Y', '1275');
INSERT INTO `region` VALUES ('360521000000', '360521', '3605', '分宜县', '3', 'F', '1276');
INSERT INTO `region` VALUES ('360600000000', '3606', '36', '鹰潭市', '2', 'Y', '128');
INSERT INTO `region` VALUES ('360601000000', '360601', '3606', '市辖区', '3', 'S', '1277');
INSERT INTO `region` VALUES ('360602000000', '360602', '3606', '月湖区', '3', 'Y', '1278');
INSERT INTO `region` VALUES ('360622000000', '360622', '3606', '余江县', '3', 'Y', '1279');
INSERT INTO `region` VALUES ('360681000000', '360681', '3606', '贵溪市', '3', 'G', '1280');
INSERT INTO `region` VALUES ('360700000000', '3607', '36', '赣州市', '2', 'G', '129');
INSERT INTO `region` VALUES ('360701000000', '360701', '3607', '市辖区', '3', 'S', '1281');
INSERT INTO `region` VALUES ('360702000000', '360702', '3607', '章贡区', '3', 'Z', '1282');
INSERT INTO `region` VALUES ('360721000000', '360721', '3607', '赣县', '3', 'G', '1283');
INSERT INTO `region` VALUES ('360722000000', '360722', '3607', '信丰县', '3', 'X', '1284');
INSERT INTO `region` VALUES ('360723000000', '360723', '3607', '大余县', '3', 'D', '1285');
INSERT INTO `region` VALUES ('360724000000', '360724', '3607', '上犹县', '3', 'S', '1286');
INSERT INTO `region` VALUES ('360725000000', '360725', '3607', '崇义县', '3', 'C', '1287');
INSERT INTO `region` VALUES ('360726000000', '360726', '3607', '安远县', '3', 'A', '1288');
INSERT INTO `region` VALUES ('360727000000', '360727', '3607', '龙南县', '3', 'L', '1289');
INSERT INTO `region` VALUES ('360728000000', '360728', '3607', '定南县', '3', 'D', '1290');
INSERT INTO `region` VALUES ('360729000000', '360729', '3607', '全南县', '3', 'Q', '1291');
INSERT INTO `region` VALUES ('360730000000', '360730', '3607', '宁都县', '3', 'N', '1292');
INSERT INTO `region` VALUES ('360731000000', '360731', '3607', '于都县', '3', 'Y', '1293');
INSERT INTO `region` VALUES ('360732000000', '360732', '3607', '兴国县', '3', 'X', '1294');
INSERT INTO `region` VALUES ('360733000000', '360733', '3607', '会昌县', '3', 'H', '1295');
INSERT INTO `region` VALUES ('360734000000', '360734', '3607', '寻乌县', '3', 'X', '1296');
INSERT INTO `region` VALUES ('360735000000', '360735', '3607', '石城县', '3', 'S', '1297');
INSERT INTO `region` VALUES ('360781000000', '360781', '3607', '瑞金市', '3', 'R', '1298');
INSERT INTO `region` VALUES ('360782000000', '360782', '3607', '南康市', '3', 'N', '1299');
INSERT INTO `region` VALUES ('360800000000', '3608', '36', '吉安市', '2', 'J', '130');
INSERT INTO `region` VALUES ('360801000000', '360801', '3608', '市辖区', '3', 'S', '1300');
INSERT INTO `region` VALUES ('360802000000', '360802', '3608', '吉州区', '3', 'J', '1301');
INSERT INTO `region` VALUES ('360803000000', '360803', '3608', '青原区', '3', 'Q', '1302');
INSERT INTO `region` VALUES ('360821000000', '360821', '3608', '吉安县', '3', 'J', '1303');
INSERT INTO `region` VALUES ('360822000000', '360822', '3608', '吉水县', '3', 'J', '1304');
INSERT INTO `region` VALUES ('360823000000', '360823', '3608', '峡江县', '3', 'X', '1305');
INSERT INTO `region` VALUES ('360824000000', '360824', '3608', '新干县', '3', 'X', '1306');
INSERT INTO `region` VALUES ('360825000000', '360825', '3608', '永丰县', '3', 'Y', '1307');
INSERT INTO `region` VALUES ('360826000000', '360826', '3608', '泰和县', '3', 'T', '1308');
INSERT INTO `region` VALUES ('360827000000', '360827', '3608', '遂川县', '3', 'S', '1309');
INSERT INTO `region` VALUES ('360828000000', '360828', '3608', '万安县', '3', 'W', '1310');
INSERT INTO `region` VALUES ('360829000000', '360829', '3608', '安福县', '3', 'A', '1311');
INSERT INTO `region` VALUES ('360830000000', '360830', '3608', '永新县', '3', 'Y', '1312');
INSERT INTO `region` VALUES ('360881000000', '360881', '3608', '井冈山市', '3', 'J', '1313');
INSERT INTO `region` VALUES ('360900000000', '3609', '36', '宜春市', '2', 'Y', '131');
INSERT INTO `region` VALUES ('360901000000', '360901', '3609', '市辖区', '3', 'S', '1314');
INSERT INTO `region` VALUES ('360902000000', '360902', '3609', '袁州区', '3', 'Y', '1315');
INSERT INTO `region` VALUES ('360921000000', '360921', '3609', '奉新县', '3', 'F', '1316');
INSERT INTO `region` VALUES ('360922000000', '360922', '3609', '万载县', '3', 'W', '1317');
INSERT INTO `region` VALUES ('360923000000', '360923', '3609', '上高县', '3', 'S', '1318');
INSERT INTO `region` VALUES ('360924000000', '360924', '3609', '宜丰县', '3', 'Y', '1319');
INSERT INTO `region` VALUES ('360925000000', '360925', '3609', '靖安县', '3', 'J', '1320');
INSERT INTO `region` VALUES ('360926000000', '360926', '3609', '铜鼓县', '3', 'T', '1321');
INSERT INTO `region` VALUES ('360981000000', '360981', '3609', '丰城市', '3', 'F', '1322');
INSERT INTO `region` VALUES ('360982000000', '360982', '3609', '樟树市', '3', 'Z', '1323');
INSERT INTO `region` VALUES ('360983000000', '360983', '3609', '高安市', '3', 'G', '1324');
INSERT INTO `region` VALUES ('361000000000', '3610', '36', '抚州市', '2', 'F', '132');
INSERT INTO `region` VALUES ('361001000000', '361001', '3610', '市辖区', '3', 'S', '1325');
INSERT INTO `region` VALUES ('361002000000', '361002', '3610', '临川区', '3', 'L', '1326');
INSERT INTO `region` VALUES ('361021000000', '361021', '3610', '南城县', '3', 'N', '1327');
INSERT INTO `region` VALUES ('361022000000', '361022', '3610', '黎川县', '3', 'L', '1328');
INSERT INTO `region` VALUES ('361023000000', '361023', '3610', '南丰县', '3', 'N', '1329');
INSERT INTO `region` VALUES ('361024000000', '361024', '3610', '崇仁县', '3', 'C', '1330');
INSERT INTO `region` VALUES ('361025000000', '361025', '3610', '乐安县', '3', 'L', '1331');
INSERT INTO `region` VALUES ('361026000000', '361026', '3610', '宜黄县', '3', 'Y', '1332');
INSERT INTO `region` VALUES ('361027000000', '361027', '3610', '金溪县', '3', 'J', '1333');
INSERT INTO `region` VALUES ('361028000000', '361028', '3610', '资溪县', '3', 'Z', '1334');
INSERT INTO `region` VALUES ('361029000000', '361029', '3610', '东乡县', '3', 'D', '1335');
INSERT INTO `region` VALUES ('361030000000', '361030', '3610', '广昌县', '3', 'G', '1336');
INSERT INTO `region` VALUES ('361100000000', '3611', '36', '上饶市', '2', 'S', '133');
INSERT INTO `region` VALUES ('361101000000', '361101', '3611', '市辖区', '3', 'S', '1337');
INSERT INTO `region` VALUES ('361102000000', '361102', '3611', '信州区', '3', 'X', '1338');
INSERT INTO `region` VALUES ('361121000000', '361121', '3611', '上饶县', '3', 'S', '1339');
INSERT INTO `region` VALUES ('361122000000', '361122', '3611', '广丰县', '3', 'G', '1340');
INSERT INTO `region` VALUES ('361123000000', '361123', '3611', '玉山县', '3', 'Y', '1341');
INSERT INTO `region` VALUES ('361124000000', '361124', '3611', '铅山县', '3', 'Q', '1342');
INSERT INTO `region` VALUES ('361125000000', '361125', '3611', '横峰县', '3', 'H', '1343');
INSERT INTO `region` VALUES ('361126000000', '361126', '3611', '弋阳县', '3', 'Z', '1344');
INSERT INTO `region` VALUES ('361127000000', '361127', '3611', '余干县', '3', 'Y', '1345');
INSERT INTO `region` VALUES ('361128000000', '361128', '3611', '鄱阳县', '3', 'Z', '1346');
INSERT INTO `region` VALUES ('361129000000', '361129', '3611', '万年县', '3', 'W', '1347');
INSERT INTO `region` VALUES ('361130000000', '361130', '3611', '婺源县', '3', 'Z', '1348');
INSERT INTO `region` VALUES ('361181000000', '361181', '3611', '德兴市', '3', 'D', '1349');
INSERT INTO `region` VALUES ('370000000000', '37', 'root', '山东省', '1', 'S', '14');
INSERT INTO `region` VALUES ('370100000000', '3701', '37', '济南市', '2', 'J', '134');
INSERT INTO `region` VALUES ('370101000000', '370101', '3701', '市辖区', '3', 'S', '1350');
INSERT INTO `region` VALUES ('370102000000', '370102', '3701', '历下区', '3', 'L', '1351');
INSERT INTO `region` VALUES ('370103000000', '370103', '3701', '市中区', '3', 'S', '1352');
INSERT INTO `region` VALUES ('370104000000', '370104', '3701', '槐荫区', '3', 'H', '1353');
INSERT INTO `region` VALUES ('370105000000', '370105', '3701', '天桥区', '3', 'T', '1354');
INSERT INTO `region` VALUES ('370112000000', '370112', '3701', '历城区', '3', 'L', '1355');
INSERT INTO `region` VALUES ('370113000000', '370113', '3701', '长清区', '3', 'C', '1356');
INSERT INTO `region` VALUES ('370124000000', '370124', '3701', '平阴县', '3', 'P', '1357');
INSERT INTO `region` VALUES ('370125000000', '370125', '3701', '济阳县', '3', 'J', '1358');
INSERT INTO `region` VALUES ('370126000000', '370126', '3701', '商河县', '3', 'S', '1359');
INSERT INTO `region` VALUES ('370181000000', '370181', '3701', '章丘市', '3', 'Z', '1360');
INSERT INTO `region` VALUES ('370200000000', '3702', '37', '青岛市', '2', 'Q', '135');
INSERT INTO `region` VALUES ('370201000000', '370201', '3702', '市辖区', '3', 'S', '1361');
INSERT INTO `region` VALUES ('370202000000', '370202', '3702', '市南区', '3', 'S', '1362');
INSERT INTO `region` VALUES ('370203000000', '370203', '3702', '市北区', '3', 'S', '1363');
INSERT INTO `region` VALUES ('370205000000', '370205', '3702', '四方区', '3', 'S', '1364');
INSERT INTO `region` VALUES ('370211000000', '370211', '3702', '黄岛区', '3', 'H', '1365');
INSERT INTO `region` VALUES ('370212000000', '370212', '3702', '崂山区', '3', 'Z', '1366');
INSERT INTO `region` VALUES ('370213000000', '370213', '3702', '李沧区', '3', 'L', '1367');
INSERT INTO `region` VALUES ('370214000000', '370214', '3702', '城阳区', '3', 'C', '1368');
INSERT INTO `region` VALUES ('370281000000', '370281', '3702', '胶州市', '3', 'J', '1369');
INSERT INTO `region` VALUES ('370282000000', '370282', '3702', '即墨市', '3', 'J', '1370');
INSERT INTO `region` VALUES ('370283000000', '370283', '3702', '平度市', '3', 'P', '1371');
INSERT INTO `region` VALUES ('370284000000', '370284', '3702', '胶南市', '3', 'J', '1372');
INSERT INTO `region` VALUES ('370285000000', '370285', '3702', '莱西市', '3', 'L', '1373');
INSERT INTO `region` VALUES ('370300000000', '3703', '37', '淄博市', '2', 'Z', '136');
INSERT INTO `region` VALUES ('370301000000', '370301', '3703', '市辖区', '3', 'S', '1374');
INSERT INTO `region` VALUES ('370302000000', '370302', '3703', '淄川区', '3', 'Z', '1375');
INSERT INTO `region` VALUES ('370303000000', '370303', '3703', '张店区', '3', 'Z', '1376');
INSERT INTO `region` VALUES ('370304000000', '370304', '3703', '博山区', '3', 'B', '1377');
INSERT INTO `region` VALUES ('370305000000', '370305', '3703', '临淄区', '3', 'L', '1378');
INSERT INTO `region` VALUES ('370306000000', '370306', '3703', '周村区', '3', 'Z', '1379');
INSERT INTO `region` VALUES ('370321000000', '370321', '3703', '桓台县', '3', 'H', '1380');
INSERT INTO `region` VALUES ('370322000000', '370322', '3703', '高青县', '3', 'G', '1381');
INSERT INTO `region` VALUES ('370323000000', '370323', '3703', '沂源县', '3', 'Y', '1382');
INSERT INTO `region` VALUES ('370400000000', '3704', '37', '枣庄市', '2', 'Z', '137');
INSERT INTO `region` VALUES ('370401000000', '370401', '3704', '市辖区', '3', 'S', '1383');
INSERT INTO `region` VALUES ('370402000000', '370402', '3704', '市中区', '3', 'S', '1384');
INSERT INTO `region` VALUES ('370403000000', '370403', '3704', '薛城区', '3', 'X', '1385');
INSERT INTO `region` VALUES ('370404000000', '370404', '3704', '峄城区', '3', 'Z', '1386');
INSERT INTO `region` VALUES ('370405000000', '370405', '3704', '台儿庄区', '3', 'T', '1387');
INSERT INTO `region` VALUES ('370406000000', '370406', '3704', '山亭区', '3', 'S', '1388');
INSERT INTO `region` VALUES ('370481000000', '370481', '3704', '滕州市', '3', 'Z', '1389');
INSERT INTO `region` VALUES ('370500000000', '3705', '37', '东营市', '2', 'D', '138');
INSERT INTO `region` VALUES ('370501000000', '370501', '3705', '市辖区', '3', 'S', '1390');
INSERT INTO `region` VALUES ('370502000000', '370502', '3705', '东营区', '3', 'D', '1391');
INSERT INTO `region` VALUES ('370503000000', '370503', '3705', '河口区', '3', 'H', '1392');
INSERT INTO `region` VALUES ('370521000000', '370521', '3705', '垦利县', '3', 'K', '1393');
INSERT INTO `region` VALUES ('370522000000', '370522', '3705', '利津县', '3', 'L', '1394');
INSERT INTO `region` VALUES ('370523000000', '370523', '3705', '广饶县', '3', 'G', '1395');
INSERT INTO `region` VALUES ('370600000000', '3706', '37', '烟台市', '2', 'Y', '139');
INSERT INTO `region` VALUES ('370601000000', '370601', '3706', '高新区', '3', 'G', '1396');
INSERT INTO `region` VALUES ('370602000000', '370602', '3706', '芝罘区', '3', 'Z', '1397');
INSERT INTO `region` VALUES ('370611000000', '370611', '3706', '福山区', '3', 'F', '1398');
INSERT INTO `region` VALUES ('370612000000', '370612', '3706', '牟平区', '3', 'M', '1399');
INSERT INTO `region` VALUES ('370613000000', '370613', '3706', '莱山区', '3', 'L', '1400');
INSERT INTO `region` VALUES ('370634000000', '370634', '3706', '长岛县', '3', 'C', '1401');
INSERT INTO `region` VALUES ('370681000000', '370681', '3706', '龙口市', '3', 'L', '1402');
INSERT INTO `region` VALUES ('370682000000', '370682', '3706', '莱阳市', '3', 'L', '1403');
INSERT INTO `region` VALUES ('370683000000', '370683', '3706', '莱州市', '3', 'L', '1404');
INSERT INTO `region` VALUES ('370684000000', '370684', '3706', '蓬莱市', '3', 'P', '1405');
INSERT INTO `region` VALUES ('370685000000', '370685', '3706', '招远市', '3', 'Z', '1406');
INSERT INTO `region` VALUES ('370686000000', '370686', '3706', '栖霞市', '3', 'Q', '1407');
INSERT INTO `region` VALUES ('370687000000', '370687', '3706', '海阳市', '3', 'H', '1408');
INSERT INTO `region` VALUES ('370688000000', '370688', '3706', '开发区', '3', 'K', '1409');
INSERT INTO `region` VALUES ('370700000000', '3707', '37', '潍坊市', '2', 'W', '140');
INSERT INTO `region` VALUES ('370701000000', '370701', '3707', '市辖区', '3', 'S', '1410');
INSERT INTO `region` VALUES ('370702000000', '370702', '3707', '潍城区', '3', 'W', '1411');
INSERT INTO `region` VALUES ('370703000000', '370703', '3707', '寒亭区', '3', 'H', '1412');
INSERT INTO `region` VALUES ('370704000000', '370704', '3707', '坊子区', '3', 'F', '1413');
INSERT INTO `region` VALUES ('370705000000', '370705', '3707', '奎文区', '3', 'K', '1414');
INSERT INTO `region` VALUES ('370724000000', '370724', '3707', '临朐县', '3', 'L', '1415');
INSERT INTO `region` VALUES ('370725000000', '370725', '3707', '昌乐县', '3', 'C', '1416');
INSERT INTO `region` VALUES ('370781000000', '370781', '3707', '青州市', '3', 'Q', '1417');
INSERT INTO `region` VALUES ('370782000000', '370782', '3707', '诸城市', '3', 'Z', '1418');
INSERT INTO `region` VALUES ('370783000000', '370783', '3707', '寿光市', '3', 'S', '1419');
INSERT INTO `region` VALUES ('370784000000', '370784', '3707', '安丘市', '3', 'A', '1420');
INSERT INTO `region` VALUES ('370785000000', '370785', '3707', '高密市', '3', 'G', '1421');
INSERT INTO `region` VALUES ('370786000000', '370786', '3707', '昌邑市', '3', 'C', '1422');
INSERT INTO `region` VALUES ('370800000000', '3708', '37', '济宁市', '2', 'J', '141');
INSERT INTO `region` VALUES ('370801000000', '370801', '3708', '市辖区', '3', 'S', '1423');
INSERT INTO `region` VALUES ('370802000000', '370802', '3708', '市中区', '3', 'S', '1424');
INSERT INTO `region` VALUES ('370811000000', '370811', '3708', '任城区', '3', 'R', '1425');
INSERT INTO `region` VALUES ('370826000000', '370826', '3708', '微山县', '3', 'W', '1426');
INSERT INTO `region` VALUES ('370827000000', '370827', '3708', '鱼台县', '3', 'Y', '1427');
INSERT INTO `region` VALUES ('370828000000', '370828', '3708', '金乡县', '3', 'J', '1428');
INSERT INTO `region` VALUES ('370829000000', '370829', '3708', '嘉祥县', '3', 'J', '1429');
INSERT INTO `region` VALUES ('370830000000', '370830', '3708', '汶上县', '3', 'Z', '1430');
INSERT INTO `region` VALUES ('370831000000', '370831', '3708', '泗水县', '3', 'Z', '1431');
INSERT INTO `region` VALUES ('370832000000', '370832', '3708', '梁山县', '3', 'L', '1432');
INSERT INTO `region` VALUES ('370881000000', '370881', '3708', '曲阜市', '3', 'Q', '1433');
INSERT INTO `region` VALUES ('370882000000', '370882', '3708', '兖州市', '3', 'Z', '1434');
INSERT INTO `region` VALUES ('370883000000', '370883', '3708', '邹城市', '3', 'Z', '1435');
INSERT INTO `region` VALUES ('370900000000', '3709', '37', '泰安市', '2', 'T', '142');
INSERT INTO `region` VALUES ('370901000000', '370901', '3709', '市辖区', '3', 'S', '1436');
INSERT INTO `region` VALUES ('370902000000', '370902', '3709', '泰山区', '3', 'T', '1437');
INSERT INTO `region` VALUES ('370911000000', '370911', '3709', '岱岳区', '3', 'Z', '1438');
INSERT INTO `region` VALUES ('370921000000', '370921', '3709', '宁阳县', '3', 'N', '1439');
INSERT INTO `region` VALUES ('370923000000', '370923', '3709', '东平县', '3', 'D', '1440');
INSERT INTO `region` VALUES ('370982000000', '370982', '3709', '新泰市', '3', 'X', '1441');
INSERT INTO `region` VALUES ('370983000000', '370983', '3709', '肥城市', '3', 'F', '1442');
INSERT INTO `region` VALUES ('371000000000', '3710', '37', '威海市', '2', 'W', '143');
INSERT INTO `region` VALUES ('371001000000', '371001', '3710', '市辖区', '3', 'S', '1443');
INSERT INTO `region` VALUES ('371002000000', '371002', '3710', '环翠区', '3', 'H', '1444');
INSERT INTO `region` VALUES ('371081000000', '371081', '3710', '文登市', '3', 'W', '1445');
INSERT INTO `region` VALUES ('371082000000', '371082', '3710', '荣成市', '3', 'R', '1446');
INSERT INTO `region` VALUES ('371083000000', '371083', '3710', '乳山市', '3', 'R', '1447');
INSERT INTO `region` VALUES ('371100000000', '3711', '37', '日照市', '2', 'R', '144');
INSERT INTO `region` VALUES ('371101000000', '371101', '3711', '市辖区', '3', 'S', '1448');
INSERT INTO `region` VALUES ('371102000000', '371102', '3711', '东港区', '3', 'D', '1449');
INSERT INTO `region` VALUES ('371103000000', '371103', '3711', '岚山区', '3', 'Z', '1450');
INSERT INTO `region` VALUES ('371121000000', '371121', '3711', '五莲县', '3', 'W', '1451');
INSERT INTO `region` VALUES ('371122000000', '371122', '3711', '莒县', '3', 'Z', '1452');
INSERT INTO `region` VALUES ('371200000000', '3712', '37', '莱芜市', '2', 'L', '145');
INSERT INTO `region` VALUES ('371201000000', '371201', '3712', '市辖区', '3', 'S', '1453');
INSERT INTO `region` VALUES ('371202000000', '371202', '3712', '莱城区', '3', 'L', '1454');
INSERT INTO `region` VALUES ('371203000000', '371203', '3712', '钢城区', '3', 'G', '1455');
INSERT INTO `region` VALUES ('371300000000', '3713', '37', '临沂市', '2', 'L', '146');
INSERT INTO `region` VALUES ('371301000000', '371301', '3713', '市辖区', '3', 'S', '1456');
INSERT INTO `region` VALUES ('371302000000', '371302', '3713', '兰山区', '3', 'L', '1457');
INSERT INTO `region` VALUES ('371311000000', '371311', '3713', '罗庄区', '3', 'L', '1458');
INSERT INTO `region` VALUES ('371312000000', '371312', '3713', '河东区', '3', 'H', '1459');
INSERT INTO `region` VALUES ('371321000000', '371321', '3713', '沂南县', '3', 'Y', '1460');
INSERT INTO `region` VALUES ('371322000000', '371322', '3713', '郯城县', '3', 'Z', '1461');
INSERT INTO `region` VALUES ('371323000000', '371323', '3713', '沂水县', '3', 'Y', '1462');
INSERT INTO `region` VALUES ('371324000000', '371324', '3713', '苍山县', '3', 'C', '1463');
INSERT INTO `region` VALUES ('371325000000', '371325', '3713', '费县', '3', 'F', '1464');
INSERT INTO `region` VALUES ('371326000000', '371326', '3713', '平邑县', '3', 'P', '1465');
INSERT INTO `region` VALUES ('371327000000', '371327', '3713', '莒南县', '3', 'Z', '1466');
INSERT INTO `region` VALUES ('371328000000', '371328', '3713', '蒙阴县', '3', 'M', '1467');
INSERT INTO `region` VALUES ('371329000000', '371329', '3713', '临沭县', '3', 'L', '1468');
INSERT INTO `region` VALUES ('371400000000', '3714', '37', '德州市', '2', 'D', '147');
INSERT INTO `region` VALUES ('371401000000', '371401', '3714', '市辖区', '3', 'S', '1469');
INSERT INTO `region` VALUES ('371402000000', '371402', '3714', '德城区', '3', 'D', '1470');
INSERT INTO `region` VALUES ('371421000000', '371421', '3714', '陵县', '3', 'L', '1471');
INSERT INTO `region` VALUES ('371422000000', '371422', '3714', '宁津县', '3', 'N', '1472');
INSERT INTO `region` VALUES ('371423000000', '371423', '3714', '庆云县', '3', 'Q', '1473');
INSERT INTO `region` VALUES ('371424000000', '371424', '3714', '临邑县', '3', 'L', '1474');
INSERT INTO `region` VALUES ('371425000000', '371425', '3714', '齐河县', '3', 'Q', '1475');
INSERT INTO `region` VALUES ('371426000000', '371426', '3714', '平原县', '3', 'P', '1476');
INSERT INTO `region` VALUES ('371427000000', '371427', '3714', '夏津县', '3', 'X', '1477');
INSERT INTO `region` VALUES ('371428000000', '371428', '3714', '武城县', '3', 'W', '1478');
INSERT INTO `region` VALUES ('371481000000', '371481', '3714', '乐陵市', '3', 'L', '1479');
INSERT INTO `region` VALUES ('371482000000', '371482', '3714', '禹城市', '3', 'Y', '1480');
INSERT INTO `region` VALUES ('371500000000', '3715', '37', '聊城市', '2', 'L', '148');
INSERT INTO `region` VALUES ('371501000000', '371501', '3715', '市辖区', '3', 'S', '1481');
INSERT INTO `region` VALUES ('371502000000', '371502', '3715', '东昌府区', '3', 'D', '1482');
INSERT INTO `region` VALUES ('371521000000', '371521', '3715', '阳谷县', '3', 'Y', '1483');
INSERT INTO `region` VALUES ('371522000000', '371522', '3715', '莘县', '3', 'Z', '1484');
INSERT INTO `region` VALUES ('371523000000', '371523', '3715', '茌平县', '3', 'Z', '1485');
INSERT INTO `region` VALUES ('371524000000', '371524', '3715', '东阿县', '3', 'D', '1486');
INSERT INTO `region` VALUES ('371525000000', '371525', '3715', '冠县', '3', 'G', '1487');
INSERT INTO `region` VALUES ('371526000000', '371526', '3715', '高唐县', '3', 'G', '1488');
INSERT INTO `region` VALUES ('371581000000', '371581', '3715', '临清市', '3', 'L', '1489');
INSERT INTO `region` VALUES ('371600000000', '3716', '37', '滨州市', '2', 'B', '149');
INSERT INTO `region` VALUES ('371601000000', '371601', '3716', '市辖区', '3', 'S', '1490');
INSERT INTO `region` VALUES ('371602000000', '371602', '3716', '滨城区', '3', 'B', '1491');
INSERT INTO `region` VALUES ('371621000000', '371621', '3716', '惠民县', '3', 'H', '1492');
INSERT INTO `region` VALUES ('371622000000', '371622', '3716', '阳信县', '3', 'Y', '1493');
INSERT INTO `region` VALUES ('371623000000', '371623', '3716', '无棣县', '3', 'W', '1494');
INSERT INTO `region` VALUES ('371624000000', '371624', '3716', '沾化县', '3', 'Z', '1495');
INSERT INTO `region` VALUES ('371625000000', '371625', '3716', '博兴县', '3', 'B', '1496');
INSERT INTO `region` VALUES ('371626000000', '371626', '3716', '邹平县', '3', 'Z', '1497');
INSERT INTO `region` VALUES ('371700000000', '3717', '37', '菏泽市', '2', 'H', '150');
INSERT INTO `region` VALUES ('371701000000', '371701', '3717', '市辖区', '3', 'S', '1498');
INSERT INTO `region` VALUES ('371702000000', '371702', '3717', '牡丹区', '3', 'M', '1499');
INSERT INTO `region` VALUES ('371721000000', '371721', '3717', '曹县', '3', 'C', '1500');
INSERT INTO `region` VALUES ('371722000000', '371722', '3717', '单县', '3', 'D', '1501');
INSERT INTO `region` VALUES ('371723000000', '371723', '3717', '成武县', '3', 'C', '1502');
INSERT INTO `region` VALUES ('371724000000', '371724', '3717', '巨野县', '3', 'J', '1503');
INSERT INTO `region` VALUES ('371725000000', '371725', '3717', '郓城县', '3', 'Z', '1504');
INSERT INTO `region` VALUES ('371726000000', '371726', '3717', '鄄城县', '3', 'Z', '1505');
INSERT INTO `region` VALUES ('371727000000', '371727', '3717', '定陶县', '3', 'D', '1506');
INSERT INTO `region` VALUES ('371728000000', '371728', '3717', '东明县', '3', 'D', '1507');
INSERT INTO `region` VALUES ('410000000000', '41', 'root', '河南省', '1', 'H', '15');
INSERT INTO `region` VALUES ('410100000000', '4101', '41', '郑州市', '2', 'Z', '151');
INSERT INTO `region` VALUES ('410101000000', '410101', '4101', '市辖区', '3', 'S', '1508');
INSERT INTO `region` VALUES ('410102000000', '410102', '4101', '中原区', '3', 'Z', '1509');
INSERT INTO `region` VALUES ('410103000000', '410103', '4101', '二七区', '3', 'E', '1510');
INSERT INTO `region` VALUES ('410104000000', '410104', '4101', '管城回族区', '3', 'G', '1511');
INSERT INTO `region` VALUES ('410105000000', '410105', '4101', '金水区', '3', 'J', '1512');
INSERT INTO `region` VALUES ('410106000000', '410106', '4101', '上街区', '3', 'S', '1513');
INSERT INTO `region` VALUES ('410108000000', '410108', '4101', '惠济区', '3', 'H', '1514');
INSERT INTO `region` VALUES ('410122000000', '410122', '4101', '中牟县', '3', 'Z', '1515');
INSERT INTO `region` VALUES ('410181000000', '410181', '4101', '巩义市', '3', 'G', '1516');
INSERT INTO `region` VALUES ('410182000000', '410182', '4101', '荥阳市', '3', 'Z', '1517');
INSERT INTO `region` VALUES ('410183000000', '410183', '4101', '新密市', '3', 'X', '1518');
INSERT INTO `region` VALUES ('410184000000', '410184', '4101', '新郑市', '3', 'X', '1519');
INSERT INTO `region` VALUES ('410185000000', '410185', '4101', '登封市', '3', 'D', '1520');
INSERT INTO `region` VALUES ('410200000000', '4102', '41', '开封市', '2', 'K', '152');
INSERT INTO `region` VALUES ('410201000000', '410201', '4102', '市辖区', '3', 'S', '1521');
INSERT INTO `region` VALUES ('410202000000', '410202', '4102', '龙亭区', '3', 'L', '1522');
INSERT INTO `region` VALUES ('410203000000', '410203', '4102', '顺河回族区', '3', 'S', '1523');
INSERT INTO `region` VALUES ('410204000000', '410204', '4102', '鼓楼区', '3', 'G', '1524');
INSERT INTO `region` VALUES ('410205000000', '410205', '4102', '禹王台区', '3', 'Y', '1525');
INSERT INTO `region` VALUES ('410211000000', '410211', '4102', '金明区', '3', 'J', '1526');
INSERT INTO `region` VALUES ('410221000000', '410221', '4102', '杞县', '3', 'Z', '1527');
INSERT INTO `region` VALUES ('410222000000', '410222', '4102', '通许县', '3', 'T', '1528');
INSERT INTO `region` VALUES ('410223000000', '410223', '4102', '尉氏县', '3', 'W', '1529');
INSERT INTO `region` VALUES ('410224000000', '410224', '4102', '开封县', '3', 'K', '1530');
INSERT INTO `region` VALUES ('410225000000', '410225', '4102', '兰考县', '3', 'L', '1531');
INSERT INTO `region` VALUES ('410300000000', '4103', '41', '洛阳市', '2', 'L', '153');
INSERT INTO `region` VALUES ('410301000000', '410301', '4103', '市辖区', '3', 'S', '1532');
INSERT INTO `region` VALUES ('410302000000', '410302', '4103', '老城区', '3', 'L', '1533');
INSERT INTO `region` VALUES ('410303000000', '410303', '4103', '西工区', '3', 'X', '1534');
INSERT INTO `region` VALUES ('410304000000', '410304', '4103', '瀍河回族区', '3', 'C', '1535');
INSERT INTO `region` VALUES ('410305000000', '410305', '4103', '涧西区', '3', 'J', '1536');
INSERT INTO `region` VALUES ('410306000000', '410306', '4103', '吉利区', '3', 'J', '1537');
INSERT INTO `region` VALUES ('410311000000', '410311', '4103', '洛龙区', '3', 'L', '1538');
INSERT INTO `region` VALUES ('410322000000', '410322', '4103', '孟津县', '3', 'M', '1539');
INSERT INTO `region` VALUES ('410323000000', '410323', '4103', '新安县', '3', 'X', '1540');
INSERT INTO `region` VALUES ('410324000000', '410324', '4103', '栾川县', '3', 'Z', '1541');
INSERT INTO `region` VALUES ('410325000000', '410325', '4103', '嵩县', '3', 'Z', '1542');
INSERT INTO `region` VALUES ('410326000000', '410326', '4103', '汝阳县', '3', 'R', '1543');
INSERT INTO `region` VALUES ('410327000000', '410327', '4103', '宜阳县', '3', 'Y', '1544');
INSERT INTO `region` VALUES ('410328000000', '410328', '4103', '洛宁县', '3', 'L', '1545');
INSERT INTO `region` VALUES ('410329000000', '410329', '4103', '伊川县', '3', 'Y', '1546');
INSERT INTO `region` VALUES ('410381000000', '410381', '4103', '偃师市', '3', 'Z', '1547');
INSERT INTO `region` VALUES ('410400000000', '4104', '41', '平顶山市', '2', 'P', '154');
INSERT INTO `region` VALUES ('410401000000', '410401', '4104', '市辖区', '3', 'S', '1548');
INSERT INTO `region` VALUES ('410402000000', '410402', '4104', '新华区', '3', 'X', '1549');
INSERT INTO `region` VALUES ('410403000000', '410403', '4104', '卫东区', '3', 'W', '1550');
INSERT INTO `region` VALUES ('410404000000', '410404', '4104', '石龙区', '3', 'S', '1551');
INSERT INTO `region` VALUES ('410411000000', '410411', '4104', '湛河区', '3', 'Z', '1552');
INSERT INTO `region` VALUES ('410421000000', '410421', '4104', '宝丰县', '3', 'B', '1553');
INSERT INTO `region` VALUES ('410422000000', '410422', '4104', '叶县', '3', 'Y', '1554');
INSERT INTO `region` VALUES ('410423000000', '410423', '4104', '鲁山县', '3', 'L', '1555');
INSERT INTO `region` VALUES ('410425000000', '410425', '4104', '郏县', '3', 'Z', '1556');
INSERT INTO `region` VALUES ('410481000000', '410481', '4104', '舞钢市', '3', 'W', '1557');
INSERT INTO `region` VALUES ('410482000000', '410482', '4104', '汝州市', '3', 'R', '1558');
INSERT INTO `region` VALUES ('410500000000', '4105', '41', '安阳市', '2', 'A', '155');
INSERT INTO `region` VALUES ('410501000000', '410501', '4105', '市辖区', '3', 'S', '1559');
INSERT INTO `region` VALUES ('410502000000', '410502', '4105', '文峰区', '3', 'W', '1560');
INSERT INTO `region` VALUES ('410503000000', '410503', '4105', '北关区', '3', 'B', '1561');
INSERT INTO `region` VALUES ('410505000000', '410505', '4105', '殷都区', '3', 'Y', '1562');
INSERT INTO `region` VALUES ('410506000000', '410506', '4105', '龙安区', '3', 'L', '1563');
INSERT INTO `region` VALUES ('410522000000', '410522', '4105', '安阳县', '3', 'A', '1564');
INSERT INTO `region` VALUES ('410523000000', '410523', '4105', '汤阴县', '3', 'T', '1565');
INSERT INTO `region` VALUES ('410526000000', '410526', '4105', '滑县', '3', 'H', '1566');
INSERT INTO `region` VALUES ('410527000000', '410527', '4105', '内黄县', '3', 'N', '1567');
INSERT INTO `region` VALUES ('410581000000', '410581', '4105', '林州市', '3', 'L', '1568');
INSERT INTO `region` VALUES ('410600000000', '4106', '41', '鹤壁市', '2', 'H', '156');
INSERT INTO `region` VALUES ('410601000000', '410601', '4106', '市辖区', '3', 'S', '1569');
INSERT INTO `region` VALUES ('410602000000', '410602', '4106', '鹤山区', '3', 'H', '1570');
INSERT INTO `region` VALUES ('410603000000', '410603', '4106', '山城区', '3', 'S', '1571');
INSERT INTO `region` VALUES ('410611000000', '410611', '4106', '淇滨区', '3', 'Z', '1572');
INSERT INTO `region` VALUES ('410621000000', '410621', '4106', '浚县', '3', 'J', '1573');
INSERT INTO `region` VALUES ('410622000000', '410622', '4106', '淇县', '3', 'Z', '1574');
INSERT INTO `region` VALUES ('410700000000', '4107', '41', '新乡市', '2', 'X', '157');
INSERT INTO `region` VALUES ('410701000000', '410701', '4107', '市辖区', '3', 'S', '1575');
INSERT INTO `region` VALUES ('410702000000', '410702', '4107', '红旗区', '3', 'H', '1576');
INSERT INTO `region` VALUES ('410703000000', '410703', '4107', '卫滨区', '3', 'W', '1577');
INSERT INTO `region` VALUES ('410704000000', '410704', '4107', '凤泉区', '3', 'F', '1578');
INSERT INTO `region` VALUES ('410711000000', '410711', '4107', '牧野区', '3', 'M', '1579');
INSERT INTO `region` VALUES ('410721000000', '410721', '4107', '新乡县', '3', 'X', '1580');
INSERT INTO `region` VALUES ('410724000000', '410724', '4107', '获嘉县', '3', 'H', '1581');
INSERT INTO `region` VALUES ('410725000000', '410725', '4107', '原阳县', '3', 'Y', '1582');
INSERT INTO `region` VALUES ('410726000000', '410726', '4107', '延津县', '3', 'Y', '1583');
INSERT INTO `region` VALUES ('410727000000', '410727', '4107', '封丘县', '3', 'F', '1584');
INSERT INTO `region` VALUES ('410728000000', '410728', '4107', '长垣县', '3', 'C', '1585');
INSERT INTO `region` VALUES ('410781000000', '410781', '4107', '卫辉市', '3', 'W', '1586');
INSERT INTO `region` VALUES ('410782000000', '410782', '4107', '辉县市', '3', 'H', '1587');
INSERT INTO `region` VALUES ('410800000000', '4108', '41', '焦作市', '2', 'J', '158');
INSERT INTO `region` VALUES ('410801000000', '410801', '4108', '市辖区', '3', 'S', '1588');
INSERT INTO `region` VALUES ('410802000000', '410802', '4108', '解放区', '3', 'J', '1589');
INSERT INTO `region` VALUES ('410803000000', '410803', '4108', '中站区', '3', 'Z', '1590');
INSERT INTO `region` VALUES ('410804000000', '410804', '4108', '马村区', '3', 'M', '1591');
INSERT INTO `region` VALUES ('410811000000', '410811', '4108', '山阳区', '3', 'S', '1592');
INSERT INTO `region` VALUES ('410821000000', '410821', '4108', '修武县', '3', 'X', '1593');
INSERT INTO `region` VALUES ('410822000000', '410822', '4108', '博爱县', '3', 'B', '1594');
INSERT INTO `region` VALUES ('410823000000', '410823', '4108', '武陟县', '3', 'W', '1595');
INSERT INTO `region` VALUES ('410825000000', '410825', '4108', '温县', '3', 'W', '1596');
INSERT INTO `region` VALUES ('410882000000', '410882', '4108', '沁阳市', '3', 'Q', '1597');
INSERT INTO `region` VALUES ('410883000000', '410883', '4108', '孟州市', '3', 'M', '1598');
INSERT INTO `region` VALUES ('410900000000', '4109', '41', '濮阳市', '2', 'Z', '159');
INSERT INTO `region` VALUES ('410901000000', '410901', '4109', '市辖区', '3', 'S', '1599');
INSERT INTO `region` VALUES ('410902000000', '410902', '4109', '华龙区', '3', 'H', '1600');
INSERT INTO `region` VALUES ('410922000000', '410922', '4109', '清丰县', '3', 'Q', '1601');
INSERT INTO `region` VALUES ('410923000000', '410923', '4109', '南乐县', '3', 'N', '1602');
INSERT INTO `region` VALUES ('410926000000', '410926', '4109', '范县', '3', 'F', '1603');
INSERT INTO `region` VALUES ('410927000000', '410927', '4109', '台前县', '3', 'T', '1604');
INSERT INTO `region` VALUES ('410928000000', '410928', '4109', '濮阳县', '3', 'Z', '1605');
INSERT INTO `region` VALUES ('411000000000', '4110', '41', '许昌市', '2', 'X', '160');
INSERT INTO `region` VALUES ('411001000000', '411001', '4110', '市辖区', '3', 'S', '1606');
INSERT INTO `region` VALUES ('411002000000', '411002', '4110', '魏都区', '3', 'W', '1607');
INSERT INTO `region` VALUES ('411023000000', '411023', '4110', '许昌县', '3', 'X', '1608');
INSERT INTO `region` VALUES ('411024000000', '411024', '4110', '鄢陵县', '3', 'Z', '1609');
INSERT INTO `region` VALUES ('411025000000', '411025', '4110', '襄城县', '3', 'X', '1610');
INSERT INTO `region` VALUES ('411081000000', '411081', '4110', '禹州市', '3', 'Y', '1611');
INSERT INTO `region` VALUES ('411082000000', '411082', '4110', '长葛市', '3', 'C', '1612');
INSERT INTO `region` VALUES ('411100000000', '4111', '41', '漯河市', '2', 'Z', '161');
INSERT INTO `region` VALUES ('411101000000', '411101', '4111', '市辖区', '3', 'S', '1613');
INSERT INTO `region` VALUES ('411102000000', '411102', '4111', '源汇区', '3', 'Y', '1614');
INSERT INTO `region` VALUES ('411103000000', '411103', '4111', '郾城区', '3', 'Z', '1615');
INSERT INTO `region` VALUES ('411104000000', '411104', '4111', '召陵区', '3', 'Z', '1616');
INSERT INTO `region` VALUES ('411121000000', '411121', '4111', '舞阳县', '3', 'W', '1617');
INSERT INTO `region` VALUES ('411122000000', '411122', '4111', '临颍县', '3', 'L', '1618');
INSERT INTO `region` VALUES ('411200000000', '4112', '41', '三门峡市', '2', 'S', '162');
INSERT INTO `region` VALUES ('411201000000', '411201', '4112', '市辖区', '3', 'S', '1619');
INSERT INTO `region` VALUES ('411202000000', '411202', '4112', '湖滨区', '3', 'H', '1620');
INSERT INTO `region` VALUES ('411221000000', '411221', '4112', '渑池县', '3', 'Z', '1621');
INSERT INTO `region` VALUES ('411222000000', '411222', '4112', '陕县', '3', 'S', '1622');
INSERT INTO `region` VALUES ('411224000000', '411224', '4112', '卢氏县', '3', 'L', '1623');
INSERT INTO `region` VALUES ('411281000000', '411281', '4112', '义马市', '3', 'Y', '1624');
INSERT INTO `region` VALUES ('411282000000', '411282', '4112', '灵宝市', '3', 'L', '1625');
INSERT INTO `region` VALUES ('411300000000', '4113', '41', '南阳市', '2', 'N', '163');
INSERT INTO `region` VALUES ('411301000000', '411301', '4113', '市辖区', '3', 'S', '1626');
INSERT INTO `region` VALUES ('411302000000', '411302', '4113', '宛城区', '3', 'W', '1627');
INSERT INTO `region` VALUES ('411303000000', '411303', '4113', '卧龙区', '3', 'W', '1628');
INSERT INTO `region` VALUES ('411321000000', '411321', '4113', '南召县', '3', 'N', '1629');
INSERT INTO `region` VALUES ('411322000000', '411322', '4113', '方城县', '3', 'F', '1630');
INSERT INTO `region` VALUES ('411323000000', '411323', '4113', '西峡县', '3', 'X', '1631');
INSERT INTO `region` VALUES ('411324000000', '411324', '4113', '镇平县', '3', 'Z', '1632');
INSERT INTO `region` VALUES ('411325000000', '411325', '4113', '内乡县', '3', 'N', '1633');
INSERT INTO `region` VALUES ('411326000000', '411326', '4113', '淅川县', '3', 'Z', '1634');
INSERT INTO `region` VALUES ('411327000000', '411327', '4113', '社旗县', '3', 'S', '1635');
INSERT INTO `region` VALUES ('411328000000', '411328', '4113', '唐河县', '3', 'T', '1636');
INSERT INTO `region` VALUES ('411329000000', '411329', '4113', '新野县', '3', 'X', '1637');
INSERT INTO `region` VALUES ('411330000000', '411330', '4113', '桐柏县', '3', 'T', '1638');
INSERT INTO `region` VALUES ('411381000000', '411381', '4113', '邓州市', '3', 'D', '1639');
INSERT INTO `region` VALUES ('411400000000', '4114', '41', '商丘市', '2', 'S', '164');
INSERT INTO `region` VALUES ('411401000000', '411401', '4114', '市辖区', '3', 'S', '1640');
INSERT INTO `region` VALUES ('411402000000', '411402', '4114', '梁园区', '3', 'L', '1641');
INSERT INTO `region` VALUES ('411403000000', '411403', '4114', '睢阳区', '3', 'Z', '1642');
INSERT INTO `region` VALUES ('411421000000', '411421', '4114', '民权县', '3', 'M', '1643');
INSERT INTO `region` VALUES ('411422000000', '411422', '4114', '睢县', '3', 'Z', '1644');
INSERT INTO `region` VALUES ('411423000000', '411423', '4114', '宁陵县', '3', 'N', '1645');
INSERT INTO `region` VALUES ('411424000000', '411424', '4114', '柘城县', '3', 'Z', '1646');
INSERT INTO `region` VALUES ('411425000000', '411425', '4114', '虞城县', '3', 'Y', '1647');
INSERT INTO `region` VALUES ('411426000000', '411426', '4114', '夏邑县', '3', 'X', '1648');
INSERT INTO `region` VALUES ('411481000000', '411481', '4114', '永城市', '3', 'Y', '1649');
INSERT INTO `region` VALUES ('411500000000', '4115', '41', '信阳市', '2', 'X', '165');
INSERT INTO `region` VALUES ('411501000000', '411501', '4115', '市辖区', '3', 'S', '1650');
INSERT INTO `region` VALUES ('411502000000', '411502', '4115', '浉河区', '3', 'S', '1651');
INSERT INTO `region` VALUES ('411503000000', '411503', '4115', '平桥区', '3', 'P', '1652');
INSERT INTO `region` VALUES ('411521000000', '411521', '4115', '罗山县', '3', 'L', '1653');
INSERT INTO `region` VALUES ('411522000000', '411522', '4115', '光山县', '3', 'G', '1654');
INSERT INTO `region` VALUES ('411523000000', '411523', '4115', '新县', '3', 'X', '1655');
INSERT INTO `region` VALUES ('411524000000', '411524', '4115', '商城县', '3', 'S', '1656');
INSERT INTO `region` VALUES ('411525000000', '411525', '4115', '固始县', '3', 'G', '1657');
INSERT INTO `region` VALUES ('411526000000', '411526', '4115', '潢川县', '3', 'Z', '1658');
INSERT INTO `region` VALUES ('411527000000', '411527', '4115', '淮滨县', '3', 'H', '1659');
INSERT INTO `region` VALUES ('411528000000', '411528', '4115', '息县', '3', 'X', '1660');
INSERT INTO `region` VALUES ('411600000000', '4116', '41', '周口市', '2', 'Z', '166');
INSERT INTO `region` VALUES ('411601000000', '411601', '4116', '市辖区', '3', 'S', '1661');
INSERT INTO `region` VALUES ('411602000000', '411602', '4116', '川汇区', '3', 'C', '1662');
INSERT INTO `region` VALUES ('411621000000', '411621', '4116', '扶沟县', '3', 'F', '1663');
INSERT INTO `region` VALUES ('411622000000', '411622', '4116', '西华县', '3', 'X', '1664');
INSERT INTO `region` VALUES ('411623000000', '411623', '4116', '商水县', '3', 'S', '1665');
INSERT INTO `region` VALUES ('411624000000', '411624', '4116', '沈丘县', '3', 'S', '1666');
INSERT INTO `region` VALUES ('411625000000', '411625', '4116', '郸城县', '3', 'D', '1667');
INSERT INTO `region` VALUES ('411626000000', '411626', '4116', '淮阳县', '3', 'H', '1668');
INSERT INTO `region` VALUES ('411627000000', '411627', '4116', '太康县', '3', 'T', '1669');
INSERT INTO `region` VALUES ('411628000000', '411628', '4116', '鹿邑县', '3', 'L', '1670');
INSERT INTO `region` VALUES ('411681000000', '411681', '4116', '项城市', '3', 'X', '1671');
INSERT INTO `region` VALUES ('411700000000', '4117', '41', '驻马店市', '2', 'Z', '167');
INSERT INTO `region` VALUES ('411701000000', '411701', '4117', '市辖区', '3', 'S', '1672');
INSERT INTO `region` VALUES ('411702000000', '411702', '4117', '驿城区', '3', 'Z', '1673');
INSERT INTO `region` VALUES ('411721000000', '411721', '4117', '西平县', '3', 'X', '1674');
INSERT INTO `region` VALUES ('411722000000', '411722', '4117', '上蔡县', '3', 'S', '1675');
INSERT INTO `region` VALUES ('411723000000', '411723', '4117', '平舆县', '3', 'P', '1676');
INSERT INTO `region` VALUES ('411724000000', '411724', '4117', '正阳县', '3', 'Z', '1677');
INSERT INTO `region` VALUES ('411725000000', '411725', '4117', '确山县', '3', 'Q', '1678');
INSERT INTO `region` VALUES ('411726000000', '411726', '4117', '泌阳县', '3', 'M', '1679');
INSERT INTO `region` VALUES ('411727000000', '411727', '4117', '汝南县', '3', 'R', '1680');
INSERT INTO `region` VALUES ('411728000000', '411728', '4117', '遂平县', '3', 'S', '1681');
INSERT INTO `region` VALUES ('411729000000', '411729', '4117', '新蔡县', '3', 'X', '1682');
INSERT INTO `region` VALUES ('419000000000', '4190', '41', '省直辖县级行政区划', '2', 'S', '168');
INSERT INTO `region` VALUES ('419001000000', '419001', '4190', '济源市', '3', 'J', '1683');
INSERT INTO `region` VALUES ('420000000000', '42', 'root', '湖北省', '1', 'H', '16');
INSERT INTO `region` VALUES ('420100000000', '4201', '42', '武汉市', '2', 'W', '169');
INSERT INTO `region` VALUES ('420101000000', '420101', '4201', '市辖区', '3', 'S', '1684');
INSERT INTO `region` VALUES ('420102000000', '420102', '4201', '江岸区', '3', 'J', '1685');
INSERT INTO `region` VALUES ('420103000000', '420103', '4201', '武汉市江汉区', '3', 'W', '1686');
INSERT INTO `region` VALUES ('420104000000', '420104', '4201', '硚口区', '3', 'C', '1687');
INSERT INTO `region` VALUES ('420105000000', '420105', '4201', '汉阳区', '3', 'H', '1688');
INSERT INTO `region` VALUES ('420106000000', '420106', '4201', '武昌区', '3', 'W', '1689');
INSERT INTO `region` VALUES ('420107000000', '420107', '4201', '青山区', '3', 'Q', '1690');
INSERT INTO `region` VALUES ('420111000000', '420111', '4201', '洪山区', '3', 'H', '1691');
INSERT INTO `region` VALUES ('420112000000', '420112', '4201', '东西湖区', '3', 'D', '1692');
INSERT INTO `region` VALUES ('420113000000', '420113', '4201', '汉南区', '3', 'H', '1693');
INSERT INTO `region` VALUES ('420114000000', '420114', '4201', '蔡甸区', '3', 'C', '1694');
INSERT INTO `region` VALUES ('420115000000', '420115', '4201', '江夏区', '3', 'J', '1695');
INSERT INTO `region` VALUES ('420116000000', '420116', '4201', '黄陂区', '3', 'H', '1696');
INSERT INTO `region` VALUES ('420117000000', '420117', '4201', '新洲区', '3', 'X', '1697');
INSERT INTO `region` VALUES ('420200000000', '4202', '42', '黄石市', '2', 'H', '170');
INSERT INTO `region` VALUES ('420201000000', '420201', '4202', '市辖区', '3', 'S', '1698');
INSERT INTO `region` VALUES ('420202000000', '420202', '4202', '黄石港区', '3', 'H', '1699');
INSERT INTO `region` VALUES ('420203000000', '420203', '4202', '西塞山区', '3', 'X', '1700');
INSERT INTO `region` VALUES ('420204000000', '420204', '4202', '下陆区', '3', 'X', '1701');
INSERT INTO `region` VALUES ('420205000000', '420205', '4202', '铁山区', '3', 'T', '1702');
INSERT INTO `region` VALUES ('420222000000', '420222', '4202', '阳新县', '3', 'Y', '1703');
INSERT INTO `region` VALUES ('420281000000', '420281', '4202', '大冶市', '3', 'D', '1704');
INSERT INTO `region` VALUES ('420300000000', '4203', '42', '十堰市', '2', 'S', '171');
INSERT INTO `region` VALUES ('420301000000', '420301', '4203', '市辖区', '3', 'S', '1705');
INSERT INTO `region` VALUES ('420302000000', '420302', '4203', '茅箭区', '3', 'M', '1706');
INSERT INTO `region` VALUES ('420303000000', '420303', '4203', '张湾区', '3', 'Z', '1707');
INSERT INTO `region` VALUES ('420321000000', '420321', '4203', '郧县', '3', 'Y', '1708');
INSERT INTO `region` VALUES ('420322000000', '420322', '4203', '郧西县', '3', 'Y', '1709');
INSERT INTO `region` VALUES ('420323000000', '420323', '4203', '竹山县', '3', 'Z', '1710');
INSERT INTO `region` VALUES ('420324000000', '420324', '4203', '竹溪县', '3', 'Z', '1711');
INSERT INTO `region` VALUES ('420325000000', '420325', '4203', '房县', '3', 'F', '1712');
INSERT INTO `region` VALUES ('420381000000', '420381', '4203', '丹江口市', '3', 'D', '1713');
INSERT INTO `region` VALUES ('420500000000', '4205', '42', '宜昌市', '2', 'Y', '172');
INSERT INTO `region` VALUES ('420501000000', '420501', '4205', '市辖区', '3', 'S', '1714');
INSERT INTO `region` VALUES ('420502000000', '420502', '4205', '西陵区', '3', 'X', '1715');
INSERT INTO `region` VALUES ('420503000000', '420503', '4205', '伍家岗区', '3', 'W', '1716');
INSERT INTO `region` VALUES ('420504000000', '420504', '4205', '点军区', '3', 'D', '1717');
INSERT INTO `region` VALUES ('420505000000', '420505', '4205', '猇亭区', '3', 'X', '1718');
INSERT INTO `region` VALUES ('420506000000', '420506', '4205', '夷陵区', '3', 'Y', '1719');
INSERT INTO `region` VALUES ('420525000000', '420525', '4205', '远安县', '3', 'Y', '1720');
INSERT INTO `region` VALUES ('420526000000', '420526', '4205', '兴山县', '3', 'X', '1721');
INSERT INTO `region` VALUES ('420527000000', '420527', '4205', '秭归县', '3', 'Z', '1722');
INSERT INTO `region` VALUES ('420528000000', '420528', '4205', '长阳土家族自治县', '3', 'C', '1723');
INSERT INTO `region` VALUES ('420529000000', '420529', '4205', '五峰土家族自治县', '3', 'W', '1724');
INSERT INTO `region` VALUES ('420581000000', '420581', '4205', '宜都市', '3', 'Y', '1725');
INSERT INTO `region` VALUES ('420582000000', '420582', '4205', '当阳市', '3', 'D', '1726');
INSERT INTO `region` VALUES ('420583000000', '420583', '4205', '枝江市', '3', 'Z', '1727');
INSERT INTO `region` VALUES ('420600000000', '4206', '42', '襄樊市', '2', 'X', '173');
INSERT INTO `region` VALUES ('420601000000', '420601', '4206', '市辖区', '3', 'S', '1728');
INSERT INTO `region` VALUES ('420602000000', '420602', '4206', '襄城区', '3', 'X', '1729');
INSERT INTO `region` VALUES ('420606000000', '420606', '4206', '樊城区', '3', 'F', '1730');
INSERT INTO `region` VALUES ('420607000000', '420607', '4206', '襄阳区', '3', 'X', '1731');
INSERT INTO `region` VALUES ('420624000000', '420624', '4206', '南漳县', '3', 'N', '1732');
INSERT INTO `region` VALUES ('420625000000', '420625', '4206', '谷城县', '3', 'G', '1733');
INSERT INTO `region` VALUES ('420626000000', '420626', '4206', '保康县', '3', 'B', '1734');
INSERT INTO `region` VALUES ('420682000000', '420682', '4206', '老河口市', '3', 'L', '1735');
INSERT INTO `region` VALUES ('420683000000', '420683', '4206', '枣阳市', '3', 'Z', '1736');
INSERT INTO `region` VALUES ('420684000000', '420684', '4206', '宜城市', '3', 'Y', '1737');
INSERT INTO `region` VALUES ('420700000000', '4207', '42', '鄂州市', '2', 'E', '174');
INSERT INTO `region` VALUES ('420701000000', '420701', '4207', '市辖区', '3', 'S', '1738');
INSERT INTO `region` VALUES ('420702000000', '420702', '4207', '梁子湖区', '3', 'L', '1739');
INSERT INTO `region` VALUES ('420703000000', '420703', '4207', '华容区', '3', 'H', '1740');
INSERT INTO `region` VALUES ('420704000000', '420704', '4207', '鄂城区', '3', 'E', '1741');
INSERT INTO `region` VALUES ('420800000000', '4208', '42', '荆门市', '2', 'J', '175');
INSERT INTO `region` VALUES ('420801000000', '420801', '4208', '市辖区', '3', 'S', '1742');
INSERT INTO `region` VALUES ('420802000000', '420802', '4208', '东宝区', '3', 'D', '1743');
INSERT INTO `region` VALUES ('420804000000', '420804', '4208', '掇刀区', '3', 'D', '1744');
INSERT INTO `region` VALUES ('420821000000', '420821', '4208', '京山县', '3', 'J', '1745');
INSERT INTO `region` VALUES ('420822000000', '420822', '4208', '沙洋县', '3', 'S', '1746');
INSERT INTO `region` VALUES ('420881000000', '420881', '4208', '钟祥市', '3', 'Z', '1747');
INSERT INTO `region` VALUES ('420900000000', '4209', '42', '孝感市', '2', 'X', '176');
INSERT INTO `region` VALUES ('420901000000', '420901', '4209', '市辖区', '3', 'S', '1748');
INSERT INTO `region` VALUES ('420902000000', '420902', '4209', '孝南区', '3', 'X', '1749');
INSERT INTO `region` VALUES ('420921000000', '420921', '4209', '孝昌县', '3', 'X', '1750');
INSERT INTO `region` VALUES ('420922000000', '420922', '4209', '大悟县', '3', 'D', '1751');
INSERT INTO `region` VALUES ('420923000000', '420923', '4209', '云梦县', '3', 'Y', '1752');
INSERT INTO `region` VALUES ('420981000000', '420981', '4209', '应城市', '3', 'Y', '1753');
INSERT INTO `region` VALUES ('420982000000', '420982', '4209', '安陆市', '3', 'A', '1754');
INSERT INTO `region` VALUES ('420984000000', '420984', '4209', '汉川市', '3', 'H', '1755');
INSERT INTO `region` VALUES ('421000000000', '4210', '42', '荆州市', '2', 'J', '177');
INSERT INTO `region` VALUES ('421001000000', '421001', '4210', '市辖区', '3', 'S', '1756');
INSERT INTO `region` VALUES ('421002000000', '421002', '4210', '沙市区', '3', 'S', '1757');
INSERT INTO `region` VALUES ('421003000000', '421003', '4210', '荆州区', '3', 'J', '1758');
INSERT INTO `region` VALUES ('421022000000', '421022', '4210', '公安县', '3', 'G', '1759');
INSERT INTO `region` VALUES ('421023000000', '421023', '4210', '监利县', '3', 'J', '1760');
INSERT INTO `region` VALUES ('421024000000', '421024', '4210', '江陵县', '3', 'J', '1761');
INSERT INTO `region` VALUES ('421081000000', '421081', '4210', '石首市', '3', 'S', '1762');
INSERT INTO `region` VALUES ('421083000000', '421083', '4210', '洪湖市', '3', 'H', '1763');
INSERT INTO `region` VALUES ('421087000000', '421087', '4210', '松滋市', '3', 'S', '1764');
INSERT INTO `region` VALUES ('421100000000', '4211', '42', '黄冈市', '2', 'H', '178');
INSERT INTO `region` VALUES ('421101000000', '421101', '4211', '市辖区', '3', 'S', '1765');
INSERT INTO `region` VALUES ('421102000000', '421102', '4211', '黄州区', '3', 'H', '1766');
INSERT INTO `region` VALUES ('421121000000', '421121', '4211', '团风县', '3', 'T', '1767');
INSERT INTO `region` VALUES ('421122000000', '421122', '4211', '红安县', '3', 'H', '1768');
INSERT INTO `region` VALUES ('421123000000', '421123', '4211', '罗田县', '3', 'L', '1769');
INSERT INTO `region` VALUES ('421124000000', '421124', '4211', '英山县', '3', 'Y', '1770');
INSERT INTO `region` VALUES ('421125000000', '421125', '4211', '浠水县', '3', 'Z', '1771');
INSERT INTO `region` VALUES ('421126000000', '421126', '4211', '蕲春县', '3', 'Z', '1772');
INSERT INTO `region` VALUES ('421127000000', '421127', '4211', '黄梅县', '3', 'H', '1773');
INSERT INTO `region` VALUES ('421181000000', '421181', '4211', '麻城市', '3', 'M', '1774');
INSERT INTO `region` VALUES ('421182000000', '421182', '4211', '武穴市', '3', 'W', '1775');
INSERT INTO `region` VALUES ('421200000000', '4212', '42', '咸宁市', '2', 'X', '179');
INSERT INTO `region` VALUES ('421201000000', '421201', '4212', '市辖区', '3', 'S', '1776');
INSERT INTO `region` VALUES ('421202000000', '421202', '4212', '咸安区', '3', 'X', '1777');
INSERT INTO `region` VALUES ('421221000000', '421221', '4212', '嘉鱼县', '3', 'J', '1778');
INSERT INTO `region` VALUES ('421222000000', '421222', '4212', '通城县', '3', 'T', '1779');
INSERT INTO `region` VALUES ('421223000000', '421223', '4212', '崇阳县', '3', 'C', '1780');
INSERT INTO `region` VALUES ('421224000000', '421224', '4212', '通山县', '3', 'T', '1781');
INSERT INTO `region` VALUES ('421281000000', '421281', '4212', '赤壁市', '3', 'C', '1782');
INSERT INTO `region` VALUES ('421300000000', '4213', '42', '随州市', '2', 'S', '180');
INSERT INTO `region` VALUES ('421301000000', '421301', '4213', '市辖区', '3', 'S', '1783');
INSERT INTO `region` VALUES ('421303000000', '421303', '4213', '曾都区', '3', 'Z', '1784');
INSERT INTO `region` VALUES ('421321000000', '421321', '4213', '随县', '3', 'S', '1785');
INSERT INTO `region` VALUES ('421381000000', '421381', '4213', '广水市', '3', 'G', '1786');
INSERT INTO `region` VALUES ('422800000000', '4228', '42', '恩施土家族苗族自治州', '2', 'E', '181');
INSERT INTO `region` VALUES ('422801000000', '422801', '4228', '恩施市', '3', 'E', '1787');
INSERT INTO `region` VALUES ('422802000000', '422802', '4228', '利川市', '3', 'L', '1788');
INSERT INTO `region` VALUES ('422822000000', '422822', '4228', '建始县', '3', 'J', '1789');
INSERT INTO `region` VALUES ('422823000000', '422823', '4228', '巴东县', '3', 'B', '1790');
INSERT INTO `region` VALUES ('422825000000', '422825', '4228', '宣恩县', '3', 'X', '1791');
INSERT INTO `region` VALUES ('422826000000', '422826', '4228', '咸丰县', '3', 'X', '1792');
INSERT INTO `region` VALUES ('422827000000', '422827', '4228', '来凤县', '3', 'L', '1793');
INSERT INTO `region` VALUES ('422828000000', '422828', '4228', '鹤峰县', '3', 'H', '1794');
INSERT INTO `region` VALUES ('429000000000', '4290', '42', '省直辖县级行政区划', '2', 'S', '182');
INSERT INTO `region` VALUES ('429004000000', '429004', '4290', '仙桃市', '3', 'X', '1795');
INSERT INTO `region` VALUES ('429005000000', '429005', '4290', '潜江市', '3', 'Q', '1796');
INSERT INTO `region` VALUES ('429006000000', '429006', '4290', '天门市', '3', 'T', '1797');
INSERT INTO `region` VALUES ('429021000000', '429021', '4290', '神农架林区', '3', 'S', '1798');
INSERT INTO `region` VALUES ('430000000000', '43', 'root', '湖南省', '1', 'H', '17');
INSERT INTO `region` VALUES ('430100000000', '4301', '43', '长沙市', '2', 'C', '183');
INSERT INTO `region` VALUES ('430101000000', '430101', '4301', '市辖区', '3', 'S', '1799');
INSERT INTO `region` VALUES ('430102000000', '430102', '4301', '芙蓉区', '3', 'Z', '1800');
INSERT INTO `region` VALUES ('430103000000', '430103', '4301', '天心区', '3', 'T', '1801');
INSERT INTO `region` VALUES ('430104000000', '430104', '4301', '岳麓区', '3', 'Y', '1802');
INSERT INTO `region` VALUES ('430105000000', '430105', '4301', '开福区', '3', 'K', '1803');
INSERT INTO `region` VALUES ('430111000000', '430111', '4301', '雨花区', '3', 'Y', '1804');
INSERT INTO `region` VALUES ('430121000000', '430121', '4301', '长沙县', '3', 'C', '1805');
INSERT INTO `region` VALUES ('430122000000', '430122', '4301', '望城县', '3', 'W', '1806');
INSERT INTO `region` VALUES ('430124000000', '430124', '4301', '宁乡县', '3', 'N', '1807');
INSERT INTO `region` VALUES ('430181000000', '430181', '4301', '浏阳市', '3', 'Z', '1808');
INSERT INTO `region` VALUES ('430200000000', '4302', '43', '株洲市', '2', 'Z', '184');
INSERT INTO `region` VALUES ('430201000000', '430201', '4302', '市辖区', '3', 'S', '1809');
INSERT INTO `region` VALUES ('430202000000', '430202', '4302', '荷塘区', '3', 'H', '1810');
INSERT INTO `region` VALUES ('430203000000', '430203', '4302', '芦淞区', '3', 'L', '1811');
INSERT INTO `region` VALUES ('430204000000', '430204', '4302', '石峰区', '3', 'S', '1812');
INSERT INTO `region` VALUES ('430211000000', '430211', '4302', '天元区', '3', 'T', '1813');
INSERT INTO `region` VALUES ('430221000000', '430221', '4302', '株洲县', '3', 'Z', '1814');
INSERT INTO `region` VALUES ('430223000000', '430223', '4302', '攸县', '3', 'Z', '1815');
INSERT INTO `region` VALUES ('430224000000', '430224', '4302', '茶陵县', '3', 'C', '1816');
INSERT INTO `region` VALUES ('430225000000', '430225', '4302', '炎陵县', '3', 'Y', '1817');
INSERT INTO `region` VALUES ('430281000000', '430281', '4302', '醴陵市', '3', 'Z', '1818');
INSERT INTO `region` VALUES ('430300000000', '4303', '43', '湘潭市', '2', 'X', '185');
INSERT INTO `region` VALUES ('430301000000', '430301', '4303', '市辖区', '3', 'S', '1819');
INSERT INTO `region` VALUES ('430302000000', '430302', '4303', '雨湖区', '3', 'Y', '1820');
INSERT INTO `region` VALUES ('430304000000', '430304', '4303', '岳塘区', '3', 'Y', '1821');
INSERT INTO `region` VALUES ('430321000000', '430321', '4303', '湘潭县', '3', 'X', '1822');
INSERT INTO `region` VALUES ('430381000000', '430381', '4303', '湘乡市', '3', 'X', '1823');
INSERT INTO `region` VALUES ('430382000000', '430382', '4303', '韶山市', '3', 'S', '1824');
INSERT INTO `region` VALUES ('430400000000', '4304', '43', '衡阳市', '2', 'H', '186');
INSERT INTO `region` VALUES ('430401000000', '430401', '4304', '市辖区', '3', 'S', '1825');
INSERT INTO `region` VALUES ('430405000000', '430405', '4304', '珠晖区', '3', 'Z', '1826');
INSERT INTO `region` VALUES ('430406000000', '430406', '4304', '雁峰区', '3', 'Y', '1827');
INSERT INTO `region` VALUES ('430407000000', '430407', '4304', '石鼓区', '3', 'S', '1828');
INSERT INTO `region` VALUES ('430408000000', '430408', '4304', '蒸湘区', '3', 'Z', '1829');
INSERT INTO `region` VALUES ('430412000000', '430412', '4304', '南岳区', '3', 'N', '1830');
INSERT INTO `region` VALUES ('430421000000', '430421', '4304', '衡阳县', '3', 'H', '1831');
INSERT INTO `region` VALUES ('430422000000', '430422', '4304', '衡南县', '3', 'H', '1832');
INSERT INTO `region` VALUES ('430423000000', '430423', '4304', '衡山县', '3', 'H', '1833');
INSERT INTO `region` VALUES ('430424000000', '430424', '4304', '衡东县', '3', 'H', '1834');
INSERT INTO `region` VALUES ('430426000000', '430426', '4304', '祁东县', '3', 'Q', '1835');
INSERT INTO `region` VALUES ('430481000000', '430481', '4304', '耒阳市', '3', 'Z', '1836');
INSERT INTO `region` VALUES ('430482000000', '430482', '4304', '常宁市', '3', 'C', '1837');
INSERT INTO `region` VALUES ('430500000000', '4305', '43', '邵阳市', '2', 'S', '187');
INSERT INTO `region` VALUES ('430501000000', '430501', '4305', '市辖区', '3', 'S', '1838');
INSERT INTO `region` VALUES ('430502000000', '430502', '4305', '双清区', '3', 'S', '1839');
INSERT INTO `region` VALUES ('430503000000', '430503', '4305', '大祥区', '3', 'D', '1840');
INSERT INTO `region` VALUES ('430511000000', '430511', '4305', '北塔区', '3', 'B', '1841');
INSERT INTO `region` VALUES ('430521000000', '430521', '4305', '邵东县', '3', 'S', '1842');
INSERT INTO `region` VALUES ('430522000000', '430522', '4305', '新邵县', '3', 'X', '1843');
INSERT INTO `region` VALUES ('430523000000', '430523', '4305', '邵阳县', '3', 'S', '1844');
INSERT INTO `region` VALUES ('430524000000', '430524', '4305', '隆回县', '3', 'L', '1845');
INSERT INTO `region` VALUES ('430525000000', '430525', '4305', '洞口县', '3', 'D', '1846');
INSERT INTO `region` VALUES ('430527000000', '430527', '4305', '绥宁县', '3', 'S', '1847');
INSERT INTO `region` VALUES ('430528000000', '430528', '4305', '新宁县', '3', 'X', '1848');
INSERT INTO `region` VALUES ('430529000000', '430529', '4305', '城步苗族自治县', '3', 'C', '1849');
INSERT INTO `region` VALUES ('430581000000', '430581', '4305', '武冈市', '3', 'W', '1850');
INSERT INTO `region` VALUES ('430600000000', '4306', '43', '岳阳市', '2', 'Y', '188');
INSERT INTO `region` VALUES ('430601000000', '430601', '4306', '市辖区', '3', 'S', '1851');
INSERT INTO `region` VALUES ('430602000000', '430602', '4306', '岳阳楼区', '3', 'Y', '1852');
INSERT INTO `region` VALUES ('430603000000', '430603', '4306', '云溪区', '3', 'Y', '1853');
INSERT INTO `region` VALUES ('430611000000', '430611', '4306', '君山区', '3', 'J', '1854');
INSERT INTO `region` VALUES ('430621000000', '430621', '4306', '岳阳县', '3', 'Y', '1855');
INSERT INTO `region` VALUES ('430623000000', '430623', '4306', '华容县', '3', 'H', '1856');
INSERT INTO `region` VALUES ('430624000000', '430624', '4306', '湘阴县', '3', 'X', '1857');
INSERT INTO `region` VALUES ('430626000000', '430626', '4306', '平江县', '3', 'P', '1858');
INSERT INTO `region` VALUES ('430681000000', '430681', '4306', '汨罗市', '3', 'Z', '1859');
INSERT INTO `region` VALUES ('430682000000', '430682', '4306', '临湘市', '3', 'L', '1860');
INSERT INTO `region` VALUES ('430700000000', '4307', '43', '常德市', '2', 'C', '189');
INSERT INTO `region` VALUES ('430701000000', '430701', '4307', '市辖区', '3', 'S', '1861');
INSERT INTO `region` VALUES ('430702000000', '430702', '4307', '武陵区', '3', 'W', '1862');
INSERT INTO `region` VALUES ('430703000000', '430703', '4307', '鼎城区', '3', 'D', '1863');
INSERT INTO `region` VALUES ('430721000000', '430721', '4307', '安乡县', '3', 'A', '1864');
INSERT INTO `region` VALUES ('430722000000', '430722', '4307', '汉寿县', '3', 'H', '1865');
INSERT INTO `region` VALUES ('430723000000', '430723', '4307', '澧县', '3', 'Z', '1866');
INSERT INTO `region` VALUES ('430724000000', '430724', '4307', '临澧县', '3', 'L', '1867');
INSERT INTO `region` VALUES ('430725000000', '430725', '4307', '桃源县', '3', 'T', '1868');
INSERT INTO `region` VALUES ('430726000000', '430726', '4307', '石门县', '3', 'S', '1869');
INSERT INTO `region` VALUES ('430781000000', '430781', '4307', '津市市', '3', 'J', '1870');
INSERT INTO `region` VALUES ('430800000000', '4308', '43', '张家界市', '2', 'Z', '190');
INSERT INTO `region` VALUES ('430801000000', '430801', '4308', '市辖区', '3', 'S', '1871');
INSERT INTO `region` VALUES ('430802000000', '430802', '4308', '永定区', '3', 'Y', '1872');
INSERT INTO `region` VALUES ('430811000000', '430811', '4308', '武陵源区', '3', 'W', '1873');
INSERT INTO `region` VALUES ('430821000000', '430821', '4308', '慈利县', '3', 'C', '1874');
INSERT INTO `region` VALUES ('430822000000', '430822', '4308', '桑植县', '3', 'S', '1875');
INSERT INTO `region` VALUES ('430900000000', '4309', '43', '益阳市', '2', 'Y', '191');
INSERT INTO `region` VALUES ('430901000000', '430901', '4309', '市辖区', '3', 'S', '1876');
INSERT INTO `region` VALUES ('430902000000', '430902', '4309', '资阳区', '3', 'Z', '1877');
INSERT INTO `region` VALUES ('430903000000', '430903', '4309', '赫山区', '3', 'H', '1878');
INSERT INTO `region` VALUES ('430921000000', '430921', '4309', '南县', '3', 'N', '1879');
INSERT INTO `region` VALUES ('430922000000', '430922', '4309', '桃江县', '3', 'T', '1880');
INSERT INTO `region` VALUES ('430923000000', '430923', '4309', '安化县', '3', 'A', '1881');
INSERT INTO `region` VALUES ('430981000000', '430981', '4309', '沅江市', '3', 'Z', '1882');
INSERT INTO `region` VALUES ('431000000000', '4310', '43', '郴州市', '2', 'C', '192');
INSERT INTO `region` VALUES ('431001000000', '431001', '4310', '市辖区', '3', 'S', '1883');
INSERT INTO `region` VALUES ('431002000000', '431002', '4310', '北湖区', '3', 'B', '1884');
INSERT INTO `region` VALUES ('431003000000', '431003', '4310', '苏仙区', '3', 'S', '1885');
INSERT INTO `region` VALUES ('431021000000', '431021', '4310', '桂阳县', '3', 'G', '1886');
INSERT INTO `region` VALUES ('431022000000', '431022', '4310', '宜章县', '3', 'Y', '1887');
INSERT INTO `region` VALUES ('431023000000', '431023', '4310', '永兴县', '3', 'Y', '1888');
INSERT INTO `region` VALUES ('431024000000', '431024', '4310', '嘉禾县', '3', 'J', '1889');
INSERT INTO `region` VALUES ('431025000000', '431025', '4310', '临武县', '3', 'L', '1890');
INSERT INTO `region` VALUES ('431026000000', '431026', '4310', '汝城县', '3', 'R', '1891');
INSERT INTO `region` VALUES ('431027000000', '431027', '4310', '桂东县', '3', 'G', '1892');
INSERT INTO `region` VALUES ('431028000000', '431028', '4310', '安仁县', '3', 'A', '1893');
INSERT INTO `region` VALUES ('431081000000', '431081', '4310', '资兴市', '3', 'Z', '1894');
INSERT INTO `region` VALUES ('431100000000', '4311', '43', '永州市', '2', 'Y', '193');
INSERT INTO `region` VALUES ('431101000000', '431101', '4311', '市辖区', '3', 'S', '1895');
INSERT INTO `region` VALUES ('431102000000', '431102', '4311', '零陵区', '3', 'L', '1896');
INSERT INTO `region` VALUES ('431103000000', '431103', '4311', '冷水滩区', '3', 'L', '1897');
INSERT INTO `region` VALUES ('431121000000', '431121', '4311', '祁阳县', '3', 'Q', '1898');
INSERT INTO `region` VALUES ('431122000000', '431122', '4311', '东安县', '3', 'D', '1899');
INSERT INTO `region` VALUES ('431123000000', '431123', '4311', '双牌县', '3', 'S', '1900');
INSERT INTO `region` VALUES ('431124000000', '431124', '4311', '道县', '3', 'D', '1901');
INSERT INTO `region` VALUES ('431125000000', '431125', '4311', '江永县', '3', 'J', '1902');
INSERT INTO `region` VALUES ('431126000000', '431126', '4311', '宁远县', '3', 'N', '1903');
INSERT INTO `region` VALUES ('431127000000', '431127', '4311', '蓝山县', '3', 'L', '1904');
INSERT INTO `region` VALUES ('431128000000', '431128', '4311', '新田县', '3', 'X', '1905');
INSERT INTO `region` VALUES ('431129000000', '431129', '4311', '江华瑶族自治县', '3', 'J', '1906');
INSERT INTO `region` VALUES ('431200000000', '4312', '43', '怀化市', '2', 'H', '194');
INSERT INTO `region` VALUES ('431201000000', '431201', '4312', '市辖区', '3', 'S', '1907');
INSERT INTO `region` VALUES ('431202000000', '431202', '4312', '鹤城区', '3', 'H', '1908');
INSERT INTO `region` VALUES ('431221000000', '431221', '4312', '中方县', '3', 'Z', '1909');
INSERT INTO `region` VALUES ('431222000000', '431222', '4312', '沅陵县', '3', 'Z', '1910');
INSERT INTO `region` VALUES ('431223000000', '431223', '4312', '辰溪县', '3', 'C', '1911');
INSERT INTO `region` VALUES ('431224000000', '431224', '4312', '溆浦县', '3', 'Z', '1912');
INSERT INTO `region` VALUES ('431225000000', '431225', '4312', '会同县', '3', 'H', '1913');
INSERT INTO `region` VALUES ('431226000000', '431226', '4312', '麻阳苗族自治县', '3', 'M', '1914');
INSERT INTO `region` VALUES ('431227000000', '431227', '4312', '新晃侗族自治县', '3', 'X', '1915');
INSERT INTO `region` VALUES ('431228000000', '431228', '4312', '芷江侗族自治县', '3', 'Z', '1916');
INSERT INTO `region` VALUES ('431229000000', '431229', '4312', '靖州苗族侗族自治县', '3', 'J', '1917');
INSERT INTO `region` VALUES ('431230000000', '431230', '4312', '通道侗族自治县', '3', 'T', '1918');
INSERT INTO `region` VALUES ('431281000000', '431281', '4312', '洪江市', '3', 'H', '1919');
INSERT INTO `region` VALUES ('431300000000', '4313', '43', '娄底市', '2', 'L', '195');
INSERT INTO `region` VALUES ('431301000000', '431301', '4313', '市辖区', '3', 'S', '1920');
INSERT INTO `region` VALUES ('431302000000', '431302', '4313', '娄星区', '3', 'L', '1921');
INSERT INTO `region` VALUES ('431321000000', '431321', '4313', '双峰县', '3', 'S', '1922');
INSERT INTO `region` VALUES ('431322000000', '431322', '4313', '新化县', '3', 'X', '1923');
INSERT INTO `region` VALUES ('431381000000', '431381', '4313', '冷水江市', '3', 'L', '1924');
INSERT INTO `region` VALUES ('431382000000', '431382', '4313', '涟源市', '3', 'L', '1925');
INSERT INTO `region` VALUES ('433100000000', '4331', '43', '湘西土家族苗族自治州', '2', 'X', '196');
INSERT INTO `region` VALUES ('433101000000', '433101', '4331', '吉首市', '3', 'J', '1926');
INSERT INTO `region` VALUES ('433122000000', '433122', '4331', '泸溪县', '3', 'Z', '1927');
INSERT INTO `region` VALUES ('433123000000', '433123', '4331', '凤凰县', '3', 'F', '1928');
INSERT INTO `region` VALUES ('433124000000', '433124', '4331', '花垣县', '3', 'H', '1929');
INSERT INTO `region` VALUES ('433125000000', '433125', '4331', '保靖县', '3', 'B', '1930');
INSERT INTO `region` VALUES ('433126000000', '433126', '4331', '古丈县', '3', 'G', '1931');
INSERT INTO `region` VALUES ('433127000000', '433127', '4331', '永顺县', '3', 'Y', '1932');
INSERT INTO `region` VALUES ('433130000000', '433130', '4331', '龙山县', '3', 'L', '1933');
INSERT INTO `region` VALUES ('440000000000', '44', 'root', '广东省', '1', 'G', '18');
INSERT INTO `region` VALUES ('440100000000', '4401', '44', '广州市', '2', 'G', '197');
INSERT INTO `region` VALUES ('440101000000', '440101', '4401', '市辖区', '3', 'S', '1934');
INSERT INTO `region` VALUES ('440103000000', '440103', '4401', '荔湾区', '3', 'L', '1935');
INSERT INTO `region` VALUES ('440104000000', '440104', '4401', '越秀区', '3', 'Y', '1936');
INSERT INTO `region` VALUES ('440105000000', '440105', '4401', '海珠区', '3', 'H', '1937');
INSERT INTO `region` VALUES ('440106000000', '440106', '4401', '天河区', '3', 'T', '1938');
INSERT INTO `region` VALUES ('440111000000', '440111', '4401', '白云区', '3', 'B', '1939');
INSERT INTO `region` VALUES ('440112000000', '440112', '4401', '黄埔区', '3', 'H', '1940');
INSERT INTO `region` VALUES ('440113000000', '440113', '4401', '番禺区', '3', 'F', '1941');
INSERT INTO `region` VALUES ('440114000000', '440114', '4401', '花都区', '3', 'H', '1942');
INSERT INTO `region` VALUES ('440115000000', '440115', '4401', '南沙区', '3', 'N', '1943');
INSERT INTO `region` VALUES ('440116000000', '440116', '4401', '萝岗区', '3', 'L', '1944');
INSERT INTO `region` VALUES ('440183000000', '440183', '4401', '增城市', '3', 'Z', '1945');
INSERT INTO `region` VALUES ('440184000000', '440184', '4401', '从化市', '3', 'C', '1946');
INSERT INTO `region` VALUES ('440200000000', '4402', '44', '韶关市', '2', 'S', '198');
INSERT INTO `region` VALUES ('440201000000', '440201', '4402', '市辖区', '3', 'S', '1947');
INSERT INTO `region` VALUES ('440203000000', '440203', '4402', '武江区', '3', 'W', '1948');
INSERT INTO `region` VALUES ('440204000000', '440204', '4402', '浈江区', '3', 'Z', '1949');
INSERT INTO `region` VALUES ('440205000000', '440205', '4402', '曲江区', '3', 'Q', '1950');
INSERT INTO `region` VALUES ('440222000000', '440222', '4402', '始兴县', '3', 'S', '1951');
INSERT INTO `region` VALUES ('440224000000', '440224', '4402', '仁化县', '3', 'R', '1952');
INSERT INTO `region` VALUES ('440229000000', '440229', '4402', '翁源县', '3', 'W', '1953');
INSERT INTO `region` VALUES ('440232000000', '440232', '4402', '乳源瑶族自治县', '3', 'R', '1954');
INSERT INTO `region` VALUES ('440233000000', '440233', '4402', '新丰县', '3', 'X', '1955');
INSERT INTO `region` VALUES ('440281000000', '440281', '4402', '乐昌市', '3', 'L', '1956');
INSERT INTO `region` VALUES ('440282000000', '440282', '4402', '南雄市', '3', 'N', '1957');
INSERT INTO `region` VALUES ('440300000000', '4403', '44', '深圳市', '2', 'S', '199');
INSERT INTO `region` VALUES ('440301000000', '440301', '4403', '市辖区', '3', 'S', '1958');
INSERT INTO `region` VALUES ('440303000000', '440303', '4403', '罗湖区', '3', 'L', '1959');
INSERT INTO `region` VALUES ('440304000000', '440304', '4403', '福田区', '3', 'F', '1960');
INSERT INTO `region` VALUES ('440305000000', '440305', '4403', '南山区', '3', 'N', '1961');
INSERT INTO `region` VALUES ('440306000000', '440306', '4403', '宝安区', '3', 'B', '1962');
INSERT INTO `region` VALUES ('440307000000', '440307', '4403', '龙岗区', '3', 'L', '1963');
INSERT INTO `region` VALUES ('440308000000', '440308', '4403', '盐田区', '3', 'Y', '1964');
INSERT INTO `region` VALUES ('440400000000', '4404', '44', '珠海市', '2', 'Z', '200');
INSERT INTO `region` VALUES ('440401000000', '440401', '4404', '市辖区', '3', 'S', '1965');
INSERT INTO `region` VALUES ('440402000000', '440402', '4404', '香洲区', '3', 'X', '1966');
INSERT INTO `region` VALUES ('440403000000', '440403', '4404', '斗门区', '3', 'D', '1967');
INSERT INTO `region` VALUES ('440404000000', '440404', '4404', '金湾区', '3', 'J', '1968');
INSERT INTO `region` VALUES ('440500000000', '4405', '44', '汕头市', '2', 'S', '201');
INSERT INTO `region` VALUES ('440501000000', '440501', '4405', '市辖区', '3', 'S', '1969');
INSERT INTO `region` VALUES ('440507000000', '440507', '4405', '龙湖区', '3', 'L', '1970');
INSERT INTO `region` VALUES ('440511000000', '440511', '4405', '金平区', '3', 'J', '1971');
INSERT INTO `region` VALUES ('440512000000', '440512', '4405', '濠江区', '3', 'Z', '1972');
INSERT INTO `region` VALUES ('440513000000', '440513', '4405', '潮阳区', '3', 'C', '1973');
INSERT INTO `region` VALUES ('440514000000', '440514', '4405', '潮南区', '3', 'C', '1974');
INSERT INTO `region` VALUES ('440515000000', '440515', '4405', '澄海区', '3', 'C', '1975');
INSERT INTO `region` VALUES ('440523000000', '440523', '4405', '南澳县', '3', 'N', '1976');
INSERT INTO `region` VALUES ('440600000000', '4406', '44', '佛山市', '2', 'F', '202');
INSERT INTO `region` VALUES ('440601000000', '440601', '4406', '市辖区', '3', 'S', '1977');
INSERT INTO `region` VALUES ('440604000000', '440604', '4406', '禅城区', '3', 'Z', '1978');
INSERT INTO `region` VALUES ('440605000000', '440605', '4406', '南海区', '3', 'N', '1979');
INSERT INTO `region` VALUES ('440606000000', '440606', '4406', '顺德区', '3', 'S', '1980');
INSERT INTO `region` VALUES ('440607000000', '440607', '4406', '三水区', '3', 'S', '1981');
INSERT INTO `region` VALUES ('440608000000', '440608', '4406', '高明区', '3', 'G', '1982');
INSERT INTO `region` VALUES ('440700000000', '4407', '44', '江门市', '2', 'J', '203');
INSERT INTO `region` VALUES ('440701000000', '440701', '4407', '市辖区', '3', 'S', '1983');
INSERT INTO `region` VALUES ('440703000000', '440703', '4407', '蓬江区', '3', 'P', '1984');
INSERT INTO `region` VALUES ('440704000000', '440704', '4407', '江海区', '3', 'J', '1985');
INSERT INTO `region` VALUES ('440705000000', '440705', '4407', '新会区', '3', 'X', '1986');
INSERT INTO `region` VALUES ('440781000000', '440781', '4407', '台山市', '3', 'T', '1987');
INSERT INTO `region` VALUES ('440783000000', '440783', '4407', '开平市', '3', 'K', '1988');
INSERT INTO `region` VALUES ('440784000000', '440784', '4407', '鹤山市', '3', 'H', '1989');
INSERT INTO `region` VALUES ('440785000000', '440785', '4407', '恩平市', '3', 'E', '1990');
INSERT INTO `region` VALUES ('440800000000', '4408', '44', '湛江市', '2', 'Z', '204');
INSERT INTO `region` VALUES ('440801000000', '440801', '4408', '市辖区', '3', 'S', '1991');
INSERT INTO `region` VALUES ('440802000000', '440802', '4408', '赤坎区', '3', 'C', '1992');
INSERT INTO `region` VALUES ('440803000000', '440803', '4408', '霞山区', '3', 'X', '1993');
INSERT INTO `region` VALUES ('440804000000', '440804', '4408', '坡头区', '3', 'P', '1994');
INSERT INTO `region` VALUES ('440811000000', '440811', '4408', '麻章区', '3', 'M', '1995');
INSERT INTO `region` VALUES ('440823000000', '440823', '4408', '遂溪县', '3', 'S', '1996');
INSERT INTO `region` VALUES ('440825000000', '440825', '4408', '徐闻县', '3', 'X', '1997');
INSERT INTO `region` VALUES ('440881000000', '440881', '4408', '廉江市', '3', 'L', '1998');
INSERT INTO `region` VALUES ('440882000000', '440882', '4408', '雷州市', '3', 'L', '1999');
INSERT INTO `region` VALUES ('440883000000', '440883', '4408', '吴川市', '3', 'W', '2000');
INSERT INTO `region` VALUES ('440900000000', '4409', '44', '茂名市', '2', 'M', '205');
INSERT INTO `region` VALUES ('440901000000', '440901', '4409', '市辖区', '3', 'S', '2001');
INSERT INTO `region` VALUES ('440902000000', '440902', '4409', '茂南区', '3', 'M', '2002');
INSERT INTO `region` VALUES ('440903000000', '440903', '4409', '茂港区', '3', 'M', '2003');
INSERT INTO `region` VALUES ('440923000000', '440923', '4409', '电白县', '3', 'D', '2004');
INSERT INTO `region` VALUES ('440981000000', '440981', '4409', '高州市', '3', 'G', '2005');
INSERT INTO `region` VALUES ('440982000000', '440982', '4409', '化州市', '3', 'H', '2006');
INSERT INTO `region` VALUES ('440983000000', '440983', '4409', '信宜市', '3', 'X', '2007');
INSERT INTO `region` VALUES ('441200000000', '4412', '44', '肇庆市', '2', 'Z', '206');
INSERT INTO `region` VALUES ('441201000000', '441201', '4412', '市辖区', '3', 'S', '2008');
INSERT INTO `region` VALUES ('441202000000', '441202', '4412', '端州区', '3', 'D', '2009');
INSERT INTO `region` VALUES ('441203000000', '441203', '4412', '鼎湖区', '3', 'D', '2010');
INSERT INTO `region` VALUES ('441223000000', '441223', '4412', '广宁县', '3', 'G', '2011');
INSERT INTO `region` VALUES ('441224000000', '441224', '4412', '怀集县', '3', 'H', '2012');
INSERT INTO `region` VALUES ('441225000000', '441225', '4412', '封开县', '3', 'F', '2013');
INSERT INTO `region` VALUES ('441226000000', '441226', '4412', '德庆县', '3', 'D', '2014');
INSERT INTO `region` VALUES ('441283000000', '441283', '4412', '高要市', '3', 'G', '2015');
INSERT INTO `region` VALUES ('441284000000', '441284', '4412', '四会市', '3', 'S', '2016');
INSERT INTO `region` VALUES ('441300000000', '4413', '44', '惠州市', '2', 'H', '207');
INSERT INTO `region` VALUES ('441301000000', '441301', '4413', '市辖区', '3', 'S', '2017');
INSERT INTO `region` VALUES ('441302000000', '441302', '4413', '惠城区', '3', 'H', '2018');
INSERT INTO `region` VALUES ('441303000000', '441303', '4413', '惠阳区', '3', 'H', '2019');
INSERT INTO `region` VALUES ('441322000000', '441322', '4413', '博罗县', '3', 'B', '2020');
INSERT INTO `region` VALUES ('441323000000', '441323', '4413', '惠东县', '3', 'H', '2021');
INSERT INTO `region` VALUES ('441324000000', '441324', '4413', '龙门县', '3', 'L', '2022');
INSERT INTO `region` VALUES ('441400000000', '4414', '44', '梅州市', '2', 'M', '208');
INSERT INTO `region` VALUES ('441401000000', '441401', '4414', '市辖区', '3', 'S', '2023');
INSERT INTO `region` VALUES ('441402000000', '441402', '4414', '梅江区', '3', 'M', '2024');
INSERT INTO `region` VALUES ('441421000000', '441421', '4414', '梅县', '3', 'M', '2025');
INSERT INTO `region` VALUES ('441422000000', '441422', '4414', '大埔县', '3', 'D', '2026');
INSERT INTO `region` VALUES ('441423000000', '441423', '4414', '丰顺县', '3', 'F', '2027');
INSERT INTO `region` VALUES ('441424000000', '441424', '4414', '五华县', '3', 'W', '2028');
INSERT INTO `region` VALUES ('441426000000', '441426', '4414', '平远县', '3', 'P', '2029');
INSERT INTO `region` VALUES ('441427000000', '441427', '4414', '蕉岭县', '3', 'J', '2030');
INSERT INTO `region` VALUES ('441481000000', '441481', '4414', '兴宁市', '3', 'X', '2031');
INSERT INTO `region` VALUES ('441500000000', '4415', '44', '汕尾市', '2', 'S', '209');
INSERT INTO `region` VALUES ('441501000000', '441501', '4415', '市辖区', '3', 'S', '2032');
INSERT INTO `region` VALUES ('441502000000', '441502', '4415', '城区', '3', 'C', '2033');
INSERT INTO `region` VALUES ('441521000000', '441521', '4415', '海丰县', '3', 'H', '2034');
INSERT INTO `region` VALUES ('441523000000', '441523', '4415', '陆河县', '3', 'L', '2035');
INSERT INTO `region` VALUES ('441581000000', '441581', '4415', '陆丰市', '3', 'L', '2036');
INSERT INTO `region` VALUES ('441600000000', '4416', '44', '河源市', '2', 'H', '210');
INSERT INTO `region` VALUES ('441601000000', '441601', '4416', '市辖区', '3', 'S', '2037');
INSERT INTO `region` VALUES ('441602000000', '441602', '4416', '源城区', '3', 'Y', '2038');
INSERT INTO `region` VALUES ('441621000000', '441621', '4416', '紫金县', '3', 'Z', '2039');
INSERT INTO `region` VALUES ('441622000000', '441622', '4416', '龙川县', '3', 'L', '2040');
INSERT INTO `region` VALUES ('441623000000', '441623', '4416', '连平县', '3', 'L', '2041');
INSERT INTO `region` VALUES ('441624000000', '441624', '4416', '和平县', '3', 'H', '2042');
INSERT INTO `region` VALUES ('441625000000', '441625', '4416', '东源县', '3', 'D', '2043');
INSERT INTO `region` VALUES ('441700000000', '4417', '44', '阳江市', '2', 'Y', '211');
INSERT INTO `region` VALUES ('441701000000', '441701', '4417', '市辖区', '3', 'S', '2044');
INSERT INTO `region` VALUES ('441702000000', '441702', '4417', '江城区', '3', 'J', '2045');
INSERT INTO `region` VALUES ('441721000000', '441721', '4417', '阳西县', '3', 'Y', '2046');
INSERT INTO `region` VALUES ('441723000000', '441723', '4417', '阳东县', '3', 'Y', '2047');
INSERT INTO `region` VALUES ('441781000000', '441781', '4417', '阳春市', '3', 'Y', '2048');
INSERT INTO `region` VALUES ('441800000000', '4418', '44', '清远市', '2', 'Q', '212');
INSERT INTO `region` VALUES ('441801000000', '441801', '4418', '市辖区', '3', 'S', '2049');
INSERT INTO `region` VALUES ('441802000000', '441802', '4418', '清城区', '3', 'Q', '2050');
INSERT INTO `region` VALUES ('441821000000', '441821', '4418', '佛冈县', '3', 'F', '2051');
INSERT INTO `region` VALUES ('441823000000', '441823', '4418', '阳山县', '3', 'Y', '2052');
INSERT INTO `region` VALUES ('441825000000', '441825', '4418', '连山壮族瑶族自治县', '3', 'L', '2053');
INSERT INTO `region` VALUES ('441826000000', '441826', '4418', '连南瑶族自治县', '3', 'L', '2054');
INSERT INTO `region` VALUES ('441827000000', '441827', '4418', '清新县', '3', 'Q', '2055');
INSERT INTO `region` VALUES ('441881000000', '441881', '4418', '英德市', '3', 'Y', '2056');
INSERT INTO `region` VALUES ('441882000000', '441882', '4418', '连州市', '3', 'L', '2057');
INSERT INTO `region` VALUES ('441900000000', '4419', '44', '东莞市', '2', 'D', '213');
INSERT INTO `region` VALUES ('442000000000', '4420', '44', '中山市', '2', 'Z', '214');
INSERT INTO `region` VALUES ('445100000000', '4451', '44', '潮州市', '2', 'C', '215');
INSERT INTO `region` VALUES ('445101000000', '445101', '4451', '市辖区', '3', 'S', '2058');
INSERT INTO `region` VALUES ('445102000000', '445102', '4451', '湘桥区', '3', 'X', '2059');
INSERT INTO `region` VALUES ('445121000000', '445121', '4451', '潮安县', '3', 'C', '2060');
INSERT INTO `region` VALUES ('445122000000', '445122', '4451', '饶平县', '3', 'R', '2061');
INSERT INTO `region` VALUES ('445200000000', '4452', '44', '揭阳市', '2', 'J', '216');
INSERT INTO `region` VALUES ('445201000000', '445201', '4452', '市辖区', '3', 'S', '2062');
INSERT INTO `region` VALUES ('445202000000', '445202', '4452', '榕城区', '3', 'Z', '2063');
INSERT INTO `region` VALUES ('445221000000', '445221', '4452', '揭东县', '3', 'J', '2064');
INSERT INTO `region` VALUES ('445222000000', '445222', '4452', '揭西县', '3', 'J', '2065');
INSERT INTO `region` VALUES ('445224000000', '445224', '4452', '惠来县', '3', 'H', '2066');
INSERT INTO `region` VALUES ('445281000000', '445281', '4452', '普宁市', '3', 'P', '2067');
INSERT INTO `region` VALUES ('445300000000', '4453', '44', '云浮市', '2', 'Y', '217');
INSERT INTO `region` VALUES ('445301000000', '445301', '4453', '市辖区', '3', 'S', '2068');
INSERT INTO `region` VALUES ('445302000000', '445302', '4453', '云城区', '3', 'Y', '2069');
INSERT INTO `region` VALUES ('445321000000', '445321', '4453', '新兴县', '3', 'X', '2070');
INSERT INTO `region` VALUES ('445322000000', '445322', '4453', '郁南县', '3', 'Y', '2071');
INSERT INTO `region` VALUES ('445323000000', '445323', '4453', '云安县', '3', 'Y', '2072');
INSERT INTO `region` VALUES ('445381000000', '445381', '4453', '罗定市', '3', 'L', '2073');
INSERT INTO `region` VALUES ('450000000000', '45', 'root', '广西壮族自治区', '1', 'G', '19');
INSERT INTO `region` VALUES ('450100000000', '4501', '45', '南宁市', '2', 'N', '218');
INSERT INTO `region` VALUES ('450101000000', '450101', '4501', '市辖区', '3', 'S', '2074');
INSERT INTO `region` VALUES ('450102000000', '450102', '4501', '兴宁区', '3', 'X', '2075');
INSERT INTO `region` VALUES ('450103000000', '450103', '4501', '青秀区', '3', 'Q', '2076');
INSERT INTO `region` VALUES ('450105000000', '450105', '4501', '江南区', '3', 'J', '2077');
INSERT INTO `region` VALUES ('450107000000', '450107', '4501', '西乡塘区', '3', 'X', '2078');
INSERT INTO `region` VALUES ('450108000000', '450108', '4501', '良庆区', '3', 'L', '2079');
INSERT INTO `region` VALUES ('450109000000', '450109', '4501', '邕宁区', '3', 'Z', '2080');
INSERT INTO `region` VALUES ('450122000000', '450122', '4501', '武鸣县', '3', 'W', '2081');
INSERT INTO `region` VALUES ('450123000000', '450123', '4501', '隆安县', '3', 'L', '2082');
INSERT INTO `region` VALUES ('450124000000', '450124', '4501', '马山县', '3', 'M', '2083');
INSERT INTO `region` VALUES ('450125000000', '450125', '4501', '上林县', '3', 'S', '2084');
INSERT INTO `region` VALUES ('450126000000', '450126', '4501', '宾阳县', '3', 'B', '2085');
INSERT INTO `region` VALUES ('450127000000', '450127', '4501', '横县', '3', 'H', '2086');
INSERT INTO `region` VALUES ('450200000000', '4502', '45', '柳州市', '2', 'L', '219');
INSERT INTO `region` VALUES ('450201000000', '450201', '4502', '市辖区', '3', 'S', '2087');
INSERT INTO `region` VALUES ('450202000000', '450202', '4502', '城中区', '3', 'C', '2088');
INSERT INTO `region` VALUES ('450203000000', '450203', '4502', '鱼峰区', '3', 'Y', '2089');
INSERT INTO `region` VALUES ('450204000000', '450204', '4502', '柳南区', '3', 'L', '2090');
INSERT INTO `region` VALUES ('450205000000', '450205', '4502', '柳北区', '3', 'L', '2091');
INSERT INTO `region` VALUES ('450221000000', '450221', '4502', '柳江县', '3', 'L', '2092');
INSERT INTO `region` VALUES ('450222000000', '450222', '4502', '柳城县', '3', 'L', '2093');
INSERT INTO `region` VALUES ('450223000000', '450223', '4502', '鹿寨县', '3', 'L', '2094');
INSERT INTO `region` VALUES ('450224000000', '450224', '4502', '融安县', '3', 'R', '2095');
INSERT INTO `region` VALUES ('450225000000', '450225', '4502', '融水苗族自治县', '3', 'R', '2096');
INSERT INTO `region` VALUES ('450226000000', '450226', '4502', '三江侗族自治县', '3', 'S', '2097');
INSERT INTO `region` VALUES ('450300000000', '4503', '45', '桂林市', '2', 'G', '220');
INSERT INTO `region` VALUES ('450301000000', '450301', '4503', '市辖区', '3', 'S', '2098');
INSERT INTO `region` VALUES ('450302000000', '450302', '4503', '秀峰区', '3', 'X', '2099');
INSERT INTO `region` VALUES ('450303000000', '450303', '4503', '叠彩区', '3', 'D', '2100');
INSERT INTO `region` VALUES ('450304000000', '450304', '4503', '象山区', '3', 'X', '2101');
INSERT INTO `region` VALUES ('450305000000', '450305', '4503', '七星区', '3', 'Q', '2102');
INSERT INTO `region` VALUES ('450311000000', '450311', '4503', '雁山区', '3', 'Y', '2103');
INSERT INTO `region` VALUES ('450321000000', '450321', '4503', '阳朔县', '3', 'Y', '2104');
INSERT INTO `region` VALUES ('450322000000', '450322', '4503', '临桂县', '3', 'L', '2105');
INSERT INTO `region` VALUES ('450323000000', '450323', '4503', '灵川县', '3', 'L', '2106');
INSERT INTO `region` VALUES ('450324000000', '450324', '4503', '全州县', '3', 'Q', '2107');
INSERT INTO `region` VALUES ('450325000000', '450325', '4503', '兴安县', '3', 'X', '2108');
INSERT INTO `region` VALUES ('450326000000', '450326', '4503', '永福县', '3', 'Y', '2109');
INSERT INTO `region` VALUES ('450327000000', '450327', '4503', '灌阳县', '3', 'G', '2110');
INSERT INTO `region` VALUES ('450328000000', '450328', '4503', '龙胜各族自治县', '3', 'L', '2111');
INSERT INTO `region` VALUES ('450329000000', '450329', '4503', '资源县', '3', 'Z', '2112');
INSERT INTO `region` VALUES ('450330000000', '450330', '4503', '平乐县', '3', 'P', '2113');
INSERT INTO `region` VALUES ('450331000000', '450331', '4503', '荔蒲县', '3', 'L', '2114');
INSERT INTO `region` VALUES ('450332000000', '450332', '4503', '恭城瑶族自治县', '3', 'G', '2115');
INSERT INTO `region` VALUES ('450400000000', '4504', '45', '梧州市', '2', 'W', '221');
INSERT INTO `region` VALUES ('450401000000', '450401', '4504', '市辖区', '3', 'S', '2116');
INSERT INTO `region` VALUES ('450403000000', '450403', '4504', '万秀区', '3', 'W', '2117');
INSERT INTO `region` VALUES ('450404000000', '450404', '4504', '蝶山区', '3', 'D', '2118');
INSERT INTO `region` VALUES ('450405000000', '450405', '4504', '长洲区', '3', 'C', '2119');
INSERT INTO `region` VALUES ('450421000000', '450421', '4504', '苍梧县', '3', 'C', '2120');
INSERT INTO `region` VALUES ('450422000000', '450422', '4504', '藤县', '3', 'T', '2121');
INSERT INTO `region` VALUES ('450423000000', '450423', '4504', '蒙山县', '3', 'M', '2122');
INSERT INTO `region` VALUES ('450481000000', '450481', '4504', '岑溪市', '3', 'Z', '2123');
INSERT INTO `region` VALUES ('450500000000', '4505', '45', '北海市', '2', 'B', '222');
INSERT INTO `region` VALUES ('450501000000', '450501', '4505', '市辖区', '3', 'S', '2124');
INSERT INTO `region` VALUES ('450502000000', '450502', '4505', '海城区', '3', 'H', '2125');
INSERT INTO `region` VALUES ('450503000000', '450503', '4505', '银海区', '3', 'Y', '2126');
INSERT INTO `region` VALUES ('450512000000', '450512', '4505', '铁山港区', '3', 'T', '2127');
INSERT INTO `region` VALUES ('450521000000', '450521', '4505', '合浦县', '3', 'H', '2128');
INSERT INTO `region` VALUES ('450600000000', '4506', '45', '防城港市', '2', 'F', '223');
INSERT INTO `region` VALUES ('450601000000', '450601', '4506', '市辖区', '3', 'S', '2129');
INSERT INTO `region` VALUES ('450602000000', '450602', '4506', '港口区', '3', 'G', '2130');
INSERT INTO `region` VALUES ('450603000000', '450603', '4506', '防城区', '3', 'F', '2131');
INSERT INTO `region` VALUES ('450621000000', '450621', '4506', '上思县', '3', 'S', '2132');
INSERT INTO `region` VALUES ('450681000000', '450681', '4506', '东兴市', '3', 'D', '2133');
INSERT INTO `region` VALUES ('450700000000', '4507', '45', '钦州市', '2', 'Q', '224');
INSERT INTO `region` VALUES ('450701000000', '450701', '4507', '市辖区', '3', 'S', '2134');
INSERT INTO `region` VALUES ('450702000000', '450702', '4507', '钦南区', '3', 'Q', '2135');
INSERT INTO `region` VALUES ('450703000000', '450703', '4507', '钦北区', '3', 'Q', '2136');
INSERT INTO `region` VALUES ('450721000000', '450721', '4507', '灵山县', '3', 'L', '2137');
INSERT INTO `region` VALUES ('450722000000', '450722', '4507', '浦北县', '3', 'P', '2138');
INSERT INTO `region` VALUES ('450800000000', '4508', '45', '贵港市', '2', 'G', '225');
INSERT INTO `region` VALUES ('450801000000', '450801', '4508', '市辖区', '3', 'S', '2139');
INSERT INTO `region` VALUES ('450802000000', '450802', '4508', '港北区', '3', 'G', '2140');
INSERT INTO `region` VALUES ('450803000000', '450803', '4508', '港南区', '3', 'G', '2141');
INSERT INTO `region` VALUES ('450804000000', '450804', '4508', '覃塘区', '3', 'Z', '2142');
INSERT INTO `region` VALUES ('450821000000', '450821', '4508', '平南县', '3', 'P', '2143');
INSERT INTO `region` VALUES ('450881000000', '450881', '4508', '桂平市', '3', 'G', '2144');
INSERT INTO `region` VALUES ('450900000000', '4509', '45', '玉林市', '2', 'Y', '226');
INSERT INTO `region` VALUES ('450901000000', '450901', '4509', '市辖区', '3', 'S', '2145');
INSERT INTO `region` VALUES ('450902000000', '450902', '4509', '玉州区', '3', 'Y', '2146');
INSERT INTO `region` VALUES ('450921000000', '450921', '4509', '容县', '3', 'R', '2147');
INSERT INTO `region` VALUES ('450922000000', '450922', '4509', '陆川县', '3', 'L', '2148');
INSERT INTO `region` VALUES ('450923000000', '450923', '4509', '博白县', '3', 'B', '2149');
INSERT INTO `region` VALUES ('450924000000', '450924', '4509', '兴业县', '3', 'X', '2150');
INSERT INTO `region` VALUES ('450981000000', '450981', '4509', '北流市', '3', 'B', '2151');
INSERT INTO `region` VALUES ('451000000000', '4510', '45', '百色市', '2', 'B', '227');
INSERT INTO `region` VALUES ('451001000000', '451001', '4510', '市辖区', '3', 'S', '2152');
INSERT INTO `region` VALUES ('451002000000', '451002', '4510', '右江区', '3', 'Y', '2153');
INSERT INTO `region` VALUES ('451021000000', '451021', '4510', '田阳县', '3', 'T', '2154');
INSERT INTO `region` VALUES ('451022000000', '451022', '4510', '田东县', '3', 'T', '2155');
INSERT INTO `region` VALUES ('451023000000', '451023', '4510', '平果县', '3', 'P', '2156');
INSERT INTO `region` VALUES ('451024000000', '451024', '4510', '德保县', '3', 'D', '2157');
INSERT INTO `region` VALUES ('451025000000', '451025', '4510', '靖西县', '3', 'J', '2158');
INSERT INTO `region` VALUES ('451026000000', '451026', '4510', '那坡县', '3', 'N', '2159');
INSERT INTO `region` VALUES ('451027000000', '451027', '4510', '凌云县', '3', 'L', '2160');
INSERT INTO `region` VALUES ('451028000000', '451028', '4510', '乐业县', '3', 'L', '2161');
INSERT INTO `region` VALUES ('451029000000', '451029', '4510', '田林县', '3', 'T', '2162');
INSERT INTO `region` VALUES ('451030000000', '451030', '4510', '西林县', '3', 'X', '2163');
INSERT INTO `region` VALUES ('451031000000', '451031', '4510', '隆林各族自治县', '3', 'L', '2164');
INSERT INTO `region` VALUES ('451100000000', '4511', '45', '贺州市', '2', 'H', '228');
INSERT INTO `region` VALUES ('451101000000', '451101', '4511', '市辖区', '3', 'S', '2165');
INSERT INTO `region` VALUES ('451102000000', '451102', '4511', '八步区', '3', 'B', '2166');
INSERT INTO `region` VALUES ('451121000000', '451121', '4511', '昭平县', '3', 'Z', '2167');
INSERT INTO `region` VALUES ('451122000000', '451122', '4511', '钟山县', '3', 'Z', '2168');
INSERT INTO `region` VALUES ('451123000000', '451123', '4511', '富川瑶族自治县', '3', 'F', '2169');
INSERT INTO `region` VALUES ('451200000000', '4512', '45', '河池市', '2', 'H', '229');
INSERT INTO `region` VALUES ('451201000000', '451201', '4512', '市辖区', '3', 'S', '2170');
INSERT INTO `region` VALUES ('451202000000', '451202', '4512', '金城江区', '3', 'J', '2171');
INSERT INTO `region` VALUES ('451221000000', '451221', '4512', '南丹县', '3', 'N', '2172');
INSERT INTO `region` VALUES ('451222000000', '451222', '4512', '天峨县', '3', 'T', '2173');
INSERT INTO `region` VALUES ('451223000000', '451223', '4512', '凤山县', '3', 'F', '2174');
INSERT INTO `region` VALUES ('451224000000', '451224', '4512', '东兰县', '3', 'D', '2175');
INSERT INTO `region` VALUES ('451225000000', '451225', '4512', '罗城仫佬族自治县', '3', 'L', '2176');
INSERT INTO `region` VALUES ('451226000000', '451226', '4512', '环江毛南族自治县', '3', 'H', '2177');
INSERT INTO `region` VALUES ('451227000000', '451227', '4512', '巴马瑶族自治县', '3', 'B', '2178');
INSERT INTO `region` VALUES ('451228000000', '451228', '4512', '都安瑶族自治县', '3', 'D', '2179');
INSERT INTO `region` VALUES ('451229000000', '451229', '4512', '大化瑶族自治县', '3', 'D', '2180');
INSERT INTO `region` VALUES ('451281000000', '451281', '4512', '宜州市', '3', 'Y', '2181');
INSERT INTO `region` VALUES ('451300000000', '4513', '45', '来宾市', '2', 'L', '230');
INSERT INTO `region` VALUES ('451301000000', '451301', '4513', '市辖区', '3', 'S', '2182');
INSERT INTO `region` VALUES ('451302000000', '451302', '4513', '兴宾区', '3', 'X', '2183');
INSERT INTO `region` VALUES ('451321000000', '451321', '4513', '忻城县', '3', 'X', '2184');
INSERT INTO `region` VALUES ('451322000000', '451322', '4513', '象州县', '3', 'X', '2185');
INSERT INTO `region` VALUES ('451323000000', '451323', '4513', '武宣县', '3', 'W', '2186');
INSERT INTO `region` VALUES ('451324000000', '451324', '4513', '金秀瑶族自治县', '3', 'J', '2187');
INSERT INTO `region` VALUES ('451381000000', '451381', '4513', '合山市', '3', 'H', '2188');
INSERT INTO `region` VALUES ('451400000000', '4514', '45', '崇左市', '2', 'C', '231');
INSERT INTO `region` VALUES ('451401000000', '451401', '4514', '市辖区', '3', 'S', '2189');
INSERT INTO `region` VALUES ('451402000000', '451402', '4514', '江洲区', '3', 'J', '2190');
INSERT INTO `region` VALUES ('451421000000', '451421', '4514', '扶绥县', '3', 'F', '2191');
INSERT INTO `region` VALUES ('451422000000', '451422', '4514', '宁明县', '3', 'N', '2192');
INSERT INTO `region` VALUES ('451423000000', '451423', '4514', '龙州县', '3', 'L', '2193');
INSERT INTO `region` VALUES ('451424000000', '451424', '4514', '大新县', '3', 'D', '2194');
INSERT INTO `region` VALUES ('451425000000', '451425', '4514', '天等县', '3', 'T', '2195');
INSERT INTO `region` VALUES ('451481000000', '451481', '4514', '凭祥市', '3', 'P', '2196');
INSERT INTO `region` VALUES ('460000000000', '46', 'root', '海南省', '1', 'H', '20');
INSERT INTO `region` VALUES ('460100000000', '4601', '46', '海口市', '2', 'H', '232');
INSERT INTO `region` VALUES ('460101000000', '460101', '4601', '市辖区', '3', 'S', '2197');
INSERT INTO `region` VALUES ('460105000000', '460105', '4601', '秀英区', '3', 'X', '2198');
INSERT INTO `region` VALUES ('460106000000', '460106', '4601', '龙华区', '3', 'L', '2199');
INSERT INTO `region` VALUES ('460107000000', '460107', '4601', '琼山区', '3', 'Q', '2200');
INSERT INTO `region` VALUES ('460108000000', '460108', '4601', '美兰区', '3', 'M', '2201');
INSERT INTO `region` VALUES ('460200000000', '4602', '46', '三亚市', '2', 'S', '233');
INSERT INTO `region` VALUES ('460201000000', '460201', '4602', '市辖区', '3', 'S', '2202');
INSERT INTO `region` VALUES ('469000000000', '4690', '46', '省直辖县级行政区划', '2', 'S', '234');
INSERT INTO `region` VALUES ('469001000000', '469001', '4690', '五指山市', '3', 'W', '2203');
INSERT INTO `region` VALUES ('469002000000', '469002', '4690', '琼海市', '3', 'Q', '2204');
INSERT INTO `region` VALUES ('469003000000', '469003', '4690', '儋州市', '3', 'Z', '2205');
INSERT INTO `region` VALUES ('469005000000', '469005', '4690', '文昌市', '3', 'W', '2206');
INSERT INTO `region` VALUES ('469006000000', '469006', '4690', '万宁市', '3', 'W', '2207');
INSERT INTO `region` VALUES ('469007000000', '469007', '4690', '东方市', '3', 'D', '2208');
INSERT INTO `region` VALUES ('469021000000', '469021', '4690', '定安县', '3', 'D', '2209');
INSERT INTO `region` VALUES ('469022000000', '469022', '4690', '屯昌县', '3', 'T', '2210');
INSERT INTO `region` VALUES ('469023000000', '469023', '4690', '澄迈县', '3', 'C', '2211');
INSERT INTO `region` VALUES ('469024000000', '469024', '4690', '临高县', '3', 'L', '2212');
INSERT INTO `region` VALUES ('469025000000', '469025', '4690', '白沙黎族自治县', '3', 'B', '2213');
INSERT INTO `region` VALUES ('469026000000', '469026', '4690', '昌江黎族自治县', '3', 'C', '2214');
INSERT INTO `region` VALUES ('469027000000', '469027', '4690', '乐东黎族自治县', '3', 'L', '2215');
INSERT INTO `region` VALUES ('469028000000', '469028', '4690', '陵水黎族自治县', '3', 'L', '2216');
INSERT INTO `region` VALUES ('469029000000', '469029', '4690', '保亭黎族苗族自治县', '3', 'B', '2217');
INSERT INTO `region` VALUES ('469030000000', '469030', '4690', '琼中黎族苗族自治县', '3', 'Q', '2218');
INSERT INTO `region` VALUES ('469031000000', '469031', '4690', '西沙群岛', '3', 'X', '2219');
INSERT INTO `region` VALUES ('469032000000', '469032', '4690', '南沙群岛', '3', 'N', '2220');
INSERT INTO `region` VALUES ('469033000000', '469033', '4690', '中沙群岛的岛礁及其海域', '3', 'Z', '2221');
INSERT INTO `region` VALUES ('500000000000', '50', 'root', '重庆市', '1', 'Z', '21');
INSERT INTO `region` VALUES ('500100000000', '5001', '50', '重庆市', '2', 'Z', '235');
INSERT INTO `region` VALUES ('500101000000', '500101', '5001', '万州区', '3', 'W', '2222');
INSERT INTO `region` VALUES ('500102000000', '500102', '5001', '涪陵区', '3', 'F', '2223');
INSERT INTO `region` VALUES ('500103000000', '500103', '5001', '渝中区', '3', 'Y', '2224');
INSERT INTO `region` VALUES ('500104000000', '500104', '5001', '大渡口区', '3', 'D', '2225');
INSERT INTO `region` VALUES ('500105000000', '500105', '5001', '江北区', '3', 'J', '2226');
INSERT INTO `region` VALUES ('500106000000', '500106', '5001', '沙坪坝区', '3', 'S', '2227');
INSERT INTO `region` VALUES ('500107000000', '500107', '5001', '九龙坡区', '3', 'J', '2228');
INSERT INTO `region` VALUES ('500108000000', '500108', '5001', '南岸区', '3', 'N', '2229');
INSERT INTO `region` VALUES ('500109000000', '500109', '5001', '北碚区', '3', 'B', '2230');
INSERT INTO `region` VALUES ('500110000000', '500110', '5001', '万盛区', '3', 'W', '2231');
INSERT INTO `region` VALUES ('500111000000', '500111', '5001', '双桥区', '3', 'S', '2232');
INSERT INTO `region` VALUES ('500112000000', '500112', '5001', '渝北区', '3', 'Y', '2233');
INSERT INTO `region` VALUES ('500113000000', '500113', '5001', '巴南区', '3', 'B', '2234');
INSERT INTO `region` VALUES ('500114000000', '500114', '5001', '黔江区', '3', 'Q', '2235');
INSERT INTO `region` VALUES ('500115000000', '500115', '5001', '长寿区', '3', 'C', '2236');
INSERT INTO `region` VALUES ('500116000000', '500116', '5001', '江津区', '3', 'J', '2237');
INSERT INTO `region` VALUES ('500117000000', '500117', '5001', '合川区', '3', 'H', '2238');
INSERT INTO `region` VALUES ('500118000000', '500118', '5001', '永川区', '3', 'Y', '2239');
INSERT INTO `region` VALUES ('500119000000', '500119', '5001', '南川区', '3', 'N', '2240');
INSERT INTO `region` VALUES ('500222000000', '500222', '5002', '綦江县', '3', 'Z', '2241');
INSERT INTO `region` VALUES ('500223000000', '500223', '5002', '潼南县', '3', 'Z', '2242');
INSERT INTO `region` VALUES ('500224000000', '500224', '5002', '铜梁县', '3', 'T', '2243');
INSERT INTO `region` VALUES ('500225000000', '500225', '5002', '大足县', '3', 'D', '2244');
INSERT INTO `region` VALUES ('500226000000', '500226', '5002', '荣昌县', '3', 'R', '2245');
INSERT INTO `region` VALUES ('500227000000', '500227', '5002', '璧山县', '3', 'Z', '2246');
INSERT INTO `region` VALUES ('500228000000', '500228', '5002', '梁平县', '3', 'L', '2247');
INSERT INTO `region` VALUES ('500229000000', '500229', '5002', '城口县', '3', 'C', '2248');
INSERT INTO `region` VALUES ('500230000000', '500230', '5002', '丰都县', '3', 'F', '2249');
INSERT INTO `region` VALUES ('500231000000', '500231', '5002', '垫江县', '3', 'D', '2250');
INSERT INTO `region` VALUES ('500232000000', '500232', '5002', '武隆县', '3', 'W', '2251');
INSERT INTO `region` VALUES ('500233000000', '500233', '5002', '忠县', '3', 'Z', '2252');
INSERT INTO `region` VALUES ('500234000000', '500234', '5002', '开县', '3', 'K', '2253');
INSERT INTO `region` VALUES ('500235000000', '500235', '5002', '云阳县', '3', 'Y', '2254');
INSERT INTO `region` VALUES ('500236000000', '500236', '5002', '奉节县', '3', 'F', '2255');
INSERT INTO `region` VALUES ('500237000000', '500237', '5002', '巫山县', '3', 'W', '2256');
INSERT INTO `region` VALUES ('500238000000', '500238', '5002', '巫溪县', '3', 'W', '2257');
INSERT INTO `region` VALUES ('500240000000', '500240', '5002', '石柱土家族自治县', '3', 'S', '2258');
INSERT INTO `region` VALUES ('500241000000', '500241', '5002', '秀山土家族苗族自治县', '3', 'X', '2259');
INSERT INTO `region` VALUES ('500242000000', '500242', '5002', '酉阳土家族苗族自治县', '3', 'Y', '2260');
INSERT INTO `region` VALUES ('500243000000', '500243', '5002', '彭水苗族土家族自治县', '3', 'P', '2261');
INSERT INTO `region` VALUES ('510000000000', '51', 'root', '四川省', '1', 'S', '22');
INSERT INTO `region` VALUES ('510100000000', '5101', '51', '成都市', '2', 'C', '236');
INSERT INTO `region` VALUES ('510101000000', '510101', '5101', '市辖区', '3', 'S', '2262');
INSERT INTO `region` VALUES ('510104000000', '510104', '5101', '锦江区', '3', 'J', '2263');
INSERT INTO `region` VALUES ('510105000000', '510105', '5101', '青羊区', '3', 'Q', '2264');
INSERT INTO `region` VALUES ('510106000000', '510106', '5101', '金牛区', '3', 'J', '2265');
INSERT INTO `region` VALUES ('510107000000', '510107', '5101', '武侯区', '3', 'W', '2266');
INSERT INTO `region` VALUES ('510108000000', '510108', '5101', '成华区', '3', 'C', '2267');
INSERT INTO `region` VALUES ('510112000000', '510112', '5101', '龙泉驿区', '3', 'L', '2268');
INSERT INTO `region` VALUES ('510113000000', '510113', '5101', '青白江区', '3', 'Q', '2269');
INSERT INTO `region` VALUES ('510114000000', '510114', '5101', '新都区', '3', 'X', '2270');
INSERT INTO `region` VALUES ('510115000000', '510115', '5101', '温江区', '3', 'W', '2271');
INSERT INTO `region` VALUES ('510121000000', '510121', '5101', '金堂县', '3', 'J', '2272');
INSERT INTO `region` VALUES ('510122000000', '510122', '5101', '双流县', '3', 'S', '2273');
INSERT INTO `region` VALUES ('510124000000', '510124', '5101', '郫县', '3', 'Z', '2274');
INSERT INTO `region` VALUES ('510129000000', '510129', '5101', '大邑县', '3', 'D', '2275');
INSERT INTO `region` VALUES ('510131000000', '510131', '5101', '蒲江县', '3', 'P', '2276');
INSERT INTO `region` VALUES ('510132000000', '510132', '5101', '新津县', '3', 'X', '2277');
INSERT INTO `region` VALUES ('510181000000', '510181', '5101', '都江堰市', '3', 'D', '2278');
INSERT INTO `region` VALUES ('510182000000', '510182', '5101', '彭州市', '3', 'P', '2279');
INSERT INTO `region` VALUES ('510183000000', '510183', '5101', '邛崃市', '3', 'Z', '2280');
INSERT INTO `region` VALUES ('510184000000', '510184', '5101', '崇州市', '3', 'C', '2281');
INSERT INTO `region` VALUES ('510300000000', '5103', '51', '自贡市', '2', 'Z', '237');
INSERT INTO `region` VALUES ('510301000000', '510301', '5103', '市辖区', '3', 'S', '2282');
INSERT INTO `region` VALUES ('510302000000', '510302', '5103', '自流井区', '3', 'Z', '2283');
INSERT INTO `region` VALUES ('510303000000', '510303', '5103', '贡井区', '3', 'G', '2284');
INSERT INTO `region` VALUES ('510304000000', '510304', '5103', '大安区', '3', 'D', '2285');
INSERT INTO `region` VALUES ('510311000000', '510311', '5103', '沿滩区', '3', 'Y', '2286');
INSERT INTO `region` VALUES ('510321000000', '510321', '5103', '荣县', '3', 'R', '2287');
INSERT INTO `region` VALUES ('510322000000', '510322', '5103', '富顺县', '3', 'F', '2288');
INSERT INTO `region` VALUES ('510400000000', '5104', '51', '攀枝花市', '2', 'P', '238');
INSERT INTO `region` VALUES ('510401000000', '510401', '5104', '市辖区', '3', 'S', '2289');
INSERT INTO `region` VALUES ('510402000000', '510402', '5104', '东区', '3', 'D', '2290');
INSERT INTO `region` VALUES ('510403000000', '510403', '5104', '西区', '3', 'X', '2291');
INSERT INTO `region` VALUES ('510411000000', '510411', '5104', '仁和区', '3', 'R', '2292');
INSERT INTO `region` VALUES ('510421000000', '510421', '5104', '米易县', '3', 'M', '2293');
INSERT INTO `region` VALUES ('510422000000', '510422', '5104', '盐边县', '3', 'Y', '2294');
INSERT INTO `region` VALUES ('510500000000', '5105', '51', '泸州市', '2', 'Z', '239');
INSERT INTO `region` VALUES ('510501000000', '510501', '5105', '市辖区', '3', 'S', '2295');
INSERT INTO `region` VALUES ('510502000000', '510502', '5105', '江阳区', '3', 'J', '2296');
INSERT INTO `region` VALUES ('510503000000', '510503', '5105', '纳溪区', '3', 'N', '2297');
INSERT INTO `region` VALUES ('510504000000', '510504', '5105', '龙马潭区', '3', 'L', '2298');
INSERT INTO `region` VALUES ('510521000000', '510521', '5105', '泸县', '3', 'Z', '2299');
INSERT INTO `region` VALUES ('510522000000', '510522', '5105', '合江县', '3', 'H', '2300');
INSERT INTO `region` VALUES ('510524000000', '510524', '5105', '叙永县', '3', 'X', '2301');
INSERT INTO `region` VALUES ('510525000000', '510525', '5105', '古蔺县', '3', 'G', '2302');
INSERT INTO `region` VALUES ('510600000000', '5106', '51', '德阳市', '2', 'D', '240');
INSERT INTO `region` VALUES ('510601000000', '510601', '5106', '市辖区', '3', 'S', '2303');
INSERT INTO `region` VALUES ('510603000000', '510603', '5106', '旌阳区', '3', 'Z', '2304');
INSERT INTO `region` VALUES ('510623000000', '510623', '5106', '中江县', '3', 'Z', '2305');
INSERT INTO `region` VALUES ('510626000000', '510626', '5106', '罗江县', '3', 'L', '2306');
INSERT INTO `region` VALUES ('510681000000', '510681', '5106', '广汉市', '3', 'G', '2307');
INSERT INTO `region` VALUES ('510682000000', '510682', '5106', '什邡市', '3', 'S', '2308');
INSERT INTO `region` VALUES ('510683000000', '510683', '5106', '绵竹市', '3', 'M', '2309');
INSERT INTO `region` VALUES ('510700000000', '5107', '51', '绵阳市', '2', 'M', '241');
INSERT INTO `region` VALUES ('510701000000', '510701', '5107', '市辖区', '3', 'S', '2310');
INSERT INTO `region` VALUES ('510703000000', '510703', '5107', '涪城区', '3', 'F', '2311');
INSERT INTO `region` VALUES ('510704000000', '510704', '5107', '游仙区', '3', 'Y', '2312');
INSERT INTO `region` VALUES ('510722000000', '510722', '5107', '三台县', '3', 'S', '2313');
INSERT INTO `region` VALUES ('510723000000', '510723', '5107', '盐亭县', '3', 'Y', '2314');
INSERT INTO `region` VALUES ('510724000000', '510724', '5107', '安县', '3', 'A', '2315');
INSERT INTO `region` VALUES ('510725000000', '510725', '5107', '梓潼县', '3', 'Z', '2316');
INSERT INTO `region` VALUES ('510726000000', '510726', '5107', '北川羌族自治县', '3', 'B', '2317');
INSERT INTO `region` VALUES ('510727000000', '510727', '5107', '平武县', '3', 'P', '2318');
INSERT INTO `region` VALUES ('510781000000', '510781', '5107', '江油市', '3', 'J', '2319');
INSERT INTO `region` VALUES ('510800000000', '5108', '51', '广元市', '2', 'G', '242');
INSERT INTO `region` VALUES ('510801000000', '510801', '5108', '市辖区', '3', 'S', '2320');
INSERT INTO `region` VALUES ('510802000000', '510802', '5108', '市中区', '3', 'S', '2321');
INSERT INTO `region` VALUES ('510811000000', '510811', '5108', '元坝区', '3', 'Y', '2322');
INSERT INTO `region` VALUES ('510812000000', '510812', '5108', '朝天区', '3', 'C', '2323');
INSERT INTO `region` VALUES ('510821000000', '510821', '5108', '旺苍县', '3', 'W', '2324');
INSERT INTO `region` VALUES ('510822000000', '510822', '5108', '青川县', '3', 'Q', '2325');
INSERT INTO `region` VALUES ('510823000000', '510823', '5108', '剑阁县', '3', 'J', '2326');
INSERT INTO `region` VALUES ('510824000000', '510824', '5108', '苍溪县', '3', 'C', '2327');
INSERT INTO `region` VALUES ('510900000000', '5109', '51', '遂宁市', '2', 'S', '243');
INSERT INTO `region` VALUES ('510901000000', '510901', '5109', '市辖区', '3', 'S', '2328');
INSERT INTO `region` VALUES ('510903000000', '510903', '5109', '船山区', '3', 'C', '2329');
INSERT INTO `region` VALUES ('510904000000', '510904', '5109', '安居区', '3', 'A', '2330');
INSERT INTO `region` VALUES ('510921000000', '510921', '5109', '蓬溪县', '3', 'P', '2331');
INSERT INTO `region` VALUES ('510922000000', '510922', '5109', '射洪县', '3', 'S', '2332');
INSERT INTO `region` VALUES ('510923000000', '510923', '5109', '大英县', '3', 'D', '2333');
INSERT INTO `region` VALUES ('511000000000', '5110', '51', '内江市', '2', 'N', '244');
INSERT INTO `region` VALUES ('511001000000', '511001', '5110', '市辖区', '3', 'S', '2334');
INSERT INTO `region` VALUES ('511002000000', '511002', '5110', '市中区', '3', 'S', '2335');
INSERT INTO `region` VALUES ('511011000000', '511011', '5110', '东兴区', '3', 'D', '2336');
INSERT INTO `region` VALUES ('511024000000', '511024', '5110', '威远县', '3', 'W', '2337');
INSERT INTO `region` VALUES ('511025000000', '511025', '5110', '资中县', '3', 'Z', '2338');
INSERT INTO `region` VALUES ('511028000000', '511028', '5110', '隆昌县', '3', 'L', '2339');
INSERT INTO `region` VALUES ('511100000000', '5111', '51', '乐山市', '2', 'L', '245');
INSERT INTO `region` VALUES ('511101000000', '511101', '5111', '市辖区', '3', 'S', '2340');
INSERT INTO `region` VALUES ('511102000000', '511102', '5111', '市中区', '3', 'S', '2341');
INSERT INTO `region` VALUES ('511111000000', '511111', '5111', '沙湾区', '3', 'S', '2342');
INSERT INTO `region` VALUES ('511112000000', '511112', '5111', '五通桥区', '3', 'W', '2343');
INSERT INTO `region` VALUES ('511113000000', '511113', '5111', '金口河区', '3', 'J', '2344');
INSERT INTO `region` VALUES ('511123000000', '511123', '5111', '犍为县', '3', 'Z', '2345');
INSERT INTO `region` VALUES ('511124000000', '511124', '5111', '井研县', '3', 'J', '2346');
INSERT INTO `region` VALUES ('511126000000', '511126', '5111', '夹江县', '3', 'J', '2347');
INSERT INTO `region` VALUES ('511129000000', '511129', '5111', '沐川县', '3', 'Z', '2348');
INSERT INTO `region` VALUES ('511132000000', '511132', '5111', '峨边彝族自治县', '3', 'E', '2349');
INSERT INTO `region` VALUES ('511133000000', '511133', '5111', '马边彝族自治县', '3', 'M', '2350');
INSERT INTO `region` VALUES ('511181000000', '511181', '5111', '峨眉山市', '3', 'E', '2351');
INSERT INTO `region` VALUES ('511300000000', '5113', '51', '南充市', '2', 'N', '246');
INSERT INTO `region` VALUES ('511301000000', '511301', '5113', '市辖区', '3', 'S', '2352');
INSERT INTO `region` VALUES ('511302000000', '511302', '5113', '顺庆区', '3', 'S', '2353');
INSERT INTO `region` VALUES ('511303000000', '511303', '5113', '高坪区', '3', 'G', '2354');
INSERT INTO `region` VALUES ('511304000000', '511304', '5113', '嘉陵区', '3', 'J', '2355');
INSERT INTO `region` VALUES ('511321000000', '511321', '5113', '南部县', '3', 'N', '2356');
INSERT INTO `region` VALUES ('511322000000', '511322', '5113', '营山县', '3', 'Y', '2357');
INSERT INTO `region` VALUES ('511323000000', '511323', '5113', '蓬安县', '3', 'P', '2358');
INSERT INTO `region` VALUES ('511324000000', '511324', '5113', '仪陇县', '3', 'Y', '2359');
INSERT INTO `region` VALUES ('511325000000', '511325', '5113', '西充县', '3', 'X', '2360');
INSERT INTO `region` VALUES ('511381000000', '511381', '5113', '阆中市', '3', 'Z', '2361');
INSERT INTO `region` VALUES ('511400000000', '5114', '51', '眉山市', '2', 'M', '247');
INSERT INTO `region` VALUES ('511401000000', '511401', '5114', '市辖区', '3', 'S', '2362');
INSERT INTO `region` VALUES ('511402000000', '511402', '5114', '东坡区', '3', 'D', '2363');
INSERT INTO `region` VALUES ('511421000000', '511421', '5114', '仁寿县', '3', 'R', '2364');
INSERT INTO `region` VALUES ('511422000000', '511422', '5114', '彭山县', '3', 'P', '2365');
INSERT INTO `region` VALUES ('511423000000', '511423', '5114', '洪雅县', '3', 'H', '2366');
INSERT INTO `region` VALUES ('511424000000', '511424', '5114', '丹棱县', '3', 'D', '2367');
INSERT INTO `region` VALUES ('511425000000', '511425', '5114', '青神县', '3', 'Q', '2368');
INSERT INTO `region` VALUES ('511500000000', '5115', '51', '宜宾市', '2', 'Y', '248');
INSERT INTO `region` VALUES ('511501000000', '511501', '5115', '市辖区', '3', 'S', '2369');
INSERT INTO `region` VALUES ('511502000000', '511502', '5115', '翠屏区', '3', 'C', '2370');
INSERT INTO `region` VALUES ('511521000000', '511521', '5115', '宜宾县', '3', 'Y', '2371');
INSERT INTO `region` VALUES ('511522000000', '511522', '5115', '南溪县', '3', 'N', '2372');
INSERT INTO `region` VALUES ('511523000000', '511523', '5115', '江安县', '3', 'J', '2373');
INSERT INTO `region` VALUES ('511524000000', '511524', '5115', '长宁县', '3', 'C', '2374');
INSERT INTO `region` VALUES ('511525000000', '511525', '5115', '高县', '3', 'G', '2375');
INSERT INTO `region` VALUES ('511526000000', '511526', '5115', '珙县', '3', 'Z', '2376');
INSERT INTO `region` VALUES ('511527000000', '511527', '5115', '筠连县', '3', 'Z', '2377');
INSERT INTO `region` VALUES ('511528000000', '511528', '5115', '兴文县', '3', 'X', '2378');
INSERT INTO `region` VALUES ('511529000000', '511529', '5115', '屏山县', '3', 'P', '2379');
INSERT INTO `region` VALUES ('511600000000', '5116', '51', '广安市', '2', 'G', '249');
INSERT INTO `region` VALUES ('511601000000', '511601', '5116', '市辖区', '3', 'S', '2380');
INSERT INTO `region` VALUES ('511602000000', '511602', '5116', '广安区', '3', 'G', '2381');
INSERT INTO `region` VALUES ('511621000000', '511621', '5116', '岳池县', '3', 'Y', '2382');
INSERT INTO `region` VALUES ('511622000000', '511622', '5116', '武胜县', '3', 'W', '2383');
INSERT INTO `region` VALUES ('511623000000', '511623', '5116', '邻水县', '3', 'L', '2384');
INSERT INTO `region` VALUES ('511681000000', '511681', '5116', '华蓥市', '3', 'H', '2385');
INSERT INTO `region` VALUES ('511700000000', '5117', '51', '达州市', '2', 'D', '250');
INSERT INTO `region` VALUES ('511701000000', '511701', '5117', '市辖区', '3', 'S', '2386');
INSERT INTO `region` VALUES ('511702000000', '511702', '5117', '通川区', '3', 'T', '2387');
INSERT INTO `region` VALUES ('511721000000', '511721', '5117', '达县', '3', 'D', '2388');
INSERT INTO `region` VALUES ('511722000000', '511722', '5117', '宣汉县', '3', 'X', '2389');
INSERT INTO `region` VALUES ('511723000000', '511723', '5117', '开江县', '3', 'K', '2390');
INSERT INTO `region` VALUES ('511724000000', '511724', '5117', '大竹县', '3', 'D', '2391');
INSERT INTO `region` VALUES ('511725000000', '511725', '5117', '渠县', '3', 'Q', '2392');
INSERT INTO `region` VALUES ('511781000000', '511781', '5117', '万源市', '3', 'W', '2393');
INSERT INTO `region` VALUES ('511800000000', '5118', '51', '雅安市', '2', 'Y', '251');
INSERT INTO `region` VALUES ('511801000000', '511801', '5118', '市辖区', '3', 'S', '2394');
INSERT INTO `region` VALUES ('511802000000', '511802', '5118', '雨城区', '3', 'Y', '2395');
INSERT INTO `region` VALUES ('511821000000', '511821', '5118', '名山县', '3', 'M', '2396');
INSERT INTO `region` VALUES ('511822000000', '511822', '5118', '荥经县', '3', 'Z', '2397');
INSERT INTO `region` VALUES ('511823000000', '511823', '5118', '汉源县', '3', 'H', '2398');
INSERT INTO `region` VALUES ('511824000000', '511824', '5118', '石棉县', '3', 'S', '2399');
INSERT INTO `region` VALUES ('511825000000', '511825', '5118', '天全县', '3', 'T', '2400');
INSERT INTO `region` VALUES ('511826000000', '511826', '5118', '芦山县', '3', 'L', '2401');
INSERT INTO `region` VALUES ('511827000000', '511827', '5118', '宝兴县', '3', 'B', '2402');
INSERT INTO `region` VALUES ('511900000000', '5119', '51', '巴中市', '2', 'B', '252');
INSERT INTO `region` VALUES ('511901000000', '511901', '5119', '市辖区', '3', 'S', '2403');
INSERT INTO `region` VALUES ('511902000000', '511902', '5119', '巴州区', '3', 'B', '2404');
INSERT INTO `region` VALUES ('511921000000', '511921', '5119', '通江县', '3', 'T', '2405');
INSERT INTO `region` VALUES ('511922000000', '511922', '5119', '南江县', '3', 'N', '2406');
INSERT INTO `region` VALUES ('511923000000', '511923', '5119', '平昌县', '3', 'P', '2407');
INSERT INTO `region` VALUES ('512000000000', '5120', '51', '资阳市', '2', 'Z', '253');
INSERT INTO `region` VALUES ('512001000000', '512001', '5120', '市辖区', '3', 'S', '2408');
INSERT INTO `region` VALUES ('512002000000', '512002', '5120', '雁江区', '3', 'Y', '2409');
INSERT INTO `region` VALUES ('512021000000', '512021', '5120', '安岳县', '3', 'A', '2410');
INSERT INTO `region` VALUES ('512022000000', '512022', '5120', '乐至县', '3', 'L', '2411');
INSERT INTO `region` VALUES ('512081000000', '512081', '5120', '简阳市', '3', 'J', '2412');
INSERT INTO `region` VALUES ('513200000000', '5132', '51', '阿坝藏族羌族自治州', '2', 'A', '254');
INSERT INTO `region` VALUES ('513221000000', '513221', '5132', '汶川县', '3', 'Z', '2413');
INSERT INTO `region` VALUES ('513222000000', '513222', '5132', '理县', '3', 'L', '2414');
INSERT INTO `region` VALUES ('513223000000', '513223', '5132', '茂县', '3', 'M', '2415');
INSERT INTO `region` VALUES ('513224000000', '513224', '5132', '松潘县', '3', 'S', '2416');
INSERT INTO `region` VALUES ('513225000000', '513225', '5132', '九寨沟县', '3', 'J', '2417');
INSERT INTO `region` VALUES ('513226000000', '513226', '5132', '金川县', '3', 'J', '2418');
INSERT INTO `region` VALUES ('513227000000', '513227', '5132', '小金县', '3', 'X', '2419');
INSERT INTO `region` VALUES ('513228000000', '513228', '5132', '黑水县', '3', 'H', '2420');
INSERT INTO `region` VALUES ('513229000000', '513229', '5132', '马尔康县', '3', 'M', '2421');
INSERT INTO `region` VALUES ('513230000000', '513230', '5132', '壤塘县', '3', 'R', '2422');
INSERT INTO `region` VALUES ('513231000000', '513231', '5132', '阿坝县', '3', 'A', '2423');
INSERT INTO `region` VALUES ('513232000000', '513232', '5132', '若尔盖县', '3', 'R', '2424');
INSERT INTO `region` VALUES ('513233000000', '513233', '5132', '红原县', '3', 'H', '2425');
INSERT INTO `region` VALUES ('513300000000', '5133', '51', '甘孜藏族自治州', '2', 'G', '255');
INSERT INTO `region` VALUES ('513321000000', '513321', '5133', '康定县', '3', 'K', '2426');
INSERT INTO `region` VALUES ('513322000000', '513322', '5133', '泸定县', '3', 'Z', '2427');
INSERT INTO `region` VALUES ('513323000000', '513323', '5133', '丹巴县', '3', 'D', '2428');
INSERT INTO `region` VALUES ('513324000000', '513324', '5133', '九龙县', '3', 'J', '2429');
INSERT INTO `region` VALUES ('513325000000', '513325', '5133', '雅江县', '3', 'Y', '2430');
INSERT INTO `region` VALUES ('513326000000', '513326', '5133', '道孚县', '3', 'D', '2431');
INSERT INTO `region` VALUES ('513327000000', '513327', '5133', '炉霍县', '3', 'L', '2432');
INSERT INTO `region` VALUES ('513328000000', '513328', '5133', '甘孜县', '3', 'G', '2433');
INSERT INTO `region` VALUES ('513329000000', '513329', '5133', '新龙县', '3', 'X', '2434');
INSERT INTO `region` VALUES ('513330000000', '513330', '5133', '德格县', '3', 'D', '2435');
INSERT INTO `region` VALUES ('513331000000', '513331', '5133', '白玉县', '3', 'B', '2436');
INSERT INTO `region` VALUES ('513332000000', '513332', '5133', '石渠县', '3', 'S', '2437');
INSERT INTO `region` VALUES ('513333000000', '513333', '5133', '色达县', '3', 'S', '2438');
INSERT INTO `region` VALUES ('513334000000', '513334', '5133', '理塘县', '3', 'L', '2439');
INSERT INTO `region` VALUES ('513335000000', '513335', '5133', '巴塘县', '3', 'B', '2440');
INSERT INTO `region` VALUES ('513336000000', '513336', '5133', '乡城县', '3', 'X', '2441');
INSERT INTO `region` VALUES ('513337000000', '513337', '5133', '稻城县', '3', 'D', '2442');
INSERT INTO `region` VALUES ('513338000000', '513338', '5133', '得荣县', '3', 'D', '2443');
INSERT INTO `region` VALUES ('513400000000', '5134', '51', '凉山彝族自治州', '2', 'L', '256');
INSERT INTO `region` VALUES ('513401000000', '513401', '5134', '西昌市', '3', 'X', '2444');
INSERT INTO `region` VALUES ('513422000000', '513422', '5134', '木里藏族自治县', '3', 'M', '2445');
INSERT INTO `region` VALUES ('513423000000', '513423', '5134', '盐源县', '3', 'Y', '2446');
INSERT INTO `region` VALUES ('513424000000', '513424', '5134', '德昌县', '3', 'D', '2447');
INSERT INTO `region` VALUES ('513425000000', '513425', '5134', '会理县', '3', 'H', '2448');
INSERT INTO `region` VALUES ('513426000000', '513426', '5134', '会东县', '3', 'H', '2449');
INSERT INTO `region` VALUES ('513427000000', '513427', '5134', '宁南县', '3', 'N', '2450');
INSERT INTO `region` VALUES ('513428000000', '513428', '5134', '普格县', '3', 'P', '2451');
INSERT INTO `region` VALUES ('513429000000', '513429', '5134', '布拖县', '3', 'B', '2452');
INSERT INTO `region` VALUES ('513430000000', '513430', '5134', '金阳县', '3', 'J', '2453');
INSERT INTO `region` VALUES ('513431000000', '513431', '5134', '昭觉县', '3', 'Z', '2454');
INSERT INTO `region` VALUES ('513432000000', '513432', '5134', '喜德县', '3', 'X', '2455');
INSERT INTO `region` VALUES ('513433000000', '513433', '5134', '冕宁县', '3', 'M', '2456');
INSERT INTO `region` VALUES ('513434000000', '513434', '5134', '越西县', '3', 'Y', '2457');
INSERT INTO `region` VALUES ('513435000000', '513435', '5134', '甘洛县', '3', 'G', '2458');
INSERT INTO `region` VALUES ('513436000000', '513436', '5134', '美姑县', '3', 'M', '2459');
INSERT INTO `region` VALUES ('513437000000', '513437', '5134', '雷波县', '3', 'L', '2460');
INSERT INTO `region` VALUES ('520000000000', '52', 'root', '贵州省', '1', 'G', '23');
INSERT INTO `region` VALUES ('520100000000', '5201', '52', '贵阳市', '2', 'G', '257');
INSERT INTO `region` VALUES ('520101000000', '520101', '5201', '市辖区', '3', 'S', '2461');
INSERT INTO `region` VALUES ('520102000000', '520102', '5201', '南明区', '3', 'N', '2462');
INSERT INTO `region` VALUES ('520103000000', '520103', '5201', '云岩区', '3', 'Y', '2463');
INSERT INTO `region` VALUES ('520111000000', '520111', '5201', '花溪区', '3', 'H', '2464');
INSERT INTO `region` VALUES ('520112000000', '520112', '5201', '乌当区', '3', 'W', '2465');
INSERT INTO `region` VALUES ('520113000000', '520113', '5201', '白云区', '3', 'B', '2466');
INSERT INTO `region` VALUES ('520114000000', '520114', '5201', '小河区', '3', 'X', '2467');
INSERT INTO `region` VALUES ('520121000000', '520121', '5201', '开阳县', '3', 'K', '2468');
INSERT INTO `region` VALUES ('520122000000', '520122', '5201', '息烽县', '3', 'X', '2469');
INSERT INTO `region` VALUES ('520123000000', '520123', '5201', '修文县', '3', 'X', '2470');
INSERT INTO `region` VALUES ('520181000000', '520181', '5201', '清镇市', '3', 'Q', '2471');
INSERT INTO `region` VALUES ('520200000000', '5202', '52', '六盘水市', '2', 'L', '258');
INSERT INTO `region` VALUES ('520201000000', '520201', '5202', '钟山区', '3', 'Z', '2472');
INSERT INTO `region` VALUES ('520203000000', '520203', '5202', '六枝特区', '3', 'L', '2473');
INSERT INTO `region` VALUES ('520221000000', '520221', '5202', '水城县', '3', 'S', '2474');
INSERT INTO `region` VALUES ('520222000000', '520222', '5202', '盘县', '3', 'P', '2475');
INSERT INTO `region` VALUES ('520300000000', '5203', '52', '遵义市', '2', 'Z', '259');
INSERT INTO `region` VALUES ('520301000000', '520301', '5203', '市辖区', '3', 'S', '2476');
INSERT INTO `region` VALUES ('520302000000', '520302', '5203', '红花岗区', '3', 'H', '2477');
INSERT INTO `region` VALUES ('520303000000', '520303', '5203', '汇川区', '3', 'H', '2478');
INSERT INTO `region` VALUES ('520321000000', '520321', '5203', '遵义县', '3', 'Z', '2479');
INSERT INTO `region` VALUES ('520322000000', '520322', '5203', '桐梓县', '3', 'T', '2480');
INSERT INTO `region` VALUES ('520323000000', '520323', '5203', '绥阳县', '3', 'S', '2481');
INSERT INTO `region` VALUES ('520324000000', '520324', '5203', '正安县', '3', 'Z', '2482');
INSERT INTO `region` VALUES ('520325000000', '520325', '5203', '道真仡佬族苗族自治县', '3', 'D', '2483');
INSERT INTO `region` VALUES ('520326000000', '520326', '5203', '务川仡佬族苗族自治县', '3', 'W', '2484');
INSERT INTO `region` VALUES ('520327000000', '520327', '5203', '凤冈县', '3', 'F', '2485');
INSERT INTO `region` VALUES ('520328000000', '520328', '5203', '湄潭县', '3', 'Z', '2486');
INSERT INTO `region` VALUES ('520329000000', '520329', '5203', '余庆县', '3', 'Y', '2487');
INSERT INTO `region` VALUES ('520330000000', '520330', '5203', '习水县', '3', 'X', '2488');
INSERT INTO `region` VALUES ('520381000000', '520381', '5203', '赤水市', '3', 'C', '2489');
INSERT INTO `region` VALUES ('520382000000', '520382', '5203', '仁怀市', '3', 'R', '2490');
INSERT INTO `region` VALUES ('520400000000', '5204', '52', '安顺市', '2', 'A', '260');
INSERT INTO `region` VALUES ('520401000000', '520401', '5204', '市辖区', '3', 'S', '2491');
INSERT INTO `region` VALUES ('520402000000', '520402', '5204', '西秀区', '3', 'X', '2492');
INSERT INTO `region` VALUES ('520421000000', '520421', '5204', '平坝县', '3', 'P', '2493');
INSERT INTO `region` VALUES ('520422000000', '520422', '5204', '普定县', '3', 'P', '2494');
INSERT INTO `region` VALUES ('520423000000', '520423', '5204', '镇宁布依族苗族自治县', '3', 'Z', '2495');
INSERT INTO `region` VALUES ('520424000000', '520424', '5204', '关岭布依族苗族自治县', '3', 'G', '2496');
INSERT INTO `region` VALUES ('520425000000', '520425', '5204', '紫云苗族布依族自治县', '3', 'Z', '2497');
INSERT INTO `region` VALUES ('522200000000', '5222', '52', '铜仁地区', '2', 'T', '261');
INSERT INTO `region` VALUES ('522201000000', '522201', '5222', '铜仁市', '3', 'T', '2498');
INSERT INTO `region` VALUES ('522222000000', '522222', '5222', '江口县', '3', 'J', '2499');
INSERT INTO `region` VALUES ('522223000000', '522223', '5222', '玉屏侗族自治县', '3', 'Y', '2500');
INSERT INTO `region` VALUES ('522224000000', '522224', '5222', '石阡县', '3', 'S', '2501');
INSERT INTO `region` VALUES ('522225000000', '522225', '5222', '思南县', '3', 'S', '2502');
INSERT INTO `region` VALUES ('522226000000', '522226', '5222', '印江土家族苗族自治县', '3', 'Y', '2503');
INSERT INTO `region` VALUES ('522227000000', '522227', '5222', '德江县', '3', 'D', '2504');
INSERT INTO `region` VALUES ('522228000000', '522228', '5222', '沿河土家族自治县', '3', 'Y', '2505');
INSERT INTO `region` VALUES ('522229000000', '522229', '5222', '松桃苗族自治县', '3', 'S', '2506');
INSERT INTO `region` VALUES ('522230000000', '522230', '5222', '万山区', '3', 'W', '2507');
INSERT INTO `region` VALUES ('522300000000', '5223', '52', '黔西南布依族苗族自治州', '2', 'Q', '262');
INSERT INTO `region` VALUES ('522301000000', '522301', '5223', '兴义市', '3', 'X', '2508');
INSERT INTO `region` VALUES ('522322000000', '522322', '5223', '兴仁县', '3', 'X', '2509');
INSERT INTO `region` VALUES ('522323000000', '522323', '5223', '普安县', '3', 'P', '2510');
INSERT INTO `region` VALUES ('522324000000', '522324', '5223', '晴隆县', '3', 'Q', '2511');
INSERT INTO `region` VALUES ('522325000000', '522325', '5223', '贞丰县', '3', 'Z', '2512');
INSERT INTO `region` VALUES ('522326000000', '522326', '5223', '望谟县', '3', 'W', '2513');
INSERT INTO `region` VALUES ('522327000000', '522327', '5223', '册亨县', '3', 'C', '2514');
INSERT INTO `region` VALUES ('522328000000', '522328', '5223', '安龙县', '3', 'A', '2515');
INSERT INTO `region` VALUES ('522400000000', '5224', '52', '毕节地区', '2', 'B', '263');
INSERT INTO `region` VALUES ('522401000000', '522401', '5224', '毕节市', '3', 'B', '2516');
INSERT INTO `region` VALUES ('522422000000', '522422', '5224', '大方县', '3', 'D', '2517');
INSERT INTO `region` VALUES ('522423000000', '522423', '5224', '黔西县', '3', 'Q', '2518');
INSERT INTO `region` VALUES ('522424000000', '522424', '5224', '金沙县', '3', 'J', '2519');
INSERT INTO `region` VALUES ('522425000000', '522425', '5224', '织金县', '3', 'Z', '2520');
INSERT INTO `region` VALUES ('522426000000', '522426', '5224', '纳雍县', '3', 'N', '2521');
INSERT INTO `region` VALUES ('522427000000', '522427', '5224', '威宁彝族回族苗族自治县', '3', 'W', '2522');
INSERT INTO `region` VALUES ('522428000000', '522428', '5224', '赫章县', '3', 'H', '2523');
INSERT INTO `region` VALUES ('522600000000', '5226', '52', '黔东南苗族侗族自治州', '2', 'Q', '264');
INSERT INTO `region` VALUES ('522601000000', '522601', '5226', '凯里市', '3', 'K', '2524');
INSERT INTO `region` VALUES ('522622000000', '522622', '5226', '黄平县', '3', 'H', '2525');
INSERT INTO `region` VALUES ('522623000000', '522623', '5226', '施秉县', '3', 'S', '2526');
INSERT INTO `region` VALUES ('522624000000', '522624', '5226', '三穗县', '3', 'S', '2527');
INSERT INTO `region` VALUES ('522625000000', '522625', '5226', '镇远县', '3', 'Z', '2528');
INSERT INTO `region` VALUES ('522626000000', '522626', '5226', '岑巩县', '3', 'Z', '2529');
INSERT INTO `region` VALUES ('522627000000', '522627', '5226', '天柱县', '3', 'T', '2530');
INSERT INTO `region` VALUES ('522628000000', '522628', '5226', '锦屏县', '3', 'J', '2531');
INSERT INTO `region` VALUES ('522629000000', '522629', '5226', '剑河县', '3', 'J', '2532');
INSERT INTO `region` VALUES ('522630000000', '522630', '5226', '台江县', '3', 'T', '2533');
INSERT INTO `region` VALUES ('522631000000', '522631', '5226', '黎平县', '3', 'L', '2534');
INSERT INTO `region` VALUES ('522632000000', '522632', '5226', '榕江县', '3', 'Z', '2535');
INSERT INTO `region` VALUES ('522633000000', '522633', '5226', '从江县', '3', 'C', '2536');
INSERT INTO `region` VALUES ('522634000000', '522634', '5226', '雷山县', '3', 'L', '2537');
INSERT INTO `region` VALUES ('522635000000', '522635', '5226', '麻江县', '3', 'M', '2538');
INSERT INTO `region` VALUES ('522636000000', '522636', '5226', '丹寨县', '3', 'D', '2539');
INSERT INTO `region` VALUES ('522700000000', '5227', '52', '黔南布依族苗族自治州', '2', 'Q', '265');
INSERT INTO `region` VALUES ('522701000000', '522701', '5227', '都匀市', '3', 'D', '2540');
INSERT INTO `region` VALUES ('522702000000', '522702', '5227', '福泉市', '3', 'F', '2541');
INSERT INTO `region` VALUES ('522722000000', '522722', '5227', '荔波县', '3', 'L', '2542');
INSERT INTO `region` VALUES ('522723000000', '522723', '5227', '贵定县', '3', 'G', '2543');
INSERT INTO `region` VALUES ('522725000000', '522725', '5227', '瓮安县', '3', 'W', '2544');
INSERT INTO `region` VALUES ('522726000000', '522726', '5227', '独山县', '3', 'D', '2545');
INSERT INTO `region` VALUES ('522727000000', '522727', '5227', '平塘县', '3', 'P', '2546');
INSERT INTO `region` VALUES ('522728000000', '522728', '5227', '罗甸县', '3', 'L', '2547');
INSERT INTO `region` VALUES ('522729000000', '522729', '5227', '长顺县', '3', 'C', '2548');
INSERT INTO `region` VALUES ('522730000000', '522730', '5227', '龙里县', '3', 'L', '2549');
INSERT INTO `region` VALUES ('522731000000', '522731', '5227', '惠水县', '3', 'H', '2550');
INSERT INTO `region` VALUES ('522732000000', '522732', '5227', '三都水族自治县', '3', 'S', '2551');
INSERT INTO `region` VALUES ('530000000000', '53', 'root', '云南省', '1', 'Y', '24');
INSERT INTO `region` VALUES ('530100000000', '5301', '53', '昆明市', '2', 'K', '266');
INSERT INTO `region` VALUES ('530101000000', '530101', '5301', '市辖区', '3', 'S', '2552');
INSERT INTO `region` VALUES ('530102000000', '530102', '5301', '五华区', '3', 'W', '2553');
INSERT INTO `region` VALUES ('530103000000', '530103', '5301', '盘龙区', '3', 'P', '2554');
INSERT INTO `region` VALUES ('530111000000', '530111', '5301', '官渡区', '3', 'G', '2555');
INSERT INTO `region` VALUES ('530112000000', '530112', '5301', '西山区', '3', 'X', '2556');
INSERT INTO `region` VALUES ('530113000000', '530113', '5301', '东川区', '3', 'D', '2557');
INSERT INTO `region` VALUES ('530121000000', '530121', '5301', '呈贡县', '3', 'C', '2558');
INSERT INTO `region` VALUES ('530122000000', '530122', '5301', '晋宁县', '3', 'J', '2559');
INSERT INTO `region` VALUES ('530124000000', '530124', '5301', '富民县', '3', 'F', '2560');
INSERT INTO `region` VALUES ('530125000000', '530125', '5301', '宜良县', '3', 'Y', '2561');
INSERT INTO `region` VALUES ('530126000000', '530126', '5301', '石林彝族自治县', '3', 'S', '2562');
INSERT INTO `region` VALUES ('530127000000', '530127', '5301', '嵩明县', '3', 'Z', '2563');
INSERT INTO `region` VALUES ('530128000000', '530128', '5301', '禄劝彝族苗族自治县', '3', 'L', '2564');
INSERT INTO `region` VALUES ('530129000000', '530129', '5301', '寻甸回族彝族自治县', '3', 'X', '2565');
INSERT INTO `region` VALUES ('530181000000', '530181', '5301', '安宁市', '3', 'A', '2566');
INSERT INTO `region` VALUES ('530300000000', '5303', '53', '曲靖市', '2', 'Q', '267');
INSERT INTO `region` VALUES ('530301000000', '530301', '5303', '市辖区', '3', 'S', '2567');
INSERT INTO `region` VALUES ('530302000000', '530302', '5303', '麒麟区', '3', 'Z', '2568');
INSERT INTO `region` VALUES ('530321000000', '530321', '5303', '马龙县', '3', 'M', '2569');
INSERT INTO `region` VALUES ('530322000000', '530322', '5303', '陆良县', '3', 'L', '2570');
INSERT INTO `region` VALUES ('530323000000', '530323', '5303', '师宗县', '3', 'S', '2571');
INSERT INTO `region` VALUES ('530324000000', '530324', '5303', '罗平县', '3', 'L', '2572');
INSERT INTO `region` VALUES ('530325000000', '530325', '5303', '富源县', '3', 'F', '2573');
INSERT INTO `region` VALUES ('530326000000', '530326', '5303', '会泽县', '3', 'H', '2574');
INSERT INTO `region` VALUES ('530328000000', '530328', '5303', '沾益县', '3', 'Z', '2575');
INSERT INTO `region` VALUES ('530381000000', '530381', '5303', '宣威市', '3', 'X', '2576');
INSERT INTO `region` VALUES ('530400000000', '5304', '53', '玉溪市', '2', 'Y', '268');
INSERT INTO `region` VALUES ('530401000000', '530401', '5304', '市辖区', '3', 'S', '2577');
INSERT INTO `region` VALUES ('530402000000', '530402', '5304', '红塔区', '3', 'H', '2578');
INSERT INTO `region` VALUES ('530421000000', '530421', '5304', '江川县', '3', 'J', '2579');
INSERT INTO `region` VALUES ('530422000000', '530422', '5304', '澄江县', '3', 'C', '2580');
INSERT INTO `region` VALUES ('530423000000', '530423', '5304', '通海县', '3', 'T', '2581');
INSERT INTO `region` VALUES ('530424000000', '530424', '5304', '华宁县', '3', 'H', '2582');
INSERT INTO `region` VALUES ('530425000000', '530425', '5304', '易门县', '3', 'Y', '2583');
INSERT INTO `region` VALUES ('530426000000', '530426', '5304', '峨山彝族自治县', '3', 'E', '2584');
INSERT INTO `region` VALUES ('530427000000', '530427', '5304', '新平彝族傣族自治县', '3', 'X', '2585');
INSERT INTO `region` VALUES ('530428000000', '530428', '5304', '元江县', '3', 'Y', '2586');
INSERT INTO `region` VALUES ('530500000000', '5305', '53', '保山市', '2', 'B', '269');
INSERT INTO `region` VALUES ('530501000000', '530501', '5305', '市辖区', '3', 'S', '2587');
INSERT INTO `region` VALUES ('530502000000', '530502', '5305', '隆阳区', '3', 'L', '2588');
INSERT INTO `region` VALUES ('530521000000', '530521', '5305', '施甸县', '3', 'S', '2589');
INSERT INTO `region` VALUES ('530522000000', '530522', '5305', '腾冲县', '3', 'T', '2590');
INSERT INTO `region` VALUES ('530523000000', '530523', '5305', '龙陵县', '3', 'L', '2591');
INSERT INTO `region` VALUES ('530524000000', '530524', '5305', '昌宁县', '3', 'C', '2592');
INSERT INTO `region` VALUES ('530600000000', '5306', '53', '昭通市', '2', 'Z', '270');
INSERT INTO `region` VALUES ('530601000000', '530601', '5306', '市辖区', '3', 'S', '2593');
INSERT INTO `region` VALUES ('530602000000', '530602', '5306', '昭阳区', '3', 'Z', '2594');
INSERT INTO `region` VALUES ('530621000000', '530621', '5306', '鲁甸县', '3', 'L', '2595');
INSERT INTO `region` VALUES ('530622000000', '530622', '5306', '巧家县', '3', 'Q', '2596');
INSERT INTO `region` VALUES ('530623000000', '530623', '5306', '盐津县', '3', 'Y', '2597');
INSERT INTO `region` VALUES ('530624000000', '530624', '5306', '大关县', '3', 'D', '2598');
INSERT INTO `region` VALUES ('530625000000', '530625', '5306', '永善县', '3', 'Y', '2599');
INSERT INTO `region` VALUES ('530626000000', '530626', '5306', '绥江县', '3', 'S', '2600');
INSERT INTO `region` VALUES ('530627000000', '530627', '5306', '镇雄县', '3', 'Z', '2601');
INSERT INTO `region` VALUES ('530628000000', '530628', '5306', '彝良县', '3', 'Y', '2602');
INSERT INTO `region` VALUES ('530629000000', '530629', '5306', '威信县', '3', 'W', '2603');
INSERT INTO `region` VALUES ('530630000000', '530630', '5306', '水富县', '3', 'S', '2604');
INSERT INTO `region` VALUES ('530700000000', '5307', '53', '丽江市', '2', 'L', '271');
INSERT INTO `region` VALUES ('530701000000', '530701', '5307', '市辖区', '3', 'S', '2605');
INSERT INTO `region` VALUES ('530702000000', '530702', '5307', '古城区', '3', 'G', '2606');
INSERT INTO `region` VALUES ('530721000000', '530721', '5307', '玉龙纳西族自治县', '3', 'Y', '2607');
INSERT INTO `region` VALUES ('530722000000', '530722', '5307', '永胜县', '3', 'Y', '2608');
INSERT INTO `region` VALUES ('530723000000', '530723', '5307', '华坪县', '3', 'H', '2609');
INSERT INTO `region` VALUES ('530724000000', '530724', '5307', '宁蒗彝族自治县', '3', 'N', '2610');
INSERT INTO `region` VALUES ('530800000000', '5308', '53', '普洱市', '2', 'P', '272');
INSERT INTO `region` VALUES ('530801000000', '530801', '5308', '市辖区', '3', 'S', '2611');
INSERT INTO `region` VALUES ('530802000000', '530802', '5308', '思茅区', '3', 'S', '2612');
INSERT INTO `region` VALUES ('530821000000', '530821', '5308', '宁洱哈尼族彝族自治县', '3', 'N', '2613');
INSERT INTO `region` VALUES ('530822000000', '530822', '5308', '墨江哈尼族自治县', '3', 'M', '2614');
INSERT INTO `region` VALUES ('530823000000', '530823', '5308', '景东彝族自治县', '3', 'J', '2615');
INSERT INTO `region` VALUES ('530824000000', '530824', '5308', '景谷傣族彝族自治县', '3', 'J', '2616');
INSERT INTO `region` VALUES ('530825000000', '530825', '5308', '镇沅彝族哈尼族拉祜族自治县', '3', 'Z', '2617');
INSERT INTO `region` VALUES ('530826000000', '530826', '5308', '江城哈尼族彝族自治县', '3', 'J', '2618');
INSERT INTO `region` VALUES ('530827000000', '530827', '5308', '孟连傣族拉祜族佤族自治县', '3', 'M', '2619');
INSERT INTO `region` VALUES ('530828000000', '530828', '5308', '澜沧拉祜族自治县', '3', 'L', '2620');
INSERT INTO `region` VALUES ('530829000000', '530829', '5308', '西盟佤族自治县', '3', 'X', '2621');
INSERT INTO `region` VALUES ('530900000000', '5309', '53', '临沧市', '2', 'L', '273');
INSERT INTO `region` VALUES ('530901000000', '530901', '5309', '市辖区', '3', 'S', '2622');
INSERT INTO `region` VALUES ('530902000000', '530902', '5309', '临翔区', '3', 'L', '2623');
INSERT INTO `region` VALUES ('530921000000', '530921', '5309', '凤庆县', '3', 'F', '2624');
INSERT INTO `region` VALUES ('530922000000', '530922', '5309', '云县', '3', 'Y', '2625');
INSERT INTO `region` VALUES ('530923000000', '530923', '5309', '永德县', '3', 'Y', '2626');
INSERT INTO `region` VALUES ('530924000000', '530924', '5309', '镇康县', '3', 'Z', '2627');
INSERT INTO `region` VALUES ('530925000000', '530925', '5309', '双江拉祜族佤族布朗族傣族自治县', '3', 'S', '2628');
INSERT INTO `region` VALUES ('530926000000', '530926', '5309', '耿马傣族佤族自治县', '3', 'G', '2629');
INSERT INTO `region` VALUES ('530927000000', '530927', '5309', '沧源佤族自治县', '3', 'C', '2630');
INSERT INTO `region` VALUES ('532300000000', '5323', '53', '楚雄彝族自治州', '2', 'C', '274');
INSERT INTO `region` VALUES ('532301000000', '532301', '5323', '楚雄市', '3', 'C', '2631');
INSERT INTO `region` VALUES ('532322000000', '532322', '5323', '双柏县', '3', 'S', '2632');
INSERT INTO `region` VALUES ('532323000000', '532323', '5323', '牟定县', '3', 'M', '2633');
INSERT INTO `region` VALUES ('532324000000', '532324', '5323', '南华县', '3', 'N', '2634');
INSERT INTO `region` VALUES ('532325000000', '532325', '5323', '姚安县', '3', 'Y', '2635');
INSERT INTO `region` VALUES ('532326000000', '532326', '5323', '大姚县', '3', 'D', '2636');
INSERT INTO `region` VALUES ('532327000000', '532327', '5323', '永仁县', '3', 'Y', '2637');
INSERT INTO `region` VALUES ('532328000000', '532328', '5323', '元谋县', '3', 'Y', '2638');
INSERT INTO `region` VALUES ('532329000000', '532329', '5323', '武定县', '3', 'W', '2639');
INSERT INTO `region` VALUES ('532331000000', '532331', '5323', '禄丰县', '3', 'L', '2640');
INSERT INTO `region` VALUES ('532500000000', '5325', '53', '红河哈尼族彝族自治州', '2', 'H', '275');
INSERT INTO `region` VALUES ('532501000000', '532501', '5325', '个旧市', '3', 'G', '2641');
INSERT INTO `region` VALUES ('532502000000', '532502', '5325', '开远市', '3', 'K', '2642');
INSERT INTO `region` VALUES ('532522000000', '532522', '5325', '蒙自县', '3', 'M', '2643');
INSERT INTO `region` VALUES ('532523000000', '532523', '5325', '屏边苗族自治县', '3', 'P', '2644');
INSERT INTO `region` VALUES ('532524000000', '532524', '5325', '建水县', '3', 'J', '2645');
INSERT INTO `region` VALUES ('532525000000', '532525', '5325', '石屏县', '3', 'S', '2646');
INSERT INTO `region` VALUES ('532526000000', '532526', '5325', '弥勒县', '3', 'M', '2647');
INSERT INTO `region` VALUES ('532527000000', '532527', '5325', '泸西县', '3', 'Z', '2648');
INSERT INTO `region` VALUES ('532528000000', '532528', '5325', '元阳县', '3', 'Y', '2649');
INSERT INTO `region` VALUES ('532529000000', '532529', '5325', '红河县', '3', 'H', '2650');
INSERT INTO `region` VALUES ('532530000000', '532530', '5325', '金平苗族瑶族傣族自治县', '3', 'J', '2651');
INSERT INTO `region` VALUES ('532531000000', '532531', '5325', '绿春县', '3', 'L', '2652');
INSERT INTO `region` VALUES ('532532000000', '532532', '5325', '河口瑶族自治县', '3', 'H', '2653');
INSERT INTO `region` VALUES ('532600000000', '5326', '53', '文山壮族苗族自治州', '2', 'W', '276');
INSERT INTO `region` VALUES ('532621000000', '532621', '5326', '文山县', '3', 'W', '2654');
INSERT INTO `region` VALUES ('532622000000', '532622', '5326', '砚山县', '3', 'Y', '2655');
INSERT INTO `region` VALUES ('532623000000', '532623', '5326', '西畴县', '3', 'X', '2656');
INSERT INTO `region` VALUES ('532624000000', '532624', '5326', '麻栗坡县', '3', 'M', '2657');
INSERT INTO `region` VALUES ('532625000000', '532625', '5326', '马关县', '3', 'M', '2658');
INSERT INTO `region` VALUES ('532626000000', '532626', '5326', '丘北县', '3', 'Q', '2659');
INSERT INTO `region` VALUES ('532627000000', '532627', '5326', '广南县', '3', 'G', '2660');
INSERT INTO `region` VALUES ('532628000000', '532628', '5326', '富宁县', '3', 'F', '2661');
INSERT INTO `region` VALUES ('532800000000', '5328', '53', '西双版纳傣族自治州', '2', 'X', '277');
INSERT INTO `region` VALUES ('532801000000', '532801', '5328', '景洪市', '3', 'J', '2662');
INSERT INTO `region` VALUES ('532822000000', '532822', '5328', '勐海县', '3', 'Z', '2663');
INSERT INTO `region` VALUES ('532823000000', '532823', '5328', '勐腊县', '3', 'Z', '2664');
INSERT INTO `region` VALUES ('532900000000', '5329', '53', '大理白族自治州', '2', 'D', '278');
INSERT INTO `region` VALUES ('532901000000', '532901', '5329', '大理市', '3', 'D', '2665');
INSERT INTO `region` VALUES ('532922000000', '532922', '5329', '漾濞彝族自治县', '3', 'Y', '2666');
INSERT INTO `region` VALUES ('532923000000', '532923', '5329', '祥云县', '3', 'X', '2667');
INSERT INTO `region` VALUES ('532924000000', '532924', '5329', '宾川县', '3', 'B', '2668');
INSERT INTO `region` VALUES ('532925000000', '532925', '5329', '弥渡县', '3', 'M', '2669');
INSERT INTO `region` VALUES ('532926000000', '532926', '5329', '南涧彝族自治县', '3', 'N', '2670');
INSERT INTO `region` VALUES ('532927000000', '532927', '5329', '巍山彝族回族自治县', '3', 'W', '2671');
INSERT INTO `region` VALUES ('532928000000', '532928', '5329', '永平县', '3', 'Y', '2672');
INSERT INTO `region` VALUES ('532929000000', '532929', '5329', '云龙县', '3', 'Y', '2673');
INSERT INTO `region` VALUES ('532930000000', '532930', '5329', '洱源县', '3', 'E', '2674');
INSERT INTO `region` VALUES ('532931000000', '532931', '5329', '剑川县', '3', 'J', '2675');
INSERT INTO `region` VALUES ('532932000000', '532932', '5329', '鹤庆县', '3', 'H', '2676');
INSERT INTO `region` VALUES ('533100000000', '5331', '53', '德宏傣族景颇族自治州', '2', 'D', '279');
INSERT INTO `region` VALUES ('533102000000', '533102', '5331', '瑞丽市', '3', 'R', '2677');
INSERT INTO `region` VALUES ('533103000000', '533103', '5331', '潞西市', '3', 'L', '2678');
INSERT INTO `region` VALUES ('533122000000', '533122', '5331', '梁河县', '3', 'L', '2679');
INSERT INTO `region` VALUES ('533123000000', '533123', '5331', '盈江县', '3', 'Y', '2680');
INSERT INTO `region` VALUES ('533124000000', '533124', '5331', '陇川县', '3', 'L', '2681');
INSERT INTO `region` VALUES ('533300000000', '5333', '53', '怒江傈僳族自治州', '2', 'N', '280');
INSERT INTO `region` VALUES ('533321000000', '533321', '5333', '泸水县', '3', 'Z', '2682');
INSERT INTO `region` VALUES ('533323000000', '533323', '5333', '福贡县', '3', 'F', '2683');
INSERT INTO `region` VALUES ('533324000000', '533324', '5333', '贡山独龙族怒族自治县', '3', 'G', '2684');
INSERT INTO `region` VALUES ('533325000000', '533325', '5333', '兰坪白族普米族自治县', '3', 'L', '2685');
INSERT INTO `region` VALUES ('533400000000', '5334', '53', '迪庆藏族自治州', '2', 'D', '281');
INSERT INTO `region` VALUES ('533421000000', '533421', '5334', '香格里拉县', '3', 'X', '2686');
INSERT INTO `region` VALUES ('533422000000', '533422', '5334', '德钦县', '3', 'D', '2687');
INSERT INTO `region` VALUES ('533423000000', '533423', '5334', '维西傈僳族自治县', '3', 'W', '2688');
INSERT INTO `region` VALUES ('540000000000', '54', 'root', '西藏自治区', '1', 'X', '25');
INSERT INTO `region` VALUES ('540100000000', '5401', '54', '拉萨市', '2', 'L', '282');
INSERT INTO `region` VALUES ('540101000000', '540101', '5401', '市辖区', '3', 'S', '2689');
INSERT INTO `region` VALUES ('540102000000', '540102', '5401', '城关区', '3', 'C', '2690');
INSERT INTO `region` VALUES ('540121000000', '540121', '5401', '林周县', '3', 'L', '2691');
INSERT INTO `region` VALUES ('540122000000', '540122', '5401', '当雄县', '3', 'D', '2692');
INSERT INTO `region` VALUES ('540123000000', '540123', '5401', '尼木县', '3', 'N', '2693');
INSERT INTO `region` VALUES ('540124000000', '540124', '5401', '曲水县', '3', 'Q', '2694');
INSERT INTO `region` VALUES ('540125000000', '540125', '5401', '堆龙德庆县', '3', 'D', '2695');
INSERT INTO `region` VALUES ('540126000000', '540126', '5401', '达孜县', '3', 'D', '2696');
INSERT INTO `region` VALUES ('540127000000', '540127', '5401', '墨竹工卡县', '3', 'M', '2697');
INSERT INTO `region` VALUES ('542100000000', '5421', '54', '昌都地区', '2', 'C', '283');
INSERT INTO `region` VALUES ('542121000000', '542121', '5421', '昌都县', '3', 'C', '2698');
INSERT INTO `region` VALUES ('542122000000', '542122', '5421', '江达县', '3', 'J', '2699');
INSERT INTO `region` VALUES ('542123000000', '542123', '5421', '贡觉县', '3', 'G', '2700');
INSERT INTO `region` VALUES ('542124000000', '542124', '5421', '类乌齐县', '3', 'L', '2701');
INSERT INTO `region` VALUES ('542125000000', '542125', '5421', '丁青县', '3', 'D', '2702');
INSERT INTO `region` VALUES ('542126000000', '542126', '5421', '察雅县', '3', 'C', '2703');
INSERT INTO `region` VALUES ('542127000000', '542127', '5421', '八宿县', '3', 'B', '2704');
INSERT INTO `region` VALUES ('542128000000', '542128', '5421', '左贡县', '3', 'Z', '2705');
INSERT INTO `region` VALUES ('542129000000', '542129', '5421', '芒康县', '3', 'M', '2706');
INSERT INTO `region` VALUES ('542132000000', '542132', '5421', '洛隆县', '3', 'L', '2707');
INSERT INTO `region` VALUES ('542133000000', '542133', '5421', '边坝县', '3', 'B', '2708');
INSERT INTO `region` VALUES ('542200000000', '5422', '54', '山南地区', '2', 'S', '284');
INSERT INTO `region` VALUES ('542221000000', '542221', '5422', '乃东县', '3', 'N', '2709');
INSERT INTO `region` VALUES ('542222000000', '542222', '5422', '扎朗县', '3', 'Z', '2710');
INSERT INTO `region` VALUES ('542223000000', '542223', '5422', '贡嘎县', '3', 'G', '2711');
INSERT INTO `region` VALUES ('542224000000', '542224', '5422', '桑日县', '3', 'S', '2712');
INSERT INTO `region` VALUES ('542225000000', '542225', '5422', '琼结县', '3', 'Q', '2713');
INSERT INTO `region` VALUES ('542226000000', '542226', '5422', '曲松县', '3', 'Q', '2714');
INSERT INTO `region` VALUES ('542227000000', '542227', '5422', '措美县', '3', 'C', '2715');
INSERT INTO `region` VALUES ('542228000000', '542228', '5422', '洛扎县', '3', 'L', '2716');
INSERT INTO `region` VALUES ('542229000000', '542229', '5422', '加查县', '3', 'J', '2717');
INSERT INTO `region` VALUES ('542231000000', '542231', '5422', '隆子县', '3', 'L', '2718');
INSERT INTO `region` VALUES ('542232000000', '542232', '5422', '错那县', '3', 'C', '2719');
INSERT INTO `region` VALUES ('542233000000', '542233', '5422', '浪卡子县', '3', 'L', '2720');
INSERT INTO `region` VALUES ('542300000000', '5423', '54', '日喀则地区', '2', 'R', '285');
INSERT INTO `region` VALUES ('542301000000', '542301', '5423', '日喀则市', '3', 'R', '2721');
INSERT INTO `region` VALUES ('542322000000', '542322', '5423', '南木林县', '3', 'N', '2722');
INSERT INTO `region` VALUES ('542323000000', '542323', '5423', '江孜县', '3', 'J', '2723');
INSERT INTO `region` VALUES ('542324000000', '542324', '5423', '定日县', '3', 'D', '2724');
INSERT INTO `region` VALUES ('542325000000', '542325', '5423', '萨迦县', '3', 'S', '2725');
INSERT INTO `region` VALUES ('542326000000', '542326', '5423', '拉孜县', '3', 'L', '2726');
INSERT INTO `region` VALUES ('542327000000', '542327', '5423', '昂仁县', '3', 'A', '2727');
INSERT INTO `region` VALUES ('542328000000', '542328', '5423', '谢通门县', '3', 'X', '2728');
INSERT INTO `region` VALUES ('542329000000', '542329', '5423', '白朗县', '3', 'B', '2729');
INSERT INTO `region` VALUES ('542330000000', '542330', '5423', '仁布县', '3', 'R', '2730');
INSERT INTO `region` VALUES ('542331000000', '542331', '5423', '康马县', '3', 'K', '2731');
INSERT INTO `region` VALUES ('542332000000', '542332', '5423', '定结县', '3', 'D', '2732');
INSERT INTO `region` VALUES ('542333000000', '542333', '5423', '仲巴县', '3', 'Z', '2733');
INSERT INTO `region` VALUES ('542334000000', '542334', '5423', '亚东县', '3', 'Y', '2734');
INSERT INTO `region` VALUES ('542335000000', '542335', '5423', '吉隆县', '3', 'J', '2735');
INSERT INTO `region` VALUES ('542336000000', '542336', '5423', '聂拉木县', '3', 'N', '2736');
INSERT INTO `region` VALUES ('542337000000', '542337', '5423', '萨嘎县', '3', 'S', '2737');
INSERT INTO `region` VALUES ('542338000000', '542338', '5423', '岗巴县', '3', 'G', '2738');
INSERT INTO `region` VALUES ('542400000000', '5424', '54', '那曲地区', '2', 'N', '286');
INSERT INTO `region` VALUES ('542421000000', '542421', '5424', '那曲县', '3', 'N', '2739');
INSERT INTO `region` VALUES ('542422000000', '542422', '5424', '嘉黎县', '3', 'J', '2740');
INSERT INTO `region` VALUES ('542423000000', '542423', '5424', '比如县', '3', 'B', '2741');
INSERT INTO `region` VALUES ('542424000000', '542424', '5424', '聂荣县', '3', 'N', '2742');
INSERT INTO `region` VALUES ('542425000000', '542425', '5424', '安多县', '3', 'A', '2743');
INSERT INTO `region` VALUES ('542426000000', '542426', '5424', '申扎县', '3', 'S', '2744');
INSERT INTO `region` VALUES ('542427000000', '542427', '5424', '索县', '3', 'S', '2745');
INSERT INTO `region` VALUES ('542428000000', '542428', '5424', '班戈县', '3', 'B', '2746');
INSERT INTO `region` VALUES ('542429000000', '542429', '5424', '巴青县', '3', 'B', '2747');
INSERT INTO `region` VALUES ('542430000000', '542430', '5424', '尼玛县', '3', 'N', '2748');
INSERT INTO `region` VALUES ('542500000000', '5425', '54', '阿里地区', '2', 'A', '287');
INSERT INTO `region` VALUES ('542521000000', '542521', '5425', '普兰县', '3', 'P', '2749');
INSERT INTO `region` VALUES ('542522000000', '542522', '5425', '札达县', '3', 'Z', '2750');
INSERT INTO `region` VALUES ('542523000000', '542523', '5425', '噶尔县', '3', 'G', '2751');
INSERT INTO `region` VALUES ('542524000000', '542524', '5425', '日土县', '3', 'R', '2752');
INSERT INTO `region` VALUES ('542525000000', '542525', '5425', '革吉县', '3', 'G', '2753');
INSERT INTO `region` VALUES ('542526000000', '542526', '5425', '改则县', '3', 'G', '2754');
INSERT INTO `region` VALUES ('542527000000', '542527', '5425', '措勤县', '3', 'C', '2755');
INSERT INTO `region` VALUES ('542600000000', '5426', '54', '林芝地区', '2', 'L', '288');
INSERT INTO `region` VALUES ('542621000000', '542621', '5426', '林芝县', '3', 'L', '2756');
INSERT INTO `region` VALUES ('542622000000', '542622', '5426', '工布江达县', '3', 'G', '2757');
INSERT INTO `region` VALUES ('542623000000', '542623', '5426', '米林县', '3', 'M', '2758');
INSERT INTO `region` VALUES ('542624000000', '542624', '5426', '墨脱县', '3', 'M', '2759');
INSERT INTO `region` VALUES ('542625000000', '542625', '5426', '波密县', '3', 'B', '2760');
INSERT INTO `region` VALUES ('542626000000', '542626', '5426', '察隅县', '3', 'C', '2761');
INSERT INTO `region` VALUES ('542627000000', '542627', '5426', '朗县', '3', 'L', '2762');
INSERT INTO `region` VALUES ('610000000000', '61', 'root', '陕西省', '1', 'S', '26');
INSERT INTO `region` VALUES ('610100000000', '6101', '61', '西安市', '2', 'X', '289');
INSERT INTO `region` VALUES ('610101000000', '610101', '6101', '市辖区', '3', 'S', '2763');
INSERT INTO `region` VALUES ('610102000000', '610102', '6101', '新城区', '3', 'X', '2764');
INSERT INTO `region` VALUES ('610103000000', '610103', '6101', '碑林区', '3', 'B', '2765');
INSERT INTO `region` VALUES ('610104000000', '610104', '6101', '莲湖区', '3', 'L', '2766');
INSERT INTO `region` VALUES ('610111000000', '610111', '6101', '灞桥区', '3', 'Z', '2767');
INSERT INTO `region` VALUES ('610112000000', '610112', '6101', '未央区', '3', 'W', '2768');
INSERT INTO `region` VALUES ('610113000000', '610113', '6101', '雁塔区', '3', 'Y', '2769');
INSERT INTO `region` VALUES ('610114000000', '610114', '6101', '阎良区', '3', 'Y', '2770');
INSERT INTO `region` VALUES ('610115000000', '610115', '6101', '临潼区', '3', 'L', '2771');
INSERT INTO `region` VALUES ('610116000000', '610116', '6101', '长安区', '3', 'C', '2772');
INSERT INTO `region` VALUES ('610122000000', '610122', '6101', '蓝田县', '3', 'L', '2773');
INSERT INTO `region` VALUES ('610124000000', '610124', '6101', '周至县', '3', 'Z', '2774');
INSERT INTO `region` VALUES ('610125000000', '610125', '6101', '户县', '3', 'H', '2775');
INSERT INTO `region` VALUES ('610126000000', '610126', '6101', '高陵县', '3', 'G', '2776');
INSERT INTO `region` VALUES ('610200000000', '6102', '61', '铜川市', '2', 'T', '290');
INSERT INTO `region` VALUES ('610201000000', '610201', '6102', '市辖区', '3', 'S', '2777');
INSERT INTO `region` VALUES ('610202000000', '610202', '6102', '王益区', '3', 'W', '2778');
INSERT INTO `region` VALUES ('610203000000', '610203', '6102', '印台区', '3', 'Y', '2779');
INSERT INTO `region` VALUES ('610204000000', '610204', '6102', '耀州区', '3', 'Y', '2780');
INSERT INTO `region` VALUES ('610222000000', '610222', '6102', '宜君县', '3', 'Y', '2781');
INSERT INTO `region` VALUES ('610300000000', '6103', '61', '宝鸡市', '2', 'B', '291');
INSERT INTO `region` VALUES ('610301000000', '610301', '6103', '市辖区', '3', 'S', '2782');
INSERT INTO `region` VALUES ('610302000000', '610302', '6103', '渭滨区', '3', 'W', '2783');
INSERT INTO `region` VALUES ('610303000000', '610303', '6103', '金台区', '3', 'J', '2784');
INSERT INTO `region` VALUES ('610304000000', '610304', '6103', '陈仓区', '3', 'C', '2785');
INSERT INTO `region` VALUES ('610322000000', '610322', '6103', '凤翔县', '3', 'F', '2786');
INSERT INTO `region` VALUES ('610323000000', '610323', '6103', '岐山县', '3', 'Z', '2787');
INSERT INTO `region` VALUES ('610324000000', '610324', '6103', '扶风县', '3', 'F', '2788');
INSERT INTO `region` VALUES ('610326000000', '610326', '6103', '眉县', '3', 'M', '2789');
INSERT INTO `region` VALUES ('610327000000', '610327', '6103', '陇县', '3', 'L', '2790');
INSERT INTO `region` VALUES ('610328000000', '610328', '6103', '千阳县', '3', 'Q', '2791');
INSERT INTO `region` VALUES ('610329000000', '610329', '6103', '麟游县', '3', 'Z', '2792');
INSERT INTO `region` VALUES ('610330000000', '610330', '6103', '凤县', '3', 'F', '2793');
INSERT INTO `region` VALUES ('610331000000', '610331', '6103', '太白县', '3', 'T', '2794');
INSERT INTO `region` VALUES ('610400000000', '6104', '61', '咸阳市', '2', 'X', '292');
INSERT INTO `region` VALUES ('610401000000', '610401', '6104', '市辖区', '3', 'S', '2795');
INSERT INTO `region` VALUES ('610402000000', '610402', '6104', '秦都区', '3', 'Q', '2796');
INSERT INTO `region` VALUES ('610403000000', '610403', '6104', '杨陵区', '3', 'Y', '2797');
INSERT INTO `region` VALUES ('610404000000', '610404', '6104', '渭城区', '3', 'W', '2798');
INSERT INTO `region` VALUES ('610422000000', '610422', '6104', '三原县', '3', 'S', '2799');
INSERT INTO `region` VALUES ('610423000000', '610423', '6104', '泾阳县', '3', 'Z', '2800');
INSERT INTO `region` VALUES ('610424000000', '610424', '6104', '乾县', '3', 'Q', '2801');
INSERT INTO `region` VALUES ('610425000000', '610425', '6104', '礼泉县', '3', 'L', '2802');
INSERT INTO `region` VALUES ('610426000000', '610426', '6104', '永寿县', '3', 'Y', '2803');
INSERT INTO `region` VALUES ('610427000000', '610427', '6104', '彬县', '3', 'B', '2804');
INSERT INTO `region` VALUES ('610428000000', '610428', '6104', '长武县', '3', 'C', '2805');
INSERT INTO `region` VALUES ('610429000000', '610429', '6104', '旬邑县', '3', 'X', '2806');
INSERT INTO `region` VALUES ('610430000000', '610430', '6104', '淳化县', '3', 'C', '2807');
INSERT INTO `region` VALUES ('610431000000', '610431', '6104', '武功县', '3', 'W', '2808');
INSERT INTO `region` VALUES ('610481000000', '610481', '6104', '兴平市', '3', 'X', '2809');
INSERT INTO `region` VALUES ('610500000000', '6105', '61', '渭南市', '2', 'W', '293');
INSERT INTO `region` VALUES ('610501000000', '610501', '6105', '市辖区', '3', 'S', '2810');
INSERT INTO `region` VALUES ('610502000000', '610502', '6105', '临渭区', '3', 'L', '2811');
INSERT INTO `region` VALUES ('610521000000', '610521', '6105', '华县', '3', 'H', '2812');
INSERT INTO `region` VALUES ('610522000000', '610522', '6105', '潼关县', '3', 'Z', '2813');
INSERT INTO `region` VALUES ('610523000000', '610523', '6105', '大荔县', '3', 'D', '2814');
INSERT INTO `region` VALUES ('610524000000', '610524', '6105', '合阳县', '3', 'H', '2815');
INSERT INTO `region` VALUES ('610525000000', '610525', '6105', '澄城县', '3', 'C', '2816');
INSERT INTO `region` VALUES ('610526000000', '610526', '6105', '蒲城县', '3', 'P', '2817');
INSERT INTO `region` VALUES ('610527000000', '610527', '6105', '白水县', '3', 'B', '2818');
INSERT INTO `region` VALUES ('610528000000', '610528', '6105', '富平县', '3', 'F', '2819');
INSERT INTO `region` VALUES ('610581000000', '610581', '6105', '韩城市', '3', 'H', '2820');
INSERT INTO `region` VALUES ('610582000000', '610582', '6105', '华阴市', '3', 'H', '2821');
INSERT INTO `region` VALUES ('610600000000', '6106', '61', '延安市', '2', 'Y', '294');
INSERT INTO `region` VALUES ('610601000000', '610601', '6106', '市辖区', '3', 'S', '2822');
INSERT INTO `region` VALUES ('610602000000', '610602', '6106', '宝塔区', '3', 'B', '2823');
INSERT INTO `region` VALUES ('610621000000', '610621', '6106', '延长县', '3', 'Y', '2824');
INSERT INTO `region` VALUES ('610622000000', '610622', '6106', '延川县', '3', 'Y', '2825');
INSERT INTO `region` VALUES ('610623000000', '610623', '6106', '子长县', '3', 'Z', '2826');
INSERT INTO `region` VALUES ('610624000000', '610624', '6106', '安塞县', '3', 'A', '2827');
INSERT INTO `region` VALUES ('610625000000', '610625', '6106', '志丹县', '3', 'Z', '2828');
INSERT INTO `region` VALUES ('610626000000', '610626', '6106', '吴起县', '3', 'W', '2829');
INSERT INTO `region` VALUES ('610627000000', '610627', '6106', '甘泉县', '3', 'G', '2830');
INSERT INTO `region` VALUES ('610628000000', '610628', '6106', '富县', '3', 'F', '2831');
INSERT INTO `region` VALUES ('610629000000', '610629', '6106', '洛川县', '3', 'L', '2832');
INSERT INTO `region` VALUES ('610630000000', '610630', '6106', '宜川县', '3', 'Y', '2833');
INSERT INTO `region` VALUES ('610631000000', '610631', '6106', '黄龙县', '3', 'H', '2834');
INSERT INTO `region` VALUES ('610632000000', '610632', '6106', '黄陵县', '3', 'H', '2835');
INSERT INTO `region` VALUES ('610700000000', '6107', '61', '汉中市', '2', 'H', '295');
INSERT INTO `region` VALUES ('610701000000', '610701', '6107', '市辖区', '3', 'S', '2836');
INSERT INTO `region` VALUES ('610702000000', '610702', '6107', '汉台区', '3', 'H', '2837');
INSERT INTO `region` VALUES ('610721000000', '610721', '6107', '南郑县', '3', 'N', '2838');
INSERT INTO `region` VALUES ('610722000000', '610722', '6107', '城固县', '3', 'C', '2839');
INSERT INTO `region` VALUES ('610723000000', '610723', '6107', '洋县', '3', 'Y', '2840');
INSERT INTO `region` VALUES ('610724000000', '610724', '6107', '西乡县', '3', 'X', '2841');
INSERT INTO `region` VALUES ('610725000000', '610725', '6107', '勉县', '3', 'M', '2842');
INSERT INTO `region` VALUES ('610726000000', '610726', '6107', '宁强县', '3', 'N', '2843');
INSERT INTO `region` VALUES ('610727000000', '610727', '6107', '略阳县', '3', 'L', '2844');
INSERT INTO `region` VALUES ('610728000000', '610728', '6107', '镇巴县', '3', 'Z', '2845');
INSERT INTO `region` VALUES ('610729000000', '610729', '6107', '留坝县', '3', 'L', '2846');
INSERT INTO `region` VALUES ('610730000000', '610730', '6107', '佛坪县', '3', 'F', '2847');
INSERT INTO `region` VALUES ('610800000000', '6108', '61', '榆林市', '2', 'Y', '296');
INSERT INTO `region` VALUES ('610801000000', '610801', '6108', '市辖区', '3', 'S', '2848');
INSERT INTO `region` VALUES ('610802000000', '610802', '6108', '榆阳区', '3', 'Y', '2849');
INSERT INTO `region` VALUES ('610821000000', '610821', '6108', '神木县', '3', 'S', '2850');
INSERT INTO `region` VALUES ('610822000000', '610822', '6108', '府谷县', '3', 'F', '2851');
INSERT INTO `region` VALUES ('610823000000', '610823', '6108', '横山县', '3', 'H', '2852');
INSERT INTO `region` VALUES ('610824000000', '610824', '6108', '靖边县', '3', 'J', '2853');
INSERT INTO `region` VALUES ('610825000000', '610825', '6108', '定边县', '3', 'D', '2854');
INSERT INTO `region` VALUES ('610826000000', '610826', '6108', '绥德县', '3', 'S', '2855');
INSERT INTO `region` VALUES ('610827000000', '610827', '6108', '米脂县', '3', 'M', '2856');
INSERT INTO `region` VALUES ('610828000000', '610828', '6108', '佳县', '3', 'J', '2857');
INSERT INTO `region` VALUES ('610829000000', '610829', '6108', '吴堡县', '3', 'W', '2858');
INSERT INTO `region` VALUES ('610830000000', '610830', '6108', '清涧县', '3', 'Q', '2859');
INSERT INTO `region` VALUES ('610831000000', '610831', '6108', '子洲县', '3', 'Z', '2860');
INSERT INTO `region` VALUES ('610900000000', '6109', '61', '安康市', '2', 'A', '297');
INSERT INTO `region` VALUES ('610901000000', '610901', '6109', '市辖区', '3', 'S', '2861');
INSERT INTO `region` VALUES ('610902000000', '610902', '6109', '汉滨区', '3', 'H', '2862');
INSERT INTO `region` VALUES ('610921000000', '610921', '6109', '汉阴县', '3', 'H', '2863');
INSERT INTO `region` VALUES ('610922000000', '610922', '6109', '石泉县', '3', 'S', '2864');
INSERT INTO `region` VALUES ('610923000000', '610923', '6109', '宁陕县', '3', 'N', '2865');
INSERT INTO `region` VALUES ('610924000000', '610924', '6109', '紫阳县', '3', 'Z', '2866');
INSERT INTO `region` VALUES ('610925000000', '610925', '6109', '岚皋县', '3', 'Z', '2867');
INSERT INTO `region` VALUES ('610926000000', '610926', '6109', '平利县', '3', 'P', '2868');
INSERT INTO `region` VALUES ('610927000000', '610927', '6109', '镇坪县', '3', 'Z', '2869');
INSERT INTO `region` VALUES ('610928000000', '610928', '6109', '旬阳县', '3', 'X', '2870');
INSERT INTO `region` VALUES ('610929000000', '610929', '6109', '白河县', '3', 'B', '2871');
INSERT INTO `region` VALUES ('611000000000', '6110', '61', '商洛市', '2', 'S', '298');
INSERT INTO `region` VALUES ('611001000000', '611001', '6110', '市辖区', '3', 'S', '2872');
INSERT INTO `region` VALUES ('611002000000', '611002', '6110', '商州区', '3', 'S', '2873');
INSERT INTO `region` VALUES ('611021000000', '611021', '6110', '洛南县', '3', 'L', '2874');
INSERT INTO `region` VALUES ('611022000000', '611022', '6110', '丹凤县', '3', 'D', '2875');
INSERT INTO `region` VALUES ('611023000000', '611023', '6110', '商南县', '3', 'S', '2876');
INSERT INTO `region` VALUES ('611024000000', '611024', '6110', '山阳县', '3', 'S', '2877');
INSERT INTO `region` VALUES ('611025000000', '611025', '6110', '镇安县', '3', 'Z', '2878');
INSERT INTO `region` VALUES ('611026000000', '611026', '6110', '柞水县', '3', 'Z', '2879');
INSERT INTO `region` VALUES ('620000000000', '62', 'root', '甘肃省', '1', 'G', '27');
INSERT INTO `region` VALUES ('620100000000', '6201', '62', '兰州市', '2', 'L', '299');
INSERT INTO `region` VALUES ('620101000000', '620101', '6201', '市辖区', '3', 'S', '2880');
INSERT INTO `region` VALUES ('620102000000', '620102', '6201', '城关区', '3', 'C', '2881');
INSERT INTO `region` VALUES ('620103000000', '620103', '6201', '七里河区', '3', 'Q', '2882');
INSERT INTO `region` VALUES ('620104000000', '620104', '6201', '西固区', '3', 'X', '2883');
INSERT INTO `region` VALUES ('620105000000', '620105', '6201', '安宁区', '3', 'A', '2884');
INSERT INTO `region` VALUES ('620111000000', '620111', '6201', '红古区', '3', 'H', '2885');
INSERT INTO `region` VALUES ('620121000000', '620121', '6201', '永登县', '3', 'Y', '2886');
INSERT INTO `region` VALUES ('620122000000', '620122', '6201', '皋兰县', '3', 'G', '2887');
INSERT INTO `region` VALUES ('620123000000', '620123', '6201', '榆中县', '3', 'Y', '2888');
INSERT INTO `region` VALUES ('620200000000', '6202', '62', '嘉峪关市', '2', 'J', '300');
INSERT INTO `region` VALUES ('620201000000', '620201', '6202', '市辖区', '3', 'S', '2889');
INSERT INTO `region` VALUES ('620300000000', '6203', '62', '金昌市', '2', 'J', '301');
INSERT INTO `region` VALUES ('620301000000', '620301', '6203', '市辖区', '3', 'S', '2890');
INSERT INTO `region` VALUES ('620302000000', '620302', '6203', '金川区', '3', 'J', '2891');
INSERT INTO `region` VALUES ('620321000000', '620321', '6203', '永昌县', '3', 'Y', '2892');
INSERT INTO `region` VALUES ('620400000000', '6204', '62', '白银市', '2', 'B', '302');
INSERT INTO `region` VALUES ('620401000000', '620401', '6204', '市辖区', '3', 'S', '2893');
INSERT INTO `region` VALUES ('620402000000', '620402', '6204', '白银区', '3', 'B', '2894');
INSERT INTO `region` VALUES ('620403000000', '620403', '6204', '平川区', '3', 'P', '2895');
INSERT INTO `region` VALUES ('620421000000', '620421', '6204', '靖远县', '3', 'J', '2896');
INSERT INTO `region` VALUES ('620422000000', '620422', '6204', '会宁县', '3', 'H', '2897');
INSERT INTO `region` VALUES ('620423000000', '620423', '6204', '景泰县', '3', 'J', '2898');
INSERT INTO `region` VALUES ('620500000000', '6205', '62', '天水市', '2', 'T', '303');
INSERT INTO `region` VALUES ('620501000000', '620501', '6205', '市辖区', '3', 'S', '2899');
INSERT INTO `region` VALUES ('620502000000', '620502', '6205', '秦州区', '3', 'Q', '2900');
INSERT INTO `region` VALUES ('620503000000', '620503', '6205', '麦积区', '3', 'M', '2901');
INSERT INTO `region` VALUES ('620521000000', '620521', '6205', '清水县', '3', 'Q', '2902');
INSERT INTO `region` VALUES ('620522000000', '620522', '6205', '秦安县', '3', 'Q', '2903');
INSERT INTO `region` VALUES ('620523000000', '620523', '6205', '甘谷县', '3', 'G', '2904');
INSERT INTO `region` VALUES ('620524000000', '620524', '6205', '武山县', '3', 'W', '2905');
INSERT INTO `region` VALUES ('620525000000', '620525', '6205', '张家川县', '3', 'Z', '2906');
INSERT INTO `region` VALUES ('620600000000', '6206', '62', '武威市', '2', 'W', '304');
INSERT INTO `region` VALUES ('620601000000', '620601', '6206', '市辖区', '3', 'S', '2907');
INSERT INTO `region` VALUES ('620602000000', '620602', '6206', '凉州区', '3', 'L', '2908');
INSERT INTO `region` VALUES ('620621000000', '620621', '6206', '民勤县', '3', 'M', '2909');
INSERT INTO `region` VALUES ('620622000000', '620622', '6206', '古浪县', '3', 'G', '2910');
INSERT INTO `region` VALUES ('620623000000', '620623', '6206', '天祝藏族自治县', '3', 'T', '2911');
INSERT INTO `region` VALUES ('620700000000', '6207', '62', '张掖市', '2', 'Z', '305');
INSERT INTO `region` VALUES ('620701000000', '620701', '6207', '市辖区', '3', 'S', '2912');
INSERT INTO `region` VALUES ('620702000000', '620702', '6207', '甘州区', '3', 'G', '2913');
INSERT INTO `region` VALUES ('620721000000', '620721', '6207', '肃南裕固族自治县', '3', 'S', '2914');
INSERT INTO `region` VALUES ('620722000000', '620722', '6207', '民乐县', '3', 'M', '2915');
INSERT INTO `region` VALUES ('620723000000', '620723', '6207', '临泽县', '3', 'L', '2916');
INSERT INTO `region` VALUES ('620724000000', '620724', '6207', '高台县', '3', 'G', '2917');
INSERT INTO `region` VALUES ('620725000000', '620725', '6207', '山丹县', '3', 'S', '2918');
INSERT INTO `region` VALUES ('620800000000', '6208', '62', '平凉市', '2', 'P', '306');
INSERT INTO `region` VALUES ('620801000000', '620801', '6208', '市辖区', '3', 'S', '2919');
INSERT INTO `region` VALUES ('620802000000', '620802', '6208', '崆峒区', '3', 'Z', '2920');
INSERT INTO `region` VALUES ('620821000000', '620821', '6208', '泾川县', '3', 'Z', '2921');
INSERT INTO `region` VALUES ('620822000000', '620822', '6208', '灵台县', '3', 'L', '2922');
INSERT INTO `region` VALUES ('620823000000', '620823', '6208', '崇信县', '3', 'C', '2923');
INSERT INTO `region` VALUES ('620824000000', '620824', '6208', '华亭县', '3', 'H', '2924');
INSERT INTO `region` VALUES ('620825000000', '620825', '6208', '庄浪县', '3', 'Z', '2925');
INSERT INTO `region` VALUES ('620826000000', '620826', '6208', '静宁县', '3', 'J', '2926');
INSERT INTO `region` VALUES ('620900000000', '6209', '62', '酒泉市', '2', 'J', '307');
INSERT INTO `region` VALUES ('620901000000', '620901', '6209', '市辖区', '3', 'S', '2927');
INSERT INTO `region` VALUES ('620902000000', '620902', '6209', '肃州区', '3', 'S', '2928');
INSERT INTO `region` VALUES ('620921000000', '620921', '6209', '金塔县', '3', 'J', '2929');
INSERT INTO `region` VALUES ('620922000000', '620922', '6209', '瓜州县', '3', 'G', '2930');
INSERT INTO `region` VALUES ('620923000000', '620923', '6209', '肃北蒙古族自治县', '3', 'S', '2931');
INSERT INTO `region` VALUES ('620924000000', '620924', '6209', '阿克塞哈萨克族自治县', '3', 'A', '2932');
INSERT INTO `region` VALUES ('620981000000', '620981', '6209', '玉门市', '3', 'Y', '2933');
INSERT INTO `region` VALUES ('620982000000', '620982', '6209', '敦煌市', '3', 'D', '2934');
INSERT INTO `region` VALUES ('621000000000', '6210', '62', '庆阳市', '2', 'Q', '308');
INSERT INTO `region` VALUES ('621001000000', '621001', '6210', '市辖区', '3', 'S', '2935');
INSERT INTO `region` VALUES ('621002000000', '621002', '6210', '西峰区', '3', 'X', '2936');
INSERT INTO `region` VALUES ('621021000000', '621021', '6210', '庆城县', '3', 'Q', '2937');
INSERT INTO `region` VALUES ('621022000000', '621022', '6210', '环县', '3', 'H', '2938');
INSERT INTO `region` VALUES ('621023000000', '621023', '6210', '华池县', '3', 'H', '2939');
INSERT INTO `region` VALUES ('621024000000', '621024', '6210', '合水县', '3', 'H', '2940');
INSERT INTO `region` VALUES ('621025000000', '621025', '6210', '正宁县', '3', 'Z', '2941');
INSERT INTO `region` VALUES ('621026000000', '621026', '6210', '宁县', '3', 'N', '2942');
INSERT INTO `region` VALUES ('621027000000', '621027', '6210', '镇原县', '3', 'Z', '2943');
INSERT INTO `region` VALUES ('621100000000', '6211', '62', '定西市', '2', 'D', '309');
INSERT INTO `region` VALUES ('621101000000', '621101', '6211', '市辖区', '3', 'S', '2944');
INSERT INTO `region` VALUES ('621102000000', '621102', '6211', '安定区', '3', 'A', '2945');
INSERT INTO `region` VALUES ('621121000000', '621121', '6211', '通渭县', '3', 'T', '2946');
INSERT INTO `region` VALUES ('621122000000', '621122', '6211', '陇西县', '3', 'L', '2947');
INSERT INTO `region` VALUES ('621123000000', '621123', '6211', '渭源县', '3', 'W', '2948');
INSERT INTO `region` VALUES ('621124000000', '621124', '6211', '临洮县', '3', 'L', '2949');
INSERT INTO `region` VALUES ('621125000000', '621125', '6211', '漳县', '3', 'Z', '2950');
INSERT INTO `region` VALUES ('621126000000', '621126', '6211', '岷县', '3', 'Z', '2951');
INSERT INTO `region` VALUES ('621200000000', '6212', '62', '陇南市', '2', 'L', '310');
INSERT INTO `region` VALUES ('621201000000', '621201', '6212', '市辖区', '3', 'S', '2952');
INSERT INTO `region` VALUES ('621202000000', '621202', '6212', '武都区', '3', 'W', '2953');
INSERT INTO `region` VALUES ('621221000000', '621221', '6212', '成县', '3', 'C', '2954');
INSERT INTO `region` VALUES ('621222000000', '621222', '6212', '文县', '3', 'W', '2955');
INSERT INTO `region` VALUES ('621223000000', '621223', '6212', '宕昌县', '3', 'Z', '2956');
INSERT INTO `region` VALUES ('621224000000', '621224', '6212', '康县', '3', 'K', '2957');
INSERT INTO `region` VALUES ('621225000000', '621225', '6212', '西和县', '3', 'X', '2958');
INSERT INTO `region` VALUES ('621226000000', '621226', '6212', '礼县', '3', 'L', '2959');
INSERT INTO `region` VALUES ('621227000000', '621227', '6212', '徽县', '3', 'H', '2960');
INSERT INTO `region` VALUES ('621228000000', '621228', '6212', '两当县', '3', 'L', '2961');
INSERT INTO `region` VALUES ('622900000000', '6229', '62', '临夏回族自治州', '2', 'L', '311');
INSERT INTO `region` VALUES ('622901000000', '622901', '6229', '临夏市', '3', 'L', '2962');
INSERT INTO `region` VALUES ('622921000000', '622921', '6229', '临夏县', '3', 'L', '2963');
INSERT INTO `region` VALUES ('622922000000', '622922', '6229', '康乐县', '3', 'K', '2964');
INSERT INTO `region` VALUES ('622923000000', '622923', '6229', '永靖县', '3', 'Y', '2965');
INSERT INTO `region` VALUES ('622924000000', '622924', '6229', '广河县', '3', 'G', '2966');
INSERT INTO `region` VALUES ('622925000000', '622925', '6229', '和政县', '3', 'H', '2967');
INSERT INTO `region` VALUES ('622926000000', '622926', '6229', '东乡族自治县', '3', 'D', '2968');
INSERT INTO `region` VALUES ('622927000000', '622927', '6229', '积石山保安族东乡族撒拉族自治县', '3', 'J', '2969');
INSERT INTO `region` VALUES ('623000000000', '6230', '62', '甘南藏族自治州', '2', 'G', '312');
INSERT INTO `region` VALUES ('623001000000', '623001', '6230', '合作市', '3', 'H', '2970');
INSERT INTO `region` VALUES ('623021000000', '623021', '6230', '临潭县', '3', 'L', '2971');
INSERT INTO `region` VALUES ('623022000000', '623022', '6230', '卓尼县', '3', 'Z', '2972');
INSERT INTO `region` VALUES ('623023000000', '623023', '6230', '舟曲县', '3', 'Z', '2973');
INSERT INTO `region` VALUES ('623024000000', '623024', '6230', '迭部县', '3', 'D', '2974');
INSERT INTO `region` VALUES ('623025000000', '623025', '6230', '玛曲县', '3', 'M', '2975');
INSERT INTO `region` VALUES ('623026000000', '623026', '6230', '碌曲县', '3', 'L', '2976');
INSERT INTO `region` VALUES ('623027000000', '623027', '6230', '夏河县', '3', 'X', '2977');
INSERT INTO `region` VALUES ('630000000000', '63', 'root', '青海省', '1', 'Q', '28');
INSERT INTO `region` VALUES ('630100000000', '6301', '63', '西宁市', '2', 'X', '313');
INSERT INTO `region` VALUES ('630101000000', '630101', '6301', '市辖区', '3', 'S', '2978');
INSERT INTO `region` VALUES ('630102000000', '630102', '6301', '城东区', '3', 'C', '2979');
INSERT INTO `region` VALUES ('630103000000', '630103', '6301', '城中区', '3', 'C', '2980');
INSERT INTO `region` VALUES ('630104000000', '630104', '6301', '城西区', '3', 'C', '2981');
INSERT INTO `region` VALUES ('630105000000', '630105', '6301', '城北区', '3', 'C', '2982');
INSERT INTO `region` VALUES ('630121000000', '630121', '6301', '大通回族土族自治县', '3', 'D', '2983');
INSERT INTO `region` VALUES ('630122000000', '630122', '6301', '湟中县', '3', 'Z', '2984');
INSERT INTO `region` VALUES ('630123000000', '630123', '6301', '湟源县', '3', 'Z', '2985');
INSERT INTO `region` VALUES ('632100000000', '6321', '63', '海东地区', '2', 'H', '314');
INSERT INTO `region` VALUES ('632121000000', '632121', '6321', '平安县', '3', 'P', '2986');
INSERT INTO `region` VALUES ('632122000000', '632122', '6321', '民和回族土族自治县', '3', 'M', '2987');
INSERT INTO `region` VALUES ('632123000000', '632123', '6321', '乐都县', '3', 'L', '2988');
INSERT INTO `region` VALUES ('632126000000', '632126', '6321', '互助土族自治县', '3', 'H', '2989');
INSERT INTO `region` VALUES ('632127000000', '632127', '6321', '化隆回族自治县', '3', 'H', '2990');
INSERT INTO `region` VALUES ('632128000000', '632128', '6321', '循化撒拉族自治县', '3', 'X', '2991');
INSERT INTO `region` VALUES ('632200000000', '6322', '63', '海北藏族自治州', '2', 'H', '315');
INSERT INTO `region` VALUES ('632221000000', '632221', '6322', '门源回族自治县', '3', 'M', '2992');
INSERT INTO `region` VALUES ('632222000000', '632222', '6322', '祁连县', '3', 'Q', '2993');
INSERT INTO `region` VALUES ('632223000000', '632223', '6322', '海晏县', '3', 'H', '2994');
INSERT INTO `region` VALUES ('632224000000', '632224', '6322', '刚察县', '3', 'G', '2995');
INSERT INTO `region` VALUES ('632300000000', '6323', '63', '黄南藏族自治州', '2', 'H', '316');
INSERT INTO `region` VALUES ('632321000000', '632321', '6323', '同仁县', '3', 'T', '2996');
INSERT INTO `region` VALUES ('632322000000', '632322', '6323', '尖扎县', '3', 'J', '2997');
INSERT INTO `region` VALUES ('632323000000', '632323', '6323', '泽库县', '3', 'Z', '2998');
INSERT INTO `region` VALUES ('632324000000', '632324', '6323', '河南蒙古族自治县', '3', 'H', '2999');
INSERT INTO `region` VALUES ('632500000000', '6325', '63', '海南藏族自治州', '2', 'H', '317');
INSERT INTO `region` VALUES ('632521000000', '632521', '6325', '共和县', '3', 'G', '3000');
INSERT INTO `region` VALUES ('632522000000', '632522', '6325', '同德县', '3', 'T', '3001');
INSERT INTO `region` VALUES ('632523000000', '632523', '6325', '贵德县', '3', 'G', '3002');
INSERT INTO `region` VALUES ('632524000000', '632524', '6325', '兴海县', '3', 'X', '3003');
INSERT INTO `region` VALUES ('632525000000', '632525', '6325', '贵南县', '3', 'G', '3004');
INSERT INTO `region` VALUES ('632600000000', '6326', '63', '果洛藏族自治州', '2', 'G', '318');
INSERT INTO `region` VALUES ('632621000000', '632621', '6326', '玛沁县', '3', 'M', '3005');
INSERT INTO `region` VALUES ('632622000000', '632622', '6326', '班玛县', '3', 'B', '3006');
INSERT INTO `region` VALUES ('632623000000', '632623', '6326', '甘德县', '3', 'G', '3007');
INSERT INTO `region` VALUES ('632624000000', '632624', '6326', '达日县', '3', 'D', '3008');
INSERT INTO `region` VALUES ('632625000000', '632625', '6326', '久治县', '3', 'J', '3009');
INSERT INTO `region` VALUES ('632626000000', '632626', '6326', '玛多县', '3', 'M', '3010');
INSERT INTO `region` VALUES ('632700000000', '6327', '63', '玉树藏族自治州', '2', 'Y', '319');
INSERT INTO `region` VALUES ('632721000000', '632721', '6327', '玉树县', '3', 'Y', '3011');
INSERT INTO `region` VALUES ('632722000000', '632722', '6327', '杂多县', '3', 'Z', '3012');
INSERT INTO `region` VALUES ('632723000000', '632723', '6327', '称多县', '3', 'C', '3013');
INSERT INTO `region` VALUES ('632724000000', '632724', '6327', '治多县', '3', 'Z', '3014');
INSERT INTO `region` VALUES ('632725000000', '632725', '6327', '囊谦县', '3', 'N', '3015');
INSERT INTO `region` VALUES ('632726000000', '632726', '6327', '曲麻莱县', '3', 'Q', '3016');
INSERT INTO `region` VALUES ('632800000000', '6328', '63', '海西蒙古族藏族自治州', '2', 'H', '320');
INSERT INTO `region` VALUES ('632801000000', '632801', '6328', '格尔木市', '3', 'G', '3017');
INSERT INTO `region` VALUES ('632802000000', '632802', '6328', '德令哈市', '3', 'D', '3018');
INSERT INTO `region` VALUES ('632821000000', '632821', '6328', '乌兰县', '3', 'W', '3019');
INSERT INTO `region` VALUES ('632822000000', '632822', '6328', '都兰县', '3', 'D', '3020');
INSERT INTO `region` VALUES ('632823000000', '632823', '6328', '天峻县', '3', 'T', '3021');
INSERT INTO `region` VALUES ('640000000000', '64', 'root', '宁夏回族自治区', '1', 'N', '29');
INSERT INTO `region` VALUES ('640100000000', '6401', '64', '银川市', '2', 'Y', '321');
INSERT INTO `region` VALUES ('640101000000', '640101', '6401', '市辖区', '3', 'S', '3022');
INSERT INTO `region` VALUES ('640104000000', '640104', '6401', '兴庆区', '3', 'X', '3023');
INSERT INTO `region` VALUES ('640105000000', '640105', '6401', '西夏区', '3', 'X', '3024');
INSERT INTO `region` VALUES ('640106000000', '640106', '6401', '金凤区', '3', 'J', '3025');
INSERT INTO `region` VALUES ('640121000000', '640121', '6401', '永宁县', '3', 'Y', '3026');
INSERT INTO `region` VALUES ('640122000000', '640122', '6401', '贺兰县', '3', 'H', '3027');
INSERT INTO `region` VALUES ('640181000000', '640181', '6401', '灵武市', '3', 'L', '3028');
INSERT INTO `region` VALUES ('640200000000', '6402', '64', '石嘴山市', '2', 'S', '322');
INSERT INTO `region` VALUES ('640201000000', '640201', '6402', '市辖区', '3', 'S', '3029');
INSERT INTO `region` VALUES ('640202000000', '640202', '6402', '大武口区', '3', 'D', '3030');
INSERT INTO `region` VALUES ('640205000000', '640205', '6402', '惠农区', '3', 'H', '3031');
INSERT INTO `region` VALUES ('640221000000', '640221', '6402', '平罗县', '3', 'P', '3032');
INSERT INTO `region` VALUES ('640300000000', '6403', '64', '吴忠市', '2', 'W', '323');
INSERT INTO `region` VALUES ('640301000000', '640301', '6403', '市辖区', '3', 'S', '3033');
INSERT INTO `region` VALUES ('640302000000', '640302', '6403', '利通区', '3', 'L', '3034');
INSERT INTO `region` VALUES ('640303000000', '640303', '6403', '红寺堡区', '3', 'H', '3035');
INSERT INTO `region` VALUES ('640323000000', '640323', '6403', '盐池县', '3', 'Y', '3036');
INSERT INTO `region` VALUES ('640324000000', '640324', '6403', '同心县', '3', 'T', '3037');
INSERT INTO `region` VALUES ('640381000000', '640381', '6403', '青铜峡市', '3', 'Q', '3038');
INSERT INTO `region` VALUES ('640400000000', '6404', '64', '固原市', '2', 'G', '324');
INSERT INTO `region` VALUES ('640401000000', '640401', '6404', '市辖区', '3', 'S', '3039');
INSERT INTO `region` VALUES ('640402000000', '640402', '6404', '原州区', '3', 'Y', '3040');
INSERT INTO `region` VALUES ('640422000000', '640422', '6404', '西吉县', '3', 'X', '3041');
INSERT INTO `region` VALUES ('640423000000', '640423', '6404', '隆德县', '3', 'L', '3042');
INSERT INTO `region` VALUES ('640424000000', '640424', '6404', '泾源县', '3', 'Z', '3043');
INSERT INTO `region` VALUES ('640425000000', '640425', '6404', '彭阳县', '3', 'P', '3044');
INSERT INTO `region` VALUES ('640500000000', '6405', '64', '中卫市', '2', 'Z', '325');
INSERT INTO `region` VALUES ('640501000000', '640501', '6405', '市辖区', '3', 'S', '3045');
INSERT INTO `region` VALUES ('640502000000', '640502', '6405', '沙坡头区', '3', 'S', '3046');
INSERT INTO `region` VALUES ('640521000000', '640521', '6405', '中宁县', '3', 'Z', '3047');
INSERT INTO `region` VALUES ('640522000000', '640522', '6405', '海原县', '3', 'H', '3048');
INSERT INTO `region` VALUES ('650000000000', '65', 'root', '新疆维吾尔自治区', '1', 'X', '30');
INSERT INTO `region` VALUES ('650100000000', '6501', '65', '乌鲁木齐市', '2', 'W', '326');
INSERT INTO `region` VALUES ('650101000000', '650101', '6501', '市辖区', '3', 'S', '3049');
INSERT INTO `region` VALUES ('650102000000', '650102', '6501', '天山区', '3', 'T', '3050');
INSERT INTO `region` VALUES ('650103000000', '650103', '6501', '沙依巴克区', '3', 'S', '3051');
INSERT INTO `region` VALUES ('650104000000', '650104', '6501', '新市区', '3', 'X', '3052');
INSERT INTO `region` VALUES ('650105000000', '650105', '6501', '水磨沟区', '3', 'S', '3053');
INSERT INTO `region` VALUES ('650106000000', '650106', '6501', '头屯河区', '3', 'T', '3054');
INSERT INTO `region` VALUES ('650107000000', '650107', '6501', '达坂城区', '3', 'D', '3055');
INSERT INTO `region` VALUES ('650109000000', '650109', '6501', '米东区', '3', 'M', '3056');
INSERT INTO `region` VALUES ('650121000000', '650121', '6501', '乌鲁木齐县', '3', 'W', '3057');
INSERT INTO `region` VALUES ('650200000000', '6502', '65', '克拉玛依市', '2', 'K', '327');
INSERT INTO `region` VALUES ('650201000000', '650201', '6502', '市辖区', '3', 'S', '3058');
INSERT INTO `region` VALUES ('650202000000', '650202', '6502', '独山子区', '3', 'D', '3059');
INSERT INTO `region` VALUES ('650203000000', '650203', '6502', '克拉玛依区', '3', 'K', '3060');
INSERT INTO `region` VALUES ('650204000000', '650204', '6502', '白碱滩区', '3', 'B', '3061');
INSERT INTO `region` VALUES ('650205000000', '650205', '6502', '乌尔禾区', '3', 'W', '3062');
INSERT INTO `region` VALUES ('652100000000', '6521', '65', '吐鲁番地区', '2', 'T', '328');
INSERT INTO `region` VALUES ('652101000000', '652101', '6521', '吐鲁番市', '3', 'T', '3063');
INSERT INTO `region` VALUES ('652122000000', '652122', '6521', '鄯善县', '3', 'Z', '3064');
INSERT INTO `region` VALUES ('652123000000', '652123', '6521', '托克逊县', '3', 'T', '3065');
INSERT INTO `region` VALUES ('652200000000', '6522', '65', '哈密地区', '2', 'H', '329');
INSERT INTO `region` VALUES ('652201000000', '652201', '6522', '哈密市', '3', 'H', '3066');
INSERT INTO `region` VALUES ('652222000000', '652222', '6522', '巴里坤哈萨克自治县', '3', 'B', '3067');
INSERT INTO `region` VALUES ('652223000000', '652223', '6522', '伊吾县', '3', 'Y', '3068');
INSERT INTO `region` VALUES ('652300000000', '6523', '65', '昌吉回族自治州', '2', 'C', '330');
INSERT INTO `region` VALUES ('652301000000', '652301', '6523', '昌吉市', '3', 'C', '3069');
INSERT INTO `region` VALUES ('652302000000', '652302', '6523', '阜康市', '3', 'F', '3070');
INSERT INTO `region` VALUES ('652323000000', '652323', '6523', '呼图壁县', '3', 'H', '3071');
INSERT INTO `region` VALUES ('652324000000', '652324', '6523', '玛纳斯县', '3', 'M', '3072');
INSERT INTO `region` VALUES ('652325000000', '652325', '6523', '奇台县', '3', 'Q', '3073');
INSERT INTO `region` VALUES ('652327000000', '652327', '6523', '吉木萨尔县', '3', 'J', '3074');
INSERT INTO `region` VALUES ('652328000000', '652328', '6523', '木垒哈萨克自治县', '3', 'M', '3075');
INSERT INTO `region` VALUES ('652700000000', '6527', '65', '博尔塔拉蒙古自治州', '2', 'B', '331');
INSERT INTO `region` VALUES ('652701000000', '652701', '6527', '博乐市', '3', 'B', '3076');
INSERT INTO `region` VALUES ('652722000000', '652722', '6527', '精河县', '3', 'J', '3077');
INSERT INTO `region` VALUES ('652723000000', '652723', '6527', '温泉县', '3', 'W', '3078');
INSERT INTO `region` VALUES ('652800000000', '6528', '65', '巴音郭楞蒙古自治州', '2', 'B', '332');
INSERT INTO `region` VALUES ('652801000000', '652801', '6528', '库尔勒市', '3', 'K', '3079');
INSERT INTO `region` VALUES ('652822000000', '652822', '6528', '轮台县', '3', 'L', '3080');
INSERT INTO `region` VALUES ('652823000000', '652823', '6528', '尉犁县', '3', 'W', '3081');
INSERT INTO `region` VALUES ('652824000000', '652824', '6528', '若羌县', '3', 'R', '3082');
INSERT INTO `region` VALUES ('652825000000', '652825', '6528', '且末县', '3', 'Q', '3083');
INSERT INTO `region` VALUES ('652826000000', '652826', '6528', '焉耆回族自治县', '3', 'Y', '3084');
INSERT INTO `region` VALUES ('652827000000', '652827', '6528', '和静县', '3', 'H', '3085');
INSERT INTO `region` VALUES ('652828000000', '652828', '6528', '和硕县', '3', 'H', '3086');
INSERT INTO `region` VALUES ('652829000000', '652829', '6528', '博湖县', '3', 'B', '3087');
INSERT INTO `region` VALUES ('652900000000', '6529', '65', '阿克苏地区', '2', 'A', '333');
INSERT INTO `region` VALUES ('652901000000', '652901', '6529', '阿克苏市', '3', 'A', '3088');
INSERT INTO `region` VALUES ('652922000000', '652922', '6529', '温宿县', '3', 'W', '3089');
INSERT INTO `region` VALUES ('652923000000', '652923', '6529', '库车县', '3', 'K', '3090');
INSERT INTO `region` VALUES ('652924000000', '652924', '6529', '沙雅县', '3', 'S', '3091');
INSERT INTO `region` VALUES ('652925000000', '652925', '6529', '新和县', '3', 'X', '3092');
INSERT INTO `region` VALUES ('652926000000', '652926', '6529', '拜城县', '3', 'B', '3093');
INSERT INTO `region` VALUES ('652927000000', '652927', '6529', '乌什县', '3', 'W', '3094');
INSERT INTO `region` VALUES ('652928000000', '652928', '6529', '阿瓦提县', '3', 'A', '3095');
INSERT INTO `region` VALUES ('652929000000', '652929', '6529', '柯坪县', '3', 'K', '3096');
INSERT INTO `region` VALUES ('653000000000', '6530', '65', '克孜勒苏柯尔克孜自治州', '2', 'K', '334');
INSERT INTO `region` VALUES ('653001000000', '653001', '6530', '阿图什市', '3', 'A', '3097');
INSERT INTO `region` VALUES ('653022000000', '653022', '6530', '阿克陶县', '3', 'A', '3098');
INSERT INTO `region` VALUES ('653023000000', '653023', '6530', '阿合奇县', '3', 'A', '3099');
INSERT INTO `region` VALUES ('653024000000', '653024', '6530', '乌恰县', '3', 'W', '3100');
INSERT INTO `region` VALUES ('653100000000', '6531', '65', '喀什地区', '2', 'K', '335');
INSERT INTO `region` VALUES ('653101000000', '653101', '6531', '喀什市', '3', 'K', '3101');
INSERT INTO `region` VALUES ('653121000000', '653121', '6531', '疏附县', '3', 'S', '3102');
INSERT INTO `region` VALUES ('653122000000', '653122', '6531', '疏勒县', '3', 'S', '3103');
INSERT INTO `region` VALUES ('653123000000', '653123', '6531', '英吉沙县', '3', 'Y', '3104');
INSERT INTO `region` VALUES ('653124000000', '653124', '6531', '泽普县', '3', 'Z', '3105');
INSERT INTO `region` VALUES ('653125000000', '653125', '6531', '莎车县', '3', 'S', '3106');
INSERT INTO `region` VALUES ('653126000000', '653126', '6531', '叶城县', '3', 'Y', '3107');
INSERT INTO `region` VALUES ('653127000000', '653127', '6531', '麦盖提县', '3', 'M', '3108');
INSERT INTO `region` VALUES ('653128000000', '653128', '6531', '岳普湖县', '3', 'Y', '3109');
INSERT INTO `region` VALUES ('653129000000', '653129', '6531', '伽师县', '3', 'Z', '3110');
INSERT INTO `region` VALUES ('653130000000', '653130', '6531', '巴楚县', '3', 'B', '3111');
INSERT INTO `region` VALUES ('653131000000', '653131', '6531', '塔什库尔干塔吉克自治县', '3', 'T', '3112');
INSERT INTO `region` VALUES ('653200000000', '6532', '65', '和田地区', '2', 'H', '336');
INSERT INTO `region` VALUES ('653201000000', '653201', '6532', '和田市', '3', 'H', '3113');
INSERT INTO `region` VALUES ('653221000000', '653221', '6532', '和田县', '3', 'H', '3114');
INSERT INTO `region` VALUES ('653222000000', '653222', '6532', '墨玉县', '3', 'M', '3115');
INSERT INTO `region` VALUES ('653223000000', '653223', '6532', '皮山县', '3', 'P', '3116');
INSERT INTO `region` VALUES ('653224000000', '653224', '6532', '洛浦县', '3', 'L', '3117');
INSERT INTO `region` VALUES ('653225000000', '653225', '6532', '策勒县', '3', 'C', '3118');
INSERT INTO `region` VALUES ('653226000000', '653226', '6532', '于田县', '3', 'Y', '3119');
INSERT INTO `region` VALUES ('653227000000', '653227', '6532', '民丰县', '3', 'M', '3120');
INSERT INTO `region` VALUES ('654000000000', '6540', '65', '伊犁哈萨克自治州', '2', 'Y', '337');
INSERT INTO `region` VALUES ('654002000000', '654002', '6540', '伊宁市', '3', 'Y', '3121');
INSERT INTO `region` VALUES ('654003000000', '654003', '6540', '奎屯市', '3', 'K', '3122');
INSERT INTO `region` VALUES ('654021000000', '654021', '6540', '伊宁县', '3', 'Y', '3123');
INSERT INTO `region` VALUES ('654022000000', '654022', '6540', '察布查尔县', '3', 'C', '3124');
INSERT INTO `region` VALUES ('654023000000', '654023', '6540', '霍城县', '3', 'H', '3125');
INSERT INTO `region` VALUES ('654024000000', '654024', '6540', '巩留县', '3', 'G', '3126');
INSERT INTO `region` VALUES ('654025000000', '654025', '6540', '新源县', '3', 'X', '3127');
INSERT INTO `region` VALUES ('654026000000', '654026', '6540', '昭苏县', '3', 'Z', '3128');
INSERT INTO `region` VALUES ('654027000000', '654027', '6540', '特克斯县', '3', 'T', '3129');
INSERT INTO `region` VALUES ('654028000000', '654028', '6540', '尼勒克县', '3', 'N', '3130');
INSERT INTO `region` VALUES ('654200000000', '6542', '65', '塔城地区', '2', 'T', '338');
INSERT INTO `region` VALUES ('654201000000', '654201', '6542', '塔城市', '3', 'T', '3131');
INSERT INTO `region` VALUES ('654202000000', '654202', '6542', '乌苏市', '3', 'W', '3132');
INSERT INTO `region` VALUES ('654221000000', '654221', '6542', '额敏县', '3', 'E', '3133');
INSERT INTO `region` VALUES ('654223000000', '654223', '6542', '沙湾县', '3', 'S', '3134');
INSERT INTO `region` VALUES ('654224000000', '654224', '6542', '托里县', '3', 'T', '3135');
INSERT INTO `region` VALUES ('654225000000', '654225', '6542', '裕民县', '3', 'Y', '3136');
INSERT INTO `region` VALUES ('654226000000', '654226', '6542', '和布克赛尔蒙古自治县', '3', 'H', '3137');
INSERT INTO `region` VALUES ('654300000000', '6543', '65', '阿勒泰地区', '2', 'A', '339');
INSERT INTO `region` VALUES ('654301000000', '654301', '6543', '阿勒泰市', '3', 'A', '3138');
INSERT INTO `region` VALUES ('654321000000', '654321', '6543', '布尔津县', '3', 'B', '3139');
INSERT INTO `region` VALUES ('654322000000', '654322', '6543', '富蕴县', '3', 'F', '3140');
INSERT INTO `region` VALUES ('654323000000', '654323', '6543', '福海县', '3', 'F', '3141');
INSERT INTO `region` VALUES ('654324000000', '654324', '6543', '哈巴河县', '3', 'H', '3142');
INSERT INTO `region` VALUES ('654325000000', '654325', '6543', '青河县', '3', 'Q', '3143');
INSERT INTO `region` VALUES ('654326000000', '654326', '6543', '吉木乃县', '3', 'J', '3144');
INSERT INTO `region` VALUES ('659000000000', '6590', '65', '自治区直辖县级行政区划', '2', 'Z', '340');
INSERT INTO `region` VALUES ('659001000000', '659001', '6590', '石河子市', '3', 'S', '3145');
INSERT INTO `region` VALUES ('659002000000', '659002', '6590', '阿拉尔市', '3', 'A', '3146');
INSERT INTO `region` VALUES ('659003000000', '659003', '6590', '图木舒克市', '3', 'T', '3147');
INSERT INTO `region` VALUES ('659004000000', '659004', '6590', '五家渠市', '3', 'W', '3148');
INSERT INTO `region` VALUES ('root', '0', '#', '全国', '0', 'Q', null);

-- ----------------------------
-- Table structure for shipping
-- ----------------------------
DROP TABLE IF EXISTS `shipping`;
CREATE TABLE `shipping` (
  `shipping_id` varchar(32) NOT NULL COMMENT '主键',
  `sys_user_id` varchar(32) NOT NULL COMMENT '用户id',
  `receiver_name` varchar(20) NOT NULL COMMENT '收货姓名',
  `receiver_phone` varchar(20) NOT NULL COMMENT '收货电话',
  `receiver_province` varchar(20) NOT NULL COMMENT '省份',
  `receiver_city` varchar(20) NOT NULL COMMENT '城市',
  `receiver_area` varchar(20) NOT NULL COMMENT '区/县',
  `region_code` varchar(100) NOT NULL COMMENT '行政编码',
  `receiver_address` varchar(200) NOT NULL COMMENT '详细地址',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`shipping_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址';

-- ----------------------------
-- Records of shipping
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `sys_dict_id` varchar(32) NOT NULL,
  `parent_id` varchar(32) NOT NULL COMMENT '父级ID',
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `value` varchar(200) NOT NULL COMMENT '字典项值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0 启用 1 不启用)',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态(0:未删除 1:已删除)',
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_user_id` varchar(32) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sys_dict_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('05fb5d03e2655c73bcad0c7d697e26cc', '63f80a586afa4758ad1f891a2d39e129', '证件类型', 'IdCardType', null, '0', '0', '10', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:17:05', null, '2020-03-15 22:17:05');
INSERT INTO `sys_dict` VALUES ('074bd6b6cd6a2d3ab60a0c24dffa3773', '05fb5d03e2655c73bcad0c7d697e26cc', '身份证', '1', null, '0', '0', '1', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:17:37', null, '2020-03-15 22:17:37');
INSERT INTO `sys_dict` VALUES ('0deac5d06ea1d0fcf2bde5a0698f2b6a', 'c44cee34ebb318211c9bcd9f0bbfeda1', '初中及同等学历', '6', null, '0', '0', '6', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:34:50', null, '2020-03-15 22:34:50');
INSERT INTO `sys_dict` VALUES ('196270cb689c4cfeb6e7748d9f2ea6d5', '48e4834c61e54f62816d3549d59cdeac', '开发工程师', '1', null, '0', '0', '100', 'hzfree020160fsh0cloud0system0crz', '2018-06-20 11:21:54', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 21:37:31');
INSERT INTO `sys_dict` VALUES ('20398b2c3ba64cb7b14083f37059871c', '48e4834c61e54f62816d3549d59cdeac', '运营人员', '0', null, '0', '0', '100', 'hzfree020160fsh0cloud0system0crz', '2018-06-20 11:21:47', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 21:37:47');
INSERT INTO `sys_dict` VALUES ('21d4184a9778b01775915a1f5bc902bd', 'ca57741ee6b72f5a6c3edbfecaffe613', '未婚', '2', null, '0', '0', '2', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:42:11', null, '2020-03-15 22:42:11');
INSERT INTO `sys_dict` VALUES ('22e283c0db8bcd530eff57f98a8aaf7b', 'c44cee34ebb318211c9bcd9f0bbfeda1', '高中及同等学历', '5', null, '0', '0', '5', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:34:41', null, '2020-03-15 22:34:41');
INSERT INTO `sys_dict` VALUES ('25a1da24994d692f3732f88c54fc06ff', '48e4834c61e54f62816d3549d59cdeac', '销售', '2', null, '0', '0', '100', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 21:38:05', null, '2020-01-11 21:38:05');
INSERT INTO `sys_dict` VALUES ('30a52f79499ab32e18c3aeb883875aef', '63f80a586afa4758ad1f891a2d39e129', '性别', '1', null, '0', '0', '100', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 10:36:07', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 20:13:04');
INSERT INTO `sys_dict` VALUES ('42ca4a818bc6bfbaf192fdde9f969f21', '05fb5d03e2655c73bcad0c7d697e26cc', '出生证', '4', null, '0', '0', '4', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:18:19', null, '2020-03-15 22:18:19');
INSERT INTO `sys_dict` VALUES ('4587d7bf7b314c84975c922c8baaf4f4', 'root', '用户管理', '1', null, '0', '0', '12', 'hzfree020160fsh0cloud0system0crz', '2018-06-19 17:21:51', '3946d9f631e3cd4619afcb9512842437', '2020-03-26 10:46:33');
INSERT INTO `sys_dict` VALUES ('489b197e56c6f52d4fd3508444e68b31', '30a52f79499ab32e18c3aeb883875aef', '未知', '3', null, '0', '0', '3', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 20:15:35', null, '2020-01-11 20:15:35');
INSERT INTO `sys_dict` VALUES ('48e4834c61e54f62816d3549d59cdeac', '4587d7bf7b314c84975c922c8baaf4f4', '用户职务', '12', null, '0', '0', '100', 'hzfree020160fsh0cloud0system0crz', '2018-06-20 11:21:27', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 21:32:46');
INSERT INTO `sys_dict` VALUES ('52c63897d1b97d7068875497cf72c184', '30a52f79499ab32e18c3aeb883875aef', '男', '1', null, '0', '0', '1', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 20:14:46', null, '2020-01-11 20:14:46');
INSERT INTO `sys_dict` VALUES ('5e0652ec6e77c00a3f128d55dab53fa9', 'ca57741ee6b72f5a6c3edbfecaffe613', '已婚', '1', null, '0', '0', '1', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:42:03', null, '2020-03-15 22:42:03');
INSERT INTO `sys_dict` VALUES ('614374635f3a7f0db13caaaa3ae05b30', 'ca57741ee6b72f5a6c3edbfecaffe613', '离异', '4', null, '0', '0', '4', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:42:30', null, '2020-03-15 22:42:30');
INSERT INTO `sys_dict` VALUES ('63f80a586afa4758ad1f891a2d39e129', 'root', '通用字典', '0', null, '0', '0', '11', 'hzfree020160fsh0cloud0system0crz', '2018-06-17 17:20:17', '3946d9f631e3cd4619afcb9512842435', '2020-04-14 20:51:01');
INSERT INTO `sys_dict` VALUES ('8fab570e85f6414c486cd0dbdccee6bf', '63f80a586afa4758ad1f891a2d39e129', '开户行', 'BankCode', null, '0', '0', '100', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:46:25', null, '2020-03-15 22:46:25');
INSERT INTO `sys_dict` VALUES ('949077cbd21d385af7c8792f87f1ffc0', '05fb5d03e2655c73bcad0c7d697e26cc', '护照', '5', null, '0', '0', '5', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:18:34', null, '2020-03-15 22:18:34');
INSERT INTO `sys_dict` VALUES ('a3a9b1b416339b40c34cd87af4845883', '30a52f79499ab32e18c3aeb883875aef', '保密', '2', null, '0', '0', '2', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 20:15:25', null, '2020-01-11 20:15:25');
INSERT INTO `sys_dict` VALUES ('a548dde82690b4c245b27a66c6c72a90', 'c44cee34ebb318211c9bcd9f0bbfeda1', '硕士', '2', null, '0', '0', '2', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:34:13', null, '2020-03-15 22:34:13');
INSERT INTO `sys_dict` VALUES ('BankCode1', '8fab570e85f6414c486cd0dbdccee6bf', '中国银行', '1', null, '0', '0', '4', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:42:30', null, '2020-03-15 22:42:30');
INSERT INTO `sys_dict` VALUES ('BankCode10', '8fab570e85f6414c486cd0dbdccee6bf', '中国中信银行', '10', null, '0', '0', '3', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:18:04', null, '2020-03-15 22:18:04');
INSERT INTO `sys_dict` VALUES ('BankCode11', '8fab570e85f6414c486cd0dbdccee6bf', '广东发展银行', '11', null, '0', '0', '7', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:41:02', null, '2020-03-15 22:41:02');
INSERT INTO `sys_dict` VALUES ('BankCode12', '8fab570e85f6414c486cd0dbdccee6bf', '上海浦东发展银行', '12', null, '0', '0', '100', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 21:38:25', null, '2020-01-11 21:38:25');
INSERT INTO `sys_dict` VALUES ('BankCode13', '8fab570e85f6414c486cd0dbdccee6bf', '上海浦东发展银行', '13', null, '0', '0', '7', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:19:12', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:19:49');
INSERT INTO `sys_dict` VALUES ('BankCode14', '8fab570e85f6414c486cd0dbdccee6bf', '厦门国际银行', '14', null, '0', '0', '4', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:34:32', null, '2020-03-15 22:34:32');
INSERT INTO `sys_dict` VALUES ('BankCode15', '8fab570e85f6414c486cd0dbdccee6bf', '深圳发展银行', '15', null, '0', '0', '0', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 20:15:13', null, '2020-01-11 20:15:13');
INSERT INTO `sys_dict` VALUES ('BankCode16', '8fab570e85f6414c486cd0dbdccee6bf', '兴业银行', '16', null, '0', '0', '6', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:18:50', null, '2020-03-15 22:18:50');
INSERT INTO `sys_dict` VALUES ('BankCode17', '8fab570e85f6414c486cd0dbdccee6bf', '中国农业发展银行', '17', null, '0', '0', '3', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:34:22', null, '2020-03-15 22:34:22');
INSERT INTO `sys_dict` VALUES ('BankCode18', '8fab570e85f6414c486cd0dbdccee6bf', '农村信用社', '18', null, '0', '0', '0', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 20:15:13', null, '2020-01-11 20:15:13');
INSERT INTO `sys_dict` VALUES ('BankCode19', '8fab570e85f6414c486cd0dbdccee6bf', '农村合作银行', '19', null, '0', '0', '6', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:18:50', null, '2020-03-15 22:18:50');
INSERT INTO `sys_dict` VALUES ('BankCode2', '8fab570e85f6414c486cd0dbdccee6bf', '中国工商银行', '2', null, '0', '0', '11', 'hzfree020160fsh0cloud0system0crz', '2018-06-17 17:20:17', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 20:12:35');
INSERT INTO `sys_dict` VALUES ('BankCode20', '8fab570e85f6414c486cd0dbdccee6bf', '农村商业银行', '20', null, '0', '0', '3', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:34:22', null, '2020-03-15 22:34:22');
INSERT INTO `sys_dict` VALUES ('BankCode3', '8fab570e85f6414c486cd0dbdccee6bf', '中国建设银行', '3', null, '0', '0', '5', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:18:34', null, '2020-03-15 22:18:34');
INSERT INTO `sys_dict` VALUES ('BankCode4', '8fab570e85f6414c486cd0dbdccee6bf', '中国交通银行', '4', null, '0', '0', '2', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 20:15:25', null, '2020-01-11 20:15:25');
INSERT INTO `sys_dict` VALUES ('BankCode5', '8fab570e85f6414c486cd0dbdccee6bf', '中国招商银行', '5', null, '0', '0', '2', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:34:13', null, '2020-03-15 22:34:13');
INSERT INTO `sys_dict` VALUES ('BankCode6', '8fab570e85f6414c486cd0dbdccee6bf', '中国邮政储蓄银行', '6', null, '0', '0', '20', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:33:35', null, '2020-03-15 22:33:35');
INSERT INTO `sys_dict` VALUES ('BankCode7', '8fab570e85f6414c486cd0dbdccee6bf', '中国农业银行', '7', null, '0', '0', '3', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:42:19', null, '2020-03-15 22:42:19');
INSERT INTO `sys_dict` VALUES ('BankCode8', '8fab570e85f6414c486cd0dbdccee6bf', '中国光大银行', '8', null, '0', '0', '5', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:42:38', null, '2020-03-15 22:42:38');
INSERT INTO `sys_dict` VALUES ('BankCode9', '8fab570e85f6414c486cd0dbdccee6bf', '中国民生银行', '9', null, '0', '0', '100', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:41:40', null, '2020-03-15 22:41:40');
INSERT INTO `sys_dict` VALUES ('c44cee34ebb318211c9bcd9f0bbfeda1', '63f80a586afa4758ad1f891a2d39e129', '学历', 'Education', null, '0', '0', '20', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:33:35', null, '2020-03-15 22:33:35');
INSERT INTO `sys_dict` VALUES ('c548372a3ed4e364e43b077e756e41bd', 'ca57741ee6b72f5a6c3edbfecaffe613', '丧偶', '3', null, '0', '0', '3', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:42:19', null, '2020-03-15 22:42:19');
INSERT INTO `sys_dict` VALUES ('c90e8cf56c3a39c72638a719345439c5', 'ca57741ee6b72f5a6c3edbfecaffe613', '其他', '5', null, '0', '0', '5', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:42:38', null, '2020-03-15 22:42:38');
INSERT INTO `sys_dict` VALUES ('ca57741ee6b72f5a6c3edbfecaffe613', '63f80a586afa4758ad1f891a2d39e129', '婚姻情况', 'Marital', null, '0', '0', '100', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:41:40', null, '2020-03-15 22:41:40');
INSERT INTO `sys_dict` VALUES ('de1760b1fd2654f2ff6d3a8d513febb5', '05fb5d03e2655c73bcad0c7d697e26cc', '户口本', '3', null, '0', '0', '3', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:18:04', null, '2020-03-15 22:18:04');
INSERT INTO `sys_dict` VALUES ('dea277b072de658e700399992d5d7268', 'c44cee34ebb318211c9bcd9f0bbfeda1', '初中及以下学历', '7', null, '0', '0', '7', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:41:02', null, '2020-03-15 22:41:02');
INSERT INTO `sys_dict` VALUES ('e5c48de5e12efd2bd7389a3dfbba91e2', '48e4834c61e54f62816d3549d59cdeac', '商务', '3', null, '0', '0', '100', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 21:38:25', null, '2020-01-11 21:38:25');
INSERT INTO `sys_dict` VALUES ('e7a18c29dec863c90ea9ef09dc01a6c1', '05fb5d03e2655c73bcad0c7d697e26cc', '军官证', '7', null, '0', '0', '7', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:19:12', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:19:49');
INSERT INTO `sys_dict` VALUES ('e85f13e765bbff6b5ceb0dcb0d3188b9', 'c44cee34ebb318211c9bcd9f0bbfeda1', '大专', '4', null, '0', '0', '4', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:34:32', null, '2020-03-15 22:34:32');
INSERT INTO `sys_dict` VALUES ('f15e6c658cd649c6c5ef5f6424e07586', '30a52f79499ab32e18c3aeb883875aef', '女', '0', null, '0', '0', '0', '3946d9f631e3cd4619afcb9512842437', '2020-01-11 20:15:13', null, '2020-01-11 20:15:13');
INSERT INTO `sys_dict` VALUES ('f22cb8e047cfbd380184e19f44376e23', '05fb5d03e2655c73bcad0c7d697e26cc', '驾驶证', '6', null, '0', '0', '6', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:18:50', null, '2020-03-15 22:18:50');
INSERT INTO `sys_dict` VALUES ('f3dff368d900e8c91c31384a9ced3fc6', 'c44cee34ebb318211c9bcd9f0bbfeda1', '本科', '3', null, '0', '0', '3', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:34:22', null, '2020-03-15 22:34:22');
INSERT INTO `sys_dict` VALUES ('f563ca540e633edbde2823db9ee861fe', 'c44cee34ebb318211c9bcd9f0bbfeda1', '博士', '1', null, '0', '0', '1', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:34:03', null, '2020-03-15 22:34:03');
INSERT INTO `sys_dict` VALUES ('fc670cb0b219383a6e9fc8d7d2a5a5f9', '05fb5d03e2655c73bcad0c7d697e26cc', '士兵证', '2', null, '0', '0', '2', '3946d9f631e3cd4619afcb9512842437', '2020-03-15 22:17:51', null, '2020-03-15 22:17:51');
INSERT INTO `sys_dict` VALUES ('root', '#', '字典管理', '###', null, '0', '0', '0', 'admin', '2020-03-26 10:46:06', 'admin', '2020-03-26 10:46:06');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `sys_permission_id` varchar(32) NOT NULL COMMENT '主键id',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父id',
  `name` varchar(100) NOT NULL COMMENT '菜单标题',
  `url` varchar(255) DEFAULT NULL COMMENT '路径',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `menu_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型(0:一级菜单; 1:子菜单:2:按钮权限)',
  `perms_code` varchar(255) DEFAULT NULL COMMENT '菜单权限编码',
  `keep_alive` tinyint(1) DEFAULT NULL COMMENT '是否缓存该页面:  0:不是  1:是  ',
  `is_hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏路由: 0:否 1 是',
  `sort` int(10) NOT NULL DEFAULT '100' COMMENT '菜单排序',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `is_route` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否路由菜单: 0:不是  1:是',
  `is_leaf` tinyint(1) DEFAULT NULL COMMENT '是否叶子结点:    1:是   0:不是',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态 0正常 1已删除',
  `create_user_id` varchar(32) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`sys_permission_id`) USING BTREE,
  KEY `index_prem_pid` (`parent_id`) USING BTREE,
  KEY `index_prem_is_route` (`is_route`) USING BTREE,
  KEY `index_prem_is_leaf` (`is_leaf`) USING BTREE,
  KEY `index_prem_sort_no` (`sort`) USING BTREE,
  KEY `index_prem_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('13e177456f985b706275fe1f182d2c44', null, '商品管理', '/imall', 'layouts/RouteView', '0', 'IMALL', '0', '0', '30', 'shopping-cart', '1', '0', '0', '3946d9f631e3cd4619afcb9512842437', '2020-03-17 20:46:50', null, '2020-08-09 09:00:39');
INSERT INTO `sys_permission` VALUES ('15e393c45a86e2b249c60960603de654', '13e177456f985b706275fe1f182d2c44', '收货地址', '/imall/Shipping', 'shipping/shipping', '1', 'IMALL:SHIPPING', '0', '0', '80', null, '1', '1', '1', '3946d9f631e3cd4619afcb9512842435', '2020-05-15 13:17:55', null, '2020-08-07 19:42:19');
INSERT INTO `sys_permission` VALUES ('1d9cc0aaf2b7490faf4b7113f3f57da8', null, '个人办公', '/iSelfOffice', 'layouts/RouteView', '0', 'ISELFOFFICE', '0', '0', '100', 'share-alt', '1', '0', '0', '3946d9f631e3cd4619afcb9512842435', '2020-04-15 15:40:54', null, '2020-05-25 12:25:05');
INSERT INTO `sys_permission` VALUES ('39338d68457b3dd1850083243b0a22c6', '13e177456f985b706275fe1f182d2c44', '订单管理', '/imall/Order', 'order/order', '1', 'IMALL:ORDER', '0', '0', '5', null, '1', '1', '0', '3946d9f631e3cd4619afcb9512842435', '2020-04-12 15:19:05', null, '2020-08-07 19:42:22');
INSERT INTO `sys_permission` VALUES ('3f915b2769fc80648e92d04e84ca059d', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '员工管理', '/isystem/user', 'system/UserList', '1', 'ISYSTEM:USER', '0', '0', '20', null, '1', '1', '0', 'admin', '2018-12-25 20:34:38', 'admin', '2020-08-07 19:56:58');
INSERT INTO `sys_permission` VALUES ('537857ac9e9dc5473b1c5e8c5c3b769e', '1d9cc0aaf2b7490faf4b7113f3f57da8', '我的消息', '/message', 'selfOffice/Message', '1', 'MESSAGE', '0', '0', '100', null, '1', '1', '0', '3946d9f631e3cd4619afcb9512842435', '2020-05-21 11:05:45', null, '2020-08-07 19:42:24');
INSERT INTO `sys_permission` VALUES ('7a9918e83b496018fc0910d4354c1370', '13e177456f985b706275fe1f182d2c44', '商品发布', '/imall/Product', 'product/product', '1', 'IMALL:PRODUCT', '0', '0', '1', null, '1', '1', '0', '3946d9f631e3cd4619afcb9512842435', '2020-04-09 16:20:40', null, '2020-08-09 09:00:53');
INSERT INTO `sys_permission` VALUES ('8606b4b10eef21dbcac51cb952c0bc77', '13e177456f985b706275fe1f182d2c44', '商品分类', '/imall/productCategory', 'product/productCategory', '1', 'IMALL:PRODUCTCATEGORY', '0', '0', '3', null, '1', '1', '0', '3946d9f631e3cd4619afcb9512842435', '2020-05-16 13:19:31', null, '2020-08-08 15:01:06');
INSERT INTO `sys_permission` VALUES ('9502685863ab87f0ad1134142788a385', null, '首页', '/dashboard/analysis', 'dashboard/Analysis', '0', 'DASHBOARD:ANALYSIS', null, '0', '1', 'home', '1', '1', '0', 'admin', '2018-12-25 20:34:38', 'admin', '2020-05-25 12:25:05');
INSERT INTO `sys_permission` VALUES ('9cb91b8851db0cf7b19d7ecc2a8193dd', '1939e035e803a99ceecb6f5563570fb2', '我的任务表单', '/modules/bpm/task/form/FormModule', 'modules/bpm/task/form/FormModule', '1', 'MODULES:BPM:TASK:FORM:FORMMODULE', null, '0', '100', null, '1', '1', '0', 'admin', '2019-03-08 16:49:05', 'admin', '2020-08-07 19:42:34');
INSERT INTO `sys_permission` VALUES ('caidanguanli', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '菜单管理', '/isystem/permission', 'system/PermissionList', '1', 'ISYSTEM:PERMISSION', '0', '0', '30', null, '1', '1', '0', 'admin', '2018-12-25 20:34:38', null, '2020-08-08 11:03:44');
INSERT INTO `sys_permission` VALUES ('d7d6e2e4e2934f2c9385a623fd98c6f3', null, '系统管理', '/isystem', 'layouts/RouteView', '0', 'ISYSTEM', '0', '0', '500', 'setting', '1', '0', '0', 'admin', '2018-12-25 20:34:38', 'admin', '2020-05-25 12:25:05');
INSERT INTO `sys_permission` VALUES ('e353ba1342b3788f9fb5f1988358a480', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '字典管理', '/isystem/Dict', 'system/DictList', '1', 'ISYSTEM:DICT', '0', '0', '50', null, '1', '1', '1', '3946d9f631e3cd4619afcb9512842437', '2020-01-07 21:22:52', null, '2020-08-07 19:42:36');
INSERT INTO `sys_permission` VALUES ('e8af452d8948ea49d37c934f5100ae6a', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '角色管理', '/isystem/role', 'system/RoleList', '1', 'ISYSTEM:ROLE', '0', '0', '40', null, '1', '1', '0', 'admin', '2018-12-25 20:34:38', null, '2020-08-07 19:42:37');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `sys_role_id` varchar(32) NOT NULL,
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_code` varchar(255) NOT NULL COMMENT '角色代码',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态(0启用 1不启用)',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态(0:未删除 1:已删除)',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `create_user_id` varchar(32) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sys_role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('5ffd7f0283c14c8f5b0dde3c44751dbf', '123', '123123', '0', '1', '100', null, '68281b252400a1f64f3b7b0aa7531fb0', '2020-08-10 09:44:04', null, '2020-08-10 09:46:28');
INSERT INTO `sys_role` VALUES ('e51758fa916c881624b046d26bd09230', 'admin', 'admin', '1', '0', '100', '管理员', '3946d9f631e3cd4619afcb9512842435', '2019-09-28 14:15:00', '3946d9f631e3cd4619afcb9512842435', '2020-08-08 11:07:33');
INSERT INTO `sys_role` VALUES ('ee8626f80f7c2619917b6236f3a7f02b', 'Administrator', 'Administrator', '0', '0', '100', '超级管理员', '3946d9f631e3cd4619afcb9512842435', '2019-09-28 14:15:34', '3946d9f631e3cd4619afcb9512842435', '2020-08-07 17:45:00');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `sys_role_permission_id` varchar(32) NOT NULL,
  `sys_role_id` varchar(32) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(32) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`sys_role_permission_id`) USING BTREE,
  KEY `index_group_role_per_id` (`sys_role_id`,`sys_permission_id`) USING BTREE,
  KEY `index_group_role_id` (`sys_role_id`) USING BTREE,
  KEY `index_group_per_id` (`sys_permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色权限表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('7dc1a24d9f53bd526485a9ac850694dd', 'e51758fa916c881624b046d26bd09230', '00b1a143029647bdd44a0132e1f0a0a3');
INSERT INTO `sys_role_permission` VALUES ('155a1e87058041f67d10599d9fa9ba4b', 'e51758fa916c881624b046d26bd09230', '13e177456f985b706275fe1f182d2c44');
INSERT INTO `sys_role_permission` VALUES ('0dc067321a263bb50d7b830ef2d1e984', 'e51758fa916c881624b046d26bd09230', '13f668e13ff24739941c17a5ef7f9e34');
INSERT INTO `sys_role_permission` VALUES ('9da16b66332672d783c2f8aaa83d76a8', 'e51758fa916c881624b046d26bd09230', '15e393c45a86e2b249c60960603de654');
INSERT INTO `sys_role_permission` VALUES ('874d9dba07b66b5b5cc6214748fc029c', 'e51758fa916c881624b046d26bd09230', '1d9cc0aaf2b7490faf4b7113f3f57da8');
INSERT INTO `sys_role_permission` VALUES ('3bcccd6032724b7c89f618fcb7d7ef92', 'e51758fa916c881624b046d26bd09230', '1e6b1944a53b66ce83cea507ed402ffe');
INSERT INTO `sys_role_permission` VALUES ('058946ce71141d59ebb436adce3431fd', 'e51758fa916c881624b046d26bd09230', '2d3fc0bb918b6a3d955abe4570075fd9');
INSERT INTO `sys_role_permission` VALUES ('83e57db9ffe3116ddc764c6a4048de38', 'e51758fa916c881624b046d26bd09230', '39338d68457b3dd1850083243b0a22c6');
INSERT INTO `sys_role_permission` VALUES ('4382715ec7789240ccdcfbde13e0cb92', 'e51758fa916c881624b046d26bd09230', '3f915b2769fc80648e92d04e84ca059d');
INSERT INTO `sys_role_permission` VALUES ('bc9b6d87456b293571869f056528025d', 'e51758fa916c881624b046d26bd09230', '537857ac9e9dc5473b1c5e8c5c3b769e');
INSERT INTO `sys_role_permission` VALUES ('dd8ae5f23c70517c79b9100b49e136b3', 'e51758fa916c881624b046d26bd09230', '594c3296308daf70f20346382ea7f3d8');
INSERT INTO `sys_role_permission` VALUES ('10b3283d914c33f7807208188cde8e49', 'e51758fa916c881624b046d26bd09230', '5eba9a80358b4df2ea7c2f56e2c5a901');
INSERT INTO `sys_role_permission` VALUES ('17bddf9d516f35ee4c811363ed7ccef6', 'e51758fa916c881624b046d26bd09230', '6770ea026b9b03251871f4a7b3503fc4');
INSERT INTO `sys_role_permission` VALUES ('133470429d79de1634f7a9d23d3558e1', 'e51758fa916c881624b046d26bd09230', '7a9918e83b496018fc0910d4354c1370');
INSERT INTO `sys_role_permission` VALUES ('5991079bb19f27a775bc7041a933594d', 'e51758fa916c881624b046d26bd09230', '81565702926279d9276dcf8206388c52');
INSERT INTO `sys_role_permission` VALUES ('98d6626cc09625d9a1865dcfe9340112', 'e51758fa916c881624b046d26bd09230', '8606b4b10eef21dbcac51cb952c0bc77');
INSERT INTO `sys_role_permission` VALUES ('9acf9385451dbf258ca3b842131fc6f6', 'e51758fa916c881624b046d26bd09230', '8e7a65c4cd35a619945e9bbacf492959');
INSERT INTO `sys_role_permission` VALUES ('823370cee382da641e7f72abe7b3cce6', 'e51758fa916c881624b046d26bd09230', '9502685863ab87f0ad1134142788a385');
INSERT INTO `sys_role_permission` VALUES ('b2c311037a2ebd261843e5a42b5de139', 'e51758fa916c881624b046d26bd09230', 'adeef5c2eac1b8d4c1af0dd0e19e9e6a');
INSERT INTO `sys_role_permission` VALUES ('e18be9daed219c99341359dbd13a1e73', 'e51758fa916c881624b046d26bd09230', 'aea1cdc0b12d63744045ec18ef5f0567');
INSERT INTO `sys_role_permission` VALUES ('9c90b25cb0b1556abe68b253a6352ead', 'e51758fa916c881624b046d26bd09230', 'caidanguanli');
INSERT INTO `sys_role_permission` VALUES ('79cf5bc6d5667d645629dcf41b1fc8fd', 'e51758fa916c881624b046d26bd09230', 'd7d6e2e4e2934f2c9385a623fd98c6f3');
INSERT INTO `sys_role_permission` VALUES ('e2f910e1ffdd95c7a9609e7f0b37f58e', 'e51758fa916c881624b046d26bd09230', 'dbaa789200df3e67c4147896e4a8503f');
INSERT INTO `sys_role_permission` VALUES ('ff2a423455bc89b23ec6fd58b7638627', 'e51758fa916c881624b046d26bd09230', 'e353ba1342b3788f9fb5f1988358a480');
INSERT INTO `sys_role_permission` VALUES ('f1af7b4848643d63c074099c4f09dd9a', 'e51758fa916c881624b046d26bd09230', 'e8af452d8948ea49d37c934f5100ae6a');
INSERT INTO `sys_role_permission` VALUES ('aa43d7aac8907c0eb81dad8cfac75203', 'e51758fa916c881624b046d26bd09230', 'ed7836791adc16b2db3e3cd29cc1dbae');
INSERT INTO `sys_role_permission` VALUES ('af63be1cb607b1c079bcba136e568192', 'e51758fa916c881624b046d26bd09230', 'f877a963715fe1d4bf3dfeb910470dfd');
INSERT INTO `sys_role_permission` VALUES ('a2ff9fa3aefadf6dfb93419c988ddcd8', 'e51758fa916c881624b046d26bd09230', 'fb0cfecfcdfc08a329a9ae801edca016');
INSERT INTO `sys_role_permission` VALUES ('26b082396fb6e704f092b61bcc88f512', 'ee8626f80f7c2619917b6236f3a7f02b', '00b1a143029647bdd44a0132e1f0a0a3');
INSERT INTO `sys_role_permission` VALUES ('f0ead2771d13183e68c0daf01f1337ca', 'ee8626f80f7c2619917b6236f3a7f02b', '0370f0bade46b4b1dbb377f6a89560ec');
INSERT INTO `sys_role_permission` VALUES ('5111753b540cc7730bf006ff76822047', 'ee8626f80f7c2619917b6236f3a7f02b', '131dc9f6e826c3dbfea16aecfcce6443');
INSERT INTO `sys_role_permission` VALUES ('6a7a43aa277baebb0633da3b64740b33', 'ee8626f80f7c2619917b6236f3a7f02b', '13e177456f985b706275fe1f182d2c44');
INSERT INTO `sys_role_permission` VALUES ('683323a414f39a6ce24f74749ac3b877', 'ee8626f80f7c2619917b6236f3a7f02b', '13f668e13ff24739941c17a5ef7f9e34');
INSERT INTO `sys_role_permission` VALUES ('63203669de315c2af81981ef8ceefa27', 'ee8626f80f7c2619917b6236f3a7f02b', '13f6db4bf6e611b71692423bf1f26dda');
INSERT INTO `sys_role_permission` VALUES ('e7fba0485801e3d157e822666002e6d3', 'ee8626f80f7c2619917b6236f3a7f02b', '15e393c45a86e2b249c60960603de654');
INSERT INTO `sys_role_permission` VALUES ('bbe006eda3b39b754f04ccf341f0bd33', 'ee8626f80f7c2619917b6236f3a7f02b', '1d9cc0aaf2b7490faf4b7113f3f57da8');
INSERT INTO `sys_role_permission` VALUES ('aaf2d3ea06c7066907fb7088ba5237fa', 'ee8626f80f7c2619917b6236f3a7f02b', '1e6b1944a53b66ce83cea507ed402ffe');
INSERT INTO `sys_role_permission` VALUES ('3b5fe927da82a78f5e5a7ce62c64f2a7', 'ee8626f80f7c2619917b6236f3a7f02b', '2a60fd65d7b51d0b1d3a01be12c4e3d3');
INSERT INTO `sys_role_permission` VALUES ('d6fdd64c5c8bb7716070e8873afeba04', 'ee8626f80f7c2619917b6236f3a7f02b', '2d3fc0bb918b6a3d955abe4570075fd9');
INSERT INTO `sys_role_permission` VALUES ('c5fb1f7c4c36745cffeead8436491a06', 'ee8626f80f7c2619917b6236f3a7f02b', '3771f186cfb21a96a6f730481c0de48e');
INSERT INTO `sys_role_permission` VALUES ('c5ad0af62942778a4e109e2ed9d65a9a', 'ee8626f80f7c2619917b6236f3a7f02b', '39338d68457b3dd1850083243b0a22c6');
INSERT INTO `sys_role_permission` VALUES ('18505c1765c21e61c36783edf75b1cf8', 'ee8626f80f7c2619917b6236f3a7f02b', '3f7c327bd059b96c2704e0808b82cd36');
INSERT INTO `sys_role_permission` VALUES ('ae6d3e68ea3a5269a237026b3d3a8bc3', 'ee8626f80f7c2619917b6236f3a7f02b', '3f915b2769fc80648e92d04e84ca059d');
INSERT INTO `sys_role_permission` VALUES ('11702112a831f37f18d42e06e400b4d0', 'ee8626f80f7c2619917b6236f3a7f02b', '537857ac9e9dc5473b1c5e8c5c3b769e');
INSERT INTO `sys_role_permission` VALUES ('d6d7fec7e9ffc26d69b2d62d8bb28849', 'ee8626f80f7c2619917b6236f3a7f02b', '57500f3bf4897b8f4d4453b001ef75d7');
INSERT INTO `sys_role_permission` VALUES ('89cc5b21c30ec79d87ace0ca92eba2c7', 'ee8626f80f7c2619917b6236f3a7f02b', '594c3296308daf70f20346382ea7f3d8');
INSERT INTO `sys_role_permission` VALUES ('fb415e24907100e13b388c4a88085840', 'ee8626f80f7c2619917b6236f3a7f02b', '5eba9a80358b4df2ea7c2f56e2c5a901');
INSERT INTO `sys_role_permission` VALUES ('ee7ff5e6dd7a722014b755a84dbbcacf', 'ee8626f80f7c2619917b6236f3a7f02b', '6770ea026b9b03251871f4a7b3503fc4');
INSERT INTO `sys_role_permission` VALUES ('7b264bcc34e8a511802822bee4d61392', 'ee8626f80f7c2619917b6236f3a7f02b', '6db1ee97dfffeaec9c56432ce25e0eef');
INSERT INTO `sys_role_permission` VALUES ('4ab1580c19f64b08cb2913980fa05eeb', 'ee8626f80f7c2619917b6236f3a7f02b', '7253f4d7a22935afc9ec37ba52ad97ba');
INSERT INTO `sys_role_permission` VALUES ('59049b06f113fe61d3dbcee85fef41af', 'ee8626f80f7c2619917b6236f3a7f02b', '7805b1e8c13d1f1b8ef4f21fbee33ec2');
INSERT INTO `sys_role_permission` VALUES ('c462f105a822fefedbd27825887442ad', 'ee8626f80f7c2619917b6236f3a7f02b', '7a9918e83b496018fc0910d4354c1370');
INSERT INTO `sys_role_permission` VALUES ('98a4573d56bea59f11e9906bab94fc8d', 'ee8626f80f7c2619917b6236f3a7f02b', '7f9f3906542f2fcb90cd45e3c1d22242');
INSERT INTO `sys_role_permission` VALUES ('e18b5bc4ae12bbffff5a0cb46e42665b', 'ee8626f80f7c2619917b6236f3a7f02b', '81565702926279d9276dcf8206388c52');
INSERT INTO `sys_role_permission` VALUES ('fb651a0dfbe1b95cd94c67eec1a7e6b8', 'ee8626f80f7c2619917b6236f3a7f02b', '8606b4b10eef21dbcac51cb952c0bc77');
INSERT INTO `sys_role_permission` VALUES ('d71289b3dcf2ba4ad2f331926aa271e9', 'ee8626f80f7c2619917b6236f3a7f02b', '89a63da40029a4445eb9c2eb9b233129');
INSERT INTO `sys_role_permission` VALUES ('a2dcbfd400ea514331e53e013cf34143', 'ee8626f80f7c2619917b6236f3a7f02b', '8a4b6e7ecbe3b714570f4cd7bb420735');
INSERT INTO `sys_role_permission` VALUES ('dd993587a5019e1361ca3d1cae0590f5', 'ee8626f80f7c2619917b6236f3a7f02b', '8e7a65c4cd35a619945e9bbacf492959');
INSERT INTO `sys_role_permission` VALUES ('69eee6d3b6cfc7704867301013e98e50', 'ee8626f80f7c2619917b6236f3a7f02b', '9502685863ab87f0ad1134142788a385');
INSERT INTO `sys_role_permission` VALUES ('729ea79325c97f1cf8b58cbaef113f7e', 'ee8626f80f7c2619917b6236f3a7f02b', 'adeef5c2eac1b8d4c1af0dd0e19e9e6a');
INSERT INTO `sys_role_permission` VALUES ('0e8ff68d578cd20b4b97b34ce8511a9d', 'ee8626f80f7c2619917b6236f3a7f02b', 'aea1cdc0b12d63744045ec18ef5f0567');
INSERT INTO `sys_role_permission` VALUES ('1cb4f133c7f5032a0b54d6e29ee7449c', 'ee8626f80f7c2619917b6236f3a7f02b', 'b82766e5673b2e58e8cfe10bf4cf032c');
INSERT INTO `sys_role_permission` VALUES ('6daa1b8d8d750df5d6ef137600ee3176', 'ee8626f80f7c2619917b6236f3a7f02b', 'caidanguanli');
INSERT INTO `sys_role_permission` VALUES ('9ec31fd7b93df146802809250456d814', 'ee8626f80f7c2619917b6236f3a7f02b', 'cb8e81289d2799dc641563e3a3b9b7d8');
INSERT INTO `sys_role_permission` VALUES ('3f2df7e0b0db79941dd7fc2e67f8da6f', 'ee8626f80f7c2619917b6236f3a7f02b', 'd7d6e2e4e2934f2c9385a623fd98c6f3');
INSERT INTO `sys_role_permission` VALUES ('218d5db8f389b150269052ba605e04a5', 'ee8626f80f7c2619917b6236f3a7f02b', 'dbaa789200df3e67c4147896e4a8503f');
INSERT INTO `sys_role_permission` VALUES ('d92730acb4e8a7b4b76d84584071a9d0', 'ee8626f80f7c2619917b6236f3a7f02b', 'e353ba1342b3788f9fb5f1988358a480');
INSERT INTO `sys_role_permission` VALUES ('620a126ceb45ef33e9e04f9c1f0729c2', 'ee8626f80f7c2619917b6236f3a7f02b', 'e8af452d8948ea49d37c934f5100ae6a');
INSERT INTO `sys_role_permission` VALUES ('318237cf29fbc95df91b9eaf646a7266', 'ee8626f80f7c2619917b6236f3a7f02b', 'ed7836791adc16b2db3e3cd29cc1dbae');
INSERT INTO `sys_role_permission` VALUES ('6aa1b5c5f3246ef5591849d4b3ff27c2', 'ee8626f80f7c2619917b6236f3a7f02b', 'f360ae39f2bd50b6d53e3e832f3c05f4');
INSERT INTO `sys_role_permission` VALUES ('db5fbdea4c936fd80bf113dea7bf7315', 'ee8626f80f7c2619917b6236f3a7f02b', 'f877a963715fe1d4bf3dfeb910470dfd');
INSERT INTO `sys_role_permission` VALUES ('af9b0305d277d749c001def4aa39e707', 'ee8626f80f7c2619917b6236f3a7f02b', 'fb0cfecfcdfc08a329a9ae801edca016');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `sys_user_id` varchar(32) NOT NULL COMMENT '主键',
  `user_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `login_name` varchar(50) NOT NULL COMMENT '登录名称',
  `pass_word` varchar(60) NOT NULL COMMENT '密码',
  `head_img` varchar(200) DEFAULT NULL COMMENT '头像',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态(0正常 1 冻结)',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '序号',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除状态(0:未删除 1:已删除)',
  `create_user_id` varchar(32) NOT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sys_user_id`) USING BTREE,
  UNIQUE KEY `index_login_name_unique` (`login_name`) USING BTREE COMMENT '登陆账号唯一性索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('3946d9f631e3cd4619afcb9512842435', '白鹭', 'bailu', '$2a$10$tjAEUKqtfCpjVhjoobQ7D.HnvXnG55pwopijyEhHKXd.AHNaTjh0a', '1589612398496.jpg', '15533333333', '0', '100', '备注', '0', 'a75d45a015c44384a04449ee80dc3503', '2020-03-30 16:59:55', null, '2020-08-07 17:26:50');
INSERT INTO `sys_user` VALUES ('4cad2f7a9aa7735962a208726384f0e9', '123', '12312312', '$2a$10$WfxURnB6F39w2Uro.LuAW.CmTgvXjY5yB2TPcOkHZf1./pegaouhq', null, '15556778888', '0', '100', null, '0', '68281b252400a1f64f3b7b0aa7531fb0', '2020-08-10 09:44:25', null, '2020-08-10 09:44:25');
INSERT INTO `sys_user` VALUES ('68281b252400a1f64f3b7b0aa7531fb0', '管理员', 'admin', '$2a$10$OezgxBLq8pGNZ1avGqceXeycSgeMgHWyA2NObe1wu8X6MvlATHONq', 'redis.png', '15567778888', '0', '100', null, '0', '3946d9f631e3cd4619afcb9512842437', '2020-04-14 20:40:38', null, '2020-05-20 16:33:54');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `sys_user_role_id` varchar(32) NOT NULL COMMENT '主键id',
  `sys_user_id` varchar(32) NOT NULL COMMENT '用户id',
  `sys_role_id` varchar(32) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`sys_user_role_id`) USING BTREE,
  KEY `index2_groupuu_user_id` (`sys_user_id`) USING BTREE,
  KEY `index2_groupuu_ole_id` (`sys_role_id`) USING BTREE,
  KEY `index2_groupuu_useridandroleid` (`sys_user_id`,`sys_role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('658b801b885da49cac86c5e92f02bfca', '3946d9f631e3cd4619afcb9512842435', 'ee8626f80f7c2619917b6236f3a7f02b');
INSERT INTO `sys_user_role` VALUES ('d5b0af507040afae17f750d5bcb040f6', '4cad2f7a9aa7735962a208726384f0e9', 'ee8626f80f7c2619917b6236f3a7f02b');
INSERT INTO `sys_user_role` VALUES ('f242d7cbf09d3d15800453f59d2c2388', '68281b252400a1f64f3b7b0aa7531fb0', 'e51758fa916c881624b046d26bd09230');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `nick_name` varchar(16) DEFAULT NULL COMMENT '用户昵称',
  `head_img` varchar(128) DEFAULT NULL COMMENT '用户头像',
  `real_name` varchar(16) DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机号',
  `wx_open_id` varchar(32) DEFAULT NULL COMMENT '微信OPENID',
  `wx_session_key` varchar(32) DEFAULT NULL COMMENT '微信SessionKey',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态 0: 正常 1:禁用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='小程序用户';

-- ----------------------------
-- Records of user
-- ----------------------------
