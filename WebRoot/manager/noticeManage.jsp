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
 function searchNotice(){
	 $("#dg").datagrid('load',{
		"user.trueName":$("#s_trueName").val(),
		"user.dep.id":$("#s_dep").combobox("getValue")	
	 });
 }

 function openNoticeAddDialog(){
	 window.parent.openTab('通知详情','noticeDetail.jsp','icon-jlgl');
 }
 
 function openNoticeModifyDialog(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length!=1){
		 $.messager.alert("系统提示","请选择一条要编辑的数据！");
		 return;
	 }
	 var row=selectedRows[0];
	 var currentUserId = ${currentUser.id};
	 var rowUserId = row.user.id;
	 if(${currentUser.authority==0 }){
		 //alert(typeof ${currentUser.id});
		 if(currentUserId!=rowUserId){
			 if(row.user.authority==0){
				 $.messager.alert("系统提示","你没有权限修改！");
				 return;
			 }
		 }
	 }else if(${currentUser.authority==1 }){
		 if(currentUserId!=rowUserId){
			 if(row.user.authority==0 || row.user.authority==1){
				 $.messager.alert("系统提示","你没有权限修改！");
				 return;
			 }
		 }
	 }
	 window.parent.openTab('通知详情','noticeDetail.jsp?id='+row.id,'icon-jlgl');
 }
 function resetSearch(){
	 $("#s_trueName").val("");
	 $("#s_dep").combobox("clear");
 } 
 //删除用户
 function deleteNotice(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要删除的数据！");
		 return;
	 }
	 var strIds=[];
	 for(var i=0;i<selectedRows.length;i++){
		 var row = selectedRows[i];
		 var currentUserId = ${currentUser.id};
		 var rowUserId = row.user.id;
		 if(${currentUser.authority==0 }){
			 if(currentUserId!=rowUserId){
				 if(row.user.authority==0){
					 $.messager.alert("系统提示","你没有权限删除！");
					 return;
				 }
			 }
		 }else if(${currentUser.authority==1 }){
			 if(currentUserId!=rowUserId){
				 if(row.user.authority==0 || row.user.authority==1){
					 $.messager.alert("系统提示","你没有权限删除！");
					 return;
				 }
			 }
		 }
		 strIds.push(selectedRows[i].id);
	 }
	 var ids=strIds.join(",");
	 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/notice/delete.do",{ids:ids},function(result){
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
 function own(v){
	var currentUserId=${currentUser.id};
	var vId=v.id;
	if(currentUserId==vId) {
		return '<span style="color:#0000ff">'+v.trueName+'(本人)</span>';}
	else {
		return v.trueName;}
 }
</script>
<title>Insert title here</title>
</head>
<body style="margin: 1px">
 <table id="dg" title="通知管理" class="easyui-datagrid" style="background-color:#000"
   fitColumns="true" pagination="true" rownumbers="true" striped="true" 
   checkOnSelect="true" selectOnCheck="true" fit="true"
   url="${pageContext.request.contextPath}/notice/list.do"
   toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="title" width="30" align="center" editor="text">标题</th>
   		<th field="summary" width="50" align="center" editor="text" data-options="formatter:function(v){return v+'...'}">内容</th>
   		<th field="depname" width="30" align="center" editor="text" data-options="formatter:function(value,row){return row.user.dep.name}">系</th>
   		<th field="user" width="30" align="center" editor="text" data-options="formatter:own">发布者</th>
   		<th field="createTime" width="30" align="center" editor="text">发布时间</th>
   		<th field="viewedNum" width="30" align="center" editor="text">浏览次数</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openNoticeAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openNoticeModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteNotice()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	<div>
        &nbsp;发布者：&nbsp;<input class="easyui-textbox" id="s_trueName" size="20" onkeydown="if(event.keyCode==13) searchNotice()"/>
 		&nbsp;系：&nbsp;<input class="easyui-combobox" id="s_dep" name="s_dep" data-options="panelHeight:'auto',editable:false,
               			valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/dep/list.do'" />
 		<a href="javascript:searchNotice()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 		<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">重置</a>
 	</div>
 </div>
</body>
</html>