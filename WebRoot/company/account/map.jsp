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
<style type="text/css">
	.head_nav{
		position: relative;
	}
    body,html{
        height: 100%;
        margin: 0px;
        font: 12px Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;
    }
    #container{
        height: 50%;
        width: 50%;
    }
    .title{
        margin: 0px;
        color: #666;
        font-size: 14px;
        background-color: #eee;
        border-bottom: solid 1px silver;
        line-height: 26px;
        padding: 0px 0 0 6px;
        font-weight: lighter;
        letter-spacing: 1px
    }
    .content{
        padding: 4px;
        color: #666;
        line-height: 23px;
    }
    .content img{
        float: left;
        margin: 3px;
    }
</style>
</head>
<body>

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
					        <a href="${pageContext.request.contextPath}/company/account/dynamic.jsp"><li><p>企业动态</p></li></a>
					        <a href="${pageContext.request.contextPath}/company/account/map.jsp"><li  class="nav_active" ><p>地图标注</p></li></a>
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
				                <h4 style="float: none">地图标注</h4>
				            </div>
                        	<input id="idc" hidden value="${currentUser.id }" />
                        	<input id="lnglat" hidden value="${currentUser.lnglat }" />
				            <p style="margin: 10px;font-size: 13px;">请在地图上用鼠标单击来标注您的具体位置，然后点击“保存位置”。</p>
				            <iframe style="width: 100%;height: 400px;border:1px solid #e5e5e5" src="mapfull.jsp"></iframe>
				        </div>
				    </div>
				</div>
			</div>
		</div>
	</div>

<!-- 低部 -->
<jsp:include page="../../common/footer.jsp"></jsp:include>

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function saveLnglat(param){
		$.post("${pageContext.request.contextPath}/user/saveManage.do",
			{id:$("#idc").val(),lnglat:param},
			function(result){
				var result = eval("("+result+")");
				if(result.success){
					$.post("${pageContext.request.contextPath}/user/updateSessionForCurrentUser.do",{},function(result){})
					layer.msg('地图标注成功', {icon: 6});
				}else{ 
					layer.msg('地图标注失败', {icon: 5});
				}
			})
	}
</script>
</body>
</html>