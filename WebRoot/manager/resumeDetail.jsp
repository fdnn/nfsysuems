<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script> 
<style type="text/css">
	ul,li{
		padding-left:0;
	    list-style-type: none;
	}
	li{
		float: left;
	}
	.xinxi{
		padding:10px;
		border-bottom:1px #ccc dotted;
		overflow:hidden;
	}
	.xinxi ul{
		clear:both;
	}
	.xinxi .fengeshu{
		width:20px;
		text-align:center;
	}
</style>
<script type="text/javascript">
$(function () {
	$.post("${pageContext.request.contextPath}/resume/findById.do",{id:'${param.resumeId}'},function(result){
		//求职意向
		var qzyxxinxi = "<div class='xinxi' style='clear:both'>"+
							"<ul>"+
					   			"<li><span>期望职位：</span></li>"+
					   			"<li style='font-weight:bold;'><span>"+result.careerThree.name+"</span></li>"+
					   		"</ul>"+
					   		"<ul>"+
					   			"<li><span>期望月薪：</span></li>"+
					   			"<li style='font-weight:bold;'><span>"+result.salary+"</span></li>"+
					   		"</ul>"+
					   		"<ul>"+
					   			"<li><span>期望工作地点：</span></li>"+
					   			"<li style='font-weight:bold;'><span>"+result.province+"/"+result.city+"</span></li>"+
					   		"</ul>"+
					   	"</div>";
	   	$("#qzyx").append(qzyxxinxi);
	   	
		//教育背景
		var jybjxinxi="";
		for(var i=0;i<result.educationList.length;i++){
			jybjxinxi += "<div class='xinxi' style='clear:both'>"+
				       		  "<ul>"+
				       		 	  "<li><span>"+result.educationList[i].start+"</span>至</li>"+
				       		 	  "<li><span>"+result.educationList[i].end+"</span>&nbsp;&nbsp;|&nbsp;&nbsp;</li>"+
				       			  "<li style='font-weight:bold;'><span>"+result.educationList[i].school+"</span></li>"+
				       		 	  "<li class='fengeshu'>|</li>"+
				       			  "<li style='font-weight:bold;'><span>"+result.educationList[i].degree+"</span></li>"+
				       		 	  "<li class='fengeshu'>|</li>"+
				       			  "<li style='font-weight:bold;'><span>"+result.educationList[i].major+"</span></li>"+
				       		  "</ul>"+
			       	   	 "</div>";
		}
		$("#jybj").append(jybjxinxi);
		
		//工作/实习经历
		var gsjlxinxi="";
		for(var i=0;i<result.workexpList.length;i++){
			gsjlxinxi += "<div class='xinxi' style='clear:both'>"+
				       		  "<ul>"+
				       		 	  "<li><span>"+result.workexpList[i].start+"</span>至</li>"+
				       		 	  "<li><span>"+result.workexpList[i].end+"</span></li>"+
				       		 	  "<li class='fengeshu'>|</li>"+
				       		 	  "<li><span style='font-weight:bold;'>"+result.workexpList[i].unitName+"</span></li>"+
				       		 	  "<li class='fengeshu'>|</li>"+
				       		 	  "<li><span style='font-weight:bold;'>"+result.workexpList[i].jobDept+"</span></li>"+
				       		 	  "<li class='fengeshu'>|</li>"+
				       		 	  "<li><span style='font-weight:bold;'>"+result.workexpList[i].jobName+"</span></li>"+
				       		  "</ul>"+
				       		  "<ul>"+
				       		 	  "<li>单位性质：<span>"+result.workexpList[i].unitNature+"</span></li>"+
				       		 	  "<li class='fengeshu'>|</li>"+
				       		 	  "<li>单位行业：<span>"+result.workexpList[i].unitIndustry+"</span></li>"+
				       		 	  "<li class='fengeshu'>|</li>"+
				       		 	  "<li>单位规模：<span>"+result.workexpList[i].unitScale+"</span></li>"+
				       		  "</ul>"+
				       		  "<ul>"+
				       		 	  "<li>职位类型：<span>"+result.workexpList[i].jobType+"</span></li>"+
				       		 	  "<li class='fengeshu'>|</li>"+
				       		 	  "<li>待遇：<span>"+result.workexpList[i].salary+"</span></li>"+
				       		  "</ul>"+
				       		  "<ul>"+
				       		 	  "<li>工作/实习描述：<span>"+result.workexpList[i].jobDescription+"</span></li>"+
				       		  "</ul>"+
			       	   "</div>";
		}
		$("#gsjl").append(gsjlxinxi);
		
		//项目经验
		var xmjlxinxi="";
		for(var i=0;i<result.itemexpList.length;i++){
			xmjlxinxi += "<div class='xinxi' style='clear:both'>"+
				       		  "<ul>"+
				       		 	  "<li><span>"+result.itemexpList[i].start+"</span>至</li>"+
				       		 	  "<li><span>"+result.itemexpList[i].end+"</span>&nbsp;&nbsp;|&nbsp;&nbsp;</li>"+
				       			  "<li style='font-weight:bold;'><span>"+result.itemexpList[i].itemName+"</span></li>"+
				       		  "</ul>"+
				       		  "<ul>"+
				       		 	  "<li>详细描述：<span>"+result.itemexpList[i].description+"</span></li>"+
				       		  "</ul>"+
			       	   "</div>";
		}
		$("#xmjl").append(xmjlxinxi);
		
		//证书
		var zsxinxi="";
		for(var i=0;i<result.certificateList.length;i++){
			zsxinxi += "<div class='xinxi' style='clear:both'>"+
				       		  "<ul>"+
				       		 	  "<li><span>"+result.certificateList[i].time+"</span>获得</li>"+
				       			  "<li style='font-weight:bold;'><span>"+result.certificateList[i].name+"</span></li>"+
				       		  "</ul>"+
			       	   "</div>";
		}
		$("#zs").append(zsxinxi);
		
		//自我评价
		$("#zwpj").append("<div class='xinxi'>"+result.evaluation+"</div>");
		
		$("#customerName").val(result.customerName);
	},"json");
	var tabs = $('#tt').tabs().tabs('tabs');
	for(var i=0; i<tabs.length; i++){
		tabs[i].panel('options').tab.unbind().bind('mouseenter',{index:i},function(e){
			$('#tt').tabs('select', e.data.index);
		});
	}
});
</script>
<title>Insert title here</title>
</head>
<body>
<div id="tt" class="easyui-tabs" style="width:700px;height:auto">
	<div id="qzyx" title="求职意向" data-options="iconCls:'icon-search'" style="padding:10px"></div>
	<div id="jybj" title="教育背景 " data-options="iconCls:'icon-search'" style="padding:10px"></div>
	<div id="gsjl" title="工作/实习经历 " data-options="iconCls:'icon-search'" style="padding:10px"></div>
	<div id="xmjl" title="项目经历 " data-options="iconCls:'icon-search'" style="padding:10px"></div>
	<div id="zs" title="职称/技能/证书 " data-options="iconCls:'icon-search'" style="padding:10px"></div>
	<div id="zwpj" title="自我评价 " data-options="iconCls:'icon-search'" style="padding:10px"></div>
</div>
</body>
</html>