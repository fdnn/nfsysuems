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
            <a class="active" href="${pageContext.request.contextPath}/foreground/company.jsp">名企荟萃</a>
            <a href="${pageContext.request.contextPath}/foreground/dynamic.jsp">企业新闻</a>
            <a href="${pageContext.request.contextPath}/foreground/notice.jsp">通知公告</a>
        </div>
    </div>

    <div style="margin-top: 5px;"></div>

	<div class="container">
        <div class="row" style="margin-top:15px;">
            <div class="col-md-8" style="padding-right: 0;">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                    <div class="recruit_title">
                        <%--<div class="right"><input type="button" class="btn btn-warning"
                                                  style="border: 1px solid #FB8300;background-color: #FF9900;" value="关注" style="padding:6px 20px; " /></div>
                        --%><h3 style="padding-bottom: 10px;">${user.trueName }</h3>
                        <a href="#" style="padding-bottom: 10px;font-size: 16px;color: #0074AA;"></a>
                    </div>
                    <hr>
                        <h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">企业介绍</h5>
                        <div style="padding: 15px 10px 0 10px;font:13px/24px 'simsun'">
                        	${user.introduction }
                        </div>
                    <hr>
                    <h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">招聘职位</h5>
                    <div class="recruit_content" style="margin:15px 0;">
                        <table class="table table-hover">
                            <thead>
                            <tr class="recruit_th">
                                <td width="20%">职业名称</td>
                                <td width="25%">公司名称</td>
                                <td width="20%">月薪范围</td>
                                <td width="20%">工作地区</td>
                                <td width="15%">更新时间</td>
                            </tr>
                            </thead>
                            <tbody class="list">
                            	<c:forEach items="${user.recruitInfoList }" var="recruitInfo">
	                                <tr>
	                                    <td><a href="${pageContext.request.contextPath}/recruitInfo/detail.do?id=${recruitInfo.id }">${recruitInfo.name }</a></td>
	                                    <td><a href='javascript:void()'>${user.trueName }</a></td>
	                                    <td>${recruitInfo.salary }</td>
	                                    <td>${recruitInfo.province }/${recruitInfo.city }</td>
	                                    <td><fmt:formatDate value='${recruitInfo.createDate }' pattern='YYYY-MM-dd'/></td>
	                                </tr>
	                        	</c:forEach>
                            </tbody>
                        </table>

                        <div align="center">
		                    <nav>
							  <ul class="pagination pagination-sm page">
							  	${pageCode }
							  </ul>
							</nav>
	                    </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                    <h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">基本信息</h5>
                    <div style="padding:5px;text-align:center;"></div>
                    <div class="companysimpleinfo">
                        <div class="infotxt">
                            <span class="left">行业：</span>
                            <div>${user.careerTwo.name }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">规模：</span>
                            <div>${user.scale }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">性质：</span>
                            <div>${user.nature }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">联系人：</span>
                            <div>${user.linkman }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">固定电话：</span>
                            <div>${user.tel }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">联系手机：</span>
                            <div>${user.phone }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">地址：</span>
                            <div>${user.address }</div>
                        </div>
                        <input id="lnglat" hidden value="${user.lnglat }" />
                        <iframe style="width: 100%;height: 300px;border:1px solid #e5e5e5;margin-top: 5px;" src="${pageContext.request.contextPath}/foreground/mapfull.jsp"></iframe>
                    </div>
                </div>
            </div>
        </div>
	</div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/date.format.js"></script>
	<script type="text/javascript">
		function page(url){
			$.post(url,{},
					function(result){
						var result = eval("("+result+")");
						$(".list").empty();
						$(".page").empty();
						var list="";
						var date = new Date();
						$.each(result.recruitInfoList,function(i,recruitInfo){
							date.setTime(recruitInfo.createDate.time);
			                list+=       
				                "<tr>"+
		                            "<td><a href='${pageContext.request.contextPath}/recruitInfo/detail.do?id="+recruitInfo.id+"'>"+recruitInfo.name+"</a></td>"+
		                            "<td><a href='javascript:void()'>${user.trueName }</a></td>"+
                            		"<td>"+recruitInfo.salary+"</td>"+
		                            "<td>"+recruitInfo.province+"/"+recruitInfo.city+"</td>"+
		                            "<td>"+date.format('YYYY-MM-dd')+"</td>"+
		                        "</tr>";
						});
						$(".list").append(list);
						$(".page").append(result.pageCode);
					});
		};
	</script>
</body>
</html>