<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<script>
	function changeUserNameOrPassword(param){
		var name=null;
		var pass=null;
		if(param=="newUserName"){
			if($("#newUserName").val()==""){
				alert("请输入用户名！");
				return false;
			}
			name=$("#newUserName").val();
		}else{
			if($("#newPassword").val()!=$("#confirmPassword").val()){
				alert("2次密码输入不一致！");
				return false;
			}
			if($("#oldPassword").val()!=$("#pass").val()){
				alert("旧密码错误！");
				return false;
			}
			pass=$("#newPassword").val();
		}
		$.post("${pageContext.request.contextPath}/user/changeUserNameOrPassword.do",
		{id:$("#id").val(),newUserName:name,newPassword:pass},
		function(result){
			var result = eval("("+result+")");
			if(result.success){
				alert("修改成功");
			}else{ 
				alert("修改失败");
			}
			if(name!=null) $("#currentUser").html(name)
			$('#oldPassword').val('');
			$('#newPassword').val('');
			$('#confirmPassword').val('');
			
			$('#userNameModal').modal('hide');
			$('#userPasswordModal').modal('hide');
		});
	}
</script>
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
					        <a href="${pageContext.request.contextPath}/student/account/security.jsp"><li class="nav_active"><p>账号安全</p></li></a>
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
				                <h4>账号安全</h4>
				                <input id="id" name="id" hidden value="${currentUser.id }" />
				            </div>
				            <%--<div class="last_login" style="padding: 12px 0 0 13px;">
				                <h6 style="color: #666"><!-- 
				                    最后一次登录时间&nbsp;:&nbsp;2016-04-04 13:29
				                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
				                    登录IP&nbsp;:&nbsp;${remoteAddr }
				                </h6>
				            </div>
				            --%><%--<div class="security_01">
				                <div class="head">
				                    <h5 class="inline">用户名</h5>
				                    <h5 class="inline" style="padding-left: 70px;"><b id="currentUser">${currentUser.userName }</b></h5>
				                    <a href="#" class="right" data-toggle="modal" data-target="#userNameModal">修改</a>
				                </div>
				            </div>
				            --%><div class="security_02">
				                <div class="head">
				                    <h5 class="inline">登陆密码</h5>
				                    <h6 class="inline" style="padding-left: 57px;color:#666">互联网账号存在被盗风险，建议您定期更改密码以保护账户安全。</h6>
				                    <a href="#" class="right" data-toggle="modal" data-target="#userPasswordModal">修改</a>
				                </div>
				            </div>
			            </div>
		            </div>
	            </div>
            </div>
            
            <!--模态框-修改用户名-->
            <div class="modal fade" id="userNameModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="exampleModalLabel">修改用户名</h4>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group" align="center">
                                	<table align="center">
                                		<tr>
                                			<td style="">旧用户名:&nbsp;&nbsp;</td>
                                			<td><b>&nbsp;&nbsp;${currentUser.userName }</b></td>
                                		</tr>
                                		<tr>
                                			<td>新用户名:&nbsp;&nbsp;</td>
                                			<td><input name="newUserName" type="text" style="margin:10px 0" class="form-control" id="newUserName"></td>
                                		</tr>
                                	</table>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="changeUserNameOrPassword('newUserName')">保存</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--模态框-修改密码-->
            <div class="modal fade" id="userPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="exampleModalLabel">修改密码</h4>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group" align="center">
                                	<table align="center">
                                		<tr>
                                			<td style="">旧密码:&nbsp;&nbsp;</td>
                                			<td><input name="oldPassword" style="margin:3px 0" type="text" class="form-control" id="oldPassword"></td>
                                			<input name="pass" hidden id="pass" value="${currentUser.password }" />
                                		</tr>
                                		<tr>
                                			<td>新密码:&nbsp;&nbsp;</td>
                                			<td><input name="newPassword" style="margin:3px 0" type="text" class="form-control" id="newPassword"></td>
                                		</tr>
                                		<tr>
                                			<td>确认密码:&nbsp;&nbsp;</td>
                                			<td><input name="confirmPassword" style="margin:3px 0" type="text" class="form-control" id="confirmPassword"></td>
                                		</tr>
                                	</table>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="changeUserNameOrPassword('newPassword')">保存</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
</body>
</html>