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
					        <a href="${pageContext.request.contextPath}/company/account/dynamic.jsp"><li class="nav_active" ><p>企业动态</p></li></a>
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
					        <a href="${pageContext.request.contextPath}/company/resumemanager/inform_resume.jsp"><li><p>面试邀请</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/resumemanager/apply_resume.jsp"><li><p>收到的简历</p></li></a>
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
				            	<input hidden id="userId" value="${currentUser.id }" />
				                <h4 style="float: none">企业动态</h4>
				            </div>
				            <div class="main_list" class="container-fluid">
				            	<div class="list">
					                <div class="list_top">
					                    <div class="row">
										  <div class="col-md-2">新闻标题</div>
										  <div class="col-md-2">审核状态</div>
										  <div class="col-md-3">添加时间</div>
										  <div class="col-md-2">浏览次数</div>
										  <div class="col-md-1">查看</div>
										  <div class="col-md-1">修改</div>
										  <div class="col-md-1">删除</div>
										</div>
				                	</div>
					                <div class="list_context">
					                </div>
					                <input type="button" class="btn btn-primary" onclick="listToSingle(-1)" style="margin:10px;" value="添加" />
				                </div>
				                
				                <div class="preview" style="display:none">
				                	<div class="preview_head" style="border-bottom: 1px #5cb85c solid;margin-bottom:10px;padding-top:10px;">
				                		<h3 class="preview_title" style="text-align:center;padding:10px;"></h3>
				                		<div style="padding:0 5px 0;font-size:13px;">
				                			<span><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;时间：<span class="preview_time"></span></span>
				                			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                			<span><span class="glyphicon glyphicon-align-left"></span>&nbsp;&nbsp;阅读量：<b class="preview_browsingTimes"></b></span>
				                			<a href="javascript:returnList2()"><span class="right glyphicon glyphicon-share-alt">返回</span></a>
				                		</div>
				                	</div>
				                	<div style="padding:3px;" class="preview_content"></div>
				                </div>
				                
				                <div class="make_context" style="display:none">
				                	<form id="fm">
										<table style="margin: 10px 0;">
											<tr>
												<input hidden id="idr"/>
								                <th width="20%"><span style="color:red">*</span>新闻标题：</th>
								                <td width="50%">
						      						<input name="title" type="text" id="title" value="" onblur="">
								                <td width="30%"></td>
								            </tr>
								            <tr>
								                <th width="20%"><span style="color:red">*</span>新闻内容：</th>
								                <td width="50%">
						      						<textarea style="margin-top:3px;" name="content" cols="70" rows="6" id="content" maxlength="1000"></textarea>
							                	</td>
								                <td width="30%"></td>
								            </tr>
								            <tr>
								                <th width="20%"></th>
								                <td width="50%">
								                	<input style="margin:7px 7px 0 0;" type="button" id="save" onclick="saveDynamic()" class="btn btn-primary" value="保存" />
								                	<input style="margin:7px 7px 0 0;" type="button" onclick="returnList()" class="btn btn-default" value="返回" />
							                	</td>
								            </tr>
								        </table>
							        </form>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>

	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
	<script type="text/javascript">
	$(function(){
		dynamicList();
	})
	function dynamicList(){
		$.post("${pageContext.request.contextPath}/dynamic/findByUserId.do",
		{userId:$("#userId").val()},
		function(result){
			var result = eval("("+result+")");
			var context="";
			$(".list_context").empty();
			/* alert(result[0].attachResume); */
			for(var i=0;i<result.length;i++){
                  context += "<div class='list_content'>"+
                  				 "<div class='row'>"+
								 "<div class='col-md-2 title_"+result[i].id+"'>"+result[i].title+"</div>"+
								 "<input hidden class='content_"+result[i].id+"' value='"+result[i].content+"' />"+
								 "<div class='col-md-2'>"+result[i].state+"</div>"+
								 "<div class='col-md-3 time_"+result[i].id+"'>"+result[i].time+"</div>"+
								 "<div class='col-md-2 browsingTimes_"+result[i].id+"'>"+result[i].viewedNum+"</div>"+
								 "<div class='col-md-1'><a href='javascript:previewDynamic("+result[i].id+")'><span class='glyphicon glyphicon-search'></span></a></div>"+
								 "<div class='col-md-1'><a href='javascript:listToSingle("+result[i].id+")'><span class='glyphicon glyphicon-tags'></span></a></div>"+
								 "<div class='col-md-1'><a href='javascript:deleteDynamic("+result[i].id+")'><span class='glyphicon glyphicon-trash'></span></a></div>"+
								 "</div>"+
			                 "</div>";
			}
			$(".list_context").append(context);
		});
	}
	function deleteDynamic(param){
		$.post("${pageContext.request.contextPath}/dynamic/delete.do",{id:param},function(result){
			layer.msg('删除成功', {icon: 6});
			dynamicList();
		});
	}
	function saveDynamic(){
		if($("#title").val() == "" || 
				$("#content").val() == ""){
			layer.msg('必填（*）参数不能为空', {icon: 5});
		}else{
			$.post("${pageContext.request.contextPath}/dynamic/save.do",
					{id:$("#idr").val(),title:$("#title").val(),content:$("#content").val()},function(result){
					layer.msg('保存成功', {icon: 6});
			});	
		}
	}
	function returnList(){
		dynamicList();
		$(".make_context").css("display","none");	
		$(".list").css("display","block");
		$("#idr").val("");
		$("#title").val("");
		$("#content").val("");
	}
	function returnList2(){
		$(".preview").css("display","none");
		$(".list").css("display","block");
	}
	function listToSingle(param){
		$(".list").css("display","none");
		$(".make_context").css("display","block");
		if(param!="-1"){
			$("#idr").val(param);
			$("#title").val($(".title_"+param).text());
			$("#content").val($(".content_"+param).val());
		}
	}
	function previewDynamic(param){
		$(".list").css("display","none");
		$(".preview").css("display","block");
		$(".preview_title").text($(".title_"+param).text());
		$(".preview_time").text($(".time_"+param).text());
		$(".preview_browsingTimes").text($(".browsingTimes_"+param).text());
		$(".preview_content").text($(".content_"+param).val());
	}
</script>
</body>
</html>