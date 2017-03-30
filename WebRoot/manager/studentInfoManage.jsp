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
<script type="text/javascript"  src="${pageContext.request.contextPath}/static/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript">
 var url;
 function searchUser(){
	 $("#dg").datagrid('load',{
		"userName":$("#s_userName").val(),
		"major.id":$("#s_major").val(),
		"grade":$("#s_grade").val()
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
		 trueName:row.trueName,
		 graduationYear:row.graduationYear
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
	 $("#graduationYear").datebox("clear");
 }
 function resetSearch(){
	 $("#s_userName").val("");
	 $("#s_dep").combobox("clear");
	 $("#s_major").val("");
	 $("#s_grade").val("")
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
function selectMajorByDep(rec){    
 	$("#s_major").empty();
    for(var i=0;i<rec.majorList.length;i++){
    	$("#s_major").append("<option value="+rec.majorList[i].id+">"+rec.majorList[i].name+"</option>");  
    }
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
							'<p>&nbsp;&nbsp;' + rowData.sex + ' | '+rowData.politics+' | '+rowData.origin + ' | '+rowData.birthday+' 出生</p>' +
							'<p>&nbsp;&nbsp;详细地址： ' + rowData.address+'</p>' +
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
 <table id="dg" title="学生信息管理" class="easyui-datagrid" style="background-color:#000"
   fitColumns="true" pagination="true" rownumbers="true" striped="true" 
   checkOnSelect="true" selectOnCheck="true" fit="true"
   url="${pageContext.request.contextPath}/user/list.do?role=0"
   toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="userName" width="50" align="center" editor="text">用户名/学号</th>
   		<th field="password" width="50" align="center" editor="text">密码</th>
   		<th field="trueName" width="30" align="center" editor="text">真实姓名</th>
   		<th field="major" width="50" align="center" data-options="formatter:function(v){if(v!=null){return v.dep.name+'/'+v.name}else{return ''}}">系/专业</th>
   		<th field="graduationYear" width="30" align="center" editor="text">毕业年份</th>
   		<th field="email" width="50" align="center" editor="text">电子邮箱</th>
   		<th field="qq" width="30" align="center" editor="text">QQ</th>
   		<th field="phone" width="40" align="center" editor="text">联系电话</th>
   		<th field="status" width="40" align="center" editor="text">状态</th>
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
 		&nbsp;用户名/学号：&nbsp;<input type="text" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
 		&nbsp;年级：&nbsp;
 		<input id="s_grade" class="Wdate" size="5"
 		 name="s_grade" onfocus="WdatePicker({dateFmt:'yyyy',qsEnabled:false})" />
 		&nbsp;系：&nbsp;<input class="easyui-combobox" id="s_dep" name="s_dep" data-options="panelHeight:'auto',editable:false,
               			valueField:'name',textField:'name',url:'${pageContext.request.contextPath}/dep/list.do',
               			onSelect:selectMajorByDep"/>
		&nbsp;专业：&nbsp;<select id="s_major" name="s_major" style="width:150px;" ></select>
 		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 		<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">重置</a>
 	</div>
 </div>
 
 <div id="dlg" class="easyui-dialog" style="width:350px;height:230px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<input hidden name="role" id="role" value="0" />
   			<td>用户名/学号：</td>
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
   		<tr>
   			<td>毕业年份：</td>
   			<td>
   				<input id="graduationYear" name="graduationYear" class="easyui-datebox" >
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