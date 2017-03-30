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

import com.nfsysu.ems.entity.Notice;
import com.nfsysu.ems.entity.PageBean;
import com.nfsysu.ems.entity.User;
import com.nfsysu.ems.service.NoticeService;
import com.nfsysu.ems.util.DateUtil;
import com.nfsysu.ems.util.PageUtil;
import com.nfsysu.ems.util.ResponseUtil;
import com.nfsysu.ems.util.StringUtil;

/**
 * 通知Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Resource
	private NoticeService noticeService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	

	@RequestMapping("/save")
	public String save(Notice notice,HttpServletRequest request,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(notice.getId()==null){
			notice.setUser((User)request.getSession().getAttribute("currentUser"));
			notice.setCreateTime(DateUtil.getCurrentDateTimestamp());
			notice.setViewedNum(0);
			resultTotal = noticeService.add(notice);
		}else{
			resultTotal = noticeService.update(notice);
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
	
	/**
	 * 分页条件查询通知
	 * @param page
	 * @param rows
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(value="page",required=false)String page,
			@RequestParam(value="rows",required=false)String rows,
			Notice notice,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		if(notice.getUser()!=null){
			map.put("user", notice.getUser());
			map.put("trueName", StringUtil.formatLike(notice.getUser().getTrueName()));
			map.put("depId", notice.getUser().getDep().getId());
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Notice> resumeList=noticeService.find(map);
		Long total=noticeService.getTotal(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		JSONArray jsonArray=JSONArray.fromObject(resumeList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Notice notice= null;
		if(id!=""){
			notice=noticeService.findById(Integer.parseInt(id));
		}
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		JSONObject jsonObject=JSONObject.fromObject(notice, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++){
			noticeService.delete(Integer.parseInt(idsStr[i]));
		}
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
		List<Notice> noticeList=noticeService.find(map);
		StringBuffer param=new StringBuffer();
		
		JSONObject result=new JSONObject(); 
		result.put("noticeList", noticeList);
		result.put("pageCode", PageUtil.genPagination(request.getContextPath()+"/notice/index.do", noticeService.getTotal(map), Integer.parseInt(page), 10, param.toString()));
		ResponseUtil.write(response, result);
		return null; 
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam(value="id")Integer id,HttpServletRequest request)throws Exception{
		Notice notice=noticeService.findById(id);
		request.setAttribute("notice", notice);
		notice.setViewedNum(notice.getViewedNum()+1);
		noticeService.update(notice);
		request.setAttribute("pageCode", this.getUpAndDownPageCode(noticeService.getLast(id), noticeService.getNext(id), request.getServletContext().getContextPath()));
		return "forward:/foreground/noticeDetail.jsp";
	}
	
	/**
	 * 获取上一篇和下一篇
	 */
	private String getUpAndDownPageCode(Notice last,Notice next,String projectContext){
		StringBuffer pageCode=new StringBuffer();
		if(last==null || last.getId()==null){
			pageCode.append("<p>上一篇：没有了</p>");
		}else{
			pageCode.append("<p>上一篇：<a href='"+projectContext+"/notice/detail.do?id="+last.getId()+"'>"+last.getTitle()+"</a></p>");
		}
			
		if(next==null || next.getId()==null){
			pageCode.append("<p>下一篇：没有了</p>");
		}else{
			pageCode.append("<p>下一篇：<a href='"+projectContext+"/notice/detail.do?id="+next.getId()+"'>"+next.getTitle()+"</a></p>");
		}
		return pageCode.toString();
	}
}
