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
<!-- 配置文件 -->
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="gbk" src="${pageContext.request.contextPath}/static/ueditor/lang/zh-cn/zh-cn.js"></script>

<style type="text/css">
	
</style>
<script type="text/javascript">

</script>
<title>Insert title here</title>
</head>
<body style="margin: 10px">
 <div id="p" class="easyui-panel" title="通知详情" style="padding: 10px">
   <table cellspacing="5px">
		<tr>
			<td>
				<input type="text" id="title" name="title" style="width: 400px" placeholder="通知标题"/>
				<div style="width:100%; border-top:1px silver dashed;border-color:#99BBE8;margin-top:7px;"></div>
			</td>
		</tr>
		<tr>
			<td>
				<!-- 加载编辑器的容器 -->
				<script id="editor" name="content" type="text/plain" style="width:100%;height:300px;"></script>
				<div style="width:100%; border-top:1px silver dashed;border-color:#99BBE8;margin-top:7px;"></div>
			</td>
		</tr>
		<tr>
			<td>
				<a href="javascript:submitNotice()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">发布通知</a>
			</td>
		</tr>
	</table>
 </div>
<!-- 实例化编辑器 -->
<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script> 
<script type="text/javascript">
    var ue = UE.getEditor('editor');
    ue.addListener("ready",function(){
    	UE.ajax.request("${pageContext.request.contextPath}/notice/findById.do",
    			{
					method:"post",
					async:false,
					data:{"id":"${param.id}"},
					onsuccess:function(result){
						result=eval("("+result.responseText+")");
						$("#title").val(result.title);
						UE.getEditor('editor').setContent(result.content);
					}
				});
    });
    
    function submitNotice(){
		var title=$("#title").val();
		var content=UE.getEditor('editor').getContent();
		if(title==null || title==''){
			alert("请输入标题！");
		}else if(content==null || content==''){
			alert("请输入内容！");
		}else{
			$.post("${pageContext.request.contextPath}/notice/save.do",{'id':'${param.id}','title':title,
				'content':content,'summary':UE.getEditor('editor').getContentTxt().substr(0,10)},function(result){
				if(result.success){
					layer.msg('发布成功', {icon: 6});
				}else{
					layer.msg('发布失败', {icon: 5});
				}
			},"json");
		}
    }
</script>
</body>
</html>