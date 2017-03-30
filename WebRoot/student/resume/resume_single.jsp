<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/zyzn/zyzn_1.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/load_hycode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/hgz_hycode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/hgz_zncode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/place.js"></script>
<style type="text/css">
	.head_nav{
		position: relative;
	}
</style>
</head>
<body onload="javascript:initialize();">
	<jsp:include page="../../common/top.jsp"></jsp:include>
   
	<div class="container container-fluid">
        <div class="row" style="margin-top:15px;">
            <div class="col-md-3">
            	<div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
            		<div class="container_nav">
					    <ul>
					        <h4>账号管理</h4>
					        <a href="${pageContext.request.contextPath}/student/account/basicinfo.jsp"><li><p>基本资料</p></li></a>
					        <a href="${pageContext.request.contextPath}/student/account/security.jsp"><li ><p>账号安全</p></li></a>
					    </ul>
					</div>
					<div style="margin-top: 10px;"></div>
					<div class="container_nav">
					    <ul>
					        <h4>我的简历</h4>
					        <a href="${pageContext.request.contextPath}/resume/save.do"><li><p>创建简历</p></li></a>
					        <a href="${pageContext.request.contextPath}/student/resume/resume_list.jsp"><li class="nav_active"><p>简历管理</p></li></a>
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
           	<div class="col-md-9 resumedetail" style="padding-left: 0;">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                	<div>
						<div class="container_main">
						    <div class="main_name">
						        <h4 class="left">简历名称：</h4>
						        <h4 class="left" id="resumeName">${resume.resumeName }</h4>
						        <input hidden type="text" id="jlmc" name="resumeName"  onblur="updateResumeName()" value="" />
						        <input hidden id="idsingle" name="id" value="${resume.id }" />&nbsp;&nbsp;
						        <a href="javascript:mingming()"><span class="glyphicon glyphicon-tag" style="font-size:16px;color:#337ab7;"></span></a>
						    </div>
						    <div class="resume_01">
						        <div class="head">
						            <h5>基本信息
						            	<a href="javascript:slideToggle('resume_01')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
						       		</h5>
						        </div>
						        
						        <div class="neirong">
							       	<div class="xinxi">
							       		<div class="jbxx" style="float:left">
								       		<ul>
								       			<li class="zitijiachu"><span>${currentUser.trueName }</span></li>
								       		</ul>
								       		<ul>
								       			<li><span>电话：${currentUser.phone }</span></li>
								       			<li class="fengeshu">|</li>
								       			<li><span>邮箱：${currentUser.email }</span></li>
								       			<li class="fengeshu">|</li>
								       			<li><span>QQ：${currentUser.qq }</span></li>
								       		</ul>
								       		<ul>
								       			<li><span>出生年份：<fmt:formatDate value='${currentUser.birthday}' pattern='yyyy'/></span></li>
								       			<li class="fengeshu">|</li>
								       			<li><span>毕业年份：<fmt:formatDate value='${currentUser.graduationYear}' pattern='yyyy'/></span></li>
								       		</ul>
								       		<ul>
								       			<li><span>${currentUser.sex }</span></li>
								       			<li class="fengeshu">|</li>
								       			<li><span>${currentUser.major.dep.name }</span></li>
								       			<li class="fengeshu">|</li>
								       			<li><span>${currentUser.major.name }</span></li>
								       		</ul>
								       		<ul>
								       			<li><span>现居住地：${currentUser.address }</span></li>
								       		</ul>
							       		</div>
								       	<div class="pic" style="float:right;margin-right:60px;">
								       		<c:choose>
						                       	<c:when test="${currentUser.pic != null}">
						                       		<img src="${pageContext.request.contextPath}/userImages/touxiang/${currentUser.pic}" width="100px;">
						                       	</c:when>
						                       	<c:otherwise>
						                            <img src="${pageContext.request.contextPath}/static/images/touxiang.jpg" width="100px;">
						                       	</c:otherwise>
						                    </c:choose>
								       	</div>
							       	</div>
						       	</div>
						    </div>
						    <div style="clear:both"></div>
						    <div class="resume_02">
						        <div class="head">
						            <h5>求职意向
						            	<a href="javascript:slideToggle('resume_02')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
						       		</h5>
						        </div>
						        
						        <div class="neirong">
						        
							        <div class="xinxi qzyx" style="display: none;">
							       		<div style="float:left">
								       		<ul>
								       			<li style="font-weight:bold;"><span>期望职位：</span></li>
								       			<li id="qwzw"><span></span></li>
								       		</ul>
								       		<ul>
								       			<li style="font-weight:bold;"><span>期望工作地点：</span></li>
								       			<li id="qwdd"><span></span></li>
								       		</ul>
								       		<ul>
								       			<li style="font-weight:bold;"><span>期望月薪：</span></li>
								       			<li id="qwyx"><span></span></li>
								       		</ul>
								       		<ul>
							       		</div>
							       		<div class="" style="float:right;">
							       			<a href="javascript:modify('qzyx_default')" style="color: #5cb85c">修改</a>
							       		</div>
							       	</div>
							        
							        <table class="content qzyx_save" width="100%" style="display: block;">
							            <form id="qzyx_fm">
								            <tbody>
								            	<input name="id" hidden value="${resume.id }"/>
									            <tr>
									                <th width="20%"><span style="color:red">*</span>期望职位：</th>
									                <td width="30%"><input class="nation expectedPosition" placeholder="请选择类别" type="text" size="30" value="" data-value="" onclick="appendhyznbar(this,'danxuan');" /></td>
									                <input hidden name="careerThree.id" class="zn" />
									                <td></td>
									                <td></td>
									            </tr>
									            <tr>
									                <th><span style="color:red">*</span>期望工作地点：</th>
									                <td>
				                                        <select name="province" style="width:100px;height: 25px;float:left" id="province" onchange="javascript:selectchange(province,city);"></select>
				                                        <select name="city" id="city" style="width:100px;height: 25px;" id="city"></select>
			                                        </td>
									            </tr>
									            <tr>
									                <th><span style="color:red">*</span>期望月薪：</th>
									                <td><input name="salary" type="text" id="expectedSalary" onblur="" maxlength="8"></td>
									            </tr>
									            <tr>
									                <td></td>
									                <td>
									                    <input class="btn btn-success" style="margin: 6px 0; " id="qzyx_submit" type="button"
									                           value="&nbsp;&nbsp;保存&nbsp;&nbsp;"/>
									                    &nbsp;&nbsp;
									                    <input class="btn btn-default" id="quxiao_qzyx" onclick="quxiao('qzyx')" type="button"
									                           value="&nbsp;&nbsp;取消&nbsp;&nbsp;"/>
									                </td>
									            </tr>
								            </tbody>
							            </form>
							        </table>
								</div>
						    </div>
						    <div style="clear:both"></div>
						    <div class="resume_03">
						        <div class="head">
						            <h5>教育背景&nbsp;&nbsp;&nbsp;&nbsp;
						            	<a href="javascript:addData('jybj')"><span class="glyphicon glyphicon-plus-sign" style="color: #5cb85c"></span></a>
						            	<a href="javascript:slideToggle('resume_03')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
						            </h5>
						        </div>
						        
						        <div class="neirong"> 
						        
						        	<div class="jybjs"></div>
						        	
							        <table class="content jybj_save" width="100%" style="display: none;">
							            <form id="jybj_fm">
								            <tbody>
									            <input name="id" id="jybjId" hidden value=""/>
									            <input name="resume.id" hidden value="${resume.id }"/>
									            <tr>
									                <th width="20%"><span style="color:red">*</span>起止时间：</th>
									                <td width="50%" colspan="2">
									                	<input name="start" id="jybj_start" class="Wdate" style="height:27px;width:100px;float:left;padding-left: 5px;" value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',qsEnabled:false})" />
									                	<span style="float:left" >-</span><input name="end" id="jybj_end" class="Wdate" style="height:27px;width:100px;float:left;padding-left: 5px;" value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',qsEnabled:false})" />
									                </td>
									            </tr>
									            <tr>
									                <th><span style="color:red">*</span>学校名称：</th>
									                <td><input name="school" type="text" id="jybj_school" onblur="" maxlength="30"></td>
									            </tr>
									            <tr>
									                <th><span style="color:red">*</span>学历/学位：</th>
									                <td><input name="degree" type="text" id="jybj_degree" onblur="" maxlength="8"></td>
									            </tr>
									            <tr>
									                <th><span style="color:red">*</span>专业名称：</th>
									                <td>
									                	<select onchange="depChange()" name="dep" id="dep" style="height:27px;">
									                		<option>请选择系...</option>
							                				<c:forEach var="dep" items="${depList}">
							                					<option value="${dep.id }">${dep.name }</option>
							                				</c:forEach>
									                	</select>
									                	<select name="major" id="major" style="height:27px;">
							                				<option>请选择专业...</option>
							                				
							                				<c:forEach var="major" items="${majorList}">
									                			<input hidden class="${major.dep.id }" name="${major.name }" value="${major.name }">
								               				</c:forEach>
									                	</select>
													</td>
									            </tr>
									            <tr>
									                <td></td>
									                <td>
									                    <input class="btn btn-success" style="margin: 6px 0; " id="jybj_submit" type="button"
									                           value="&nbsp;&nbsp;保存&nbsp;&nbsp;"/>
									                    &nbsp;&nbsp;
									                    <input class="btn btn-default" onclick="quxiao('jybj')" type="button"
									                           value="&nbsp;&nbsp;取消&nbsp;&nbsp;"/>
									                </td>
									            </tr>
								            </tbody>
							            </form>
							        </table>
								</div>
						    </div>
						    <div style="clear:both"></div>
						    <div class="resume_04">
						        <div class="head">
						            <h5>工作/实习经历&nbsp;&nbsp;&nbsp;&nbsp;
						            	<a href="javascript:addData('gsjy')"><span class="glyphicon glyphicon-plus-sign" style="color: #5cb85c"></span></a>
						            	<a href="javascript:slideToggle('resume_04')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
						            </h5>
						        </div>
						        
						        <div class="neirong">
						        
						        	<div class="gsjys"></div>
						        
							        <table class="content gsjy_save" width="100%" style="display: none;">
							            <form id="gsjy_fm">
								            <tbody>
								            	<input name="id" id="gsjyId" hidden value=""/>
									            <input name="resume.id" hidden value="${resume.id }"/>
									            <tr>
									                <th width="15%"><span style="color:red">*</span>起止时间：</th>
									                <td width="40%">
									                	<input name="start" id="gsjy_start" class="Wdate" style="height:27px;width:100px;float:left;padding-left: 5px;" value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',qsEnabled:false})" />
									                	<span style="float:left" >-</span>
									                	<input name="end" id="gsjy_end" class="Wdate" style="height:27px;width:100px;float:left;padding-left: 5px;" value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',qsEnabled:false})" />
									                </td>
									                <th></th>
									                <td></td>
									            </tr>
									            <tr>
									                <th><span style="color:red">*</span>单位名称：</th>
									                <td><input name="unitName" type="text" id="gsjy_unitName" onblur="" maxlength="8"></td>
									                <th>单位性质：</th>
									                <td><input name="unitNature" type="text" id="gsjy_unitNature" onblur="" maxlength="8"></td>
									            </tr>
									            <tr>
									                <th>单位行业：</th>
									                <td><input name="unitIndustry" type="text" id="gsjy_unitIndustry" onblur="" maxlength="8"></td>
									                <th>单位规模：</th>
									                <td><input name="unitScale" type="text" id="gsjy_unitScale" onblur="" maxlength="8"></td>
									            </tr>
									            <tr>
									                <th><span style="color:red">*</span>职位名称：</th>
									                <td><input name="jobName" type="text" id="gsjy_jobName" onblur="" maxlength="8"></td>
									                <th>所在部门：</th>
									                <td><input name="jobDept" type="text" id="gsjy_jobDept" onblur="" maxlength="8"></td>
									            </tr>
									            <tr>
									                <th><span style="color:red">*</span>职位类别：</th>
									                <td><input name="jobType" type="text" id="gsjy_jobType" onblur="" maxlength="8"></td>
									                <th>工资待遇：</th>
									                <td><input name="salary" type="text" id="gsjy_salary" onblur="" maxlength="8">元/月</td>
									            </tr>
									            <tr>
									                <th>工作/实习描述：</th>
									                <td colspan="3">
									                	<textarea name="jobDescription" style="padding-left: 5px;" cols="87" rows="4" id="gsjy_jobDescription" maxlength="1000"></textarea>
									                	<!-- <input name="jobDescription" type="text" id="" onblur="" maxlength="8"> -->
									                </td>
									            </tr>
									            <tr>
									                <td></td>
									                <td>
									                    <input class="btn btn-success" style="margin: 6px 0; " id="gsjy_submit" onclick="" type="button"
									                           value="&nbsp;&nbsp;保存&nbsp;&nbsp;"/>
									                    &nbsp;&nbsp;
									                    <input class="btn btn-default" onclick="quxiao('gsjy')" type="button"
									                           value="&nbsp;&nbsp;取消&nbsp;&nbsp;"/>
									                </td>
									            </tr>
								            </tbody>
							            </form>
							        </table>
						        </div>
						    </div>
						    <div style="clear:both"></div>
						    <div class="resume_05">
						        <div class="head">
						            <h5>项目经历&nbsp;&nbsp;&nbsp;&nbsp;
						            	<a href="javascript:addData('xmjy')"><span class="glyphicon glyphicon-plus-sign" style="color: #5cb85c"></span></a>
						            	<a href="javascript:slideToggle('resume_05')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
						            </h5>
						        </div>
						        
						        <div class="neirong">
						        
						        	<div class="xmjys"></div>
						        
							        <table class="content xmjy_save" width="100%" style="display: block;">
							            <form id="xmjy_fm">
								            <tbody>
								            	<input name="id" id="xmjyId" hidden value=""/>
									            <input name="resume.id" hidden value="${resume.id }"/>
									            <tr>
									                <th width="20%"><span style="color:red">*</span>起止时间：</th>
									                <td width="40%">
									                	<input name="start" id="xmjy_start" class="Wdate" style="height:27px;width:100px;float:left;padding-left:5px;" value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',qsEnabled:false})" />
									                	<span style="float:left" >-</span>
									                	<input name="end" id="xmjy_end" class="Wdate" style="height:27px;width:100px;float:left;padding-left:5px;" value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',qsEnabled:false})" />
									                </td>
									                <th></th>
									                <td></td>
									            </tr>
									            <tr>
									                <th><span style="color:red">*</span>项目名称：</th>
									                <td><input name="itemName" type="text" id="xmjy_itemName" onblur="" maxlength="8"></td>
									            </tr>
									            <tr>
									                <th>详细描述：</th>
									                <td><textarea style="padding-left:5px;" name="description" id="xmjy_description" onblur="" rows="5" cols="70"></textarea></td>
									            </tr>
									            <tr>
									                <td></td>
									                <td>
									                    <input class="btn btn-success" style="margin: 6px 0; " id="xmjy_submit" type="button"
									                           value="&nbsp;&nbsp;保存&nbsp;&nbsp;"/>
									                    &nbsp;&nbsp;
									                    <input class="btn btn-default" onclick="quxiao('xmjy')" type="button"
									                           value="&nbsp;&nbsp;取消&nbsp;&nbsp;"/>
									                </td>
									            </tr>
								            </tbody>
						            	</form>
							        </table>
						        </div>
						    </div>
						    <div style="clear:both"></div>
						    <div class="resume_06">
						        <div class="head">
						            <h5>职称/技能/证书&nbsp;&nbsp;&nbsp;&nbsp;
						            	<a href="javascript:addData('zs')"><span class="glyphicon glyphicon-plus-sign" style="color: #5cb85c"></span></a>
						            	<a href="javascript:slideToggle('resume_06')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
						            </h5>
						        </div>
						        
						        <div class="neirong">
						        
						        	<div class="zss"></div>
						        	
							        <table class="content zs_save"  width="100%" style="display: none;">
								        <form id="zs_fm">
								            <tbody>
									            <input name="id" id="zsId" hidden value=""/>
									            <input name="resume.id" hidden value="${resume.id }"/>
									            <tr>
									                <th width="20%"><span style="color:red">*</span>获取时间：</th>
									                <td width="30%">
									                	<input name="time" id="zs_time" class="Wdate" style="height:27px;width:200px;padding-left:5px;" value="" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',qsEnabled:false})" />
									                </td>
									                <td></td>
									                <td></td>
									            </tr>
									            <tr>
									                <th><span style="color:red">*</span>证书名称：</th>
									                <td><input name="name" type="text" id="zs_name" onblur="" maxlength="30"></td>
									            </tr>
									            <tr>
									                <td></td>
									                <td>
									                    <input class="btn btn-success" style="margin: 6px 0; " id="zs_submit" type="button"
									                           value="&nbsp;&nbsp;保存&nbsp;&nbsp;"/>
									                    &nbsp;&nbsp;
									                    <input class="btn btn-default" onclick="quxiao('zs')" type="button"
									                           value="&nbsp;&nbsp;取消&nbsp;&nbsp;"/>
									                </td>
									            </tr>
								            </tbody>
								        </form>
							        </table>
						        </div>
						    </div>
						    <div style="clear:both"></div>
						    <div class="resume_07">
						        <div class="head">
						            <h5>自我评价
						            	<a href="javascript:slideToggle('resume_07')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true" onclick=""></span></a>
						            </h5>
						        </div>
						        
						        <div class="neirong">
						        
						        	<div class="xinxi zwpj" style="display: none;">
							       		<div style="float:left">
								       		<ul>
								       			<li id="zwpj"><span></span></li>
								       		</ul>
								       		<ul>
								       			<li style="font-weight:bold;">
								       				<span><a href="javascript:modify('zwpj_default')" style="color: #5cb85c">修改</a></span>
								       			</li>
								       		</ul>
							       		</div>
							       	</div>
						        	
							        <table class="content zwpj_save" width="100%" style="display: block;">
							        	<form id="zwpj_fm">
								            <tbody>
								            	<input name="id" hidden value="${resume.id }"/>
									            <tr>
									                <td>
									                    <div class="alert alert-success" role="alert">
															1、填写您在职/在校期间的主要能力、成就、获得奖励、个人特长等，简明扼要地描述您的职业优势，让用人单位快速了解您！<br />
									                    	2、建议尽量详细描述您个人已经做出的工作业绩！
														</div>
									                </td>
									            </tr>
									            <tr>
									                <td>
									                    <textarea style="padding-left:5px;" name="evaluation" id="zwpj_evaluation" cols="87" rows="5" maxlength="1000"></textarea>
									                </td>
									            </tr>
									            <tr>
									                <td>
									                    <input class="btn btn-success" style="margin: 6px 0; " id="zwpj_submit" type="button"
									                           value="&nbsp;&nbsp;保存&nbsp;&nbsp;"/>
									                    &nbsp;&nbsp;
									                    <input class="btn btn-default" id="quxiao_zwpj" onclick="quxiao('zwpj')" type="button"
									                           value="&nbsp;&nbsp;取消&nbsp;&nbsp;"/>
									                </td>
									            </tr>
								            </tbody>
							            </form>
							        </table>
						        </div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../../common/footer.jsp"></jsp:include>

	<script src="http://malsup.github.io/jquery.form.js"></script>
	<script type="text/javascript">
		$(function(){
			$("div[class^=resume_] .neirong").hide();
			getResume("qzyx");
			getEducationList();
			getWorkExpList();
			getItemExpList();
			getCertificateList();
			getResume("zwpj");
		})
		function slideToggle(param){  
			$("."+param+" .neirong").slideToggle(0);//窗帘效果的切换,点一下收,点一下开
		}
	
		var qzyx_options = {
			url:"${pageContext.request.contextPath}/resume/save.do",
			type: 'post',
			success: function(data) {
               	//alert('提交成功！');
                getResume("qzyx");
           	}
		}
		var jybj_options = {
			url:"${pageContext.request.contextPath}/education/save.do",
			type: 'post',
			success: function(data) {
               	//alert('提交成功！');
                getEducationList();
           	}
		};
		var gsjy_options = {
			url:"${pageContext.request.contextPath}/workExp/save.do",
			type: 'post',
			success: function(data) {
               	//alert('提交成功！');
                getWorkExpList();
           	}
		}
		var xmjy_options = {
			url:"${pageContext.request.contextPath}/itemExp/save.do",
			type: 'post',
			success: function(data) {
               	//alert('提交成功！');
                getItemExpList();
           	}
		}
		var zs_options = {
			url:"${pageContext.request.contextPath}/certificate/save.do",
			type: 'post',
			success: function(data) {
               	//alert('提交成功！');
                getCertificateList();
           	}
		};
		var zwpj_options = {
			url:"${pageContext.request.contextPath}/resume/save.do",
			type: 'post',
			success: function(data) {
               	//alert('提交成功！');
                getResume("zwpj");
           	}
		}
		$("#qzyx_submit").click(function() { 
			$(".zn").val($(datazninput).data("value").split(",")[2]);
			$("#qzyx_fm").ajaxSubmit(qzyx_options); 
			return false; 
		});
		$("#jybj_submit").click(function() { 
			$("#jybj_fm").ajaxSubmit(jybj_options); 
			return false; 
		});
		$("#gsjy_submit").click(function() { 
			$("#gsjy_fm").ajaxSubmit(gsjy_options); 
			return false; 
		});
		$("#xmjy_submit").click(function() { 
			$("#xmjy_fm").ajaxSubmit(xmjy_options); 
			return false; 
		});
		$("#zs_submit").click(function() { 
			$("#zs_fm").ajaxSubmit(zs_options); 
			return false; 
		});
		$("#zwpj_submit").click(function() { 
			$("#zwpj_fm").ajaxSubmit(zwpj_options); 
			return false; 
		});
		
		function getCertificateList(){
			$.post("${pageContext.request.contextPath}/certificate/findByResumeId.do",
				{resumeId:$("#idsingle").val()},
				function(result){
					var result = eval("("+result+")");
					$(".zss").empty();
					var zsxinxi="";
					for(var i=0;i<result.length;i++){
						zsxinxi += "<div class='xinxi zs' id='zs_"+result[i].id+"'>"+
						       		  "<div style='float:left'>"+
							       		  "<ul>"+
							       		 	  "<li><span>"+result[i].time+"</span>获得</li>"+
							       			  "<li style='font-weight:bold;'><span>"+result[i].name+"</span></li>"+
							       		  "</ul>"+
						       		  "</div>"+
						       		  "<div class='' style='float:right;'>"+
						       		  	  "<a href='javascript:modify(\"zs_"+result[i].id+"\")' style='color: #5cb85c'>修改</a>"+
						       		  	  "&nbsp;|&nbsp;"+
						       		  	  "<a href='javascript:deleteData(\"zs_"+result[i].id+"\")' style='color: #5cb85c'>删除</a>"+
						       		  "</div>"+
						       	   "</div>";
					}
					$(".zss").append(zsxinxi);
					$(".zss").css("display", "block");
					$(".zs_save").css("display", "none");
				});
		}
		function getEducationList(){
			$.post("${pageContext.request.contextPath}/education/findByResumeId.do",
				{resumeId:$("#idsingle").val()},
				function(result){
					var result = eval("("+result+")");
					$(".jybjs").empty();
					var jybjxinxi="";
					for(var i=0;i<result.length;i++){
						jybjxinxi += "<div class='xinxi jybj' id='jybj_"+result[i].id+"'>"+
						       		  "<div style='float:left'>"+
							       		  "<ul>"+
							       		 	  "<li><span>"+result[i].start+"</span>至</li>"+
							       		 	  "<li><span>"+result[i].end+"</span>&nbsp;&nbsp;|&nbsp;&nbsp;</li>"+
							       			  "<li style='font-weight:bold;'><span>"+result[i].school+"</span></li>"+
							       		 	  "<li class='fengeshu'>|</li>"+
							       			  "<li style='font-weight:bold;'><span>"+result[i].degree+"</span></li>"+
							       		 	  "<li class='fengeshu'>|</li>"+
							       			  "<li style='font-weight:bold;'><span>"+result[i].major+"</span></li>"+
							       		  "</ul>"+
						       		  "</div>"+
						       		  "<div class='' style='float:right;'>"+
						       		  	  "<a href='javascript:modify(\"jybj_"+result[i].id+"\")' style='color: #5cb85c'>修改</a>"+
						       		  	  "&nbsp;|&nbsp;"+
						       		  	  "<a href='javascript:deleteData(\"jybj_"+result[i].id+"\")' style='color: #5cb85c'>删除</a>"+
						       		  "</div>"+
						       	   "</div>";
					}
					$(".jybjs").append(jybjxinxi);
					$(".jybjs").css("display", "block");
					$(".jybj_save").css("display", "none");
				});
		}
		
		function getWorkExpList(){
			$.post("${pageContext.request.contextPath}/workExp/findByResumeId.do",
				{resumeId:$("#idsingle").val()},
				function(result){
					var result = eval("("+result+")");
					$(".gsjys").empty();
					var gsjyxinxi="";
					for(var i=0;i<result.length;i++){
						gsjyxinxi += "<div class='xinxi gsjy' id='gsjy_"+result[i].id+"'>"+
						       		  "<div style='float:left'>"+
							       		  "<ul>"+
							       		 	  "<li><span>"+result[i].start+"</span>至</li>"+
							       		 	  "<li><span>"+result[i].end+"</span></li>"+
							       		 	  "<li class='fengeshu'>|</li>"+
							       		 	  "<li><span style='font-weight:bold;'>"+result[i].unitName+"</span></li>"+
							       		 	  "<li class='fengeshu'>|</li>"+
							       		 	  "<li><span style='font-weight:bold;'>"+result[i].jobDept+"</span></li>"+
							       		 	  "<li class='fengeshu'>|</li>"+
							       		 	  "<li><span style='font-weight:bold;'>"+result[i].jobName+"</span></li>"+
							       		  "</ul>"+
							       		  "<ul>"+
							       		 	  "<li>单位性质：<span>"+result[i].unitNature+"</span></li>"+
							       		 	  "<li class='fengeshu'>|</li>"+
							       		 	  "<li>单位行业：<span>"+result[i].unitIndustry+"</span></li>"+
							       		 	  "<li class='fengeshu'>|</li>"+
							       		 	  "<li>单位规模：<span>"+result[i].unitScale+"</span></li>"+
							       		  "</ul>"+
							       		  "<ul>"+
							       		 	  "<li>职位类型：<span>"+result[i].jobType+"</span></li>"+
							       		 	  "<li class='fengeshu'>|</li>"+
							       		 	  "<li>待遇：<span>"+result[i].salary+"</span></li>"+
							       		  "</ul>"+
							       		  "<ul>"+
							       		 	  "<li>工作/实习描述：<span>"+result[i].jobDescription+"</span></li>"+
							       		  "</ul>"+
						       		  "</div>"+
						       		  "<div class='' style='float:right;'>"+
						       		  	  "<a href='javascript:modify(\"gsjy_"+result[i].id+"\")' style='color: #5cb85c'>修改</a>"+
						       		  	  "&nbsp;|&nbsp;"+
						       		  	  "<a href='javascript:deleteData(\"gsjy_"+result[i].id+"\")' style='color: #5cb85c'>删除</a>"+
						       		  "</div>"+
						       	   "</div>";
					}
					$(".gsjys").append(gsjyxinxi);
					$(".gsjys").css("display", "block");
					$(".gsjy_save").css("display", "none");
				});
		}
		
		function getItemExpList(){
			$.post("${pageContext.request.contextPath}/itemExp/findByResumeId.do",
				{resumeId:$("#idsingle").val()},
				function(result){
					var result = eval("("+result+")");
					$(".xmjys").empty();
					var xmjyxinxi="";
					for(var i=0;i<result.length;i++){
						xmjyxinxi += "<div class='xinxi xmjy' id='xmjy_"+result[i].id+"'>"+
						       		  "<div style='float:left'>"+
							       		  "<ul>"+
							       		 	  "<li><span>"+result[i].start+"</span>至</li>"+
							       		 	  "<li><span>"+result[i].end+"</span>&nbsp;&nbsp;|&nbsp;&nbsp;</li>"+
							       			  "<li style='font-weight:bold;'><span>"+result[i].itemName+"</span></li>"+
							       		  "</ul>"+
							       		  "<ul>"+
							       		 	  "<li>详细描述：<span>"+result[i].description+"</span></li>"+
							       		  "</ul>"+
						       		  "</div>"+
						       		  "<div class='' style='float:right;'>"+
						       		  	  "<a href='javascript:modify(\"xmjy_"+result[i].id+"\")' style='color: #5cb85c'>修改</a>"+
						       		  	  "&nbsp;|&nbsp;"+
						       		  	  "<a href='javascript:deleteData(\"xmjy_"+result[i].id+"\")' style='color: #5cb85c'>删除</a>"+
						       		  "</div>"+
						       	   "</div>";
					}
					$(".xmjys").append(xmjyxinxi);
					$(".xmjys").css("display", "block");
					$(".xmjy_save").css("display", "none");
				});
		}
		
		function getResume(param){
			$.post("${pageContext.request.contextPath}/resume/findById.do",
				{id:$("#idsingle").val()},
				function(result){
					var result = eval("("+result+")");
					if(param=="qzyx"){
						$("#qwzw span").html(result.careerThree.name);
						$("#qwdd span").html(result.province+"/"+result.city);
						$("#qwyx span").html(result.salary);
						$(".qzyx").css("display", "block");
						$(".qzyx_save").css("display", "none");
					}
					if(param=="zwpj"){
						$("#zwpj span").html(result.evaluation);
						$(".zwpj").css("display", "block");
						$(".zwpj_save").css("display", "none");
					}
				});
		}
		
		// 修改数据操作
		function modify(data){
			var strs = new Array(); 
			strs = data.split("_");
			if(strs[0]=="qzyx"){
				$(".qzyx").css("display", "none");
				$("#expectedPosition").val($("#qwzw span").html());
				$("#city").val($("#qwdd span").html());
				$("#expectedSalary").val($("#qwyx span").html());
				$(".qzyx_save").css("display", "block");
			}
			if(strs[0]=="jybj"){
				$("#jybjId").val(strs[1]);
				$("#jybj_start").val($("#jybj_"+strs[1]+" span").eq(0).html());
				$("#jybj_end").val($("#jybj_"+strs[1]+" span").eq(1).html());
				$("#jybj_school").val($("#jybj_"+strs[1]+" span").eq(2).html());
				$("#jybj_degree").val($("#jybj_"+strs[1]+" span").eq(3).html());
				$("#jybj_major").val($("#jybj_"+strs[1]+" span").eq(4).html());
				$(".jybjs").css("display", "none");
				$(".jybj_save").css("display", "block");
			}
			if(strs[0]=="gsjy"){
				$("#gsjyId").val(strs[1]);
				$("#gsjy_start").val($("#gsjy_"+strs[1]+" span").eq(0).html());
				$("#gsjy_end").val($("#gsjy_"+strs[1]+" span").eq(1).html());
				$("#gsjy_unitName").val($("#gsjy_"+strs[1]+" span").eq(2).html());
				$("#gsjy_unitNature").val($("#gsjy_"+strs[1]+" span").eq(3).html());
				$("#gsjy_unitIndustry").val($("#gsjy_"+strs[1]+" span").eq(4).html());
				$("#gsjy_unitScale").val($("#gsjy_"+strs[1]+" span").eq(5).html());
				$("#gsjy_jobName").val($("#gsjy_"+strs[1]+" span").eq(6).html());
				$("#gsjy_jobDept").val($("#gsjy_"+strs[1]+" span").eq(7).html());
				$("#gsjy_jobType").val($("#gsjy_"+strs[1]+" span").eq(8).html());
				$("#gsjy_salary").val($("#gsjy_"+strs[1]+" span").eq(9).html());
				$("#gsjy_jobDescription").val($("#gsjy_"+strs[1]+" span").eq(10).html());
				$(".gsjys").css("display", "none");
				$(".gsjy_save").css("display", "block");
			}
			if(strs[0]=="xmjy"){
				$("#xmjyId").val(strs[1]);
				$("#xmjy_start").val($("#xmjy_"+strs[1]+" span").eq(0).html());
				$("#xmjy_end").val($("#xmjy_"+strs[1]+" span").eq(1).html());
				$("#xmjy_itemName").val($("#xmjy_"+strs[1]+" span").eq(2).html());
				$("#xmjy_description").val($("#xmjy_"+strs[1]+" span").eq(3).html());
				$(".xmjys").css("display", "none");
				$(".xmjy_save").css("display", "block");
			}
			if(strs[0]=="zs"){
				$("#zsId").val(strs[1]);
				$("#zs_time").val($("#zs_"+strs[1]+" span").eq(0).html());
				$("#zs_name").val($("#zs_"+strs[1]+" span").eq(1).html());
				$(".zss").css("display", "none");
				$(".zs_save").css("display", "block");
			}
			if(strs[0]=="zwpj"){
				$(".zwpj").css("display", "none");
				$("#zwpj_evaluation").val($("#zwpj span").html());
				$(".zwpj_save").css("display", "block");
			}
		}
		
		
		// 删除数据操作
		function deleteData(data){
			var strs = new Array(); 
			strs = data.split("_");
			if(strs[0]=="jybj"){
				$.post("${pageContext.request.contextPath}/education/delete.do",
				{id:strs[1]},
				function(result){
					var result = eval("("+result+")");
					if(result.success){
						getEducationList();
					}
				});
			}
			if(strs[0]=="gsjy"){
				$.post("${pageContext.request.contextPath}/workExp/delete.do",
				{id:strs[1]},
				function(result){
					var result = eval("("+result+")");
					if(result.success){
						getWorkExpList();
					}
				});
			}
			if(strs[0]=="xmjy"){
				$.post("${pageContext.request.contextPath}/itemExp/delete.do",
				{id:strs[1]},
				function(result){
					var result = eval("("+result+")");
					if(result.success){
						getItemExpList();
					}
				});
			}
			if(strs[0]=="zs"){
				$.post("${pageContext.request.contextPath}/certificate/delete.do",
				{id:strs[1]},
				function(result){
					var result = eval("("+result+")");
					if(result.success){
						getCertificateList();
					}
				});
			}
		}
		
		// 取消操作
		function quxiao(data){
			if(data=="qzyx"){
				$(".qzyx_save").css("display", "none");
				$(".qzyx").css("display", "block");
			}
			if(data=="jybj"){
				$(".jybj_save").css("display", "none");
				$(".jybjs").css("display", "block");
			}
			if(data=="gsjy"){
				$(".gsjy_save").css("display", "none");
				$(".gsjys").css("display", "block");
			}
			if(data=="xmjy"){
				$(".xmjy_save").css("display", "none");
				$(".xmjys").css("display", "block");
			}
			if(data=="zs"){
				$(".zs_save").css("display", "none");
				$(".zss").css("display", "block");
			}
			if(data=="zwpj"){
				$(".zwpj_save").css("display", "none");
				$(".zwpj").css("display", "block");
			}
		}
		
		// 添加数据操作
		function addData(data){
			if(data=="jybj"){
				$("#jybjId").val("");
				$(".jybjs").css("display", "none");
				$(".jybj_save").css("display", "block");
				$(".resume_03 .neirong").show();
			}
			if(data=="gsjy"){
				$("#gsjyId").val("");
				$(".gsjys").css("display", "none");
				$(".gsjy_save").css("display", "block");
				$(".resume_04 .neirong").show();
			}
			if(data=="xmjy"){
				$("#xmjyId").val("");
				$(".xmjys").css("display", "none");
				$(".xmjy_save").css("display", "block");
				$(".resume_05 .neirong").show();
			}
			if(data=="zs"){
				$("#zsId").val("");
				$(".zss").css("display", "none");
				$(".zs_save").css("display", "block");
				$(".resume_06 .neirong").show();
			}
		}
		
		// 专业下拉框
		function depChange(){
			var depId = $("#dep").find("option:selected").val();
			$("#major").empty();
			$("."+depId+"").each(function(){
				$("#major").append("<option value='"+$(this).attr("name")+"'>"+$(this).attr("value")+"</option>")
			});
		}
		
		//命名
		function mingming(){
			$("#resumeName").hide();
			$("#jlmc").val($("#resumeName").html());
			$("#jlmc").show();
		}
		
		//更新简历名
		function updateResumeName(){
			$.post("${pageContext.request.contextPath}/resume/save.do",
				{id:$("#idsingle").val(),resumeName:$("#jlmc").val()},
				function(result){
					$("#jlmc").hide();
					$("#resumeName").html($("#jlmc").val());
					$("#resumeName").show();
				});
		}
	</script>
</body>
</html>