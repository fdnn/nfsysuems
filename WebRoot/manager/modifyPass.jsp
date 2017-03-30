<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/jquery-easyui-1.3.3/jquery.edatagrid.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resource/js/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/md5.js"></script>  
<script type="text/javascript">
	function submit(){
		if($("#newPass").val()==""){
			alert("新密码不能为空");
			return false;
		}else if($("#repetPass").val()==""){
			alert("重复密码不能为空");
			return false;
		}else if($("#newPass").val()!=$("#repetPass").val()){
			alert("2次密码输入不一致！");
			return false;
		}else{
			var userPassword = hex_md5($("#newPass").val());
			var oldPass=$("#oldPass").val();
			var newPass=$("#newPass").val();
			$.post("${pageContext.request.contextPath}/admin/updatePassword.do",
				{oldPass:oldPass,newPass:newPass},
				function(result){
					if(result.resultCode == "_0"){
						layer.msg(result.resultTipMsg, {icon: 0});
					}else{ 
						layer.msg(result.resultTipMsg, {icon: 6});
					}
				});
		}
	};
</script>
</head>
<body style="margin: 10px">

<div id="p" class="easyui-panel" title="修改个人信息" style="padding: 10px">
	<form id="form">
		<table cellspacing="20px">
			<tr>
				<td width="80px">旧密码：</td>
				<td>
					<input type="text" id="oldPass" name="oldPass" style="width: 200px"  />
				</td>
			</tr>
			<tr>
				<td>新密码：</td>
				<td>
					<input type="text" id="newPass" name="newPass" style="width: 200px"  />
				</td>
			</tr>
			<tr>
				<td>重复密码：</td>
				<td>
					<input type="text" id="repetPass" name="repetPass" style="width: 200px"  />
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