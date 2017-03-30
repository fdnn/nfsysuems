<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.edatagrid.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/datagrid-detailview.js"></script>

<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
<script type="text/javascript">
	function submit(){ 
		var trueName=$("#trueName").val();
		if(trueName==null || trueName==''){
			alert("请输入真实姓名！");
		}else{
			$("#form").ajaxSubmit(options); 
		}
		return false; 
	};
	var options = {
			url:"${pageContext.request.contextPath}/admin/saveInfo.do",
			type: 'post',
			success: function(data) {
				layer.msg('保存成功', {icon: 6});
	           	}
		}
</script>
</head>
<body style="margin: 10px">

<div id="p" class="easyui-panel" title="修改个人信息" style="padding: 10px">
	<form id="form" action="${pageContext.request.contextPath}/user/save.do" method="post" enctype="multipart/form-data">
		<table cellspacing="20px">
			<%--<tr>
				<td width="80px">用户名：</td>
				<td>
					<input type="hidden" id="id" name="id" value="${currentUser.id }"/>
					<input type="text" id="userName" name="userName" style="width: 200px" value="${currentUser.userName }" readonly="readonly" />
				</td>
			</tr>
			--%><tr>
				<td>真实姓名：</td>
				<td>
					<input type="text" value="${currentUser.trueName}" id="trueName" name="trueName" style="width: 200px"  />
				</td>
			</tr>
			<tr>
				<td>个人头像：</td>
				<td>
					<input type="file" id="file_pic" name="file_pic"/>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<c:choose>
						<c:when test="${currentUser.pic == ''}">
							<img width="100px" src="${pageContext.request.contextPath}/static/images/touxiang.jpg" />
						</c:when>
						<c:otherwise>
							<img width="100px" id="pic" src="${pageContext.request.contextPath}/userImages/touxiang/${currentUser.pic}" />
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<a href="javascript:submit()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
				</td>
			</tr>
		</table>
	</form>
</div>
<script src="http://malsup.github.io/jquery.form.js"></script>
</body>
</html>