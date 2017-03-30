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
 function searchRecruitInfo(){
	 if(typeof($(datazninput).data("value"))!="undefined"){
		 $("#dg").datagrid('load',{
				"careerThree.id":$(datazninput).data("value").split(",")[2],
				"name":$("#s_name").val(),	
				"province":$("#province").val(),
				"city":$("#city").val(),
			 });
	 }else{
		 $("#dg").datagrid('load',{
				"name":$("#s_name").val(),	
				"province":$("#province").val(),
				"city":$("#city").val(),
			 });
	 }
 }
 function resetSearch(){
	 $("#s_name").val("");
	 $(datazninput).val("");
	 $(datazninput).data("value","");
	 $("#province").val("");
	 $("#city").val("");
 } 
 $(function(){
	 $("#province").val("");
	 $("#city").val("");	
		$('#dg').datagrid({
			view: detailview,
			detailFormatter: function(rowIndex, rowData){
				var detail='<table><tr>' +
							'<td rowspan=3 style="border:0">';
				if(rowData.user.pic!=null && rowData.user.pic!=""){
					detail+='<img src="/pic/' + rowData.user.pic + '"';
				}else{
					detail+='<img src="${pageContext.request.contextPath}/static/images/touxiang.jpg"';
				}
					detail+=' width="70"></td>' +
							'<td style="border:0">' +
								'<p>&nbsp;&nbsp;招聘人数： '+rowData.recruitNum+' | 福利待遇： '+rowData.welfare + ' | 性别要求： '+rowData.sex+' | 学历要求： '+rowData.degree+'</p>' +
								'<p>&nbsp;&nbsp;工作经验： ' + rowData.workExp + ' | 联系人： '+rowData.linkman+' | 固定电话： '+rowData.tel + ' | 联系手机： '+rowData.phone+' | 联系邮箱： '+rowData.email+'</p>' +
								'<p>&nbsp;&nbsp;浏览次数： ' + rowData.browsingTimes + ' | 应聘简历数： '+rowData.resumeNum+' | 联系地址： '+rowData.linkAddress+ ' | 创建时间： '+rowData.createDate + ' | 刷新时间： '+rowData.refreshDate+'</p>' +
								'<p>&nbsp;&nbsp;职位描述： ' + rowData.description+'</p>' +
							'</td>' +
						   '</tr></table>';
			   return detail;
			}
		});
	});
 function checked(){
	 var selectedRows=$("#dg").datagrid("getSelections");
	 if(selectedRows.length==0){
		 $.messager.alert("系统提示","请选择要通过审核的数据！");
		 return;
	 }
	 var strIds=[];
	 for(var i=0;i<selectedRows.length;i++){
		 strIds.push(selectedRows[i].id);
	 }
	 var ids=strIds.join(",");
	 $.messager.confirm("系统提示","您确定要审核这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
		if(r){
			$.post("${pageContext.request.contextPath}/recruitInfo/checked.do",{ids:ids},function(result){
				if(result.success){
					 $.messager.alert("系统提示","数据已成功审核！");
					 $("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","数据审核失败，请联系系统管理员！");
				}
			},"json");
		} 
	 });
	 
 }
</script>
<title>Insert title here</title>
</head>
<!-- 通过body的onload事件调用js里面的initialize()方法来初始化省市级联下拉框 -->
<body style="margin: 1px" onload="javascript:initialize();">
 <table id="dg" title="企业招聘信息管理" class="easyui-datagrid" style="background-color:#000"
   fitColumns="true" pagination="true" rownumbers="true" striped="true" 
   checkOnSelect="true" selectOnCheck="true" fit="true"
   url="${pageContext.request.contextPath}/recruitInfo/list.do"
   toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="user" width="50" align="center" editor="text" data-options="formatter:function(v){return v.trueName}">企业名称</th>
   		<th field="name" width="50" align="center" editor="text">职位名称</th>
   		<th field="nature" width="30" align="center" editor="text">职位性质</th>
   		<%--<th field="careerThree" width="50" align="center" editor="text" data-options="formatter:function(v){return v.name}">职位类型</th>
   		--%><th field="provincecity" width="30" align="center" editor="text" data-options="formatter:function(v,r){return r.province+'/'+r.city}">工作地区</th>
   		<th field="salary" width="50" align="center" editor="text">薪资待遇</th>
   		<th field="state" width="20" align="center" editor="text">审核状态</th>
   		<th field="checkedDate" width="50" align="center" editor="text">审核时间</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:checked()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">通过审核</a>
 	</div>
 	<div>
 		&nbsp;职位名称：&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchRecruitInfo()"/>
		&nbsp;职位类型：&nbsp;<input type="text" id="s_expectedPosition" size="20" class="nation" value="" data-value="" onclick="appendhyznbar(this,'danxuan')" />
		&nbsp;工作地区：&nbsp;
		<select class="s1" style="width:98px;height: 25px;" id="province" name="province" onchange="javascript:selectchange(province,city);">
        </select>
        <select class="s2" style="width:98px;height: 25px;" id="city" name="city">
        </select>
		<%--
		&nbsp;薪资待遇：&nbsp;<select id="s_scale" style="width:150px;">
 								<option value=""></option>
 								<option value="50人以下">50人以下</option>
 								<option value="51-149人">51-149人</option>
 								<option value="150-499人">150-499人</option>
 								<option value="500-999人">500-999人</option>
 								<option value="1000-4999人">1000-4999人</option>
 								<option value="5000-9999人">5000-9999人</option>
 								<option value="10000人以上">10000人以上</option>
 							</select>
 		--%>
 		<a href="javascript:searchRecruitInfo()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 		<a href="javascript:resetSearch()" class="easyui-linkbutton" iconCls="icon-undo" plain="true">重置</a>
 	</div>
 </div>
</body>
</html>