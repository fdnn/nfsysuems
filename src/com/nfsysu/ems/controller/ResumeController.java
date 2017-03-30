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
import com.nfsysu.ems.entity.Resume;
import com.nfsysu.ems.entity.User;
import com.nfsysu.ems.service.ResumeService;
import com.nfsysu.ems.util.DateUtil;
import com.nfsysu.ems.util.PageUtil;
import com.nfsysu.ems.util.ResponseUtil;
import com.nfsysu.ems.util.StringUtil;

/**
 * 简历Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/resume")
public class ResumeController {
	
	@Resource
	private ResumeService resumeService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	
	@RequestMapping("/save")
	public String save(Resume resume,
			HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		resume.setRefreshDate(DateUtil.getCurrentDateTimestamp());
		int resultTotal=0; // 操作的记录条数
		/*if(request.getParameter("career")!=null){
			String str= request.getParameter("career");
			String[] strs = str.split(",");
			CareerThree careerThree = new CareerThree();
			careerThree.setId(Integer.parseInt(strs[2]));
			resume.setCareerThree(careerThree);
		}*/
		if(resume.getId()==null){
			User currentUser = (User)session.getAttribute("currentUser");
			List<Resume> resumeList2=resumeService.findByUserId(currentUser.getId());
			if(resumeList2.size()>=currentUser.getResumeNum()){
				request.setAttribute("outOfResumeNum", 1);
				return "forward:/student/resume/resume_list.jsp";
			}
			resume.setCreateDate(DateUtil.getCurrentDateTimestamp());
			resultTotal = resumeService.add(currentUser.getId());//增加数据
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("newData", "1");
			List<Resume> resumeList = resumeService.find(map);//检出最新增加的数据
			request.setAttribute("resume_id", resumeList.get(0).getId());
			return "forward:/student/resume/resume_make.jsp";
		}else{
			resultTotal = resumeService.update(resume);
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
	 * 分页条件查询简历
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
			@RequestParam(value="salaryBetween",required=false)String salaryBetween,
			Resume resume,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		if(salaryBetween!=null && salaryBetween!=""){
			String[] array = salaryBetween.split("-");
			map.put("salaryStart", Integer.parseInt(array[0]));
			map.put("salaryEnd", Integer.parseInt(array[1]));
		}
		if(resume.getCareerThree()!=null){
			map.put("careerThree", resume.getCareerThree().getId());
		}
		map.put("city", resume.getCity());
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Resume> resumeList=resumeService.find(map);
		Long total=resumeService.getTotal(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM"));
		JSONArray jsonArray=JSONArray.fromObject(resumeList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	

	@RequestMapping("/findByUserId")
	public String findByUserId(HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("currentUser");
		List<Resume> resumeList=resumeService.findByUserId(currentUser.getId());
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm"));
		JSONArray jsonArray=JSONArray.fromObject(resumeList,jsonConfig);
		ResponseUtil.write(response, jsonArray.toString());
		return null;
	}
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")int id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Resume resume= null;
		resume=resumeService.findById(id);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONObject jsonObject=JSONObject.fromObject(resume, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	@RequestMapping("/findByIdForward")
	public String findByIdForward(@RequestParam(value="id")int id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Resume resume= null;
		resume=resumeService.findById(id);
		request.setAttribute("resume", resume);
		return "forward:/student/resume/resume_single.jsp";
	}
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="id")int id,HttpServletResponse response)throws Exception{
		resumeService.delete(id);
		JSONObject result=new JSONObject(); 
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("/findGroupByCreateDate")
	public String findGroupByCreateDate(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=resumeService.findGroupByCreateDate();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
	@RequestMapping("/findGroupByCity")
	public String findByCity(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=resumeService.findGroupByCity();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	@RequestMapping("/findGroupByProvince")
	public String findGroupByProvince(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=resumeService.findGroupByProvince();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}

	@RequestMapping("/findGroupByTypeOne")
	public String findGroupByTypeOne(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=resumeService.findGroupByTypeOne();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	@RequestMapping("/findGroupByTypeTwo")
	public String findGroupByTypeTwo(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=resumeService.findGroupByTypeTwo();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	@RequestMapping("/findGroupByTypeThree")
	public String findGroupByTypethree(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=resumeService.findGroupByTypeThree();
		JSONArray jsonArray=JSONArray.fromObject(RecruitInfoAnaList);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	@RequestMapping("/findBySalary")
	public String findBySalary(HttpServletResponse response)throws Exception{
		List<RecAResAna> RecruitInfoAnaList=resumeService.findBySalary();
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
			map.put("resumeName", StringUtil.formatLike(name));
			param.append("name="+name+"&");
		}
		
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<Resume> resumeList=resumeService.find(map);

		JSONObject result=new JSONObject();
		result.put("resumeList", resumeList);
		result.put("pageCode", PageUtil.genPagination(request.getContextPath()+"/resume/index.do", resumeService.getTotal(map), Integer.parseInt(page), 10, param.toString()));
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam(value="id")Integer id,HttpServletRequest request)throws Exception{
		Resume resume=resumeService.findById(id);
		Resume resume2 = new Resume();
		resume2.setId(id);
		resume2.setViewedNum(resume.getViewedNum()+1);
		resumeService.update(resume2);
		request.setAttribute("resume", resume);
		return "forward:/foreground/resumeDetail.jsp";
	}
}