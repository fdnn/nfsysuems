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

import com.nfsysu.ems.entity.Dep;
import com.nfsysu.ems.service.DepService;
import com.nfsysu.ems.util.ResponseUtil;

/**
 * 系Controller控制层
 * @author 小海
 */
@Controller
@RequestMapping("/dep")
public class DepController {
	
	@Resource
	private DepService depService;
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id",required=false)String id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Dep dep= null;
		if(id!=null){
			dep=depService.findById(Integer.parseInt(id));
		}else{
			HttpSession session = request.getSession();
			dep = (Dep) session.getAttribute("currentDep");
		}
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM"));
		JSONObject jsonObject=JSONObject.fromObject(dep, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	@RequestMapping("/list")
	public String list(HttpServletResponse response)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		List<Dep> depList=depService.find(map);
		JSONArray result=JSONArray.fromObject(depList);
		ResponseUtil.write(response, result);
		return null;
	}
}