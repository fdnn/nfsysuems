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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/zyzn/zyzn_1.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/load_hycode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/hgz_hycode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/hgz_zncode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/place.js"></script>
</head>
<!-- 通过body的onload事件调用js里面的initialize()方法来初始化省市级联下拉框 -->
<body onload="javascript:initialize();">

    <jsp:include page="../common/top.jsp"></jsp:include>

    <div class="m_banner"></div>

    <div class="m_tab">
        <div class="container">
            <a href="${pageContext.request.contextPath}/foreground/index.jsp">首页</a>
            <a class="active" href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp">招聘信息</a>
            <a href="${pageContext.request.contextPath}/foreground/resume.jsp">求职信息</a>
            <a href="${pageContext.request.contextPath}/foreground/company.jsp">名企荟萃</a>
            <a href="${pageContext.request.contextPath}/foreground/dynamic.jsp">企业新闻</a>
            <a href="${pageContext.request.contextPath}/foreground/notice.jsp">通知公告</a>
        </div>
    </div>

    <div style="margin-top: 5px;"></div>

	<div class="container container-fluid">
        <div class="row" style="margin-top:15px;">
            <div class="col-md-9">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                    <div class="select_title">
                        <h4 style="padding-bottom: 10px;"><a>职位搜索</a></h4>
                        <div class="recruit_select">
                            <ul>
                                <li>
                                    <p class="left">行业类别：&nbsp;&nbsp;</p>
                                    <input class="left nation" placeholder="请选择行业" type="text" size="30" value="" data-value="" onkeydown="if(event.keyCode==13) search()" onclick="appendhybar(this,'danxuan')" />
                                    <p class="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;职业类别：&nbsp;&nbsp;</p>
                                    <input class="nation" placeholder="请选择类别" type="text" size="30" value="" data-value="" onkeydown="if(event.keyCode==13) search()" onclick="appendhyznbar(this,'danxuan')" />
                                </li>
                                <li>
                                    <p class="left">工作地区：&nbsp;&nbsp;</p>
                                    <div class="left">
                                        <select style="width:100px;height: 25px;" id="province" onchange="javascript:selectchange(province,city);"></select>
                                        <select style="width:100px;height: 25px;" id="city"></select>
                                    </div>
                                    <p class="left" style="margin-left: 28px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间：&nbsp;&nbsp;</p>
                                    <div class="selecttime">
                                        <span class="shuxian"></span>
                                        <a id="firstchild" href="javascript:void()" class="chooseon"><input hidden value="" />全部</a>
                                        <span class="shuxian"></span>
                                        <a href="javascript:void()"><input hidden value="3" />三天内</a>
                                        <span class="shuxian"></span>
                                        <a href="javascript:void()"><input hidden value="7" />一周内</a>
                                        <span class="shuxian"></span>
                                        <a href="javascript:void()"><input hidden value="30" />一个月内</a>
                                        <input id="selecttimeInput" hidden value="" />
                                    </div>
                                </li>
                                <li>
                                    <p class="left" style="padding-left: 5px;">关 键 词 ：&nbsp;&nbsp;</p>
                                    <input id="name" placeholder="请输入职位名称" type="text" size="43" value="" />
                                    <input type="button" class="btn-primary" style="border:0;padding-left:20px;padding-right:20px;" onclick="search()" value="搜索" />
                                    <input type="button" class="btn-warning" style="border:0;padding-left:20px;padding-right:20px;" onclick="resetSearch()" value="清空" />
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="recruit_content">
                        <table class="table table-hover">
                            <thead>
                                <tr class="recruit_th">
                                        <td width="20%">职业名称</td>
                                        <td width="25%">公司名称</td>
                                        <td width="20%">月薪范围</td>
                                        <td width="20%">工作地区</td>
                                        <td width="15%">发布时间</td>
                                </tr>
                            </thead>
                            <tbody class="list">
                            	<%--<c:forEach items="${recruitInfoList }" var="recruitInfo">
	                                <tr>
	                                    <td><a href="${pageContext.request.contextPath}/recruitInfo/detail.do?id=${recruitInfo.id }">${recruitInfo.name }</a></td>
	                                    <td><a href="${pageContext.request.contextPath}/user/detail.do?userId=${recruitInfo.user.id }">${recruitInfo.user.trueName }</a></td>
	                                    <td>${recruitInfo.salary }</td>
	                                    <td>${recruitInfo.province }/${recruitInfo.city }</td>
	                                    <td><fmt:formatDate value='${recruitInfo.createDate }' pattern='YYYY-MM-dd'/></td>
	                                </tr>
	                        	</c:forEach>--%>
                        	</tbody>
                        </table>

                        <div align="center">
		                    <nav>
							  <ul class="pagination pagination-sm page">
							  <%-- ${pageCode } --%>
							  </ul>
							</nav>
	                    </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3" style="padding-left: 0;">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                    <div class="col3div">
                        <p class="m_title">
                            <i></i>
                            <a href="${pageContext.request.contextPath}/foreground/notice.jsp">通知公告</a>
                            <span>
                                <a href="#" style="font-size: 10px;">
                                    <i></i>
                                    <i></i>
                                    <i></i>
                                </a>
                            </span>
                        </p>
                        <div class="norightborder">
                            <ul style="display: block;">
                                <c:forEach items="${noticeListIndex }" var="notice">
	                        		<li class="m_li">
		                                <p class="m_time">
	                                        <a href="#">
	                                            <i>›</i>
	                                        </a>
	                                    </p>
		                                <p class="m_content2">
		                                    <a href="${pageContext.request.contextPath}/notice/detail.do?id=${notice.id }">${notice.title }</a>
		                                </p>
		                            </li>
	                        	</c:forEach>
                            </ul>
                        </div>
                    </div>

                    <hr style="margin:10px 0">

                    <div class="col3div">
                        <p class="m_title">
                            <i></i>
                            <a href="${pageContext.request.contextPath}/foreground/dynamic.jsp">企业新闻</a>
                            <span>
                                <a href="#" style="font-size: 10px;">
                                    <i></i>
                                    <i></i>
                                    <i></i>
                                </a>
                            </span>
                        </p>
                        <div class="norightborder">
                            <ul style="display: block;">
                                <c:forEach items="${dynamicListIndex }" var="dynamic">
	                        		<li class="m_li">
		                                <p class="m_time">
		                                    <a href="#">
                                            <i>›</i>
                                        </a>
		                                </p>
		                                <p class="m_content2">
		                                    <a href="${pageContext.request.contextPath}/dynamic/detail.do?id=${dynamic.id }">${dynamic.title }</a>
		                                </p>
		                            </li>
	                        	</c:forEach>
                            </ul>
                        </div>
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
		function search(){
			var param = "";
			if(typeof($(datainput).data("value"))!="undefined"){
				param += "hy="+$(datainput).data("value")+"&";
			}
			if(typeof($(datazninput).data("value"))!="undefined"){
				param += "type="+$(datazninput).data("value")+"&";
			}
			if($("#province").val()!="不限"){
				param += "province="+encodeURI($("#province").val())+"&";
			}
			if($("#city").val()!="不限"&&$("#city").val()!=null){
				param += "city="+encodeURI($("#city").val())+"&";
			}
			if($("#selecttimeInput").val()!=""){
				param += "time="+$("#selecttimeInput").val()+"&";
			}
			if($("#name").val()!=""){
				param += "name="+encodeURI($("#name").val())+"&";
			}
			page("${pageContext.request.contextPath}/recruitInfo/index.do?"+param);
		}
		function resetSearch(){
			 $(datainput).val("");
			 $(datainput).data("value","");
			 $(datazninput).val("");
			 $(datazninput).data("value","");
			 $("#province").val("不限");
			 $("#city").empty();
			 $("#city").append("<option value='不限'>不限</option>");
			 $(".selecttime #firstchild").addClass("chooseon").siblings().removeClass("chooseon");
			 $("#selecttimeInput").val("");
			 $("#name").val("");
		}
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
			                        "<td><a href='${pageContext.request.contextPath}/user/detail.do?userId="+recruitInfo.user.id+"'>"+recruitInfo.user.trueName+"</a></td>"+
			                        "<td>"+recruitInfo.salary+"</td>"+
			                        "<td>"+recruitInfo.province+"/"+recruitInfo.city+"</td>"+
			                        "<td>"+date.format('YYYY-MM-dd')+"</td>"+
			                    "</tr>";
						});
						$(".list").append(list);
						$(".page").append(result.pageCode);
					});
		}
		
		$(function(){
			$(".selecttime a").click(function(){
		    	$(this).addClass("chooseon").siblings().removeClass("chooseon");
		    	$("#selecttimeInput").val($(this).children("input").val());
			});
			var param = "";
			var careerOne="<%= request.getParameter("careerOne")%>";
			var careerTwo="<%= request.getParameter("careerTwo")%>";
			var time="<%= request.getParameter("time")%>";
			if(careerOne!=null){
				param += "type="+careerOne+"&";
			}
			if(careerTwo!=null){
				param += "hy="+careerTwo+"&";
			}
			if(time!=null){
				param += "time="+time;
			}
			page("${pageContext.request.contextPath}/recruitInfo/index.do?"+param);
		})
	</script>
</body>
</html>