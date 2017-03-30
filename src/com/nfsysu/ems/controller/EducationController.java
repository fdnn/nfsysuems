package com.nfsysu.ems.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

import com.nfsysu.ems.entity.Education;
import com.nfsysu.ems.service.EducationService;
import com.nfsysu.ems.util.ResponseUtil;

/**
 * 教育背景Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/education")
public class EducationController {
	
	@Resource
	private EducationService educationService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	
	@RequestMapping("/save")
	public String save(Education education,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(education.getId()==null){
			resultTotal = educationService.add(education);
		}else{
			resultTotal = educationService.update(education);
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
	
	@RequestMapping("/findByResumeId")
	public String findByResumeId(@RequestParam(value="resumeId")int resumeId,HttpServletResponse response)throws Exception{
		List<Education> educationList=educationService.findByResumeId(resumeId);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray=JSONArray.fromObject(educationList,jsonConfig);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")int id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Education education= null;
		education=educationService.findById(id);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONObject jsonObject=JSONObject.fromObject(education, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="id")int id,HttpServletResponse response)throws Exception{
		educationService.delete(id);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
}
