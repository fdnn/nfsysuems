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
            <a class="active" href="${pageContext.request.contextPath}/foreground/index.jsp">首页</a>
            <a href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp">招聘信息</a>
            <a href="${pageContext.request.contextPath}/foreground/resume.jsp">求职信息</a>
            <a href="${pageContext.request.contextPath}/foreground/company.jsp">名企荟萃</a>
            <a href="${pageContext.request.contextPath}/foreground/dynamic.jsp">企业新闻</a>
            <a href="${pageContext.request.contextPath}/foreground/notice.jsp">通知公告</a>
        </div>
    </div>

    <div style="margin-top: 5px;"></div>

	<div class="container">
        <div class="row index" style="margin-top: 15px;">
            <div class="col-md-12">
           		<div class="index_career" style="overflow: hidden;">
           			<p class="m_title">
                        <a style="border-left: 2px #6cbd45 solid;" href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp">最新招聘</a>
                        <span>
                            <a href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp">
                                <i></i>
                                <i></i>
                                <i></i>
                            </a>
                        </span>
                    </p>
                    <div class="listbody">
                    	<div class="careerTwoTag" style="padding: 0px 15px;">
                   			<span class="label label-info"><a href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp?time=3">三天内</a></span>
                   			<span class="label label-info"><a href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp?time=7">一周内</a></span>
                   			<span class="label label-info"><a href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp?time=30">一个月内</a></span>
                    	</div>
           				<c:forEach items="${newRecruitInfoList }" var="recruitInfo" >
	                    	<div class="career" style="width: 33.333%;float: left;padding: 0px 15px;margin-bottom: 7px;">
		                        <ul style="display: block;">
	                        		<li class="m_li">
	                                    <i>›</i>
		                                <a href="${pageContext.request.contextPath}/user/detail.do?userId=${recruitInfo.user.id }" target="_blank">${recruitInfo.user.trueName }</a>
		                                <span>[<fmt:formatDate value='${recruitInfo.createDate }' pattern='MM-dd'/>]</span>
		                            </li>
		                            <li class="m_li m_li2">
	                                    <a href="${pageContext.request.contextPath}/recruitInfo/detail.do?id=${recruitInfo.id }" target="_blank">${recruitInfo.name }</a>
		                            </li>
		                        </ul>
	                        </div>
           				</c:forEach>
                    </div>
           		</div>
            	
            	<c:forEach items="${careerOneList }" var="careerOne" varStatus="idx">
                	<div class="index_career" style="overflow: hidden;">
	                    <p class="m_title">
	                        <a style="border-left: 2px #6cbd45 solid;" href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp?careerOne=${careerOne.id }">${careerOne.name }</a>
	                        <span>
	                            <a href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp?careerOne=${careerOne.id }">
	                                <i></i>
	                                <i></i>
	                                <i></i>
	                            </a>
	                        </span>
	                    </p>
                    	<div class="listbody">
	                    	<div class="careerTwoTag" style="padding: 0px 15px;">
	                    		<c:forEach items="${careerOne.careerTwoList }" var="careerTwo" >
	                    			<span class="label label-info"><a href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp?careerTwo=${careerTwo.id }">${careerTwo.name }</a></span>
	                    		</c:forEach>
	                    	</div>
	                    	<c:forEach items="${rilList }" var="recruitInfoList" begin="${idx.index }" end="${idx.index }">
	                     		<c:forEach items="${recruitInfoList }" var="recruitInfo">
		                     		<div class="career" style="width: 33.333%;float: left;padding: 0px 15px;margin-bottom: 7px;">
				                        <ul style="display: block;">
			                        		<li class="m_li">
	                                    <i>›</i>
		                                <a href="${pageContext.request.contextPath}/user/detail.do?userId=${recruitInfo.user.id }" target="_blank">${recruitInfo.user.trueName }</a>
		                                <span>[<fmt:formatDate value='${recruitInfo.createDate }' pattern='MM-dd'/>]</span>
		                            </li>
		                            <li class="m_li m_li2">
	                                    <a href="${pageContext.request.contextPath}/recruitInfo/detail.do?id=${recruitInfo.id }" target="_blank">${recruitInfo.name }</a>
		                            </li>
				                        </ul>
			                        </div>
	                        	</c:forEach>
	                        </c:forEach>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
            <%--<div class="col-md-6" style="padding-left: 0;">
                <div>
                    <p class="m_title">
                        <a href="${pageContext.request.contextPath}/foreground/notice.jsp">通知公告</a>

                        <span>
                            <a href="${pageContext.request.contextPath}/foreground/notice.jsp">
                                <i></i>
                                <i></i>
                                <i></i>
                            </a>
                        </span>
                    </p>
                    <div>
                        <ul style="display: block;">
                            <c:forEach items="${noticeListIndex }" var="notice">
                        		<li class="m_li">
	                                <p class="m_time">
	                                    <a href="${pageContext.request.contextPath}/notice/detail.do?id=${notice.id }">
	                                        <i>›</i>
	                                        <span><fmt:formatDate value='${notice.createTime }' pattern='MM-dd'/></span>
	                                    </a>
	                                </p>
	                                <p class="m_content">
	                                    <a href="${pageContext.request.contextPath}/notice/detail.do?id=${notice.id }">${notice.title }</a>
	                                </p>
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                    
                    <div style="margin-top:20px;"></div>
                    
                    <p class="m_title">
                        <a href="${pageContext.request.contextPath}/foreground/dynamic.jsp">企业新闻</a>
                        <span>
                            <a href="${pageContext.request.contextPath}/foreground/dynamic.jsp">
                                <i></i>
                                <i></i>
                                <i></i>
                            </a>
                        </span>
                    </p>
                    <div>
                        <ul style="display: block;">
                            <c:forEach items="${dynamicListIndex }" var="dynamic">
                        		<li class="m_li">
	                                <p class="m_time">
	                                    <a href="${pageContext.request.contextPath}/dynamic/detail.do?id=${dynamic.id }">
	                                        <i>›</i>
	                                        <span><fmt:formatDate value='${dynamic.time }' pattern='MM-dd'/></span>
	                                    </a>
	                                </p>
	                                <p class="m_content">
	                                    <a href="${pageContext.request.contextPath}/dynamic/detail.do?id=${dynamic.id }">${dynamic.title }</a>
	                                </p>
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        --%></div>
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
</body>
</html>