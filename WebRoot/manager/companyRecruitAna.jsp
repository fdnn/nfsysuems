<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/highcharts4/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/highcharts4/js/highcharts.js"></script>
<%-- 处理图表下钻的js文件 --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/highcharts4/js/modules/drilldown.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/static/highcharts4/js/modules/data.js"></script>
<%-- 处理导出图片功能的js文件 --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/highcharts4/js/modules/exporting.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">

$(function () {
	var chart01=new Highcharts.Chart({
		chart: {
			renderTo:'container01',
			//背景颜色渐变
			backgroundColor: {
                linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
                stops: [[0, 'rgb(255, 255, 255)'],
            			[1, 'rgb(240, 240, 255)']]
            },
			//统计图方框
			/*plotBackgroundColor: 'rgba(255, 255, 255, .9)',
			plotBorderWidth: 1,
            plotShadow: true,*/
            events:{
            	load:function(event){
            		var series=this.series[0];
            		// ajax请求后台加载数据
            		$.post("${pageContext.request.contextPath}/recruitInfo/findBySalary.do",{},function(result){
            			var pArr=new Array();
            			for(var i=0;i<result.length;i++){
            				pArr[i]=new Array();
            				pArr[i][0]=result[i].salary;
            				pArr[i][1]=result[i].salaryNum;
            			}
            			series.setData(pArr);
            		},"json");
            	}
            }
        },
        title: {
            text: '<b>企业招聘薪资分析</b>',
            x: -20
        }, 
        /*subtitle: {
            text: '子标题'
        },*/
        //说明
        legend: {
            itemStyle: {
                font: '9pt Trebuchet MS, Verdana, sans-serif',
                color: 'black'
            },
            itemHoverStyle: {
                color: '#039'
            },
            itemHiddenStyle: {
                color: 'gray'
            },
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -10, 
            y: 100,
            borderWidth: 0
        },
        tooltip: {
        	formatter:function(){
        		return this.point.name+':<b>'+Highcharts.numberFormat(this.percentage,1)+'%</b> ('+this.y+'个)'	
        	}
        },
        plotOptions: {
            pie: {
            	animation:true,
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                },
        		showInLegend: true
            }
        },
      	//设定报表对象的初始数据 
        series: [{
            animation: true,
            type: 'pie',
            name: '比例',
            data: []
        }],
        credits: {
        	enabled: false
        },
        lang: {
            printChart: '打印图表',
            downloadPNG: '下载JPEG 图片',
            downloadJPEG: '下载JPEG文档',
            downloadPDF: '下载PDF 文件',
            downloadSVG: '下载SVG 矢量图',
            contextButtonTitle: '下载图片'
        }
	});
	
	var drilldownSeries = [];
	var provinceData = [];
	var cityData = [];
	var chart02=new Highcharts.Chart({
		chart: {
			renderTo:'container02',
            type: 'column',
            zoomType: 'x',
            //背景颜色渐变
			backgroundColor: {
                linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
                stops: [[0, 'rgb(255, 255, 255)'],
            			[1, 'rgb(240, 240, 255)']]
            },
			//统计图方框
			plotBackgroundColor: 'rgba(255, 255, 255, .9)',
			plotBorderWidth: 1,
            plotShadow: true,
            events:{
            	load:function(event){
            		// ajax请求后台加载数据
            		$.post("${pageContext.request.contextPath}/recruitInfo/findGroupByProvince.do",{},function(result){
            			$.post("${pageContext.request.contextPath}/recruitInfo/findGroupByCity.do",{},function(result02){
            			var j=0;
            			for(var i=0;i<result.length;i++){
            				//省-数据
            				provinceData.push({
                                name: result[i].province,
                                y: result[i].provinceNum,
                                drilldown: result[i].province
                            });
            				//市-数据
            				for(;j<result02.length;j++){
            					if(result02[j].province==result[i].province){
            						cityData.push({
            							 name: result02[j].city,
       	        	                     y: result02[j].cityNum
            						});
            						//市最后一条-塞数据
            						if(j==(result02.length-1)){
            							drilldownSeries.push({
                							id: result[i].province,
                							name: result[i].province,
                							data: cityData
                						});
            						}
            					}else{
            						//市-塞数据
            						drilldownSeries.push({
            							id: result[i].province,
            							name: result[i].province,
            							data: cityData
            						});
            						cityData=[];
            						break;
            					}
            				}
            			}
            			//省-塞数据
        				//chart02.xAxis[0].categories=pArr;
            			chart02.series[0].setData(provinceData);
            		},"json");},"json");
            	}
            }
        },
        title: {
            text: '<b>工作地区统计</b>'
        },
        xAxis: {
        	title:'城市',
        	type: 'category'
        },
        yAxis: {
            title: {
                text: '招聘信息数'
            }
        },
        series: [{
            name: '招聘地区-省',
            colorByPoint: true
        }],
        drilldown: {
            series: drilldownSeries
        },
	    plotOptions: {
            column: {
               colorByPoint:true
            }
        },
        credits: {
        	enabled: false
        },
        lang: {
            printChart: '打印图表',
            downloadPNG: '下载JPEG 图片',
            downloadJPEG: '下载JPEG文档',
            downloadPDF: '下载PDF 文件',
            downloadSVG: '下载SVG 矢量图',
            contextButtonTitle: '下载图片'
        }
	});
var chart06=new Highcharts.Chart({
	chart: {
		renderTo:'container06',
        type: 'line',
        zoomType: 'x',
       //背景颜色渐变
		backgroundColor: {
            linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
            stops: [[0, 'rgb(255, 255, 255)'],
        			[1, 'rgb(240, 240, 255)']]
        },
		//统计图方框
		plotBackgroundColor: 'rgba(255, 255, 255, .9)',
		plotBorderWidth: 1,
        plotShadow: true,
        events:{
        	load:function(event){
        		var series=this.series[0];
        		// ajax请求后台加载数据
        		$.post("${pageContext.request.contextPath}/recruitInfo/findGroupByCreateDate.do",{},function(result){
        			var xArr=new Array();
        			var pArr=new Array();
        			for(var i=0;i<result.length;i++){
        				xArr.push(result[i].createDate.substring(5));
        				pArr[i]=new Array();
        				pArr[i][0]=result[i].createDate;
        				pArr[i][1]=result[i].createDateNum;
        			}
        			chart06.xAxis[0].categories=xArr;
        			series.setData(pArr);
        		},"json");
        	}
        }
    },
    title: {
        text: '<b>招聘发布统计</b>'
    },
    tooltip: {
        valueSuffix: '个'
    },
    yAxis: {
        title: {
            text: '招聘信息数'	
        }
    },
    <%--plotOptions: {
        series: {
            marker: {
                enabled: false
            }
        }
    },--%>
    series: [{
        type: 'line',
        name: '发布数量（近30天）'
    }],
    credits: {
    	enabled: false
    },
    lang: {
        printChart: '打印图表',
        downloadPNG: '下载JPEG 图片',
        downloadJPEG: '下载JPEG文档',
        downloadPDF: '下载PDF 文件',
        downloadSVG: '下载SVG 矢量图',
        contextButtonTitle: '下载图片'
    }
});


	var one_drilldownSeries = [];
	var two_drilldownSeries = [];
	var one_Data = [];
	var two_Data = [];
	var three_Data = [];
	var chart03=new Highcharts.Chart({
		chart: {
			renderTo:'container03',
	        type: 'column',
	        zoomType: 'x',
	        //背景颜色渐变
			backgroundColor: {
	            linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
	            stops: [[0, 'rgb(255, 255, 255)'],
	        			[1, 'rgb(240, 240, 255)']]
	        },
			//统计图方框
			plotBackgroundColor: 'rgba(255, 255, 255, .9)',
			plotBorderWidth: 1,
	        plotShadow: true,
	        events:{
	        	load:function(event){
	        		// ajax请求后台加载数据
	        		$.post("${pageContext.request.contextPath}/recruitInfo/findGroupByTypeOne.do",{},function(result){
	        			$.post("${pageContext.request.contextPath}/recruitInfo/findGroupByTypeTwo.do",{},function(result02){
	        				$.post("${pageContext.request.contextPath}/recruitInfo/findGroupByTypeThree.do",{},function(result03){
		        				var j=0;
		        				var k=0;
		            			for(var i=0;i<result.length;i++){
		            				//一级职业-数据
		            				one_Data.push({
		                                name: result[i].one,
		                                y: result[i].num,
		                                drilldown: result[i].one
		                            });
		            				//二级职业-数据
		            				for(;j<result02.length;j++){
		            					if(result02[j].one==result[i].one){
		            						two_Data.push({
		            							 name: result02[j].two,
		       	        	                     y: result02[j].num,
		 		                                 drilldown: result02[j].two
		            						});
		            						//二级职业最后一条-塞数据
		            						if(j==(result02.length-1)){
		            							one_drilldownSeries.push({
		                							id: result[i].one,
		                							name: result[i].one,
		                							data: two_Data
		                						});
		            						}
		            					}else{
		            						//二级职业-塞数据
		            						one_drilldownSeries.push({
		            							id: result[i].one,
		            							name: result[i].one,
		            							data: two_Data
		            						});
		            						two_Data=[];
		            						break;
		            					}

			            				//三级职业-数据
		            					for(;k<result03.length;k++){
		            						if(result03[k].two==result02[j].two){
			            						three_Data.push({
			            							 name: result03[k].three,
			       	        	                     y: result03[k].num
			            						});
			            						//三级职业最后一条-塞数据
			            						if(k==(result03.length-1)){
			            							one_drilldownSeries.push({
			                							id: result02[j].two,
			                							name: result02[j].two,
			                							data: three_Data
			                						});
			            						}
			            					}else{
			            						//三级职业-塞数据
			            						one_drilldownSeries.push({
		                							id: result02[j].two,
		                							name: result02[j].two,
		                							data: three_Data
		                						});
			            						three_Data=[];
			            						break;
			            					}
		            					}
		            				}
		            			}
		        				chart03.series[0].setData(one_Data);
	        		},"json");},"json");},"json");
	        	}
	        }
	    },
	    title: {
	        text: '<b>职业统计</b>'
	    },
	    xAxis: {
	    	title:'职业',
	    	type: 'category'
	    },
	    yAxis: {
	        title: {
	            text: '职业数'
	        }
	    },
	    series: [{
	        name: '一级职业'
	    }],
	    drilldown: {
	        series: one_drilldownSeries
	    },
	    plotOptions: {
            column: {
               colorByPoint:true
            }
        },
	    credits: {
	    	enabled: false
	    },
	    lang: {
	        printChart: '打印图表',
	        downloadPNG: '下载JPEG 图片',
	        downloadJPEG: '下载JPEG文档',
	        downloadPDF: '下载PDF 文件',
	        downloadSVG: '下载SVG 矢量图',
	        contextButtonTitle: '下载图片'
	    }
	});
});
</script>
<title>Insert title here</title>
</head>
<body style="margin: 5px">
	<div style="margin:5px;min-height: 0px;">
		<div id="container06" class="easyui-panel" title="招聘发布统计" style="width:1110px;padding:10px;"
		        data-options="iconCls:'icon-tjbb',collapsible:true,closable:true">
		</div>
	</div>
	<div style="margin:5px;float:left;min-height: 0px;">
		<div id="container01" class="easyui-panel" title="企业招聘薪资分析" style="width:550px;height:400px;padding:10px;"
		        data-options="iconCls:'icon-tjbb',collapsible:true,closable:true">
		</div>
	</div>
	
	<div style="margin:5px;float:left;min-height: 0px;">
		<div id="container02" class="easyui-panel" title="工作地区统计" style="width:550px;height:400px;padding:10px;"
		        data-options="iconCls:'icon-tjbb',collapsible:true,closable:true">
		</div>
	</div>
	
	<div style="margin:5px;float:left;min-height: 0px;">
		<div id="container03" class="easyui-panel" title="职位统计" style="width:1110px;padding:10px;"
		        data-options="iconCls:'icon-tjbb',collapsible:true,closable:true">
		</div>
	</div>
</body>
</html>