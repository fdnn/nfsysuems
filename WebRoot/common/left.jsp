<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript">
$(function (){
	$(".container_nav ul li").click(function(){
    	$(this).addClass("nav_active").siblings().removeClass("nav_active");
	});
})
</script> -->
</head>
<body>
<div class="container_nav">
    <ul>
        <h4>账号管理</h4>
        <a href="${pageContext.request.contextPath}/student/account/basicinfo.jsp"><li class="nav_active"><p>基本资料</p></li></a>
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
        <a href="${pageContext.request.contextPath}/student/apply/store_job.jsp"><li><p>收藏的职位</p></li></a>
    </ul>
</div>
</body>
</html>