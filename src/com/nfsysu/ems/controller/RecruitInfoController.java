package com.nfsysu.ems.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nfsysu.ems.entity.PageBean;
import com.nfsysu.ems.entity.RecAResAna;
import com.nfsysu.ems.entity.RecruitInfo;
import com.nfsysu.ems.entity.User;
import com.nfsysu.ems.service.RecruitInfoService;
import com.nfsysu.ems.util.DateUtil;
import com.nfsysu.ems.util.PageUtil;
import com.nfsysu.ems.util.ResponseUtil;
import com.nfsysu.ems.util.StringUtil;

/**
 * 招聘信息Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/recruitInfo")
public class RecruitInfoController {
	
	@Resource
	private RecruitInfoService recruitInfoService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	
	@RequestMapping("/save")
	public String save(RecruitInfo recruitInfo,HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		recruitInfo.setRefreshDate(DateUtil.getCurrentDateTimestamp());
		int resultTotal=0; // 操作的记录条数
		if(recruitInfo.getId()==null){
			User currentUser = (User)session.getAttribute("currentUser");
			recruitInfo.setUser(currentUser);
			recruitInfo.setState("未审核");
			recruitInfo.setViewedNum(0);
			recruitInfo.setResumeNum("0");
			recruitInfo.setCreateDate(DateUtil.getCurrentDateTimestamp());
			resultTotal = recruitInfoService.add(recruitInfo);//增加数据
		}else{
			resultTotal = recruitInfoService.update(recruitInfo);
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
	 * 审核
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/checked")
	public String checked(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		RecruitInfo recruitInfo = new RecruitInfo();
		for(int i=0;i<idsStr.length;i++){
			recruitInfo.setId(Integer.parseInt(idsStr[i]));
			recruitInfo.setState("已审核");
			recruitInfo.setCheckedDate(DateUtil.getCurrentDateTimestamp());
			recruitInfoService.update(recruitInfo);
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 分页条件查询招聘信息
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
			RecruitInfo recruitInfo,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("name", StringUtil.formatLike(recruitInfo.getName()));
		if(recruitInfo.getCareerThree()!=null){
			map.put("careerThree", recruitInfo.getCareerThree().getId());
			if(recruitInfo.getCareerThree().getCareerTwo()!=null){
				map.put("careerTwo", recruitInfo.getCareerThree().getCareerTwo().getId());
				if(recruitInfo.getCareerThree().getCareerTwo().getCareerOne()!=null){
					map.put("careerOne", recruitInfo.getCareerThree().getCareerTwo().getCareerOne().getId());
				}
			}
		}
		map.put("province", recruitInfo.getProvince());
		map.put("city", recruitInfo.getCity());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<RecruitInfo> resumeList=recruitInfoService.find(map);
		Long total=recruitInfoService.getTotal(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		JSONArray jsonArray=JSONArray.fromObject(resumeList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/findByUserId")
	public String findByUserId(@RequestParam(value="userId")int userId,HttpServletResponse response)throws Exception{
		List<RecruitInfo> recruitInfo=recruitInfoService.findByUserId(userId);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		JSONArray jsonArray=JSONArray.fromObject(recruitInfo,jsonConfig);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")int id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		RecruitInfo recruitInfo= null;
		recruitInfo=recruitInfoService.findById(id);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONObject jsonObject=JSONObject.fromObject(recruitInfo, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	@RequestMapping("/findByIdForward")
	public String findByIdForward(@RequestParam(value="id")int id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		RecruitInfo recruitInfo= null;
		recruitInfo=recruitInfoService.findById(id);
		request.setAttribute("recruitInfo", recruitInfo);
		return "forward:/student/recruitInfo/recruitInfo_single.jsp";
	}
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="id")int id,HttpServletResponse response)throws Exception{
		recruitInfoService.delete(id);
		JSONObject result=new JSONObject(); 
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/findGroupByCreateDate")
	public String findGroupByCreateDate(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=recruitInfoService.findGroupByCreateDate();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
	@RequestMapping("/findGroupByCity")
	public String findByCity(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=recruitInfoService.findGroupByCity();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	@RequestMapping("/findGroupByProvince")
	public String findGroupByProvince(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=recruitInfoService.findGroupByProvince();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	@RequestMapping("/findBySalary")
	public String findBySalary(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=recruitInfoService.findBySalary();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	@RequestMapping("/findGroupByTypeOne")
	public String findGroupByTypeOne(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=recruitInfoService.findGroupByTypeOne();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	@RequestMapping("/findGroupByTypeTwo")
	public String findGroupByTypeTwo(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=recruitInfoService.findGroupByTypeTwo();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	@RequestMapping("/findGroupByTypeThree")
	public String findGroupByTypethree(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=recruitInfoService.findGroupByTypeThree();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}

	/**
	 * 前台分页显示
	 * @return
	 */
	@RequestMapping("/index")
	public String index(@RequestParam(value="page",required=false)String page,
			@RequestParam(value="hy",required=false)String hy,
			@RequestParam(value="type",required=false)String type,
			@RequestParam(value="province",required=false)String province,
			@RequestParam(value="city",required=false)String city,
			@RequestParam(value="time",required=false)String time,
			@RequestParam(value="name",required=false)String name,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("UTF-8");
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),10);
		Map<String,Object> map=new HashMap<String,Object>();
		StringBuffer param=new StringBuffer();
		
		if(StringUtil.isNotEmpty(type)){
			String []typeStr=type.split(",");
			if(typeStr.length==1){
				map.put("careerOne", Integer.parseInt(typeStr[0]));
			}else{
				map.put("careerOne", Integer.parseInt(typeStr[0]));
				map.put("careerTwo", Integer.parseInt(typeStr[1]));
				map.put("careerThree", Integer.parseInt(typeStr[2]));
			}
			param.append("type="+type+"&");
		}
		if(StringUtil.isNotEmpty(hy)){
			map.put("careerTwo", Integer.parseInt(hy));
			param.append("hy="+hy+"&");
		}
		if(StringUtil.isNotEmpty(province)){
			province = new String(province.getBytes("iso-8859-1"),"utf-8");
			map.put("province", province);
			param.append("province="+province+"&");
		}
		if(StringUtil.isNotEmpty(city)){
			city = new String(city.getBytes("iso-8859-1"),"utf-8");
			map.put("city", city);
			param.append("city="+city+"&");
		}
		if(StringUtil.isNotEmpty(time)){
			map.put("time", Integer.parseInt(time));
			param.append("time="+time+"&");
		}
		if(StringUtil.isNotEmpty(name)){
			name = new String(name.getBytes("iso-8859-1"),"utf-8");
			map.put("name", StringUtil.formatLike(name));
			param.append("name="+name+"&");
		}
		
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		map.put("front", 1);
		List<RecruitInfo> recruitInfoList=recruitInfoService.find(map);

		JSONObject result=new JSONObject(); 
		result.put("recruitInfoList", recruitInfoList);
		result.put("pageCode", PageUtil.genPagination(request.getContextPath()+"/recruitInfo/index.do", recruitInfoService.getTotal(map), Integer.parseInt(page), 10, param.toString()));
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam(value="id")Integer id,HttpServletRequest request)throws Exception{
		RecruitInfo recruitInfo=recruitInfoService.findById(id);
		RecruitInfo recruitInfo2 = new RecruitInfo();
		recruitInfo2.setId(id);
		recruitInfo2.setViewedNum(recruitInfo.getViewedNum()+1);
		recruitInfoService.update(recruitInfo2);
		
		request.setAttribute("recruitInfo", recruitInfo);
		request.setAttribute("pageCode", this.getUpAndDownPageCode(recruitInfoService.getLast(id), recruitInfoService.getNext(id), request.getServletContext().getContextPath()));
		return "forward:/foreground/recruitInfoDetail.jsp";
	}
	
	/**
	 * 获取上一篇和下一篇
	 */
	private String getUpAndDownPageCode(RecruitInfo last,RecruitInfo next,String projectContext){
		StringBuffer pageCode=new StringBuffer();
		if(last==null || last.getId()==null){
			pageCode.append("<p>上一篇：没有了</p>");
		}else{
			pageCode.append("<p>上一篇：<a href='"+projectContext+"/recruitInfo/detail.do?id="+last.getId()+"'>"+last.getName()+"</a></p>");
		}
			
		if(next==null || next.getId()==null){
			pageCode.append("<p>下一篇：没有了</p>");
		}else{
			pageCode.append("<p>下一篇：<a href='"+projectContext+"/recruitInfo/detail.do?id="+next.getId()+"'>"+next.getName()+"</a></p>");
		}
		return pageCode.toString();
	}
}
