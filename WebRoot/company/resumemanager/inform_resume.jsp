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
					        <a href="${pageContext.request.contextPath}/company/account/basicinfo.jsp"><li><p>基本资料</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/account/security.jsp"><li ><p>账号安全</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/account/dynamic.jsp"><li	 ><p>企业动态</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/account/map.jsp"><li ><p>地图标注</p></li></a>
					    </ul>
					</div>
					<div style="margin-top: 10px;"></div>
					<div class="container_nav">
					    <ul>
					        <h4>职位管理</h4>
					        <a href="${pageContext.request.contextPath}/company/jobmanager/job_list.jsp"><li><p>管理职位</p></li></a>
					    </ul>
					</div>
					<div style="margin-top: 10px;"></div>
					<div class="container_nav">
					    <ul>
					        <h4>简历管理</h4>
					        <a href="${pageContext.request.contextPath}/company/resumemanager/inform_resume.jsp"><li class="nav_active"><p>面试邀请</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/resumemanager/apply_resume.jsp" ><li ><p>收到的简历</p></li></a>
					        <%--<a href="${pageContext.request.contextPath}/company/resumemanager/store_resume.jsp"><li><p>收藏的简历</p></li></a>
					    --%></ul>
					</div>
            	</div>
           	</div>
           	<div class="col-md-9" style="padding-left: 0;">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                	<div>
						<div class="container_main">
						    <div class="main_name">
				                <h4 style="float: none">面试邀请</h4>
				            </div>
				            <div class="main_list" class="container-fluid">
				                <div class="list_top">
				                    <div class="row" style='margin-right:0'>
									  <div class="col-md-4">基本信息</div>
									  <div class="col-md-2">应聘职位</div>
									  <div class="col-md-2">邀请时间</div>
									  <div class="col-md-2">状态</div>
									  <div class="col-md-1">详情</div>
									  <div class="col-md-1">结束</div>
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
	<script src="http://malsup.github.io/jquery.form.js"></script>
	<script type="text/javascript">
	$(function(){
		informResumeList();
	})
	function informResumeList(){
		$.post("${pageContext.request.contextPath}/applyRecord/findByRecruitInfoIdIdAndOther.do",
		{type:"isInform"},
		function(result){
			var result = eval("("+result+")");
			var context="";
			$(".list_context").empty();
			/* alert(result[0].attachResume); */
			for(var i=0;i<result.length;i++){
                  context += "<div class='list_content' style='font-family:SimSun'>"+
                  				 "<div class='row inform_"+result[i].id+"' style='margin-right:0'>"+
                  				 "<div style='font-size:13px;text-align:left;font-family:SimSun' class='col-md-4'>"+
								 	"<div style='margin:0 0 0 10px;text-align:left;'><a style='color:#0180cf;font-family:SimSun' class='trueName'>"+result[i].user.trueName+"</a>"+
								 	" | "+"<a href='javascript:void(0)' class='resumeName'>"+result[i].resume.resumeName+"</a>"+"</div>"+
								 	"<p style='margin:0 0 0 10px;'>"+result[i].user.sex+" | "+
								 	result[i].user.origin+" | "+
								 	result[i].user.politics+
								 	"</p>"+
							 	 "</div>"+
							 	 "<div style='display:none' id='informTip_"+result[i].id+"'><div style='padding:5px;'>通知主题:"+result[i].informTopic+"<br>"+
							 	 "通知内容:"+result[i].informContent+
							 	 "</div></div>"+
								 "<div class='col-md-2' style='height:37px;line-height:37px;'><p class='recruitInfoName'>"+result[i].recruitInfo.name+"</p></div>"+
								 "<div class='col-md-2' style='height:37px;line-height:37px;'>"+result[i].interviewTime+"</div>"+
								 "<div class='col-md-2' style='height:37px;line-height:37px;'>"+result[i].informState+"</div>"+
								 "<div class='col-md-1' style='height:37px;line-height:37px;'><a id='xiangqing_"+result[i].id+"' href='javascript:xiangqing("+result[i].id+")'>详情</a></div>"+
	                  			 "<div class='col-md-1'><a href='javascript:deleteApplyRecord("+result[i].id+")'><span class='glyphicon glyphicon-trash' style='height:37px;line-height:37px;'></span></a></div>"+
								 "</div>"+
			                 "</div>";
			}
			$(".list_context").append(context);
		});
	}
	function deleteApplyRecord(param){
		$.post("${pageContext.request.contextPath}/applyRecord/save.do",{id:param,informState:"面试结束",isRefuse:1},function(result){
			informResumeList();
		});
	}
	function xiangqing(param){
		layer.tips($("#informTip_"+param).html(), '#xiangqing_'+param, {
			  tips: [1, '#3595CC'],
			  time: 0,
			  shade: [0],
			  shadeClose: true
			});
	}
</script>
</body>
</html>