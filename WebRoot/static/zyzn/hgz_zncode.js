var hyznstrVar = "";
    hyznstrVar += "<div class=\"aui_state_box\"><div class=\"aui_state_box_bg\"></div>";
    hyznstrVar += "  <div class=\"aui_alert_zn aui_outer\" id=\"drag_con\">";
    hyznstrVar += "    <table class=\"aui_border\" style=\"border:2px solid #8a9499;\">";
    hyznstrVar += "      <tbody>";
    hyznstrVar += "        <tr>";
    hyznstrVar += "          <td class=\"aui_w\"><\/td>";
    hyznstrVar += "          <td class=\"aui_c\"><div class=\"aui_inner\">";
    hyznstrVar += "              <table class=\"aui_dialog\">";
    hyznstrVar += "                <tbody>";
    hyznstrVar += "                  <tr>";
    hyznstrVar += "                    <td class=\"aui_header\" colspan=\"2\"><div class=\"aui_titleBar\">";
    hyznstrVar += "                        <div class=\"aui_title\" style=\"cursor: move;\">选择职能<\/div>";
    hyznstrVar += "                        <a href=\"javascript:;\" class=\"aui_close\" onclick=\"Close()\">×<\/a><\/div><\/td>";
    hyznstrVar += "                  <\/tr>";
    hyznstrVar += "                  <tr>";
    hyznstrVar += "                    <td class=\"aui_icon\" style=\"display: none;\"><div class=\"aui_iconBg\" style=\"background: transparent none repeat scroll 0% 0%;\"><\/div><\/td>";
    hyznstrVar += "                    <td class=\"aui_main\" style=\"width: auto; height: auto;\"><div class=\"aui_content\" style=\"padding: 0px;\">";
    hyznstrVar += "                        <div id=\"\" style=\"width: 900px; position:relative \">";
    hyznstrVar += "                          <div class=\"data-result aui-titlespan\"><em>最多选择 <strong>3<\/strong> 项<\/em><\/div>";
    hyznstrVar += "                          <div class=\"data-tabs\">";
    hyznstrVar += "                            <ul>";
    hyznstrVar += "                              <li onclick=\"removenode(this,0)\" data-selector=\"tab-all\" class=\"active\"><a href=\"javascript:;\"><span>全部职能<\/span><em><\/em><\/a><\/li>";
    hyznstrVar += "                            <\/ul>";
    hyznstrVar += "                          <\/div>";
    hyznstrVar += "                          <!--职能选择-大类-->";
    hyznstrVar += "                          <div class=\"data-container data-container-0\">";
    hyznstrVar += "                            <div class=\"view-all\">";
    hyznstrVar += "                              <div class=\"cate-list-normal\">";
    hyznstrVar += "                                <div class=\"cate-list-title\"><em>专业职能<\/em><\/div>";
    hyznstrVar += "                                <ul class=\"clearfix\" id=\"znhy-table\">";
    var maxhy=znhycode;
