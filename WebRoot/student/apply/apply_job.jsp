<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/place.js"></script>
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
					        <a href="${pageContext.request.contextPath}/student/resume/resume_list.jsp"><li><p>简历管理</p></li></a>
					    </ul>
					</div>
					<div style="margin-top: 10px;"></div>
					<div class="container_nav">
					    <ul>
					        <h4>我的求职</h4>
					        <a href="${pageContext.request.contextPath}/student/apply/apply_inform.jsp"><li><p>应聘通知</p></li></a>
					        <a href="${pageContext.request.contextPath}/student/apply/apply_job.jsp"><li class="nav_active"><p>申请的职位</p></li></a>
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
				                <h4 style="float: none">申请的职位</h4>
				            </div>
				            <div class="main_list" class="container-fluid">
				                <div class="list_top">
				                    <div class="row">
									  <div class="col-md-2">职位名称</div>
									  <div class="col-md-2">单位名称</div>
									  <div class="col-md-2">相关简历</div>
									  <div class="col-md-3">申请时间</div>
									  <div class="col-md-2">单位反馈</div>
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
			</div>
		</div>
	</div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>

	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
	<script type="text/javascript">
	$(function(){
		applyJobList();
	})
	function applyJobList(){
		$.post("${pageContext.request.contextPath}/applyRecord/findByUserIdAndOther.do",
		{type:"isApply"},
		function(result){
			var result = eval("("+result+")");
			var context="";
			$(".list_context").empty();
			/* alert(result[0].attachResume); */
			for(var i=0;i<result.length;i++){
                  context += "<div class='list_content'>"+
                  				 "<div class='row'>"+
								 "<div class='col-md-2'><p style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;'>"+result[i].recruitInfo.name+"</p></div>"+
								 "<div class='col-md-2'><p style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;'>"+result[i].recruitInfo.user.trueName+"</p></div>"+
								 "<div class='col-md-2'><p style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;'>"+result[i].resume.resumeName+"</p></div>"+
								 "<div class='col-md-3'>"+result[i].applyTime+"</div>"+
								 "<div class='col-md-2'>"+result[i].applyState+"</div>"+
								 "<div class='col-md-1'><a href='javascript:deleteApplyRecord("+result[i].id+")'><span class='glyphicon glyphicon-trash'></span></a></div>"+
								 "</div>"+
			                 "</div>";
			}
			$(".list_context").append(context);
		});
	}
	function deleteApplyRecord(param){
		$.post("${pageContext.request.contextPath}/applyRecord/save.do",{id:param,isApply:0},function(result){
			layer.msg('成功删除', {icon: 6});
			applyJobList();
		});
	}
</script>
</body>
</html>