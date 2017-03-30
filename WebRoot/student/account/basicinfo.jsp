<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/place.js"></script>
<style type="text/css">
	.head_nav{
		position: relative;
	}
</style>
<script>
	function depChange(){
		var depId = $("#s_dep").find("option:selected").val();
		$("#major").empty();
		$("."+depId+"").each(function(){
			$("#major").append("<option value='"+$(this).attr("name")+"'>"+$(this).attr("value")+"</option>")
		});
	}
	function pToForm(){
		$("#msg").hide();
		$(".pToForm p").hide();
		$(".change").hide();
		$(".save").show();
		$(".cancel").show();
		$(".hideOrShow").show();
	}
	function formToP(){
		$("#msg").hide();
		$(".pToForm p").show();
		$(".change").show();
		$(".save").hide();
		$(".cancel").hide();
		$(".hideOrShow").hide();
	}
	function check(){
		if($("#trueName").val() == "" || 
				$("#birthday").val() == "" || 
				$("#graduationYear").val() == "" || 
				$("#phone").val() == "" || 
				$("#email").val() == "" || 
				$("#qq").val() == "" || 
				$("#address").val() == ""){
			layer.msg('必填（*）参数不能为空', {icon: 5});
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
</head>
<!-- 通过body的onload事件调用js里面的initialize()方法来初始化省市级联下拉框 -->
<body onload="javascript:initialize();">

	<jsp:include page="../../common/top.jsp"></jsp:include>
   
	<div class="container container-fluid">
        <div class="row" style="margin-top:15px;">
            <div class="col-md-3">
            	<div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
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
            	</div>
           	</div>
           	<div class="col-md-9" style="padding-left: 0;">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                	<div>
						<div class="container_main">
						    <div class="main_name">
						        <h4 class="float:none">基本资料：</h4>
						    </div>
						    <div class="basicinfo" style="margin-top: 20px;">
							    <form id="fm" onsubmit="return check()" method="post" action="${pageContext.request.contextPath}/user/save.do" enctype="multipart/form-data">
							        <table class="content" width="100%">
							            <tbody>
							            <tr>
							                <th width="20%"><span style="color:red">*</span>姓名：</th>
							                <td width="30%" class="pToForm">
							                	<p>${currentUser.trueName }</p>
							                	<input hidden class="hideOrShow isNot" id='trueName' name='trueName' type='text' maxlength='8' value='${currentUser.trueName }' />
							                	<input hidden name="id" value="${currentUser.id }" />
							                </td>
							                <th width="10%"></th>
							                <td rowspan="6" width="40%">
							                    <form action="" enctype="multipart/form-d5ta">
							                        <div class="touxiang" style="padding-bottom: 4px;">
								                        <c:choose>
								                        	<c:when test="${currentUser.pic != null}">
								                        		<img src="${pageContext.request.contextPath}/userImages/touxiang/${currentUser.pic}" width="100px;">
								                        	</c:when>
								                        	<c:otherwise>
									                            <img src="${pageContext.request.contextPath}/static/images/touxiang.jpg" width="100px;">
								                        	</c:otherwise>
								                        </c:choose>
							                        </div>
							                        <input type="file" name="file_pic" style="padding-bottom: 4px;">
							                    </form>
							                </td>
							            </tr>
							            <tr>
							                <th><span style="color:red">*</span>性别：</th>
							                <td class="pToForm">
							                	<p>${currentUser.sex }</p>
							                	<div hidden class="hideOrShow ">
								                	<input value="男" name="sex" type="radio" id="man" <c:if test="${currentUser.sex =='男' }">checked</c:if> /> 男&nbsp;
								                	<input value="女" name="sex" type="radio" id="woman" <c:if test="${currentUser.sex =='女' }">checked</c:if>/> 女
							                	</div>
							                </td>
							            </tr>
							            <tr>
							                <th><span style="color:red">*</span>出生年月：</th>
							                <td class="pToForm">
							                	<p>
							                	<p><fmt:formatDate value='${currentUser.birthday}' pattern='yyyy-MM'/></p>
							                	<input hidden class="hideOrShow isNot" id="birthday" class="Wdate" style="height:27px;width:200px;padding-left:5px" value="<fmt:formatDate value='${currentUser.birthday}' pattern='yyyy-MM'/>" name="birthday" onfocus="WdatePicker({dateFmt:'yyyy-MM',qsEnabled:false})" />
							                </td>
							            </tr>
							            <tr>
							            	<th><span style="color:red"></span>籍贯：</th>
							                <td class="pToForm">
							                	<p>${currentUser.origin }</p>
		                                        <select hidden class="hideOrShow s1" style="width:98px;height: 25px;" id="province" name="province" onchange="javascript:selectchange(province,city);">
		                                        </select>
		                                        <select hidden class="hideOrShow s2" style="width:98px;height: 25px;" id="city" name="city">
		                                        </select>
							                </td>
							            </tr>
							            <tr>
							                <th>政治面貌：</th>
							                <td colspan="3" class="pToForm">
							                	<p>${currentUser.politics }</p>
							                	<div hidden class="hideOrShow">
								                	<input id="politics1" type="radio" name="politics" value="群众" <c:if test="${currentUser.politics =='群众' }">checked</c:if>/>
								                	群众&nbsp;
								                	<input id="politics2" type="radio" name="politics" value="共青团员" <c:if test="${currentUser.politics =='共青团员' }">checked</c:if>/>
								                	共青团员&nbsp;
								                	<input id="politics3" type="radio" name="politics" value="中共党员" <c:if test="${currentUser.politics =='中共党员' }">checked</c:if>/>
								                	中共党员
								                </div>
							                </td>
							            </tr>
							           <tr>
							                <th><span style="color:red">*</span>系/专业：</th>
							                <td colspan="3" class="pToForm">
							                	<p>${currentUser.major.dep.name }&nbsp;&nbsp;${currentUser.major.name }</p>
							                	<div hidden class="hideOrShow">
								                	<select hidden class="hideOrShow isNot" onchange="depChange()" name="s_dep" id="s_dep" style="height:27px;">
								                		<c:choose>
								                			<c:when test="${not empty currentUser.major.id}">
								                				<option value="${currentUser.major.dep.id}">${currentUser.major.dep.name }</option>
								                				<c:forEach var="dep" items="${depList}">
									                				<c:if test="${currentUser.major.dep.id != dep.id }">
									                				<option value="${dep.id }">${dep.name }</option>
									                				</c:if>
								                				</c:forEach>
								                			</c:when>
								                			<c:otherwise>
								                				<option>请选择系...</option>
								                				<c:forEach var="dep" items="${depList}">
								                					<option value="${dep.id }">${dep.name }</option>
								                				</c:forEach>
								                			</c:otherwise>
								                		</c:choose>
								                	</select>
								                	&nbsp;
								                	<select hidden class="hideOrShow isNot" name="majorId" id="major" style="height:27px;">
							                		<c:choose>
							                			<c:when test="${not empty currentUser.major.id}">
							                				<option value="${currentUser.major.id}">${currentUser.major.name }</option>
							                			</c:when>
							                			<c:otherwise>
							                				<option>请选择专业...</option>
							                			</c:otherwise>
							                		</c:choose>
							                		
							                		<c:forEach var="major" items="${majorList}">
							                			<input hidden class="${major.dep.id }" name="${major.id }" value="${major.name }">
						               				</c:forEach>
						               			</select>
							               		</div>
							                </td>
							            </tr>
							            <tr>
							                <th><span style="color:red">*</span>毕业年月：</th>
							                <td class="pToForm">
							                	<p><fmt:formatDate value="${currentUser.graduationYear}" pattern="yyyy-MM"/></p>
							                	<input hidden class="hideOrShow isNot" id="graduationYear" value="<fmt:formatDate value='${currentUser.graduationYear}' pattern='yyyy-MM'/>" name="graduationYear" class="Wdate" style="height:27px;width:200px;padding-left:5px;" name="graduationYear" onfocus="WdatePicker({dateFmt:'yyyy-MM',qsEnabled:false})" /> 
							                </td>
							                <th><span style="color:red">*</span>手机：</th>
							                <td class="pToForm">
							                	<p>${currentUser.phone }</p>
							                	<input hidden class="hideOrShow isNot" name="phone" type="text" id="phone" maxlength="11" value="${currentUser.phone }" />
							                </td>
							            </tr>
							            <tr>
							                <th><span style="color:red">*</span>Email：</th>
							                <td class="pToForm">
							                	<p>${currentUser.email }</p>
							                	<input hidden class="hideOrShow isNot" id="email" name="email" type="text" maxlength="20" value="${currentUser.email }">
							                </td>
							                <th>QQ：</th>
							                <td class="pToForm">
							                	<p>${currentUser.qq }</p>
							                	<input hidden class="hideOrShow isNot" name="qq" id="qq" type="text" maxlength="20" value="${currentUser.qq }"/>
							                </td>
							            </tr>
							            <tr >
							                <th><span style="color:red">*</span>现居住地：</th>
							                <td colspan="5" class="pToForm">
							                	<p>${currentUser.address }</p>
							                	<input hidden style='width:280px;' class="hideOrShow isNot" name="address" type="text" id="address" maxlength="50" value="${currentUser.address }">
							                </td>
							            </tr>
							            <tr>
							                <td></td>
							                <td class="converButton">
							                    <input class="btn btn-success change" type="button" onclick="pToForm()"
							                           value="&nbsp;&nbsp;修改&nbsp;&nbsp;"/>
							                    <span id="msg" style="color:${color}">${msg }</span>
							                    <div hidden class="hideOrShow">
								                    <input class="btn btn-success" type="submit"
								                           value="&nbsp;&nbsp;保存&nbsp;&nbsp;"/>
							                        <input class="btn btn-default" type="button" onclick="formToP()"
							                        	   value="&nbsp;&nbsp;取消&nbsp;&nbsp;"/>
						                    	</div>
							                </td>
							            </tr>
							            </tbody>
							        </table>
							    </form>
						    </div>
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		if(!$("#msg").is(":hidden")){
			layer.msg('修改成功', {icon: 6});
		}
	</script>
</body>
</html>