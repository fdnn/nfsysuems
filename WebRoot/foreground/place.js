/**
 * Created by 小海 on 2016/5/31.
 */
//province(省份类)
function provinceList()
{
    this.length=36;
    this[0] = new Option("不限","不限");
    this[1] = new Option("北京","北京");
    this[2] = new Option("重庆","重庆");
    this[3] = new Option("福建","福建");
    this[4] = new Option("甘肃","甘肃");
    this[5] = new Option("广东","广东");
    this[6] = new Option("广西","广西");
    this[7] = new Option("贵州","贵州");
    this[8] = new Option("海南","海南");
    this[9] = new Option("河北","河北");
    this[10] = new Option("河南","河南");
    this[11] = new Option("黑龙江","黑龙江");
    this[12] = new Option("湖北","湖北");
    this[13] = new Option("湖南","湖南");
    this[14] = new Option("江苏","江苏");
    this[15] = new Option("江西","江西");
    this[16] = new Option("吉林","吉林");
    this[17] = new Option("辽宁","辽宁");
    this[18] = new Option("内蒙古","内蒙古");
    this[19] = new Option("宁夏","宁夏");
    this[20] = new Option("青海","青海");
    this[21] = new Option("上海","上海");
    this[22] = new Option("山东","山东");
    this[23] = new Option("山西","山西");
    this[24] = new Option("陕西","陕西");
    this[25] = new Option("四川","四川");
    this[26] = new Option("天津","天津");
    this[27] = new Option("新疆","新疆");
    this[28] = new Option("西藏","西藏");
    this[29] = new Option("云南","云南");
    this[30] = new Option("浙江","浙江");
    this[31] = new Option("安徽","安徽");
    this[32] = new Option("香港","香港");
    this[33] = new Option("澳门","澳门");
    this[34] = new Option("台湾","台湾");
    this[35] = new Option("其它","其他");
    return this;
}
//city(城市类)
function citylist()
{
    this.length=36;
    this[0] = new Array(1);
    this[0][0] = new Option("不限","不限");
    this[1] = new Array(1);
    this[1][0] = new Option("北京市","北京市");
    this[2] = new Array(4);
    this[2][0] = new Option("重庆市","重庆市");
    this[2][1] = new Option("涪陵市","涪陵市");
    this[2][2] = new Option("黔江市","黔江市");
    this[2][3] = new Option("万县市","万县市");
    this[3] = new Array(9);
    this[3][0] = new Option("福州市","福州市");
    this[3][1] = new Option("龙岩市","龙岩市");
    this[3][2] = new Option("南平市","南平市");
    this[3][3] = new Option("宁德市","宁德市");
    this[3][4] = new Option("莆田市","莆田市");
    this[3][5] = new Option("泉州市","泉州市");
    this[3][6] = new Option("三明市","三明市");
    this[3][7] = new Option("厦门市","厦门市");
    this[3][8] = new Option("漳州市","漳州市");
    this[4] = new Array(14);
    this[4][0] = new Option("兰州市","兰州市");
    this[4][1] = new Option("甘南藏族自治州","甘南藏族自治州");
    this[4][2] = new Option("定西地区","定西地区");
    this[4][3] = new Option("白银市","白银市");
    this[4][4] = new Option("嘉峪关市","嘉峪关市");
    this[4][5] = new Option("金昌市","金昌市");
    this[4][6] = new Option("酒泉市","酒泉市");
    this[4][7] = new Option("宁夏回族自治州","宁夏回族自治州");
    this[4][8] = new Option("陇南地区","陇南地区");
    this[4][9] = new Option("平凉市","平凉市");
    this[4][10] = new Option("庆阳市","庆阳市");
    this[4][11] = new Option("天水市","天水市");
    this[4][12] = new Option("武威市","武威市");
    this[4][13] = new Option("张掖市","张掖市");
    this[5] = new Array(21);
    this[5][0] = new Option("广州市","广州市");
    this[5][1] = new Option("佛山市","佛山市");
    this[5][2] = new Option("惠州市","惠州市");
    this[5][3] = new Option("东莞市","东莞市");
    this[5][4] = new Option("江门市","江门市");
    this[5][5] = new Option("揭阳市","揭阳市");
    this[5][6] = new Option("潮州市","潮州市");
    this[5][7] = new Option("茂名市","茂名市");
    this[5][8] = new Option("梅州市","梅州市");
    this[5][9] = new Option("清远市","清远市");
    this[5][10] = new Option("汕头市","汕头市");
    this[5][11] = new Option("汕尾市","汕尾市");
    this[5][12] = new Option("深圳市","深圳市");
    this[5][13] = new Option("韶关市","韶关市");
    this[5][14] = new Option("阳江市","阳江市");
    this[5][15] = new Option("河源市","河源市");
    this[5][16] = new Option("云浮市","云浮市");
    this[5][17] = new Option("中山市","中山市");
    this[5][18] = new Option("珠海市","珠海市");
    this[5][19] = new Option("湛江市","湛江市");
    this[5][20] = new Option("肇庆市","肇庆市");
    this[6] = new Array(14);
    this[6][0] = new Option("南宁市","南宁市");
    this[6][1] = new Option("防城港市","防城港市");
    this[6][2] = new Option("北海市","北海市");
    this[6][3] = new Option("百色市","百色市");
    this[6][4] = new Option("贺州市","贺州市");
    this[6][5] = new Option("桂林市","桂林市");
    this[6][6] = new Option("来宾市","来宾市");
    this[6][7] = new Option("柳州市","柳州市");
    this[6][8] = new Option("崇左市","崇左市");
    this[6][9] = new Option("钦州市","钦州市");
    this[6][10] = new Option("贵港市","贵港市");
    this[6][11] = new Option("梧州市","梧州市");
    this[6][12] = new Option("河池市","河池市");
    this[6][13] = new Option("玉林市","玉林市");
    this[7] = new Array(9);
    this[7][0] = new Option("贵阳市","贵阳市");
    this[7][1] = new Option("毕节地区","毕节地区");
    this[7][2] = new Option("遵义市","遵义市");
    this[7][3] = new Option("安顺市","安顺市");
    this[7][4] = new Option("六盘水市","六盘水市");
    this[7][5] = new Option("黔东南苗族侗族自治州","黔东南苗族侗族自治州");
    this[7][6] = new Option("黔南布依族苗族自治州","黔南布依族苗族自治州");
    this[7][7] = new Option("黔西南布依族苗族自治","黔西南布依族苗族自治");
    this[7][8] = new Option("铜仁地区","铜仁地区");
    this[8] = new Array(3);
    this[8][0] = new Option("海口市","海口市");
    this[8][1] = new Option("三亚市","三亚市");
    this[8][2] = new Option("省直辖行政单位","省直辖行政单位");
    this[9] = new Array(11);
    this[9][0] = new Option("石家庄市","石家庄市");
    this[9][1] = new Option("邯郸市","邯郸市");
    this[9][2] = new Option("邢台市","邢台市");
    this[9][3] = new Option("保定市","保定市");
    this[9][4] = new Option("张家口市","张家口市");
    this[9][5] = new Option("沧州市","沧州市");
    this[9][6] = new Option("承德市","承德市");
    this[9][7] = new Option("廊坊市","廊坊市");
    this[9][8] = new Option("秦皇岛市","秦皇岛市");
    this[9][9] = new Option("唐山市","唐山市");
    this[9][10] = new Option("衡水市","衡水市");
    this[10] = new Array(18);
    this[10][0] = new Option("郑州市","郑州市");
    this[10][1] = new Option("开封市","开封市");
    this[10][2] = new Option("驻马店市","驻马店市");
    this[10][3] = new Option("安阳市","安阳市");
    this[10][4] = new Option("焦作市","焦作市");
    this[10][5] = new Option("洛阳市","洛阳市");
    this[10][6] = new Option("濮阳市","濮阳市");
    this[10][7] = new Option("漯河市","漯河市");
    this[10][8] = new Option("南阳市","南阳市");
    this[10][9] = new Option("平顶山市","平顶山市");
    this[10][10] = new Option("新乡市","新乡市");
    this[10][11] = new Option("信阳市","信阳市");
    this[10][12] = new Option("许昌市","许昌市");
    this[10][13] = new Option("商丘市","商丘市");
    this[10][14] = new Option("三门峡市","三门峡市");
    this[10][15] = new Option("鹤壁市","鹤壁市");
    this[10][16] = new Option("周口市","周口市");
    this[10][17] = new Option("济源市","济源市");
    this[11] = new Array(13);
    this[11][0] = new Option("哈尔滨市","哈尔滨市");
    this[11][1] = new Option("大庆市","大庆市");
    this[11][2] = new Option("大兴安岭地区","大兴安岭地区");
    this[11][3] = new Option("鸡西市","鸡西市");
    this[11][4] = new Option("佳木斯市","佳木斯市");
    this[11][5] = new Option("牡丹江市","牡丹江市");
    this[11][6] = new Option("齐齐哈尔市","齐齐哈尔市");
    this[11][7] = new Option("七台河市","七台河市");
    this[11][8] = new Option("双鸭山市","双鸭山市");
    this[11][9] = new Option("绥化市","绥化市");
    this[11][10] = new Option("伊春市","伊春市");
    this[11][11] = new Option("鹤岗市","鹤岗市");
    this[11][12] = new Option("黑河市","黑河市");
    this[12] = new Array(14);
    this[12][0] = new Option("武汉市","武汉市");
    this[12][1] = new Option("黄冈市","黄冈市");
    this[12][2] = new Option("黄石市","黄石市");
    this[12][3] = new Option("恩施土家族苗族自治州","恩施土家族苗族自治州");
    this[12][4] = new Option("鄂州市","鄂州市");
    this[12][5] = new Option("荆门市","荆门市");
    this[12][6] = new Option("荆州市","荆州市");
    this[12][7] = new Option("孝感市","孝感市");
    this[12][8] = new Option("省直辖县级行政单位","省直辖县级行政单位");
    this[12][9] = new Option("十堰市","十堰市");
    this[12][10] = new Option("襄樊市","襄樊市");
    this[12][11] = new Option("咸宁市","咸宁市");
    this[12][12] = new Option("宜昌市","宜昌市");
    this[12][13] = new Option("随州市","随州市");
    this[13] = new Array(14);
    this[13][0] = new Option("长沙市","长沙市");
    this[13][1] = new Option("怀化市","怀化市");
    this[13][2] = new Option("郴州市","郴州市");
    this[13][3] = new Option("常德市","常德市");
    this[13][4] = new Option("娄底市","娄底市");
    this[13][5] = new Option("邵阳市","邵阳市");
    this[13][6] = new Option("湘潭市","湘潭市");
    this[13][7] = new Option("湘西土家族苗族自治州","湘西土家族苗族自治州");
    this[13][8] = new Option("衡阳市","衡阳市");
    this[13][9] = new Option("永州市","永州市");
    this[13][10] = new Option("益阳市","益阳市");
    this[13][11] = new Option("岳阳市","岳阳市");
    this[13][12] = new Option("株洲市","株洲市");
    this[13][13] = new Option("张家界市","张家界市");
    this[14] = new Array(13);
    this[14][0] = new Option("南京市","南京市");
    this[14][1] = new Option("淮安市","淮安市");
    this[14][2] = new Option("常州市","常州市");
    this[14][3] = new Option("连云港市","连云港市");
    this[14][4] = new Option("南通市","南通市");
    this[14][5] = new Option("徐州市","徐州市");
    this[14][6] = new Option("苏州市","苏州市");
    this[14][7] = new Option("无锡市","无锡市");
    this[14][8] = new Option("盐城市","盐城市");
    this[14][9] = new Option("扬州市","扬州市");
    this[14][10] = new Option("镇江市","镇江市");
    this[14][11] = new Option("泰州市","泰州市");
    this[14][12] = new Option("宿迁市","宿迁市");
    this[15] = new Array(11);
    this[15][0] = new Option("南昌市","南昌市");
    this[15][1] = new Option("抚州市","抚州市");
    this[15][2] = new Option("赣州市","赣州市");
    this[15][3] = new Option("吉安市","吉安市");
    this[15][4] = new Option("景德镇市","景德镇市");
    this[15][5] = new Option("九江市","九江市");
    this[15][6] = new Option("萍乡市","萍乡市");
    this[15][7] = new Option("新余市","新余市");
    this[15][8] = new Option("上饶市","上饶市");
    this[15][9] = new Option("鹰潭市","鹰潭市");
    this[15][10] = new Option("宜春市","宜春市");
    this[16] = new Array(9);
    this[16][0] = new Option("长春市","长春市");
    this[16][1] = new Option("白城市","白城市");
    this[16][2] = new Option("白山市","白山市");
    this[16][3] = new Option("吉林市","吉林市");
    this[16][4] = new Option("辽源市","辽源市");
    this[16][5] = new Option("四平市","四平市");
    this[16][6] = new Option("松原市","松原市");
    this[16][7] = new Option("通化市","通化市");
    this[16][8] = new Option("延边朝鲜族自治州","延边朝鲜族自治州");
    this[17] = new Array(14);
    this[17][0] = new Option("沈阳市","沈阳市");
    this[17][1] = new Option("大连市","大连市");
    this[17][2] = new Option("阜新市","阜新市");
    this[17][3] = new Option("抚顺市","抚顺市");
    this[17][4] = new Option("本溪市","本溪市");
    this[17][5] = new Option("鞍山市","鞍山市");
    this[17][6] = new Option("丹东市","丹东市");
    this[17][7] = new Option("锦州市","锦州市");
    this[17][8] = new Option("朝阳市","朝阳市");
    this[17][9] = new Option("辽阳市","辽阳市");
    this[17][10] = new Option("盘锦市","盘锦市");
    this[17][11] = new Option("铁岭市","铁岭市");
    this[17][12] = new Option("营口市","营口市");
    this[17][13] = new Option("葫芦岛市","葫芦岛市");
    this[18] = new Array(12);
    this[18][0] = new Option("呼和浩特市","呼和浩特市");
    this[18][1] = new Option("阿拉善盟","阿拉善盟");
    this[18][2] = new Option("巴彦淖尔盟","巴彦淖尔盟");
    this[18][3] = new Option("包头市","包头市");
    this[18][4] = new Option("赤峰市","赤峰市");
    this[18][5] = new Option("兴安盟","兴安盟");
    this[18][6] = new Option("乌兰察布盟","乌兰察布盟");
    this[18][7] = new Option("乌海市","乌海市");
    this[18][8] = new Option("锡林郭勒盟","锡林郭勒盟");
    this[18][9] = new Option("呼伦贝尔盟","呼伦贝尔盟");
    this[18][10] = new Option("伊克昭盟","伊克昭盟");
    this[18][11] = new Option("通辽市","通辽市");
    this[19] = new Array(5);
    this[19][0] = new Option("银川市","银川市");
    this[19][1] = new Option("固原市","固原市");
    this[19][2] = new Option("石嘴山市","石嘴山市");
    this[19][3] = new Option("吴忠市","吴忠市");
    this[19][4] = new Option("中卫市","中卫市");
    this[20] = new Array(8);
    this[20][0] = new Option("西宁市","西宁市");
    this[20][1] = new Option("海东地区","海东地区");
    this[20][2] = new Option("海南藏族自治州","海南藏族自治州");
    this[20][3] = new Option("海北藏族自治州","海北藏族自治州");
    this[20][4] = new Option("黄南藏族自治州","黄南藏族自治州");
    this[20][5] = new Option("果洛藏族自治州","果洛藏族自治州");
    this[20][6] = new Option("玉树藏族自治州","玉树藏族自治州");
    this[20][7] = new Option("海西蒙古族藏族自治州","海西蒙古藏族自治州");
    this[21] = new Array(1);
    this[21][0] = new Option("上海市","上海市");
    this[22] = new Array(17);
    this[22][0] = new Option("济南市","济南市");
    this[22][1] = new Option("东营市","东营市");
    this[22][2] = new Option("滨州市","滨州市");
    this[22][3] = new Option("淄博市","淄博市");
    this[22][4] = new Option("德州市","德州市");
    this[22][5] = new Option("济宁市","济宁市");
    this[22][6] = new Option("聊城市","聊城市");
    this[22][7] = new Option("临沂市","临沂市");
    this[22][8] = new Option("莱芜市","莱芜市");
    this[22][9] = new Option("青岛市","青岛市");
    this[22][10] = new Option("日照市","日照市");
    this[22][11] = new Option("威海市","威海市");
    this[22][12] = new Option("泰安市","泰安市");
    this[22][13] = new Option("潍坊市","潍坊市");
    this[22][14] = new Option("烟台市","烟台市");
    this[22][15] = new Option("菏泽市","菏泽市");
    this[22][16] = new Option("枣庄市","枣庄市");
    this[23] = new Array(11);
    this[23][0] = new Option("太原市","太原市");
    this[23][1] = new Option("大同市","大同市");
    this[23][2] = new Option("晋城市","晋城市");
    this[23][3] = new Option("晋中市","晋中市");
    this[23][4] = new Option("长治市","长治市");
    this[23][5] = new Option("临汾市","临汾市");
    this[23][6] = new Option("吕梁地区","吕梁地区");
    this[23][7] = new Option("忻州市","忻州市");
    this[23][8] = new Option("朔州市","朔州市");
    this[23][9] = new Option("阳泉市","阳泉市");
    this[23][10] = new Option("运城市","运城市");
    this[24] = new Array(10);
    this[24][0] = new Option("西安市","西安市");
    this[24][1] = new Option("宝鸡市","宝鸡市");
    this[24][2] = new Option("安康市","安康市");
    this[24][3] = new Option("商洛市","商洛市");
    this[24][4] = new Option("铜川市","铜川市");
    this[24][5] = new Option("渭南市","渭南市");
    this[24][6] = new Option("咸阳市","咸阳市");
    this[24][7] = new Option("延安市","延安市");
    this[24][8] = new Option("汉中市","汉中市");
    this[24][9] = new Option("榆林市","榆林市");
    this[25] = new Array(21);
    this[25][0] = new Option("成都市","成都市");
    this[25][1] = new Option("达川市","达川市");
    this[25][2] = new Option("甘孜藏族自治州","甘孜藏族自治州");
    this[25][3] = new Option("自贡市","自贡市");
    this[25][4] = new Option("阿坝藏族羌族自治州","阿坝藏族羌族自治州");
    this[25][5] = new Option("巴中市","巴中市");
    this[25][6] = new Option("德阳市","德阳市");
    this[25][7] = new Option("广安市","广安市");
    this[25][8] = new Option("广元市","广元市");
    this[25][9] = new Option("凉山彝族自治州","凉山彝族自治州");
    this[25][10] = new Option("乐山市","乐山市");
    this[25][11] = new Option("攀枝花市","攀枝花市");
    this[25][12] = new Option("南充市","南充市");
    this[25][13] = new Option("内江市","内江市");
    this[25][14] = new Option("泸州市","泸州市");
    this[25][15] = new Option("绵阳市","绵阳市");
    this[25][16] = new Option("遂宁市","遂宁市");
    this[25][17] = new Option("雅安市","雅安市");
    this[25][18] = new Option("宜宾市","宜宾市");
    this[25][19] = new Option("眉山市","眉山市");
    this[25][20] = new Option("资阳市","资阳市");
    this[26] = new Array(1);
    this[26][0] = new Option("天津市","天津市");
    this[27] = new Array(15);
    this[27][0] = new Option("乌鲁木齐市","乌鲁木齐市");
    this[27][1] = new Option("喀什地区","喀什地区");
    this[27][2] = new Option("克孜勒苏柯尔克孜自治区","克孜勒苏柯尔克孜自治区");
    this[27][3] = new Option("克拉玛依市","克拉玛依市");
    this[27][4] = new Option("阿克苏地区","阿克苏地区");
    this[27][5] = new Option("阿勒泰地区","阿勒泰地区");
    this[27][6] = new Option("巴音郭楞蒙古自治州","巴音郭楞蒙古自治州");
    this[27][7] = new Option("哈密地区","哈密地区");
    this[27][8] = new Option("博尔塔拉蒙古自治州","博尔塔拉蒙古自治州");
    this[27][9] = new Option("昌吉回族自治州","昌吉回族自治州");
    this[27][10] = new Option("塔城地区","塔城地区");
    this[27][11] = new Option("吐鲁番地区","吐鲁番地区");
    this[27][12] = new Option("和田地区","和田地区");
    this[27][13] = new Option("石河子市","石河子市");
    this[27][14] = new Option("伊犁哈萨克自治州","伊犁哈萨克自治州");
    this[28] = new Array(7);
    this[28][0] = new Option("拉萨市","拉萨市");
    this[28][1] = new Option("阿里地区","阿里地区");
    this[28][2] = new Option("昌都市","昌都市");
    this[28][3] = new Option("林芝地区","林芝地区");
    this[28][4] = new Option("那曲地区","那曲地区");
    this[28][5] = new Option("山南地区","山南地区");
    this[28][6] = new Option("日喀则地区","日喀则地区");
    this[29] = new Array(16);
    this[29][0] = new Option("昆明市","昆明市");
    this[29][1] = new Option("大理白族自治州","大理白族自治州");
    this[29][2] = new Option("昭通市","邵通市");
    this[29][3] = new Option("保山市","保山市");
    this[29][4] = new Option("德宏傣族景颇族自治州","德宏傣族景颇族自治州");
    this[29][5] = new Option("迪庆藏族自治州","迪庆藏族自治州");
    this[29][6] = new Option("楚雄彝族自治州","楚雄彝族自治州");
    this[29][7] = new Option("临沧地区","临沧地区");
    this[29][8] = new Option("丽江市","丽江市");
    this[29][9] = new Option("怒江僳族自治州","怒江僳族自治州");
    this[29][10] = new Option("曲靖市","曲靖市");
    this[29][11] = new Option("思茅地区","思茅地区");
    this[29][12] = new Option("西双版纳傣族自治州","西双版纳傣族自治州");
    this[29][13] = new Option("文山壮族苗族自治州","文山壮族苗族自治州");
    this[29][14] = new Option("红河哈尼族彝族自治州","红河哈尼族彝族自治州");
    this[29][15] = new Option("玉溪市","玉溪市");
    this[30] = new Array(11);
    this[30][0] = new Option("杭州市","杭州市");
    this[30][1] = new Option("嘉兴市","嘉兴市");
    this[30][2] = new Option("金华市","金华市");
    this[30][3] = new Option("衢州市","衢州市");
    this[30][4] = new Option("丽水市","丽水市");
    this[30][5] = new Option("宁波市","宁波市");
    this[30][6] = new Option("绍兴市","绍兴市");
    this[30][7] = new Option("台州市","台州市");
    this[30][8] = new Option("温州市","温州市");
    this[30][9] = new Option("湖州市","湖州市");
    this[30][10] = new Option("舟山市","舟山市");
    this[31] = new Array(17);
    this[31][0] = new Option("合肥市","合肥市");
    this[31][1] = new Option("淮北市","淮北市");
    this[31][2] = new Option("淮南市","淮南市");
    this[31][3] = new Option("黄山市","黄山市");
    this[31][4] = new Option("安庆市","安庆市");
    this[31][5] = new Option("蚌埠市","蚌埠市");
    this[31][6] = new Option("巢湖市","巢湖市");
    this[31][7] = new Option("池州市","池州市");
    this[31][8] = new Option("滁州市","滁州市");
    this[31][9] = new Option("六安市","六安市");
    this[31][10] = new Option("马鞍山市","马鞍山市");
    this[31][11] = new Option("宣城市","宣城市");
    this[31][12] = new Option("宿州市","苏州市");
    this[31][13] = new Option("铜陵市","铜陵市");
    this[31][14] = new Option("芜湖市","芜湖市");
    this[31][15] = new Option("阜阳市","阜阳市");
    this[31][16] = new Option("亳州市","毫州市");

    this[32] = new Array(1);
    this[32][0] = new Option("香港","香港");
    this[33] = new Array(1);
    this[33][0] = new Option("澳门","澳门");
    this[34] = new Array(1);
    this[34][0] = new Option("台湾","台湾");
    this[35] = new Array(7);
    this[35][0] = new Option("北美洲","北美洲");
    this[35][1] = new Option("南美洲","南美洲");
    this[35][2] = new Option("大洋洲","大洋洲");
    this[35][3] = new Option("欧洲","欧洲");
    this[35][4] = new Option("亚洲","亚洲");
    this[35][5] = new Option("非洲","非洲");
    this[35][6] = new Option("虚拟社团","虚拟社团");
    return this;
}
//创建provincelist、citylist类实例
var provinceOb=new provinceList();
var cityOb=new citylist();
//定义province、city变量，用于select元素
var province;
var city;
//子函数添加城市
function addCitys(province,city)
{
    var index=province.selectedIndex;
    for(var i=0;i<cityOb[index].length;i++)
    {
        try
        {
            city.add(cityOb[index][i]);
        }
        catch(e)
        {
            city.add(cityOb[index][i],null);
        }
    }
}
//子函数删除城市
function delCitys(city)
{
    city.length=0;
}
//初始化地区下拉菜单
function initialize(privinceId,cityId)
{
    //获取select元素
    province=document.getElementById("province");
    city=document.getElementById("city");

    //循环添加省份到province
    for(var i=0;i<provinceOb.length;i++)
    {
        try
        {
            province.add(provinceOb[i]);
        }
        catch(e)
        {
            province.add(provinceOb[i],null);
        }
    }

    //初始化privinceId
    if(privinceId==undefined)
    {
        privinceId=0;
    }
    //设置province默认选项
    province.options[privinceId].selected=true;

    //添加城市到city
    addCitys(province,city);
    //设置city的默认选项
    if(cityId!=undefined)
    {
        city.options[cityId].selected=true;
    }
    else
    {
        city.options[0].selected=true;
    }
}
//下拉列表改变事件
function selectchange(province,city)
{
    delCitys(city);
    addCitys(province,city);
}
