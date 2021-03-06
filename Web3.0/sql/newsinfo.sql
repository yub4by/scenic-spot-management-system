/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2017-12-22 11:24:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for newsinfo
-- ----------------------------
DROP TABLE IF EXISTS `newsinfo`;
CREATE TABLE `newsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` text,
  `seeCount` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newsinfo
-- ----------------------------
INSERT INTO `newsinfo` VALUES ('19', '哈尔滨端午节旅游踏青去哪儿玩', 'pxr', '       	       	哈尔滨端午节旅游踏青去哪儿玩?哈尔滨拥有丰富的旅游资源，端午节这个时候选择一些有意义的景点可以说是一个不错的选择\r\n哈尔滨极地馆位于松花江心的太阳岛上，这里可以欣赏到全球独一无二的白鲸表演“海洋之心”，看两头白鲸明星“米拉”和“尼克拉”与两位美女驯养师默契配合组成心形图案、上演浪漫唯美的故事，还会看到顽皮的白鲸吐水泡泡。而身怀技艺的海象、海狮则与驯养师上演各种互动搞怪，能逗得你捧腹不已。在这里可以体验到人与动物和谐共处的快乐，不失为端午节哈尔滨旅游好去处。\r\n中央大街\r\n中央大街北起松花江畔的防洪纪念塔、南至经纬街，是拥有超过百年历史的著名商业街，来哈尔滨必到此一游。在这条由方石铺成的步行街两侧，坐落着众多文艺复兴、巴洛克等各种风格的欧式建筑，每到夜晚整条街被灯光渲染得流光溢彩，而冰雪节期间的大街上随处可见有趣的冰雕和雪雕，等着你来与它们合影。\r\n龙塔\r\n龙的传人上龙塔，成就一段佳话的，就是端午节哈尔滨旅游好去处之——龙塔。于千禧龙年金秋落成的黑龙江省广播电视塔，坐落在哈尔滨高新技术开发区。塔高336米，塔身为正八边形，塔体呈抛物线形，由七条银白色的铝合金板和九条深蓝色镀膜玻璃围护。塔楼设在181米至216米处，由飞碟状的下塔楼和球状的上塔楼组成，共八层。这座亚洲第一钢塔，宛如一颗镶嵌在龙江大地上的明珠，散发着夺目的光辉。\r\n       	\r\n       	', '9', '2017-12-04 10:11:03');
INSERT INTO `newsinfo` VALUES ('20', '哈尔滨clubmed亚布力度假村攻略', 'pxr', '哈尔滨亚布力度假村位于哈尔滨市东南方向195公里处的张广才岭大锅盔山和二锅盔山北麓，海拔1374米，占地面积2255公顷。其是中国目前最大、功能最全的综合性滑雪场，与哈尔滨市区有高速公路和铁路相连接。步骤/方法\r\n　　自由式滑雪空中技巧比赛场地\r\n 该场地始建于1994年，海拔高度488米，垂直落差53米，助滑区长度75米，宽度35米，坡度25度;平台区长度25米，宽度24米，坡度0度;结束区长度45米，宽度50米，坡度0-5度。\r\n　　自由式滑雪争霸赛比赛场地\r\n 该项比赛设在二锅盔山高山滑雪大回转场地进行，该场地长度827.26米，宽度50-80米，平均坡20.93%，垂直高度差169.46米。', '0', '2017-12-05 10:11:11');
INSERT INTO `newsinfo` VALUES ('23', '“五一”前哈市五条航线游湿地 让游客饱览湿地风光', 'pxr', '   随着“湿地游”即将开始，哈市轮渡旅游公司将开启五条“湿地游”水上航线，让中外游客饱览哈市湿地风光。\r\n  据哈市轮渡旅游公司运营科长张寿滨介绍，为全力打造“迷人的哈尔滨之夏”系列活动，“五一”前，哈市轮渡旅游公司将开通九站至大顶子山、九站至老山头、通江街至金河湾公园、通江街至民主湿地和通江街至一湖三岛五条湿地游航线。其中，九站至大顶子山、九站至老山头航线将配备200客位客船一艘和320客位客船一艘；通江街至—湖三岛航线将配备2至4艘客船；通江街至金河湾湿地航线配备两艘120客位客船；通江街至民主湿地航线配备150客位客船两艘。\r\n       	', '1', '2017-12-05 10:47:38');
INSERT INTO `newsinfo` VALUES ('50', '酒店行情一路看涨 圣诞、元旦寒暖旅游地火爆', 'pxr', '酒店行情一路看涨\r\n圣诞、元旦期间，全国最热的旅游目的地莫过于香港、三亚等南方城市，另外，哈尔滨等北方滑雪目的地也较为火爆，这些城市的酒店行情均随之大涨。\r\n年底，香港成为全国最为热门的目的地。据相关人员透露，近期香港酒店预订高涨，预订率基本都在90％以上，而圣诞期间尤为紧俏。低星级酒店价格也比平时上涨了20％左右，而五星级酒店涨幅不大。\r\n近期，三亚酒店也预订火爆，价格有较大上涨。圣诞到元旦期间，五星级酒店报价大抵在1500元左右、四星级在600元左右、三星级在400元左右、二星级报价在250元左右。圣诞、元旦期间的价格比平日均增长50％以上，高过了“十一”黄金周期间。另外，厦门、丽江等酒店报价也略有上涨。\r\n值得一提的是，杭州作为传统旅游胜地，元旦期间也受到了游客们青睐，各星级酒店价格出现10％－40％的上涨。\r\n此外，北方的滑雪项目也是今年圣诞、元旦热门的旅游主题，并拉动酒店行情大幅上涨。据了解，哈尔滨五星级酒店价格在850元左右、四星级酒店价格在500元左右、三星级价格在300元左右、二星级价格在200元左右，各星级酒店比平时出现了10％－40％的上涨。\r\n       	', '2', '2017-12-14 09:37:49');
INSERT INTO `newsinfo` VALUES ('51', '凤凰山拍照惊现UFO续 多名目击者复述事发过程', 'pxr', '12年7月8日15时42分，黑龙江省山河屯林业局境内的凤凰山风景区天空出现一个柱状不明飞行物体(UFO)。当时正在现场为游客拍照的景区专职照相师吴春燕用相机将这一飞行物拍下来。10日，多位在现场看到不明飞行物体的目击者向记者讲述了事发过程。\r\n“不明飞行物像个发光的子弹头”\r\n拍摄到不明飞行物体的景区一次性成像业主吴春燕告诉记者说，7月8日下午15时40分左右，当时她正为一位女游客拍照。忽然听见有人高喊“天上是什么东西?”这时吴春燕在相机里也发现了这个物体，便立即对其进行抓拍。\r\n吴春燕说，不明物体像是一个子弹头，通体发光并且移动速度极快。\r\n在观看吴春燕所拍摄的照片后，很多网友在评论时称不明物体似乎长有两只“翅膀”，就此当事人吴春燕说，“那个不是翅膀，当时看起来好像是气体。”\r\n不明飞行物仅“亮相”数秒钟\r\n凤凰山景区工作人员潘昌金事发时也在现场，潘昌金说，不明飞行发光物体上下都有光柱，物体在空中持续了几秒钟后，便隐隐地消失在自己的视线中。\r\n凤凰山景区个体业主卢庆海告诉记者，事发时自己正在景区修理发电机，忽然听到身边的游客大喊天上有东西，他连忙起身观看。当时感觉这东西挺奇特的，从来没见过。这时卢庆海想找出望远镜继续观察，一抬头发现不明物体已经消失了，整个过程也就几秒钟的时间。\r\n有关部门将进一步调查核实\r\n吴春燕称，当时现场有两位景区的工作人员以及数名游客，大概十人左右目睹了这一异象的发生，大家都很激动。记者随后致电山河屯林业局，林业局的负责同志介绍说，目前，林业局已经将“发现不明飞行物”的情况向上级主管部门进行了汇报，正在等待有关部门的进一步调查核实。', '3', '2017-12-14 11:46:16');
INSERT INTO `newsinfo` VALUES ('52', '哈尔滨：冰城冬季玩冰赏雪吸引四方游客', 'pxr', '11年12月29日，一名游客在哈尔滨防洪纪念塔广场上一处名为“冬宫”的冰瀑布前拍照。年末岁尾，正值冰城哈尔滨的旅游旺季，被誉为“东方莫斯科”的哈尔滨以其独特的冰雪文化、冰雪旅游娱乐项目吸引来自五湖四海、四面八方的游客前来游玩。\r\n\r\n12月29日，游客乘坐马车在哈尔滨冰冻的松花江面上游玩。年末岁尾，正值冰城哈尔滨的旅游旺季，被誉为“东方莫斯科”的哈尔滨以其独特的冰雪文化、冰雪旅游娱乐项目吸引来自五湖四海、四面八方的游客前来游玩。 \r\n\r\n12月29日，游客乘坐马车在哈尔滨冰冻的松花江面上游玩。年末岁尾，正值冰城哈尔滨的旅游旺季，被誉为“东方莫斯科”的哈尔滨以其独特的冰雪文化、冰雪旅游娱乐项目吸引来自五湖四海、四面八方的游客前来游玩。新华社记者李建平摄\r\n\r\n       	', '6', '2017-12-14 11:46:23');