for(var i in znhycode)
{
	hyznstrVar += "<li><a href=\"javascript:;\" data-code=\""+znhycode[i].CodeValue+"\" data-name=\""+znhycode[i].CodeName+"\" class=\"d-cate\" onclick=\"show_second_node(this,"+i+")\">"+znhycode[i].CodeName+"<\/a><\/li>";
	}
    hyznstrVar += "                                <\/ul>";
    hyznstrVar += "                              <\/div>";
    hyznstrVar += "                            <\/div>";
    hyznstrVar += "                          <\/div>";
    hyznstrVar += "                          <!--职能选择-大类行业-->";
    hyznstrVar += "                          <div class=\"data-container data-container-1\">";
    hyznstrVar += "                            <div class=\"view-cate\" id=\"\">";
    hyznstrVar += "                              <div class=\"cate-list-subs\">";
    hyznstrVar += "                                <ul class=\"clearfix\" id=\"znhy\">";
    //点击大类
								function show_second_node(conthis,i)
								{
									var pid=$(conthis).data('code');
									var pname=$(conthis).data('name');
									$(conthis).parents('.data-container').hide();
									show_hy(i,pname);
								}
								//展示行业
								function show_hy(pid,pname)
								{
								$('.data-container-1').show();
								//添加标题
								$('.data-tabs ul').append('<li onclick="removenode(this,1)" data-code="'+pid+'" class="active"><a href="javascript:;"><span>'+pname+'</span><em></em></a></li>');
								var hyznstrVar = "";
								var maxhy=znhycode;
									//pid=pid-1;
									for(var j in znhycode[pid].maxhycode)
									{
									hyznstrVar += "<li><a href=\"javascript:;\" data-code=\""+znhycode[pid].maxhycode[j].CodeValue+"\"  data-name=\""+znhycode[pid].maxhycode[j].CodeName+"\" class=\"d-cate\" onclick=\"show_third_node(this,"+pid+","+j+")\">"+ znhycode[pid].maxhycode[j].CodeName +"<\/a><\/li>";
									}		
								$('#znhy').html(hyznstrVar);
								}
    hyznstrVar += "                                <\/ul>";
    hyznstrVar += "                              <\/div>";
    hyznstrVar += "                            <\/div>";
    hyznstrVar += "                          <\/div>";
    hyznstrVar += "                          <!--职能选择-职能-->";
    hyznstrVar += "                          <div class=\"data-container data-container-2\">";
    hyznstrVar += "                            <div class=\"view-tree\" id=\"\">";
    hyznstrVar += "                              <div class=\"tree-container\">";
    hyznstrVar += "                                <div class=\"tree-list\">";
    hyznstrVar += "                                  <ul id=\"data-hy-d3j\">";
    hyznstrVar += "                                   ";
    hyznstrVar += "                                  <\/ul>";
    hyznstrVar += "                                <\/div>";
    hyznstrVar += "                                <div class=\"tree-item-list\" style=\"height: 300px;\">";
    hyznstrVar += "                                  <div class=\"view-tree-items\" id=\"\">";
    hyznstrVar += "                                    <div class=\"item-list\">";
    hyznstrVar += "                                      <ul id=\"data-hyzn-d3j\" class=\"clearfix\">";
                     //点击大类
						  function show_third_node(conthis,pid,jid)
						  {
							  var phyid=$(conthis).data('code');
							  var phyname=$(conthis).data('name');
							  $(conthis).parents('.data-container').hide();
							  show_zn(pid+1,jid,phyname);
						  }
						  
						  
						  //展示职能
						  function show_zn(pid,phyid,phyname)
						  {
							  $('.data-container-2').show();
							  //添加标题
							  $('.data-tabs ul').append('<li onclick="removenode(this,2)" data-code="'+phyid+'" class="active"><a href="javascript:;"><span>'+phyname+'</span><em></em></a></li>');
							  
							  var hyznstrVar = "";
							  pid=pid-1;
							  
							  for(var j in znhycode[pid].maxhycode)
							  {
								  
								  if(phyid==j){
							  hyznstrVar += "<li class=\"d-tree-active\"><a href=\"javascript:;\" data-code=\""+znhycode[pid].maxhycode[j].CodeValue+"\"  data-name=\""+znhycode[pid].maxhycode[j].CodeName+"\" class=\"d-tree\" onclick=\"show_zn_last("+pid+","+j+",'"+phyname+"',this)\">"+ ((znhycode[pid].maxhycode[j].CodeName.length>11)?znhycode[pid].maxhycode[j].CodeName.substring(0,11)+"..":znhycode[pid].maxhycode[j].CodeName) +"<label>0<\/label><\/a><\/li>";
								  show_zn_last(pid,j,phyname);
								  }else
								  {hyznstrVar += "<li class=\"d-tree\"><a href=\"javascript:;\" data-code=\""+znhycode[pid].maxhycode[j].CodeValue+"\"  data-name=\""+znhycode[pid].maxhycode[j].CodeName+"\" class=\"d-tree\" onclick=\"show_zn_last("+pid+","+j+",'"+phyname+"',this)\">"+ ((znhycode[pid].maxhycode[j].CodeName.length>11)?znhycode[pid].maxhycode[j].CodeName.substring(0,11):znhycode[pid].maxhycode[j].CodeName) +"<label>0<\/label><\/a><\/li>";
									  }
							  }
							  $('#data-hy-d3j').html(hyznstrVar);
							  
						  
						  }
						  
						  function show_zn_last(pid,phyid,phyname,lithis)
						  {
							   var hyznstrVar = "";
							  $(lithis).parent('li').siblings('li').attr("class","d-tree");
							  $(lithis).parent('li').attr("class","d-tree-active");
							  for(var k in znhycode[pid].maxhycode[phyid].znhycdoe)
							  {
							  var thirdnode=znhycode[pid].maxhycode[phyid].znhycdoe[k];
							   hyznstrVar += "<li><a title=\""+thirdnode.CodeName+"\" href=\"javascript:;\" data-code=\""+thirdnode.CodeValue+"\" data-name=\""+thirdnode.CodeName+"\" data-ditem=\""+thirdnode.CodeValue+"\" class=\"d-item\" onclick=\"ditem_select("+znhycode[pid].CodeValue+","+znhycode[pid].maxhycode[phyid].CodeValue+",this)\">"+thirdnode.CodeName+"<\/a><\/li>";		
							  }
							  $('#data-hyzn-d3j').children().remove();	
							  $('#data-hyzn-d3j').html(hyznstrVar);	
							  
								  if($('.data-result span').length>0)
							  {
								  $('.data-result span').each(function(index) {
									  
									  $('#data-hyzn-d3j a[data-ditem='+$(this).data("code")+']').addClass('d-item-active');
								  });
								  }
							  }
						  
						
						  function ditem_select(one,two,conthis)
						  { 
						  if(datazntype=="duoxuan"){
							  if($(conthis).attr("class").indexOf("d-item-active")>0)
							  {
								  $(conthis).removeClass("d-item-active");
								  $('.data-result span[data-code='+$(conthis).data("code")+']').remove();
							  }else{
							  if($('.data-result span').length>2)
							  {
								  $('.data-error').slideDown();
								  setTimeout("$('.data-error').hide()",1000);
								  return false;
							  }else
							  {
							   $('.data-result').append("<span class=\"svae_box aui-titlespan\" data-code=\""+$(conthis).data("code")+"\"  data-name=\""+$(conthis).data("name")+"\" onclick=\"removespan(this)\">"+$(conthis).data("name")+"<i>×<\/i><\/span>");
							   $(conthis).addClass('d-item-active');
							  }
								  }
						  }else
							{
								$(datazninput).data("value",one+","+two+","+$(conthis).data("code"));
								$(datazninput).val($(conthis).data("name"));
								$('.aui_state_box').remove();
							}
						  }
						  
						  function removespan(spanthis)
						  {
							  $('#data-hyzn-d3j a[data-ditem='+$(spanthis).data("code")+']').removeClass('d-item-active');
							  $(spanthis).remove();
						  }

    hyznstrVar += "                                      <\/ul>";
    hyznstrVar += "                                    <\/div>";
    hyznstrVar += "                                  <\/div>";
    hyznstrVar += "                                <\/div>";
    hyznstrVar += "                              <\/div>";
    hyznstrVar += "                            <\/div>";
    hyznstrVar += "                          <\/div>";
    hyznstrVar += "                          <div class=\"data-error\" style=\"display: none;\">最多只能选择 3 项<\/div>";
    hyznstrVar += "                        <\/div>";
    hyznstrVar += "                      <\/div><\/td>";
    hyznstrVar += "                  <\/tr>";
    hyznstrVar += "                  <tr>";
    hyznstrVar += "                    <td class=\"aui_footer\" colspan=\"2\"><div class=\"aui_buttons\">";
    hyznstrVar += "                        <button class=\"aui-btn aui-btn-primary\" type=\"button\" onclick=\"svae_znitem()\">确定<\/button>";
    hyznstrVar += "                        <button class=\"aui-btn aui-btn-light\" type=\"button\" onclick=\"Close()\">取消<\/button>";
    hyznstrVar += "                      <\/div><\/td>";
    hyznstrVar += "                  <\/tr>";
    hyznstrVar += "                <\/tbody>";
    hyznstrVar += "              <\/table>";
    hyznstrVar += "            <\/div><\/td>";
    hyznstrVar += "          <td class=\"aui_e\"><\/td>";
    hyznstrVar += "        <\/tr>";
    hyznstrVar += "      <\/tbody>";
    hyznstrVar += "    <\/table>";
    hyznstrVar += "  <\/div>";
    hyznstrVar += "<\/div>";
	
	
	
	
	
