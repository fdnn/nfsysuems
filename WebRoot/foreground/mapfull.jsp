<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
	<link href="../static/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <!--引入高德地图JavaScript API文件-->
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&amp;key=608d75903d29ad471362f8c58c550daf&amp;plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
    <style type="text/css">
        body,html,#container{
            height: 100%;
            margin: 0px;
            font: 12px Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;
        }
        .panel {
	        background-color: #ddf;
	        color: #333;
	        border: 1px solid silver;
	        box-shadow: 3px 4px 3px 0px silver;
	        position: absolute;
	        top: 10px;
	        right: 10px;
	        border-radius: 5px;
	        overflow: hidden;
	        line-height: 20px;
        }
        #input{
	        width: 250px;
	        height: 25px;
	        border: 0;
	        background-color: white;
        }
    </style>
</head>
<body>

<!--创建地图容器-->
<div id="container" tabindex="0"></div>
<script src="../static/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	var lnglat = window.parent.document.getElementById("lnglat").value;
	if(lnglat==null || lnglat=="")	lnglat = "113.679285,23.632408";
	var array = lnglat.split(",");
    /*创建地图*/
    var map = new AMap.Map('container',{
        resizeEnable: true,
        zoom: 10,
        center: new AMap.LngLat(parseFloat(array[0]),parseFloat(array[1]))
    });
    //var asd = new AMap.LngLat(lng:"113.679285",lat:"23.632408");
    //map.setCenter(new AMap.LngLat(lnglat));

    /*添加点标记*/
    var marker = new AMap.Marker({
    	position: [parseFloat(array[0]), parseFloat(array[1])]
    });
    marker.setMap(map);
    /* 添加圆circle */
    /*var circle = new AMap.Circle({
            center: [parseFloat(array[0]), parseFloat(array[1])],
            redius: 100,
            fillOpacity:0.1,
            fillColor:'#09f',
            strokeColor:'#09f',
            strokeWeight:1
    })
    circle.setMap(map);*/
    
    /* 自适应布局视图 */
    map.setFitView();
    /* 信息窗体 */
    /*marker.on('click',function(e){
        infowindow.open(map,e.target.getPosition());
    })
    var infowindow = new AMap.InfoWindow({
        content: '<h3 class="title">高德地图</h1><div class="content">'+
        '<img src="http://webapi.amap.com/images/amap.jpg">'+
        '高德是中国领先的数字地图内容、导航和位置服务解决方案提供商。<br/>'+
        '<a target="_blank" href = "http://mobile.amap.com/">点击下载高德地图</a></div>',
        offset: new AMap.Pixel(0, -30),
        size:new AMap.Size(300,0)
    })
    infowindow.open(map,marker.getPosition());*/

    /*添加工具条和比例尺*/
    AMap.plugin(['AMap.ToolBar','AMap.Scale'],function(){
        var toolBar = new AMap.ToolBar();
        var scale = new AMap.Scale();
        map.addControl(toolBar);
    })

    //为地图注册click事件获取鼠标点击出的经纬度坐标
    /* var clickEventListener = map.on('click', function(e) {
        map.clearMap();
        var marker = new AMap.Marker({
            //position:[e.lnglat.getLng(),e.lnglat.getLat()],
            draggable: false,//点标记可拖拽
            cursor: 'move',//鼠标悬停点标记时的鼠标样式
            raiseOnDrag: true//鼠标拖拽点标记时开启点标记离开地图的效果
        });
        marker.setPosition(new AMap.LngLat(e.lnglat.getLng(),e.lnglat.getLat())); //更新点标记位置
        marker.setMap(map);
        document.getElementById("lnglat").value = e.lnglat.getLng() + ',' + e.lnglat.getLat()
    }); 
    */

    /* 根据经纬度获得地址 */
    AMap.plugin('AMap.Geocoder',function(){
        var geocoder = new AMap.Geocoder({
            city: "010"//城市，默认：“全国”
        });
        /* 页面加载完后初始位置 */
       	geocoder.getAddress(parseFloat(array[0])+ ',' + parseFloat(array[1]),function(status,result){
          if(status=='complete'){
             document.getElementById('input').value = result.regeocode.formattedAddress
          }
        })
    });
</script>
</body>
</html>