<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
</head>
<body>
    
	<jsp:include page="../common/top.jsp"></jsp:include>

    <div class="m_banner"></div>

    <div class="m_tab">
        <div class="container">
            <a href="${pageContext.request.contextPath}/foreground/index.jsp">首页</a>
            <a href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp">招聘信息</a>
            <a href="${pageContext.request.contextPath}/foreground/resume.jsp">求职信息</a>
            <a href="${pageContext.request.contextPath}/foreground/company.jsp">名企荟萃</a>
            <a class="active" href="${pageContext.request.contextPath}/foreground/dynamic.jsp">企业新闻</a>
            <a href="${pageContext.request.contextPath}/foreground/notice.jsp">通知公告</a>
        </div>
    </div>

    <div style="margin-top: 5px;"></div>

	<div class="container">
        <div class="row" style="margin-top:15px;">
            <div class="col-md-3" style="padding-right: 0;">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                    <p><a href="${pageContext.request.contextPath}/foreground/notice.jsp" style="font-size: 16px;border-left: 3px solid #3d9ccc;padding-left: 7px">通知公告</a></p>
                    <p style="margin-top:5px;"><a href="${pageContext.request.contextPath}/foreground/dynamic.jsp" style="font-size: 16px;border-left: 3px solid #3d9ccc;padding-left: 7px;color:#0074AA">企业新闻</a></p>
                </div>
            </div>
            <div class="col-md-9">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                    <div class="gonggaotitle" style="font-size: 17px;border-bottom: 1px solid #ccc;padding-bottom: 10px;padding-left:20px;">企业新闻</div>
                    <div class="detail">
                        <h3 class="detail_title">${dynamic.title }</h3>
                        <p class="detail_time"> 
                        	来源：<span>${dynamic.user.trueName }</span>
                			发布时间：<span><fmt:formatDate value='${dynamic.time }' pattern='YYYY-MM-dd'/></span>
                			人气：<span>${dynamic.viewedNum }</span>
                      	</p>
                        <div class="detail_content">
                            <span>${dynamic.content }</span>
                        </div>
                        <hr>
                        <div class="detail_page">
	                        ${pageCode }
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
</body>
</html>