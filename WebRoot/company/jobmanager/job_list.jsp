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
					        <a href="${pageContext.request.contextPath}/company/account/basicinfo.jsp"><li><p>基本资料</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/account/security.jsp"><li ><p>账号安全</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/account/dynamic.jsp"><li ><p>企业动态</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/account/map.jsp"><li ><p>地图标注</p></li></a>
					    </ul>
					</div>
					<div style="margin-top: 10px;"></div>
					<div class="container_nav">
					    <ul>
					        <h4>职位管理</h4>
					        <a href="${pageContext.request.contextPath}/company/jobmanager/job_list.jsp"><li class="nav_active"><p>管理职位</p></li></a>
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
				            	<input hidden id="userId" value="${currentUser.id }" />
				                <h4 style="float: none">管理职位</h4>
				            </div>
				            <div class="main_list" class="container-fluid">
				            	<div class="list">
					                <div class="list_top">
					                    <div class="row" style='margin-right:0'>
										  <div class="col-md-5">职位名称</div>
										  <div class="col-md-3">创建时间</div>
										  <div class="col-md-2">状态</div>
										  <div class="col-md-1">修改</div>
										  <div class="col-md-1">删除</div>
										</div>
				                	</div>
					                <div class="list_context">
					                </div>
					                
					                <input type="button" class="btn btn-primary" onclick="listToSingle(-1)" style="margin:10px;" value="添加" />
				                </div>
				                
				                <div class="make_context" style="display:none">
				                	<form id="fm">
				                		<input name="id" id="idc" hidden value=""/>
					                	<div class="zwxx">
						                	<div class="head">
									            <h5>职位信息
									            	<a href="javascript:slideToggle('zwxx')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
									       		</h5>
							        		</div>
						        		
							        		<div class="neirong">
										        <table class="content" width="100%" style="display: block;">
														<tbody>
												            <tr>
												                <th width="20%"><span style="color:red">*</span>职位名称：</th>
												                <td width="30%"><input name="name" type="text" id="name" onblur=""></td>
												                <td></td>
												                <td></td>
												            </tr>
												            <tr>
												                <th><span style="color:red">*</span>职位性质：</th>
												                <td><input name="nature" type="text" id="nature" onblur=""></td>
												            </tr>
												            <tr>
												                <th><span style="color:red">*</span>职位类别：</th>
												                <td>
													                <input class="nation expectedPosition" placeholder="请选择类别" type="text" size="30" value="" data-value="" onclick="appendhyznbar(this,'danxuan');" />
													                <input hidden name="careerThree.id" class="zn" />
												                </td>
												            </tr>
												            <tr>
												                <th><span style="color:red"></span>工作地区：</th>
												                <td>
													                <select name="province" style="width:100px;height: 25px;float:left" id="province" onchange="javascript:selectchange(province,city);"></select>
					                                        		<select name="city" id="city" style="width:100px;height: 25px;"></select>
																</td>
												            </tr>
												            <tr>
												                <th><span style="color:red">*</span>招聘人数：</th>
												                <td><input name="recruitNum" type="text" id="recruitNum" onblur="" maxlength="8"></td>
												            </tr>
												            <tr>
												                <th><span style="color:red">*</span>薪资待遇：</th>
												                <td><input name="salary" type="text" id="salary" onblur="" maxlength="8"></td>
												            </tr>
												            <tr>
												                <th>福利待遇：</th>
												                <td><input name="welfare" type="text" id="welfare" onblur="" maxlength="8"></td>
												            </tr>
											            </tbody>
										        </table>
									        </div>
								        </div>
								        
								        <div class="zwyq">
						                	<div class="head">
									            <h5>职位要求
									            	<a href="javascript:slideToggle('zwyq')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
									       		</h5>
							        		</div>
						        		
							        		<div class="neirong">
										        <table class="content" width="100%" style="display: block;">
														<tbody>
												            <tr>
												                <th width="20%"><span style="color:red">*</span>性别要求：</th>
												                <td width="30%"><input name="sex" type="text" id="sex" onblur=""></td>
												                <td></td>
												                <td></td>
												            </tr>
												            <tr>
												                <th><span style="color:red">*</span>学历要求：</th>
												                <td><input name="degree" type="text" id="degree" onblur=""></td>
												            </tr>
												            <tr>
												                <th><span style="color:red">*</span>工作经验：</th>
												                <td><input name="workExp" type="text" id="workExp" onblur="" maxlength="8"></td>
												            </tr>
											            </tbody>
										        </table>
									        </div>
								        </div>
								        
								        <div class="zwms">
						                	<div class="head">
									            <h5>职位描述
									            	<a href="javascript:slideToggle('zwms')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
									       		</h5>
							        		</div>
						        		
							        		<div class="neirong">
										        <table class="content" width="100%" style="display: block;">
														<tbody>
											            	<tr>
												                <td>
												                    <textarea name="description" id="description" cols="87" rows="5" maxlength="1000"></textarea>
												                </td>
												            </tr>
											            </tbody>
										        </table>
									        </div>
								        </div>
								        
								        <div class="lxfs">
						                	<div class="head">
									            <h5>联系方式
									            	<a href="javascript:slideToggle('lxfs')"><span style="float:right;padding:8px;color:#5cb85c" class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></a>
									       		</h5>
							        		</div>
						        		
							        		<div class="neirong">
										        <table class="content" width="100%" style="display: block;">
														<tbody>
											            	<tr>
												                <th width="20%"><span style="color:red">*</span>联系人：</th>
												                <td width="30%"><input name="linkman" type="text" id="linkman" onblur=""></td>
												                <td></td>
												                <td></td>
												            </tr>
												            <tr>
												                <th><span style="color:red">*</span>固定电话：</th>
												                <td><input name="tel" type="text" id="tel" onblur=""></td>
												            </tr>
												            <tr>
												                <th>联系手机：</th>
												                <td><input name="phone" type="text" id="phone" onblur="" maxlength="8"></td>
												            </tr>
												            <tr>
												                <th><span style="color:red">*</span>联系邮箱：</th>
												                <td><input name="email" type="text" id="email" onblur=""></td>
												            </tr>
												            <tr>
												                <th><span style="color:red">*</span>联系地址：</th>
												                <td><input name="linkAddress" type="text" id="linkAddress" onblur=""></td>
												            </tr>
											            </tbody>
										        </table>
									        </div>
								        </div>
								        <hr>
								        <input class="btn btn-success" id="publish" type="button"
					                           value="&nbsp;&nbsp;发布&nbsp;&nbsp;"/>
					                    &nbsp;&nbsp;
					                    <input class="btn btn-default" onclick="returnList()" type="button"
					                           value="&nbsp;&nbsp;返回&nbsp;&nbsp;"/>
			                            <input type="reset" name="reset" style="display: none;" />
			                        </form>
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
		recruitInfoList();
	})
	function recruitInfoList(){
		$.post("${pageContext.request.contextPath}/recruitInfo/findByUserId.do",
		{userId:$("#userId").val()},
		function(result){
			var result = eval("("+result+")");
			var context="";
			$(".list_context").empty();
			/* alert(result[0].attachResume); */
			for(var i=0;i<result.length;i++){
                  context += "<div class='list_content' style='font-family:SimSun'>"+
                  				 "<div class='row' style='margin-right:0'>"+
								 "<div style='font-size:13px;text-align:left;font-family:SimSun' class='col-md-5 title_"+result[i].id+"'>"+
								 	"<div style='margin:0 0 0 10px;text-align:left;'><a style='color:#0180cf;font-family:SimSun'>"+result[i].name+"</a></div>"+
								 	"<p style='margin:0 0 0 10px;'>简历投递数："+result[i].resumeNum+" | "+
								 	"浏览次数："+result[i].viewedNum+"</p>"+
							 	 "</div>"+
								 "<div class='col-md-3' style='height:37px;line-height:37px;'>"+result[i].refreshDate+"  </div>"+
								 "<div class='col-md-2' style='height:37px;line-height:37px;'>"+result[i].state+"</div>"+
								 "<div class='col-md-1'><a href='javascript:listToSingle("+result[i].id+")'><span style='height:37px;line-height:37px;' class='glyphicon glyphicon-tags'></span></a></div>"+
								 "<div class='col-md-1'><a href='javascript:deleteRecruitInfo("+result[i].id+")'><span style='height:37px;line-height:37px;' class='glyphicon glyphicon-trash'></span></a></div>"+
								 "</div>"+
			                 "</div>";
			}
			$(".list_context").append(context);
		});
	}
	function deleteRecruitInfo(param){
		$.post("${pageContext.request.contextPath}/recruitInfo/delete.do",{id:param},function(result){
			layer.msg('删除成功', {icon: 6});
			recruitInfoList();
		});
	}
	function returnList(){
		$(".make_context").css("display","none");	
		$(".list").css("display","block");
		$("#idc").val("");
		$("input[type=reset]").trigger("click");
	}
	function listToSingle(param){
		$(".list").css("display","none");
		$(".make_context").css("display","block");
		if(param!="-1"){
			$.post("${pageContext.request.contextPath}/recruitInfo/findById.do",
			{id:param},
			function(result){
				var result = eval("("+result+")");
				$("#idc").val(param);
				$("#name").val(result.name);
				$("#nature").val(result.nature);
				if(result.careerThree!=null){
					$(".expectedPosition").attr('placeholder', result.careerThree.name);
				}
				$("#type").val(result.type);
				if(result.province!="" && result.city!=""){
					$("#province").val(result.province);
					$("#province").change();
					$("#city").val(result.city);
				}
				$("#recruitNum").val(result.recruitNum);
				$("#salary").val(result.salary);
				$("#welfare").val(result.welfare);
				$("#sex").val(result.sex);
				$("#degree").val(result.degree);
				$("#workExp").val(result.workExp);
				$("#description").val(result.description);
				$("#linkman").val(result.linkman);
				$("#tel").val(result.tel);
				$("#phone").val(result.phone);
				$("#email").val(result.email);
				$("#linkAddress").val(result.linkAddress);
			})
		}
	}
	function slideToggle(param){  
		$("."+param+" .neirong").slideToggle(0);//窗帘效果的切换,点一下收,点一下开
	}
	var options = {
			url:"${pageContext.request.contextPath}/recruitInfo/save.do",
			type: 'post',
			clearForm: true,
			success: function(data) {
				layer.msg('发布成功', {icon: 6});
				$(".make_context").css("display","none");
				$(".list").css("display","block");
				recruitInfoList();
           	}
		}
	$("#publish").click(function() { 
		if($("#name").val() == "" || 
				$("#nature").val() == "" || 
				typeof($(datazninput).data("value"))=="undefined" || 
				$("#recruitNum").val() == "" || 
				$("#salary").val() == "" || 
				$("#welfare").val() == "" || 
				$("#sex").val() == "" ||
				$("#degree").val() == "" || 
				$("#workExp").val() == "" || 
				$("#linkman").val() == "" || 
				$("#tel").val() == "" || 
				$("#email").val() == "" || 
				$("#linkAddress").val() == ""){
			layer.msg('必填（*）参数不能为空', {icon: 5});
		}else{
			$(".zn").val($(datazninput).data("value").split(",")[2]);
			$("#fm").ajaxSubmit(options); 
		}
		return false; 
	});
</script>
</body>
</html>