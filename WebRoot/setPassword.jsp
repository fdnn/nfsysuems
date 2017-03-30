<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
<script type="text/javascript">
	function checkForm() {
		var password = $("#password").val();
		var repeat = $("#repeatPassword").val();
		if (password == null || password == "") {
			alert("密码不能为空！");
			return false;
		}
		if (repeat == null || repeat == "") {
			alert("重复密码不能为空！");
			return false;
		}
		if(password != repeat){
			alert("密码不一致！");
			return false;
		}
		$("#password").val(hex_md5(password));
		$("#repeatPassword").val(hex_md5(repeat));
		return true;
	}
	if ('${errorMsg}' != '') {
		alert('${errorMsg}');
	}
	function reLoade()
	{
		var imgVar = document.getElementById('img');
		imgVar.src=imgVar.src+'?';
	}
</script>
</head>
<body>
	<!-- 头部 -->
	<div class="head_nav">
	    <div class="container">
	        <div class="left l">
	            <a href="/" class="left" ><img src="${pageContext.request.contextPath}/static/images/logo1.png" width="60px;"></a>
	            <p class="left">毕业生就业跟踪管理平台</p>
	        </div>
	    </div>
	</div>
    
    <div class="container login_main" style="position: absolute;z-index: 10;width: 100%;">
    	<div class="container">
			<form id="login" method="post" onsubmit="return checkForm()"
				name="login" action="${pageContext.request.contextPath}/user/setPassword.do">
				<!-- 登录窗口 -->
				<div class="right login_form">
					<div class="identity_main">
						<ul>
							<a href="javascript:void()">
								<li style="width:100%" class="removeClass selected">设置登录密码</li>
							</a>
						</ul>
						<input id="role" type="hidden" name="role" value="0" />
					</div>
					
					<div class="submit_input">
						<ul>
							<li>
								<input name="password" placeholder="设置密码" type="password" size="32" id="password" />
							</li>
							<li>
								<input name="repeatPassword" placeholder="重复密码" type="password" size="32" id="repeatPassword" />
							</li>
							<li>
								<input type="submit" name="submit" value="设置" id="submit" />
							</li>
							<hr style="margin:17px 0;">
						</ul>
					</div>
				</div>
			</form>
		</div>
	</div>
	
    <div class="m_banner"></div>

    <div style="margin-top: 5px;"></div>

	<jsp:include page="common/footer.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
	<script src="${pageContext.request.contextPath}/static/js/md5.js"></script>
	<script type="text/javascript">
		if ('${errorInfo}' != '') {
			layer.msg('${errorInfo}');
		}
	</script>
</body>
</html>