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
    <div style="margin-top: 20px;"></div>

	<div class="container" style="width: 760px;">
        <div class="row" style="margin:15px 0 30px;">
            <div class="col-md-12 resumedetail">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                    <div class="recruit_title">
                        <h3>${resume.resumeName }</h3>
                        <div style="margin-top: 13px;">
                        	<%--<c:forTokens  items="${resume.welfare }" var="welfare" delims=",">
                        		<span class="label label-info">${welfare }</span>
                        	</c:forTokens >
                        --%></div>
                    </div>
                    <hr>
                        <h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">基本信息（${resume.user.trueName }）</h5>
                        <div style="padding: 15px 10px 0 10px;font:13px/24px 'simsun';overflow: hidden;">
				       		<div style="float:left">
	                        	<ul>
					       			<li><span>电话：${resume.user.phone }</span></li>
					       			<li class="fengeshu">|</li>
					       			<li><span>邮箱：${resume.user.email }</span></li>
					       			<li class="fengeshu">|</li>
					       			<li><span>QQ：${resume.user.qq }</span></li>
					       		</ul>
					       		<ul>
					       			<li><span>出生年份：<fmt:formatDate value='${resume.user.birthday}' pattern='yyyy'/></span></li>
					       			<li class="fengeshu">|</li>
					       			<li><span>毕业年份：<fmt:formatDate value='${resume.user.graduationYear}' pattern='yyyy'/></span></li>
					       		</ul>
					       		<ul>
					       			<li><span>${resume.user.sex }</span></li>
					       			<li class="fengeshu">|</li>
					       			<li><span>${resume.user.major.dep.name }</span></li>
					       			<li class="fengeshu">|</li>
					       			<li><span>${resume.user.major.name }</span></li>
					       		</ul>
					       		<ul>
					       			<li><span>现居住地：${resume.user.address }</span></li>
					       		</ul>
				       		</div>
	                        <div class="pic" style="float:right;margin-right:20px;">
					       		<c:choose>
			                       	<c:when test="${resume.user.pic != null}">
			                       		<img src="${pageContext.request.contextPath}/userImages/touxiang/${resume.user.pic}" width="100px;">
			                       	</c:when>
			                       	<c:otherwise>
			                            <img src="${pageContext.request.contextPath}/static/images/touxiang.jpg" width="100px;">
			                       	</c:otherwise>
			                    </c:choose>
					       	</div>
                        </div>
                    <hr>
                    	<h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">求职意向</h5>
                        <div style="padding: 15px 10px 0 10px;font:13px/24px 'simsun';overflow: hidden;">
				       		<div style="float:left">
	                        	<ul>
					       			<li><span>期望职位：${resume.careerThree.name }</span></li>
					       		</ul>
					       		<ul>
					       			<li><span>期望月薪：${resume.salary }</span></li>
					       		</ul>
					       		<ul>
					       			<li><span>期望工作地点：${resume.province }/${resume.city }</span></li>
					       		</ul>
				       		</div>
                        </div>
                    <hr>
                    	<h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">教育背景</h5>
                        <div style="padding: 15px 10px 0 10px;font:13px/24px 'simsun';overflow: hidden;">
				       		<c:forEach var="education" items="${resume.educationList }">
				       			<ul>
				       		 	  <li><span><fmt:formatDate value='${education.start }' pattern='YYYY-MM'/></span>至</li>
				       		 	  <li><span><fmt:formatDate value='${education.end }' pattern='YYYY-MM'/></span></li>
				       		 	  <li class='fengeshu'>|</li>
				       			  <li style='font-weight:bold;'><span>${education.school }</span></li>
				       		 	  <li class='fengeshu'>|</li>
				       			  <li style='font-weight:bold;'><span>${education.degree }</span></li>
				       		 	  <li class='fengeshu'>|</li>
				       			  <li style='font-weight:bold;'><span>${education.major }</span></li>
			       			  </ul>
				       		</c:forEach>
                        </div>
                    <hr>
                    	<h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">工作/实习经历</h5>
                        <div style="padding: 15px 10px 0 10px;font:13px/24px 'simsun';overflow: hidden;">
			       			<c:forEach var="workexp" items="${resume.workexpList }">
				       			<div class="rxinxi">
					       			<ul style='font-weight:bold;'>
					       		 	  <li><span><fmt:formatDate value='${workexp.start }' pattern='YYYY-MM'/></span>至</li>
					       		 	  <li><span><fmt:formatDate value='${workexp.end }' pattern='YYYY-MM'/></span></li>
					       		 	  <li class='fengeshu'>|</li>
					       			  <li style='font-weight:bold;'><span>${workexp.unitName }</span></li>
					       		 	  <li class='fengeshu'>|</li>
					       			  <li style='font-weight:bold;'><span>${workexp.jobDept }</span></li>
					       		 	  <li class='fengeshu'>|</li>
					       			  <li style='font-weight:bold;'><span>${workexp.jobName }</span></li>
				       			  </ul>
				       			  <ul>
				       			  	<li>单位性质：<span>${workexp.unitNature }</span></li>
					       		 	<li class='fengeshu'>|</li>
					       		 	<li>单位行业：<span>${workexp.unitIndustry }</span></li>
					       		 	<li class='fengeshu'>|</li>
					       		 	<li>单位规模：<span>${workexp.unitScale }</span></li>
				       			  </ul>
				       			  <ul>
				       			  	<li>职位类型：<span>${workexp.jobType }</span></li>
					       		 	<li class='fengeshu'>|</li>
					       		 	<li>待遇：<span>${workexp.salary }</span></li>
				       			  </ul>
				       			  <ul>
				       			  	<li>工作/实习描述：<span>${workexp.jobDescription }</span></li>
				       			  </ul>
			       			  </div>
				       		</c:forEach>
                        </div>
                    <hr>
                    	<h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">项目经历 </h5>
                        <div style="padding: 15px 10px 0 10px;font:13px/24px 'simsun';overflow: hidden;">
				       		<c:forEach var="itemexp" items="${resume.itemexpList }">
				       			<div class="rxinxi">
					       			<ul style='font-weight:bold;'>
					       		 	  <li><span><fmt:formatDate value='${itemexp.start }' pattern='YYYY-MM'/></span>至</li>
					       		 	  <li><span><fmt:formatDate value='${itemexp.end }' pattern='YYYY-MM'/></span></li>
							       	  <li style='font-weight:bold;'><span>&nbsp;&nbsp;&nbsp;${itemexp.itemName }</span></li>
				       			  </ul>
					       		  <ul>
					       		 	  <li>详细描述：<span>${itemexp.description }</span></li>
					       		  </ul>
			       			  </div>
				       		</c:forEach>
                        </div>
                   	<hr>
                   		<h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">职称/技能/证书</h5>
                        <div style="padding: 15px 10px 0 10px;font:13px/24px 'simsun';overflow: hidden;">
                    		<c:forEach var="certificate" items="${resume.certificateList }">
				       			<ul>
							    	<li><span><fmt:formatDate value='${certificate.time }' pattern='YYYY-MM-dd'/></span>获得</li>
							    	<li style='font-weight:bold;'>${certificate.name }<span></span></li>
							    </ul>
				       		</c:forEach>
                        </div>	
                    <hr>
                    	<h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">自我评价</h5>
                        <div style="padding: 15px 10px 0 10px;font:13px/24px 'simsun';overflow: hidden;">
				       		${resume.evaluation }
                        </div>
                </div>
            </div>
        </div>
	</div>
	
	<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
</body>
</html>