<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function logout(){
		if(confirm('您确定要退出系统吗？')){
			window.location.href="${pageContext.request.contextPath}/user/logout.do";
		}
	}
	function login(){
		window.location.href="${pageContext.request.contextPath}/login.jsp";
	}
	function houtai(){
		if($("#role").val()==0){
			window.location.href="${pageContext.request.contextPath}/student/account/basicinfo.jsp";
		}
		if($("#role").val()==1){
			window.location.href="${pageContext.request.contextPath}/company/account/basicinfo.jsp";
		}
		if($("#role").val()==2){
			window.location.href="${pageContext.request.contextPath}/manager/main.jsp";
		}
	}
</script>
</head>
<body>
<!-- 头部 -->
<div class="head_nav">
    <div class="container">
        <div class="left l">
            <a href="${pageContext.request.contextPath}/foreground/index.jsp" class="left" ><img src="${pageContext.request.contextPath}/static/images/logo1.png" width="60px;"></a>
            <p class="left">毕业生就业跟踪管理平台</p>
        </div>
        <div class="right r">
        	<c:choose>
        		<c:when test="${not empty currentUser }">
        			<span><a href="javascript:houtai()">您好，${currentUser.trueName }</a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <span><a href="javascript:logout()">退出登录</a></span>
		            <input name="id" id="id" hidden value="${currentUser.id }" />
        			<input name="role" id="role" hidden value="${currentUser.role }" />
        		</c:when>
        		<c:otherwise>
        			<span><a href="javascript:login()">登录</a></span>
        		</c:otherwise>
        	</c:choose>
        </div>
    </div>
</div>

</body>
</html>