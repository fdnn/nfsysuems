<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
<style type="text/css">
	.head_nav{
		position: relative;
	}
</style>
</head>
<body>
	<jsp:include page="../../common/top.jsp"></jsp:include>
	
	<div class="container container-fluid">
        <div class="row" style="margin-top:15px;">
            <div class="col-md-3">
            	<div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
            		<div class="container_nav">
					    <ul>
					        <h4>账号管理</h4>
					        <a href="${pageContext.request.contextPath}/student/account/basicinfo.jsp"><li><p>基本资料</p></li></a>
					        <a href="${pageContext.request.contextPath}/student/account/security.jsp"><li ><p>账号安全</p></li></a>
					    </ul>
					</div>
					<div style="margin-top: 10px;"></div>
					<div class="container_nav">
					    <ul>
					        <h4>我的简历</h4>
					        <a href="${pageContext.request.contextPath}/resume/save.do"><li><p>创建简历</p></li></a>
					        <a href="${pageContext.request.contextPath}/student/resume/resume_list.jsp"><li class="nav_active"><p>简历管理</p></li></a>
					    </ul>
					</div>
					<div style="margin-top: 10px;"></div>
					<div class="container_nav">
					    <ul>
					        <h4>我的求职</h4>
					        <a href="${pageContext.request.contextPath}/student/apply/apply_inform.jsp"><li><p>应聘通知</p></li></a>
					        <a href="${pageContext.request.contextPath}/student/apply/apply_job.jsp"><li><p>申请的职位</p></li></a>
					        <a href="${pageContext.request.contextPath}/student/apply/store_job.jsp"><li><p>收藏的职位</p></li></a>
					    </ul>
					</div>
            	</div>
           	</div>
           	<div class="col-md-9" style="padding-left: 0;">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                	<div>
						<div class="container_main">
						    <div class="main_name">
				                <h4 style="float: left">简历管理</h4>
				                &nbsp;&nbsp;&nbsp;
				                <span class="label label-warning">只允许创建5封简历</span>
			                    <input hidden id="outOfResumeNum" value="${outOfResumeNum }" />
				            </div>
				            <div class="main_list" class="container-fluid">
				                <div class="list_top">
				                    <div class="row">
									  <div class="col-md-5">简历名称</div>
									  <div class="col-md-4">修改日期</div>
									  <div class="col-md-1">修改</div>
									  <div class="col-md-1">预览</div>
									  <%--<div class="col-md-1">下载</div>
									  --%><div class="col-md-1">删除</div>
									</div>
			                	</div>
				                <div class="list_context">
				                </div>
				            </div>
				        </div>
			        </div>
		        </div>
	        </div>
	    </div>
	</div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>

	<%--<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>--%>
	<script type="text/javascript">
	$(function(){
		if($("#outOfResumeNum").val()==1){
			layer.msg('只允许创建5封简历', {icon: 5});
		}
		resumeList();
	})
	function resumeList(){
		$.post("${pageContext.request.contextPath}/resume/findByUserId.do",
		{},
		function(result){
			var result = eval("("+result+")");
			var context="";
			$(".list_context").empty();
			/* alert(result[0].attachResume); */
			for(var i=0;i<result.length;i++){
                  context += "<div class='list_content'>"+
                  				 "<div class='row'>"+
								 "<div class='col-md-5'>"+result[i].resumeName+"</div>"+
								 "<div class='col-md-4'>"+result[i].refreshDate+"</div>"+
								 "<div class='col-md-1'><form id='subform_"+result[i].id+"' action='${pageContext.request.contextPath}/resume/findByIdForward.do' method='post'><input hidden name='id' value='"+result[i].id+"'/><a href='javascript:void(0)' onclick='document.getElementById(\"subform_"+result[i].id+"\").submit();'><span class='glyphicon glyphicon-tag'></span></a></form></div>"+
								 "<div class='col-md-1'><a href='${pageContext.request.contextPath}/resume/detail.do?id="+result[i].id+"' target=_blank><span class='glyphicon glyphicon-eye-open'></span></a></div>"+
								 // "<div class='col-md-1'><a href='#'><span class='glyphicon glyphicon-download'></span></a></div>"+
								 "<div class='col-md-1'><a href='javascript:deleteResume("+result[i].id+")'><span class='glyphicon glyphicon-trash'></span></a></div>"+
								 "</div>"+
			                 "</div>";
			}
			$(".list_context").append(context);
		});
	}
	function deleteResume(param){
		layer.confirm('确定删除？', {
		  btn: ['删除','取消']
		}, function(){
		  $.post("${pageContext.request.contextPath}/resume/delete.do",{id:param},function(result){
		  	  resumeList();
		  });
		  layer.msg('删除成功', {icon: 1});
		}, function(){
		  return null;
		});
	}
</script>
</body>
</html>