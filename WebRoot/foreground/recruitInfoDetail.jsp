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
            <a class="active" href="${pageContext.request.contextPath}/foreground/recruitInfo.jsp">招聘信息</a>
            <a href="${pageContext.request.contextPath}/foreground/resume.jsp">求职信息</a>
            <a href="${pageContext.request.contextPath}/foreground/company.jsp">名企荟萃</a>
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
                        <div class="right">
                        </div>
                        <h3 style="padding-bottom: 10px;">${recruitInfo.name }</h3>
                        <a href="${pageContext.request.contextPath}/user/detail.do?userId=${recruitInfo.user.id }" style="padding-bottom: 10px;font-size: 16px;color: #0074AA;">${recruitInfo.user.trueName }</a>
                        <div style="margin-top: 13px;">
                        	<c:forTokens  items="${recruitInfo.welfare }" var="welfare" delims=",">
                        		<span class="label label-info">${welfare }</span>
                        	</c:forTokens >
                        </div>
                    </div>
                    <hr>
                    <div class="basicinfo">
                        <table class="talbe" style="width:100%;font:14px/26px 'simsun';">
                            <tr>
                                <td width="50%">职位月薪：<span>${recruitInfo.salary }</span></td>
                                <td width="50%">工作地点：<span>${recruitInfo.province }-${recruitInfo.city }</span></td>
                            </tr>
                            <tr>
                                <td width="50%">更新时间：<span><fmt:formatDate value='${recruitInfo.refreshDate }' pattern='YYYY-MM-dd'/></span></td>
                                <td width="50%">招聘人数：<span>${recruitInfo.recruitNum }人</span></td>
                            </tr>
                            <tr>
                                <td width="50%">职位性质：<span>${recruitInfo.nature }</span></td>
                                <td width="50%">职位类别：<span>${recruitInfo.careerThree.careerTwo.name }/${recruitInfo.careerThree.name }</span></td>
                            </tr>
                            <tr>
                                <td width="50%">性别要求：<span>${recruitInfo.sex }</span></td>
                                <td width="50%">学历要求：<span>${recruitInfo.degree }</span></td>
                            </tr>
                            <tr>
                                <td width="50%">工作经验：<span>${recruitInfo.workExp }年</span></td>
                            </tr>
                        </table>
                    </div>
                    <hr>
                        <h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">职位描述</h5>
                        <div style="padding: 15px 10px 0 10px;font:13px/24px 'simsun'">
                        	${recruitInfo.description }
                        </div>
                    <hr>
                        <h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">企业介绍</h5>
                        <div style="padding: 15px 10px 0 10px;font:13px/24px 'simsun'">
                            ${recruitInfo.user.introduction }
                        </div>
                </div>
            </div>
            <div class="col-md-4">
                <div style="background-color: #fff;border: 1px solid #e6e6e6;border-top:2px solid #0074AA;padding: 20px 13px 13px 13px;">
                    <h5 style="font-weight: bold;font-family: 'SimSun';border-left: 3px solid #3d9ccc;padding-left: 7px;">企业信息</h5>
                    <div style="padding:10px;text-align:center;"><a href="${pageContext.request.contextPath}/user/detail.do?userId=${recruitInfo.user.id }" style="font-size: 16px;color: #0074AA;">${recruitInfo.user.trueName }</a></div>
                    <div class="companysimpleinfo">
                        <div class="infotxt">
                            <span class="left">行业：</span>
                            <div>${recruitInfo.user.careerTwo.name }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">规模：</span>
                            <div>${recruitInfo.user.scale }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">性质：</span>
                            <div>${recruitInfo.user.nature }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">联系人：</span>
                            <div>${recruitInfo.user.linkman }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">固定电话：</span>
                            <div>${recruitInfo.user.tel }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">联系手机：</span>
                            <div>${recruitInfo.user.phone }</div>
                        </div>
                        <div class="infotxt">
                            <span class="left">地址：</span>
                            <div>${recruitInfo.user.address }</div>
                        </div>
                        <input id="lnglat" hidden value="${recruitInfo.user.lnglat }" />
                        <iframe style="width: 100%;height: 300px;border:1px solid #e5e5e5;margin-top: 5px;" src="${pageContext.request.contextPath}/foreground/mapfull.jsp"></iframe>
                    </div>
                </div>
            </div>
        </div>
	</div>
	
	<%--选择简历--%>
	<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" style="width: 300px;" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="exampleModalLabel">申请职位</h4>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group" align="center">
                                	<table align="center">
                                		<tr>
                                			<td style="">投递的简历:&nbsp;&nbsp;</td>
                                			<td>
                                				<select id="applySelect">
													
												</select>
											</td>
                                		</tr>
                                	</table>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" onclick="applyCareer()">保存</button>
                        </div>
                    </div>
                </div>
            </div>
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
	<script type="text/javascript">
		$(function(){
			if(${currentUser.role==0 }){
				$.post("${pageContext.request.contextPath}/applyRecord/findByUserIdAndRecruitInfoId.do",{recruitInfoId:${recruitInfo.id }},function(result){
					var result = eval("("+result+")");
					if(result.isApply){
						var q = "<input type='button' onclick='apply();' data-toggle='modal' data-target='#applyModal' class='btn btn-warning sq' value='立即申请' style='padding:6px 20px; ' />&nbsp;&nbsp;";
						$(".recruit_title .right").append(q);
					}else{
						var q = "<input type='button' disabled='disabled' class='btn btn-defalut' style='' value='已申请' style='padding:6px 20px; ' />&nbsp;&nbsp;";
						$(".recruit_title .right").append(q);
					}
					
					if(result.isStore){
						var t = "<input type='button' onclick='sc();' class='btn btn-success sc' style='' value='收藏' style='padding:6px 20px; ' />";
						$(".recruit_title .right").append(t);
					}else{
						var t = "<input type='button' disabled='disabled' class='btn btn-defalut' style='' value='已收藏' style='padding:6px 20px; ' />";
						$(".recruit_title .right").append(t);
					}
					
				});
			}
		});
		function sc(){
			$.post("${pageContext.request.contextPath}/applyRecord/save.do",{recruitInfoId:${recruitInfo.id },methor:0},function(result){
				$(".sc").attr("disabled","disabled");
				$(".sc").removeClass("btn-success");
				$(".sc").addClass("btn-defalut");
				$(".sc").val("已收藏");
				layer.msg('收藏成功', {icon: 6});
			});
		}
		function apply(){
			$.post("${pageContext.request.contextPath}/resume/findByUserId.do",
			{},
			function(result){
				var result = eval("("+result+")");
				var context="";
				$("#applySelect").empty();
				for(var i=0;i<result.length;i++){
	                  context += "<option value='"+result[i].id+"'>"+result[i].resumeName+
				                 "</option>";
				}
				if(result.length==0){
					layer.msg('您还未创建简历', {icon: 5});
					$('#applyModal').modal('hide');
				}
				$("#applySelect").append(context);
			});
		}
		function applyCareer(){
			$.post("${pageContext.request.contextPath}/applyRecord/save.do",{recruitInfoId:${recruitInfo.id },resumeId:$("#applySelect").val(),methor:1},function(result){
				$(".sq").attr("disabled","disabled");
				$(".sq").removeClass("btn-warning");
				$(".sq").addClass("btn-defalut");
				$(".sq").val("已申请");
				$('#applyModal').modal('hide');
				layer.msg('职位申请成功，请静候佳音！', {icon: 6});
			});
		}
	</script>
</body>
</html>