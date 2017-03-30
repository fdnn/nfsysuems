<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
 var url;
 function searchUser(){
	 $("#dg").datagrid('load',{
		"userName":$("#s_userName").val(),
		"nature":$("#s_nature").val(),
		"scale":$("#s_scale").val()
	 });
 }
 
 function openUserAddDialog(){
	 $("#dlg").dialog("open").dialog("setTitle","添加用户信息");
	 url="${pageContext.request.contextPath}/user/saveManage.do";
 }
 
 function openUserModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 $("#dlg").dialog("open").dialog("setTitle","编辑用户信息");
	 $("#fm").form("load",{
		 userName:row.userName,
		 password:row.password,
		 trueName:row.trueName
	 });
	 url="${pageContext.request.contextPath}/user/saveManage.do?id="+row.id;
 }
 
 function saveUser(){
	 $("#fm").form("submit",{
		url:url,
		onSubmit:function(){
			return $(this).form("validate");
		},
		success:function(result){
			var result=eval('('+result+')');
			if(result.success){
				$.messager.alert("系统提示","保存成功！");
				resetValue();
				$("#dlg").dialog("close");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("系统提示","保存失败！");
				return;
			}
		}
	 });
 }
 
 function resetValue(){
	 $("#userName").val("");
	 $("#password").val("");
	 $("#trueName").val("");
 }
 function resetSearch(){
	 $("#s_userName").val("");
	 $("#s_nature").val("");
	 $("#s_scale").val("");
 }
 function closeUserDialog(){
	 $("#dlg").dialog("close");
	 resetValue();
 }
 //删除用户
 function deleteUser(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要删除的数据！");
		 return;
	 }
	 var strIds=[];
	 for(var i=0;i<selectedRows.length;i++){
		 strIds.push(selectedRows[i].id);
	 }
	 var ids=strIds.join(",");
	 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/user/delete.do",{ids:ids},function(result){
				if(result.success){
					 $.messager.alert("系统提示","数据已成功删除！");
					 $("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","数据删除失败，请联系系统管理员！");
				}
			},"json");
		} 
	 });
 }
$(function(){
	$('#dg').datagrid({
		view: detailview,
		detailFormatter: function(rowIndex, rowData){
			var detail='<table><tr>' +
						'<td rowspan=3 style="border:0">';
			if(rowData.pic!=null && rowData.pic!=""){
				detail+='<img src="${pageContext.request.contextPath}/userImages/touxiang/' + rowData.pic+'"';
			}else{
				detail+='<img src="${pageContext.request.contextPath}/static/images/touxiang.jpg"';
			}
				detail+=' width="70"></td>' +
						'<td style="border:0">' +
							'<p>&nbsp;&nbsp;联系人：' + rowData.linkman + ' | 固定电话：'+rowData.tel+' | 联系手机：'+rowData.phone+' | 联系邮箱：'+rowData.email+'</p>' +
							'<p>&nbsp;&nbsp;详细地址： ' + rowData.address + ' | 经纬度：'+ rowData.lnglat +'</p>'+
						'</td>' +
					   '</tr></table>';
		   return detail;
		}
	});
});
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
 <table id="dg" title="企业信息管理" class="easyui-datagrid" style="background-color:#000"
   fitColumns="true" pagination="true" rownumbers="true" striped="true" 
   checkOnSelect="true" selectOnCheck="true" fit="true"
   url="${pageContext.request.contextPath}/user/list.do?role=1"
   toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="userName" width="50" align="center" editor="text">企业账号</th>
   		<th field="password" width="50" align="center" editor="text">密码</th>
   		<th field="trueName" width="70" align="center" editor="text">企业名称</th>
   		<th field="nature" width="40" align="center" editor="text">企业性质</th>
   		<th field="industryname" width="50" align="center" editor="text" data-options="formatter:function(v,r){return r.careerTwo.name}">所属行业</th>
   		<th field="scale" width="40" align="center" editor="text">企业规模</th>
   		<th field="url" width="60" align="center" editor="text" data-options="formatter:function(v){if(v!=null){return '<a href='+v+' target=_blank>'+v+'</a>'}else{return ''}}">企业网址</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	<div>
 		&nbsp;企业账号：&nbsp;<input type="text" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
 		&nbsp;企业性质：&nbsp;<input type="text" id="s_nature" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
 		&nbsp;企业规模：&nbsp;<select id="s_scale" style="width:150px;">
 								<option value=""></option>
 								<option value="50人以下">50人以下</option>
 								<option value="51-149人">51-149人</option>
 								<option value="150-499人">150-499人</option>
 								<option value="500-999人">500-999人</option>
 								<option value="1000-4999人">1000-4999人</option>
 								<option value="5000-9999人">5000-9999人</option>
 								<option value="10000人以上">10000人以上</option>
 							</select>
 		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 		<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">重置</a>
 	</div>
 </div>
 
 <div id="dlg" class="easyui-dialog" style="width:320px;height:230px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<input hidden name="role" id="role" value="1" />
   			<td>企业账号：</td>
   			<td><input type="text" id="userName" name="userName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>密码：</td>
   			<td><input type="text" id="password" name="password" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>企业名称：</td>
   			<td><input type="text" id="trueName" name="trueName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
</body>
</html>