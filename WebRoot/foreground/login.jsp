<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<script type="text/javascript">
	function checkForm() {
		var userName = $("#userName").val();
		var password = $("#password").val();
		if (userName == null || userName == "") {
			alert("用户名不能为空！");
			return false;
		}
		if (password == null || password == "") {
			alert("密码不能为空！");
			return false;
		}
		return true;
	}
	function select(obj) {
		$(".removeClass").removeClass("selected");
		$("#" + obj.id).children("li").addClass("selected");
		$("#role").attr("value", $("#" + obj.id).children("li").attr("value"));
	}
	if ('${errorMsg}' != '') {
		alert('${errorMsg}');
	}
</script>
</head>
<body>
	<!-- 头部 -->
    <div class="head_nav">
        <div class="container">
            <div class="left l">
                <a href="/" class="left" ><img src="${pageContext.request.contextPath}/images/logo1.png" width="60px;"></a>
                <p class="left">毕业生就业跟踪管理平台</p>
            </div>
            
            <!-- 中间_登陆主体  -->
			<div class="container login_main">
				<form id="login" method="post" onsubmit="return checkForm()"
					name="login" action="${pageContext.request.contextPath}/user/login.do">
					<!-- 登录窗口 -->
					<div class="right login_form">
						<div class="identity_main">
							<ul>
								<a href="javascript:void()" id="student" onclick="select(this)">
									<li value="0" class="removeClass selected">学生</li>
								</a>
								<a href="javascript:void()" id="company" onclick="select(this)">
									<li value="1" class="removeClass">企业</li>
								</a>
								<a href="javascript:void()" id="manager" onclick="select(this)">
									<li value="2" class="removeClass">管理员</li>
								</a>
							</ul>
							<input id="role" type="hidden" name="role" value="0" />
						</div>
						
						<div class="submit_input">
							<ul>
								<li>
									<input name="userName" placeholder="请输入用户名" type="text" size="32" maxlength="40" id="userName" />
								</li>
								<li>
									<input name="password" placeholder="请输入密码" type="password" size="32" id="password" />
								</li>
								<li>
									<input type="submit" name="submit" value="立即登录" id="submit" />
								</li>
								<hr style="margin:17px 0;">
								<div class="otherLogin">
									<p>使用合作账号登录</p>
									<a style="line-height: 10px" href="javascript:void()" title="使用QQ号登录"> 
										<img src="${pageContext.request.contextPath}/images/qq_login2.png">
									</a>
								</div>
							</ul>
						</div>
					</div>
				</form>
			</div>
        </div>
    </div>

    <div class="m_banner"></div>


    <div style="margin-top: 5px;"></div>

	<jsp:include page="common/footer.jsp"></jsp:include>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script> -->
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>