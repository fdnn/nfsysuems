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

import com.nfsysu.ems.entity.WorkExp;
import com.nfsysu.ems.service.WorkExpService;
import com.nfsysu.ems.util.ResponseUtil;

/**
 * 工作/实习经验Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/workExp")
public class WorkExpController {
	
	@Resource
	private WorkExpService workExpService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	
	@RequestMapping("/save")
	public String save(WorkExp workExp,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(workExp.getId()==null){
			resultTotal = workExpService.add(workExp);
		}else{
			resultTotal = workExpService.update(workExp);
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
		List<WorkExp> workExpList=workExpService.findByResumeId(resumeId);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray=JSONArray.fromObject(workExpList,jsonConfig);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")int id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		WorkExp workExp= null;
		workExp=workExpService.findById(id);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONObject jsonObject=JSONObject.fromObject(workExp, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="id")int id,HttpServletResponse response)throws Exception{
		workExpService.delete(id);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
