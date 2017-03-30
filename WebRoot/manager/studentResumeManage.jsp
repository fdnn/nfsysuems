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
<%-- 职能行业插件 --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/zyzn/zyzn_1.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/load_hycode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/hgz_hycode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/zyzn/hgz_zncode.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/place.js"></script>
<script type="text/javascript">
 function searchUser(){
	 <%--var start=$("#s_expectedSalaryStart").val();
	 var end=$("#s_expectedSalaryEnd").val();
	 var between;
	 if(start=="" && end==""){
		 between="";
	 }else if(start==""){
		 between="0-"+end;
	 }else if(end==""){
		 between=start+"-9999999";
	 }else{
		 between=start+"-"+end;
	 }--%>
	 if(typeof($(datazninput).data("value"))!="undefined"){
		 $("#dg").datagrid('load',{
				"careerThree.id":$(datazninput).data("value").split(",")[2],
				<%--"expectedSalaryBetween":between,--%>
				"province":$("#province").val(),
				"city":$("#city").val()
			 });
	 }else{
		 $("#dg").datagrid('load',{
				<%--"expectedSalaryBetween":between,--%>
				"province":$("#province").val(),
				"city":$("#city").val()
			 });
	 }
 }
 function resetSearch(){
	 $(datazninput).val("");
	 $(datazninput).data("value","");
	 $("#province").val("");
	 $("#city").val("");
 } 
 function openResumeDetailTab(id){
	 window.parent.openTab('简历详情','resumeDetail.jsp?resumeId='+id,'icon-jlgl');
 }
 $(function(){
	 $("#province").val("");
	 $("#city").val("");
 })
</script>
<title>Insert title here</title>
</head>
<!-- 通过body的onload事件调用js里面的initialize()方法来初始化省市级联下拉框 -->
<body style="margin: 1px" onload="javascript:initialize();">
 <table id="dg" title="学生简历管理" class="easyui-datagrid" style="background-color:#000"
   fitColumns="true" pagination="true" rownumbers="true" striped="true" 
   checkOnSelect="true" selectOnCheck="true" fit="true"
   url="${pageContext.request.contextPath}/resume/list.do"
   toolbar="#tb">
   <thead>
   	<tr>
   		<%--<th field="cb" checkbox="true" align="center"></th>--%>
   		<th field="user" width="50" align="center" editor="text" data-options="formatter:function(v){return v.trueName}">学生姓名</th>
   		<th field="resumeName" width="50" align="center" editor="text">简历名称</th>
   		<th field="careerThree" width="50" align="center" editor="text" data-options="formatter:function(v){return v.name}">期待职位</th>
   		<th field="salary" width="30" align="center" editor="text">期待薪资</th>
   		<th field="provincecity" width="50" align="center" editor="text" data-options="formatter:function(v,r){return r.province+'/'+r.city}">期待工作地点</th>
   		<th field="a" width="30" align="center" editor="text" data-options="formatter:function(v,r){return '<a href=javascript:openResumeDetailTab('+r.id+')>详细信息</a>'}">操作</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		&nbsp;期待职位：&nbsp;<input type="text" id="s_expectedPosition" size="20" class="nation" value="" data-value="" onclick="appendhyznbar(this,'danxuan')" /><%--
		&nbsp;期待薪资：&nbsp;<input type="text" id="s_expectedSalaryStart" size="6" onkeydown="if(event.keyCode==13) searchUser()"/>
			-&nbsp;<input type="text" id="s_expectedSalaryEnd" size="6" onkeydown="if(event.keyCode==13) searchUser()"/>
		--%>&nbsp;期待工作地点：&nbsp;
		<select class="s1" style="width:98px;height: 25px;" id="province" name="province" onchange="javascript:selectchange(province,city);">
        </select>
        <select class="s2" style="width:98px;height: 25px;" id="city" name="city">
        </select>
 		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 		<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">重置</a>
 	</div>
 </div>
</body>
</html>