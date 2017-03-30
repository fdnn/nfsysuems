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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/zyzn/zyzn_1.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/load_hycode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/hgz_hycode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/hgz_zncode.js"></script>
<style type="text/css">
	.head_nav{
		position: relative;
	}
</style>
<script>
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
</script>
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
					        <a href="${pageContext.request.contextPath}/company/account/basicinfo.jsp"><li class="nav_active"><p>基本资料</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/account/security.jsp"><li ><p>账号安全</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/account/dynamic.jsp"><li ><p>企业动态</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/account/map.jsp"><li ><p>地图标注</p></li></a>
					    </ul>
					</div>
					<div style="margin-top: 10px;"></div>
					<div class="container_nav">
					    <ul>
					        <h4>职位管理</h4>
					        <a href="${pageContext.request.contextPath}/company/jobmanager/job_list.jsp"><li><p>管理职位</p></li></a>
					    </ul>
					</div>
					<div style="margin-top: 10px;"></div>
					<div class="container_nav">
					    <ul>
					        <h4>简历管理</h4>
					        <a href="${pageContext.request.contextPath}/company/resumemanager/inform_resume.jsp"><li><p>面试邀请</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/resumemanager/apply_resume.jsp"><li><p>收到的简历</p></li></a>
					        <%--<a href="${pageContext.request.contextPath}/company/resumemanager/store_resume.jsp"><li><p>收藏的简历</p></li></a>
					    --%></ul>
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
							    <form id="fm" method="post" onsubmit="return presumbit()" action="${pageContext.request.contextPath}/user/save.do" enctype="multipart/form-data">
							        <table class="content" width="100%">
							            <tbody>
							            <tr>
							                <th width="20%"><span style="color:red">*</span>企业名称：</th>
							                <td width="30%" class="pToForm">
							                	<p>${currentUser.trueName }</p>
							                	<input hidden class="hideOrShow" id='trueName' name='trueName' type='text' maxlength='8' value='${currentUser.trueName }' />
							                	<input hidden name="id" value="${currentUser.id }" />
							                </td>
							                <th width="20%"></th>
							                <td rowspan="5" width="40%">
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
							                <th><span style="color:red">*</span>企业性质：</th>
							                <td class="pToForm">
							                	<p>${currentUser.nature }</p>
							                	<input hidden class="hideOrShow" name="nature" type="text" id="nature" maxlength="8" value="${currentUser.nature }">
							                </td>
							            </tr>
							            <tr>
							                <th><span style="color:red">*</span>所属行业：</th>
							                <td class="pToForm">
							                	<p>${currentUser.careerTwo.name }</p>
							                	<input hidden class="hideOrShow nation expectedPosition" type="text" id="industry" placeholder="请选择类别" type="text" size="30" onclick="appendhybar(this,'danxuan');" />
							                	<input hidden name="careerTwo.id" class="hy" />
						                	</td>
							            </tr>
							            <tr>
							            	<th><span style="color:red">*</span>企业规模：</th>
							                <td class="pToForm">
							                	<p>${currentUser.scale }</p>
							                	<input hidden class="hideOrShow" name="scale" type="text" id="scale" maxlength="8" value="${currentUser.scale }">
							                </td>
							            </tr>
							            <tr>
							                <th><span style="color:red">*</span>联系人：</th>
							                <td class="pToForm">
							                	<p>${currentUser.linkman }</p>
							                	<input hidden class="hideOrShow" id="linkman" name="linkman" type="text" maxlength="20" value="${currentUser.linkman }">
							                </td>
							            </tr>
							            <tr>
							                <th><span style="color:red">*</span>固定电话：</th>
							                <td class="pToForm">
							                	<p>${currentUser.tel }</p>
							                	<input hidden class="hideOrShow" id="tel" name="tel" type="text" maxlength="20" value="${currentUser.tel }">
							                </td>
							                <th>联系手机：</th>
							                <td class="pToForm">
							                	<p>${currentUser.phone }</p>
							                	<input hidden class="hideOrShow" name="phone" id="phone" type="text" maxlength="20" value="${currentUser.phone }"/>
							                </td>
							            </tr>
							            <tr >
							                <th><span style="color:red">*</span>联系邮箱：</th>
							                <td class="pToForm">
							                	<p>${currentUser.email }</p>
							                	<input hidden class="hideOrShow" name="email" type="text" id="email" maxlength="50" value="${currentUser.email }">
							                </td>
							                <th>公司网址：</th>
							                <td class="pToForm">
							                	<p><a href="${currentUser.url }" target="_blank">${currentUser.url }</a></p>
							                	<input hidden class="hideOrShow" name="url" id="url" type="text" maxlength="20" value="${currentUser.url }"/>
							                </td>
							            </tr>
							            <tr>
							                <th><span style="color:red"></span>地区：</th>
							                <td class="pToForm">
							                	<p>${currentUser.province }/${currentUser.city }</p>
		                                        <select hidden class="hideOrShow" name="province" style="width:100px;height: 25px;float:left" id="province" onchange="javascript:selectchange(province,city);"></select>
		                                        <select hidden class="hideOrShow" name="city" id="city" style="width:100px;height: 25px;" id="city"></select>
	                                        </td>
							            </tr>
							            <tr>
							                <th><span style="color:red">*</span>详细地址：</th>
							                <td colspan="4" class="pToForm">
							                	<p>${currentUser.address }</p>
							                	<input style="width:300px;"  hidden class="hideOrShow" name="address" type="text" id="address" maxlength="50" value="${currentUser.address }">
							                </td>
							            </tr>
							            <tr>
							            	<th valign="top"><span style="color:red">*</span>公司简介：</th>
							                <td colspan="4" class="pToForm">
							                	<p>${currentUser.introduction }</p>
							                	<textarea style="margin: 3px 0;" hidden class="hideOrShow" name="introduction" id="introduction" cols="85" rows="10" maxlength="1000">${currentUser.introduction }</textarea>
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
		function presumbit(){
			if($("#trueName").val() == "" || 
					$("#nature").val() == "" || 
					$("#industry").val() == "" || 
					$("#scale").val() == "" || 
					$("#linkman").val() == "" || 
					$("#tel").val() == "" || 
					$("#email").val() == "" || 
					$("#address").val() == "" || 
					$("#introduction").val() == ""){
				layer.msg('必填（*）参数不能为空', {icon: 5});
				return false;
			}
			$(".hy").val($(datainput).data("value"));
			return true;
		}
	</script>
</body>
</html>