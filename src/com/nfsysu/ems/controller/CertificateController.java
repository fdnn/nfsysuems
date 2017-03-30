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

import com.nfsysu.ems.entity.Certificate;
import com.nfsysu.ems.service.CertificateService;
import com.nfsysu.ems.util.ResponseUtil;

/**
 * 证书Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/certificate")
public class CertificateController {
	
	@Resource
	private CertificateService certificateService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	
	@RequestMapping("/save")
	public String save(Certificate certificate,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(certificate.getId()==null){
			resultTotal = certificateService.add(certificate);
		}else{
			resultTotal = certificateService.update(certificate);
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
		List<Certificate> certificateList=certificateService.findByResumeId(resumeId);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray=JSONArray.fromObject(certificateList,jsonConfig);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Certificate certificate= null;
		certificate=certificateService.findById(Integer.parseInt(id));
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONObject jsonObject=JSONObject.fromObject(certificate, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="id")int id,HttpServletResponse response)throws Exception{
		certificateService.delete(id);
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	
}
