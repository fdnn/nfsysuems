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
					        <a href="${pageContext.request.contextPath}/student/apply/apply_job.jsp"><li><p>申请的职位</p></li></a>
					        <a href="${pageContext.request.contextPath}/student/apply/store_job.jsp"><li class="nav_active"><p>收藏的职位</p></li></a>
					    </ul>
					</div>
            	</div>
           	</div>
           	<div class="col-md-9" style="padding-left: 0;">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                	<div>
						<div class="container_main">
						    <div class="main_name">
				                <h4 style="float: none">收藏的职位</h4>
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
			</div>
		</div>
	</div>
	
	<%--选择简历--%>
	<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" style="width: 300px;" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="exampleModalLabel">申请职位</h4>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group" align="center">
                                	<table align="center">
                                		<tr>
                                			<td style="">投递的简历:&nbsp;&nbsp;</td>
                                			<td>
                                				<select id="applySelect">
													
												</select>
											</td>
                                		</tr>
                                	</table>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="applyCareer()">保存</button>
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
								 "<div class='col-md-2'><p style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;'>"+result[i].recruitInfo.name+"</p></div>"+
								 "<div class='col-md-2'><p style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;'>"+result[i].recruitInfo.user.trueName+"</p></div>"+
								 "<div class='col-md-2'><p style='overflow: hidden;text-overflow: ellipsis;white-space: nowrap;'>"+result[i].recruitInfo.salary+"</p></div>"+
								 "<div class='col-md-3'>"+result[i].storeTime+"</div>"+
								 "<div class='col-md-2'>";
					  if(result[i].isApply==1){
					  	context += "<a href='#'>已申请</a>";
					  }else{
					  	context += "<a onclick='apply("+result[i].id+")' >申请</a>";
					  }
					  context += "</div>"+
								 "<div class='col-md-1'><a href='javascript:deleteApplyRecord("+result[i].id+")'><span class='glyphicon glyphicon-trash'></span></a></div>"+
								 "</div>"+
			                 "</div>";
			}
			$(".list_context").append(context);
		});
	}
	function isTrueApply(param,is){
		$.post("${pageContext.request.contextPath}/applyRecord/save.do",{id:param,isApply:is},function(result){
			if(is==1){
				layer.msg('申请成功', {icon: 6});
			}else{
				layer.msg('取消成功', {icon: 6});
			}
			storeJobList();
		});
	}
	function deleteApplyRecord(param){
		$.post("${pageContext.request.contextPath}/applyRecord/save.do",{id:param,isStore:0},function(result){
			layer.msg('成功删除', {icon: 6});
			storeJobList();
		});
	}
	function apply(param){
		$.post("${pageContext.request.contextPath}/resume/findByUserId.do",
		{},
		function(result){
			var result = eval("("+result+")");
			var context="";
			$("#applySelect").empty();
			for(var i=0;i<result.length;i++){
                  context += "<option value='"+result[i].id+"'>"+result[i].resumeName+
			                 "</option>";
			}
			if(result.length==0){
				layer.msg('您还未创建简历', {icon: 5});
			}else{
				$('#applyModal').modal('show');
				$("#applySelect").append(context);
				$("#applySelect").append("<input hidden id='clickCareer' value='"+param+"' />");
			}
		});
	}
	function applyCareer(){
		$.post("${pageContext.request.contextPath}/applyRecord/save.do",{id:$("#clickCareer").val(),resumeId:$("#applySelect").val(),methor:1},function(result){
			$('#applyModal').modal('hide');
			layer.msg('职位申请成功，请静候佳音！', {icon: 6});
			storeJobList();
			
		});
	}
</script>
</body>
</html>