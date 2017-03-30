<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/common.js"></script>
	
<script type="text/javascript" src="${pageContext.request.contextPath}/static/highcharts4/js/highcharts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/highcharts4/js/modules/drilldown.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/static/highcharts4/js/modules/data.js"></script> 
<script type="text/javascript">
	function openTab(text, url, iconCls) {
		if ($("#tabs").tabs("exists", text)) {
			$("#tabs").tabs("select", text);
		} else {
			var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/manager/"
					+ url + "'></iframe>";
			$("#tabs").tabs("add", {
				title : text,
				iconCls : iconCls,
				closable : true,
				content : content
			});
		}
	}

	function refreshCareer() {
		$.post("${pageContext.request.contextPath}/admin/refreshCareer.do", {},
				function(result) {
					if (result.success) {
						$.messager.alert("系统提示", "已成功刷新系统缓存！");
					} else {
						$.messager.alert("系统提示", "刷新系统缓存失败！");
					}
				}, "json");
	}
	function logout(){
		if(confirm('您确定要退出系统吗？')){
			window.location.href="${pageContext.request.contextPath}/user/logout.do";
		}
	}
	
	
	$(function(){
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
		        		$.post("${pageContext.request.contextPath}/resume/findGroupByCreateDate.do",{},function(result){
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
		        text: '<b>简历发布统计</b>'
		    },
		    tooltip: {
		        valueSuffix: '个'
		    },
		    yAxis: {
		        title: {
		            text: '简历数'	
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
		
		var chart05=new Highcharts.Chart({
			chart: {
				renderTo:'container05',
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
	})
</script>
</head>
<body class="easyui-layout">
	<div region="north" style="height: 50px;background-color: #E0ECFF">
		<table style="padding: 5px" width="100%">
			<tr>
				<td width="50%"><font size='4px;'><b>&nbsp;&nbsp;毕业生就业跟踪管理系统</b>
				</font>
				</td>
				<td valign="bottom" align="right" width="50%">
					<div class="huanying">
						欢迎 ${currentUser.userName}【${currentUser.trueName }】登录 | <span
							id="clock"></span>
					</div></td>
			</tr>
		</table>
	</div>
	<div region="center">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页" data-options="iconCls:'icon-home'">
				<div>
					<%--<font color="red" size="10">欢迎使用</font>--%>
					<%--<img alt="" src="../images/bg.jpg" width="100%">
				--%>
					<div style="margin:5px;min-height: 0px;">
						<div id="container06" class="easyui-panel" title="简历发布统计" style="width:1110px;padding:10px;"
						        data-options="iconCls:'icon-tjbb',collapsible:true,closable:true">
						</div>
					</div>
					<div style="margin:5px;min-height: 0px;">
						<div id="container05" class="easyui-panel" title="招聘发布统计" style="width:1110px;padding:10px;"
						        data-options="iconCls:'icon-tjbb',collapsible:true,closable:true">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div region="west" style="width: 200px" title="导航菜单" split="true">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="用户管理" data-options="selected:true,iconCls:'icon-yhgl'"
				style="padding: 10px">
				<a
					href="javascript:openTab('学生信息管理','studentInfoManage.jsp','icon-xsxxgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-xsxxgl'"
					style="width: 150px">学生信息管理</a> <a
					href="javascript:openTab('企业信息管理','companyInfoManage.jsp','icon-qyxxgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-qyxxgl'"
					style="width: 150px">企业信息管理</a>
				<c:choose>
					<c:when test="${currentUser.role==2 || currentUser.role==3 }">
						<a
							href="javascript:openTab('系管理员信息管理','depAdminManage.jsp','icon-admin')"
							class="easyui-linkbutton"
							data-options="plain:true,iconCls:'icon-admin'"
							style="width: 150px">系管理员信息管理</a>
					</c:when>
				</c:choose>
			</div>
			<div title="应聘管理" data-options="selected:true,iconCls:'icon-ypgl'"
				style="padding: 10px">
				<a
					href="javascript:openTab('学生简历管理','studentResumeManage.jsp','icon-jlgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-jlgl'" style="width: 150px">学生简历管理</a>
				<a
					href="javascript:openTab('企业招聘管理','companyRecruitManage.jsp','icon-zpgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-zpgl'" style="width: 150px">企业招聘管理</a>
			</div>
			<div title="职位管理" data-options="selected:true,iconCls:'icon-zwgl'"
				style="padding: 10px">
				<a
					href="javascript:openTab('一级职位管理','oneCareerManage.jsp','icon-onezw')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-onezw'" style="width: 150px">一级职位管理</a>
				<a
					href="javascript:openTab('二级职位管理','twoCareerManage.jsp','icon-twozw')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-twozw'" style="width: 150px">二级职位管理</a>
				<a
					href="javascript:openTab('三级职位管理','threeCareerManage.jsp','icon-threezw')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-threezw'" style="width: 150px">三级职位管理</a>
				<a href="javascript:refreshCareer()" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-reload'"
					style="width: 150px;">刷新职位缓存</a>
			</div>
			<div title="资料管理" data-options="selected:true,iconCls:'icon-zlgl'"
				style="padding: 10px">
				<%--<a
					href="javascript:openTab('系/专业管理','depManage.jsp','icon-dep')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-dep'"
					style="width: 150px">系/专业管理</a>--%>
				<%--<a
					href="javascript:openTab('友情链接管理','noticeManage.jsp','icon-tzgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-tzgl'"
					style="width: 150px">友情链接管理</a>--%>
				<a href="javascript:openTab('通知管理','noticeManage.jsp','icon-tzgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-tzgl'" style="width: 150px">通知管理</a>
				<%--<a
					href="javascript:openTab('文件上传管理','fileManage.jsp','icon-wjscgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-wjscgl'"
					style="width: 150px">文件上传管理<font style="color:red">(开发..)</font></a>
			--%></div>
			<div title="统计报表" data-options="iconCls:'icon-tjbb'"
				style="padding:10px;">
				<a
					href="javascript:openTab('学生简历分析','studentResumeAna.jsp','icon-xsjlfx')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-xsjlfx'"
					style="width: 150px;">学生简历分析 </a> <a
					href="javascript:openTab('企业招聘分析','companyRecruitAna.jsp','icon-qyzpfx')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-qyzpfx'"
					style="width: 150px;">企业招聘分析 </a> <%--<a
					href="javascript:openTab('学生就业分析','studentJobAna.jsp','icon-xsjyfx')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-xsjyfx'"
					style="width: 150px;">学生就业分析<font style="color:red">(开发..)</font> </a> <a
					href="javascript:openTab('企业人才需求分析','companyTalentAna.jsp','icon-qyrcxqfx')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-qyrcxqfx'"
					style="width: 150px;">企业人才需求分析<font style="color:red">(开发..)</font> </a>
			--%></div>
			<div title="个人信息管理" data-options="iconCls:'icon-grxxgl'"
				style="padding:10px">
				<a
					href="javascript:openTab('修改个人信息','modifyInfo.jsp','icon-grxxgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-grxxgl'"
					style="width: 150px;">修改个人信息 </a>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-item'"
				style="padding:10px">
				<a href="javascript:openTab('修改密码','modifyPass.jsp','icon-grxxgl')"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-modifyPassword'"
					style="width: 150px;">修改密码</a> 
				<a href="javascript:logout()"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
			</div>
		</div>
	</div>
	<div region="south" style="height: 25px;padding: 5px" align="center">
		(2016-2017)版本所有-小海-(QQ:253565984)</div>
</body>
</html>