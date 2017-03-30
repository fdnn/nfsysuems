package com.nfsysu.ems.controller;

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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nfsysu.ems.entity.Major;
import com.nfsysu.ems.service.MajorService;
import com.nfsysu.ems.util.ResponseUtil;

/**
 * 专业Controller控制层
 * @author 小海
 */
@Controller
@RequestMapping("/major")
public class MajorController {
	
	@Resource
	private MajorService majorService;
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id",required=false)String id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Major major= null;
		if(id!=null){
			major=majorService.findById(Integer.parseInt(id));
		}else{
			HttpSession session = request.getSession();
			major = (Major) session.getAttribute("currentMajor");
		}
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM"));
		JSONObject jsonObject=JSONObject.fromObject(major, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	@RequestMapping("/list")
	public String list(HttpServletResponse response)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		List<Major> majorList=majorService.find(map);
		JSONArray result=JSONArray.fromObject(majorList);
		ResponseUtil.write(response, result);
		return null;
	}
}