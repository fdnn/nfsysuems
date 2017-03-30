<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script> 

</head>
<body>
	<jsp:include page="../../common/top.jsp"></jsp:include>
	
	<div class="container">
	    <!-- 左侧 -->
		<div class="container_left left">
			<%-- <jsp:include page="../../common/left.jsp"></jsp:include> --%>
			<div class="container_nav">
			    <ul>
			        <h4>账号管理</h4>
			        <a href="${pageContext.request.contextPath}/company/account/basicinfo.jsp"><li ><p>基本资料</p></li></a>
			        <a href="${pageContext.request.contextPath}/company/account/security.jsp"><li><p>账号安全</p></li></a>
			        <a href="${pageContext.request.contextPath}/company/account/dynamic.jsp"><li><p>企业动态</p></li></a>
			        <a href="${pageContext.request.contextPath}/company/account/map.jsp"><li><p>地图标注</p></li></a>
			    </ul>
			</div>
			<div style="margin-top: 10px;"></div>
			<div class="container_nav">
			    <ul>
			        <h4>职位管理</h4>
			        <a href="${pageContext.request.contextPath}/company/jobmanager/job_list.jsp"><li class="nav_active"><p>管理职位</p></li></a>
			    </ul>
			</div>
			<div style="margin-top: 10px;"></div>
			<div class="container_nav">
			    <ul>
			        <h4>简历管理</h4>
			        <a href="${pageContext.request.contextPath}/company/apply/apply_inform.jsp"><li><p>面试邀请</p></li></a>
			        <a href="${pageContext.request.contextPath}/company/apply/apply_job.jsp"><li><p>收到的简历</p></li></a>
			        <a href="${pageContext.request.contextPath}/company/resumemanager/store_resume.jsp"><li><p>收藏的简历</p></li></a>
			    </ul>
			</div>
		</div>
	
		<!-- 右侧 -->
	    <div class="container_right right">
	        <div class="container_main">
	            <div class="main_name">
	                <h4 style="float: none">收藏的简历</h4>
	            </div>
	            <div class="main_list" class="container-fluid">
	                <div class="list_top">
	                    <div class="row">
						  <div class="col-md-2">职位名称</div>
						  <div class="col-md-2">单位名称</div>
						  <div class="col-md-2">月薪范围</div>
						  <div class="col-md-3">收藏时间</div>
						  <div class="col-md-2">申请</div>
						  <div class="col-md-1">删除</div>
						</div>
                	</div>
                	
	                <div class="list_context">
	                </div>
	                
	                <nav style="text-align: center">
		                <ul class="pagination">
		                    <li>
		                        <a href="#" aria-label="Previous">
		                            <span aria-hidden="true">&laquo;</span>
		                        </a>
		                    </li>
		                    <li><a href="#">1</a></li>
		                    <li>
		                        <a href="#" aria-label="Next">
		                            <span aria-hidden="true">&raquo;</span>
		                        </a>
		                    </li>
		                </ul>
		            </nav>
	            </div>
	        </div>
	    </div>
	</div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>

	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
	<script type="text/javascript">
	$(function(){
		storeJobList();
	})
	function storeJobList(){
		$.post("${pageContext.request.contextPath}/applyRecord/findByUserIdAndOther.do",
		{type:"isStore"},
		function(result){
			var result = eval("("+result+")");
			var context="";
			$(".list_context").empty();
			/* alert(result[0].attachResume); */
			for(var i=0;i<result.length;i++){
                  context += "<div class='list_content'>"+
                  				 "<div class='row'>"+
								 "<div class='col-md-2'>"+result[i].recruitInfo.name+"</div>"+
								 "<div class='col-md-2'>"+result[i].recruitInfo.user.trueName+"</div>"+
								 "<div class='col-md-2'>"+result[i].recruitInfo.salary+"</div>"+
								 "<div class='col-md-3'>"+result[i].storeTime+"</div>"+
								 "<div class='col-md-2'>";
					  if(result[i].isApply==1){
					  	context += "已申请";
					  }else{
					  	context += "<a href='javascript:isTrueApply("+result[i].id+")'>申请</a>";
					  }
					  context += "</div>"+
								 "<div class='col-md-1'><a href='javascript:deleteApplyRecord("+result[i].id+")'><span class='glyphicon glyphicon-trash'></span></a></div>"+
								 "</div>"+
			                 "</div>";
			}
			$(".list_context").append(context);
		});
	}
	function isTrueApply(param){
		$.post("${pageContext.request.contextPath}/applyRecord/save.do",{id:param,isApply:1},function(result){
			layer.msg('申请成功', {icon: 6});
			storeJobList();
		});
	}
	function deleteApplyRecord(param){
		$.post("${pageContext.request.contextPath}/applyRecord/save.do",{id:param,isStore:0},function(result){
			storeJobList();
		});
	}
</script>
</body>
</html>