<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bindSuccess.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div class="msg" style="text-align: center;width:50%;margin:auto;margin-top:200px">
    	<div>
            <img src="${pageContext.request.contextPath}/static/images/convert.png" >
    	</div>
    	<div style="border:1px #000 solid;">
			<p>恭喜：绑定教务系统账号成功！</p>
			<p>请稍等，正在进入登录页面...</p>
			<script type="text/javascript">
				setTimeout("location.href='login.jsp'", 3000);
			</script>
		</div>
	</div>
  </body>
</html>
