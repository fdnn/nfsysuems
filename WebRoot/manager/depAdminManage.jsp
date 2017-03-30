<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	 var userName=$("#s_userName").val();
	 var depId=$("#s_dep").combobox("getValue");
	 var authority=$("#s_authority").combobox("getValue");
	 $("#dg").datagrid({
	 	url:'${pageContext.request.contextPath}/user/list.do',
	    queryParams:{
	    	"userName":userName,
	    	"dep.id":depId,
	    	"role":'2',
	    	"authority":authority
	    }
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
	 if(${currentUser.authority==0 }){
		 if(row.authority==0){
			 $.messager.alert("系统提示","你没有权限修改！");
			 return;
		 }
	 }else if(${currentUser.authority==1 }){
		 if(row.authority==0 || row.authority==1){
			 $.messager.alert("系统提示","你没有权限修改！");
			 return;
		 }
	 }
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
	 $("#s_dep").combobox("clear");
	 $("#s_authority").combobox("clear");
 }
 $(function(){
	 resetSearch();
 })
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
		 var row = selectedRows[i];
		 if(${currentUser.authority==0 }){
			 if(row.authority==0){
				 $.messager.alert("系统提示","你没有权限删除！");
				 return;
			 }
		 }else if(${currentUser.authority==1 }){
			 if(row.authority==0 || row.authority==1){
				 $.messager.alert("系统提示","你没有权限删除！");
				 return;
			 }
		 }
		 strIds.push(row.id);
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
 function formatAuthority(val){
	 if(val==0){
		 return "顶级管理员";
	 }else if(val==1){
		 return "系高级管理员";
	 }else if(val==2){
		 return "系普通管理员";
	 }
 }
 function own(v,r){
	var currentUserId=${currentUser.id};
	var rId=r.id;
	if(currentUserId==rId) {
		return '<span style="color:#0000ff">'+v+'(本人)</span>';}
	else {
		return v;}
 }
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
 <table id="dg" title="系管理员信息管理" class="easyui-datagrid" style="background-color:#000"
   fitColumns="true" pagination="true" rownumbers="true" striped="true" 
   checkOnSelect="true" selectOnCheck="true" fit="true"
   url="${pageContext.request.contextPath}/user/list.do?role=2"
   toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="userName" width="50" align="center" editor="text">用户名/编号</th>
   		<th field="password" width="50" align="center" editor="text">密码</th>
   		<th field="trueName" width="50" align="center" editor="text" data-options="formatter:own">真实姓名</th>
   		<th field="dep" width="50" align="center" data-options="formatter:function(v){if(v!=null){return v.name}else{return ''}}">系</th>
   		<th field="email" width="50" align="center" editor="text">电子邮箱</th>
   		<th field="qq" width="30" align="center" editor="text">QQ</th>
   		<th field="phone" width="40" align="center" editor="text">联系电话</th>
   		<th field="authority" width="40" align="center" editor="text" formatter="formatAuthority">身份</th>
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
 		&nbsp;用户名/编号：&nbsp;<input class="easyui-textbox" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
 		&nbsp;系：&nbsp;<input class="easyui-combobox" id="s_dep" name="s_dep" data-options="panelHeight:'auto',editable:false,
               			valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/dep/list.do'" />
        &nbsp;身份：&nbsp;<select class="easyui-combobox" panelHeight="auto" editable="false" id="s_authority" name="s_authority">
        				  <c:choose>
        				  	<c:when test="${currentUser.authority==0 }">
							  <option value="0">顶级管理员</option>
        				  	</c:when>
        				  </c:choose>
						  <option value="1">系高级管理员</option>
						  <option value="2">系普通管理员</option>
						</select>	
 		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 		<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">重置</a>
 	</div>
 </div>
 
 <div id="dlg" class="easyui-dialog" style="width:350px;height:280px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>用户名/编号：</td>
   			<td><input type="text" id="userName" name="userName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>密码：</td>
   			<td><input type="text" id="password" name="password" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>真实姓名：</td>
   			<td><input type="text" id="trueName" name="trueName" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<c:choose>
			<c:when test="${currentUser.authority==0 }">
		   		<tr>
					<td>系：</td>
					<td>
						<input class="easyui-combobox" id="dep.id" name="dep.id" data-options="panelHeight:'auto',editable:false,
		               			valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/dep/list.do'" />
					</td>
				</tr>
			</c:when>
		</c:choose>
   		<tr>
   			<td valign="top">身份：</td>
   			<td>
   			<input type="hidden" name="role" value="2" />
	   		<c:choose>
				<c:when test="${currentUser.authority==0 }">
					<input type="radio" id="authority" name="authority" value="0" checked>顶级管理员</input><br>
					<input type="radio" id="authority" name="authority" value="1">系高级管理员</input>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="dep.id" value="${currentUser.dep.id }" />
					<input type="radio" id="authority" name="authority" value="2" checked>${currentUser.dep.name }-普通管理员</input>
				</c:otherwise>
			</c:choose>
			</td>
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