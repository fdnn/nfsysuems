package com.nfsysu.ems.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nfsysu.ems.entity.Dynamic;
import com.nfsysu.ems.entity.PageBean;
import com.nfsysu.ems.entity.User;
import com.nfsysu.ems.service.DynamicService;
import com.nfsysu.ems.util.DateUtil;
import com.nfsysu.ems.util.PageUtil;
import com.nfsysu.ems.util.ResponseUtil;
import com.nfsysu.ems.util.StringUtil;

/**
 * 企业动态Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/dynamic")
public class DynamicController {
	
	@Resource
	private DynamicService dynamicService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	
	@RequestMapping("/save")
	public String save(Dynamic dynamic,HttpServletRequest request,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(dynamic.getId()==null){
			dynamic.setViewedNum(0);
			dynamic.setState("未审核");
			dynamic.setTime(DateUtil.getCurrentDateTimestamp());
			User user = (User)request.getSession().getAttribute("currentUser");
			dynamic.setUser(user);
			resultTotal = dynamicService.add(dynamic);
		}else{
			resultTotal = dynamicService.update(dynamic);
		}
		JSONObject result=new JSONObject(); 
		if(resultTotal>0){
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/findByUserId")
	public String findByUserId(@RequestParam(value="userId")int userId,HttpServletResponse response)throws Exception{
		List<Dynamic> dynamicList=dynamicService.findByUserId(userId);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		JSONArray jsonArray=JSONArray.fromObject(dynamicList,jsonConfig);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")int id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Dynamic dynamic= null;
		dynamic=dynamicService.findById(id);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		JSONObject jsonObject=JSONObject.fromObject(dynamic, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="id")int id,HttpServletResponse response)throws Exception{
		dynamicService.delete(id);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 前台分页显示
	 * @return
	 */
	@RequestMapping("/index")
	public String index(@RequestParam(value="page",required=false)String page,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),10);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Dynamic> dynamicList=dynamicService.find(map);
		StringBuffer param=new StringBuffer();

		JSONObject result=new JSONObject(); 
		result.put("dynamicList", dynamicList);
		result.put("pageCode", PageUtil.genPagination(request.getContextPath()+"/dynamic/index.do", dynamicService.getTotal(map), Integer.parseInt(page), 10, param.toString()));
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam(value="id")Integer id,HttpServletRequest request)throws Exception{
		Dynamic dynamic=dynamicService.findById(id);
		request.setAttribute("dynamic", dynamic);
		dynamic.setViewedNum(dynamic.getViewedNum()+1);
		dynamicService.update(dynamic);
		request.setAttribute("pageCode", this.getUpAndDownPageCode(dynamicService.getLast(id), dynamicService.getNext(id), request.getServletContext().getContextPath()));
		return "forward:/foreground/dynamicDetail.jsp";
	}
	
	/**
	 * 获取上一篇和下一篇
	 */
	private String getUpAndDownPageCode(Dynamic last,Dynamic next,String projectContext){
		StringBuffer pageCode=new StringBuffer();
		if(last==null || last.getId()==null){
			pageCode.append("<p>上一篇：没有了</p>");
		}else{
			pageCode.append("<p>上一篇：<a href='"+projectContext+"/dynamic/detail.do?id="+last.getId()+"'>"+last.getTitle()+"</a></p>");
		}
			
		if(next==null || next.getId()==null){
			pageCode.append("<p>下一篇：没有了</p>");
		}else{
			pageCode.append("<p>下一篇：<a href='"+projectContext+"/dynamic/detail.do?id="+next.getId()+"'>"+next.getTitle()+"</a></p>");
		}
		return pageCode.toString();
	}
}