var datazninput=null;	
var datazntype="";
function appendhyznbar(thiscon,znpe){
	datazninput=thiscon;
	datazntype=znpe;
	$('body').append(hyznstrVar);
	if(datazntype=="duoxuan"){
		if($(datazninput).data("value")!="")
		{ 
			var inputarry= $(datazninput).data("value").split('-');
			var inputarryname= $(datazninput).val().split('-');
			
			for(var i in inputarry)
			{
			$('.data-result').append("<span class=\"svae_box aui-titlespan\" data-code=\""+inputarry[i]+"\"  data-name=\""+inputarryname[i]+"\" onclick=\"removespan(this)\">"+inputarryname[i]+"<i>×<\/i><\/span>");			
				//for(var i in znhycode)
//				{
//					for(var j in znhycode[i].maxhycode)
//						for(var k in znhycode[i].maxhycode[i].znhycdoe)
//						{
//								if(znhycode[i].maxhycode[i].znhycdoe[k].CodeValue==inputarry[i])
//								{
//									
//									}
//							}
//					}
			}
			

		}
	}else
	{
		$('.aui_state_box .aui_buttons').remove();
		$('.aui-titlespan').find('em').remove();
		if($(datazninput).data("value")!="")
		{ 
			$('.data-result').append("<span class=\"svae_box aui-titlespan\" data-code=\""+$(datazninput).data("value")+"\"  data-name=\""+$(datazninput).val()+"\" onclick=\"removespan(this)\">"+$(datazninput).val()+"<i>×<\/i><\/span>");
		}
	}

	var minwid = document.documentElement.clientWidth;
	$('.aui_outer .aui_header').on("mousedown",
	function(e) {
	    /*$(this)[0].onselectstart = function(e) { return false; }*/
	    //防止拖动窗口时，会有文字被选中的现象(事实证明不加上这段效果会更好)
	    $(this)[0].oncontextmenu = function(e) {
	        return false;
	    } //防止右击弹出菜单
	    var getStartX = e.pageX,
	    getStartY = e.pageY;
	    var getPositionX = (minwid / 2) - $(this).offset().left,
	    getPositionY = 60;
	    $(document).on("mousemove",
	    function(e) {
	        var getEndX = e.pageX,
	        getEndY = e.pageY;
	        $('.aui_outer').css({
	            left: getEndX - getStartX - getPositionX,
	            top: getEndY - getStartY + getPositionY
	        });
	    });
	    $(document).on("mouseup",
	    function() {
	        $(document).unbind("mousemove");
	    })
	});
}

//确定选择
function svae_znitem()
{

	var val='';
	var valname='';
	if($('.svae_box').length>0){
	$('.svae_box').each(function(){
		val+=$(this).data("code")+'-';
		valname+=$(this).data("name")+'-';
		})
	}
	if(val!='')
	{
		val=val.substring(0,val.lastIndexOf('-'));
	}
	if(valname!='')
	{
		valname=valname.substring(0,valname.lastIndexOf('-'));
	}
	
	$(datazninput).data("value",val);
	$(datazninput).val(valname);

	$('.aui_state_box').remove();
	
}
function Close() {
	$('.aui_state_box').remove();
}




//点击标题以后后面node
function removenode(lithis,typeid)
{
	$(lithis).nextAll('li').remove();
	$('.data-container-'+typeid).nextAll('.data-container').hide();
	$('.data-container-'+typeid).show();
}