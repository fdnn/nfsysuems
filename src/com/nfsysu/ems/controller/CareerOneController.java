package com.nfsysu.ems.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nfsysu.ems.entity.CareerOne;
import com.nfsysu.ems.entity.PageBean;
import com.nfsysu.ems.service.CareerOneService;
import com.nfsysu.ems.util.ResponseUtil;

/**
 * 一级职位Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/careerOne")
public class CareerOneController {
	
	@Resource
	private CareerOneService careerOneService;


	/**
	 * 分页条件查询
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
			CareerOne careerOne,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<CareerOne> careerOneList=careerOneService.find(map);
		Long total=careerOneService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(careerOneList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	//下拉一级职位
	@RequestMapping("/listAll")
	public String list(HttpServletResponse response)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		List<CareerOne> careerOneList=careerOneService.find(map);
		JSONArray result=JSONArray.fromObject(careerOneList);
		ResponseUtil.write(response, result);
		return null;
	}

	//下拉两个级职位
	@RequestMapping("/listAllWithTwo")
	public String listAllWithTwo(HttpServletResponse response)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		List<CareerOne> careerOneList=careerOneService.findWithTwo(map);
		JSONArray jsonArray1 = new JSONArray();
		JSONArray jsonArray2 = new JSONArray();
		JSONObject jsonObject1 = new JSONObject();
		JSONObject jsonObject2 = new JSONObject();
		for(int i = 0;i<careerOneList.size();i++){
			jsonArray2.clear();
			for (int j = 0; j < careerOneList.get(i).getCareerTwoList().size(); j++) {
				jsonObject2.put("id", careerOneList.get(i).getCareerTwoList().get(j).getId());
				jsonObject2.put("text", careerOneList.get(i).getCareerTwoList().get(j).getName());
				jsonArray2.add(jsonObject2);
			}
			jsonObject1.put("id", careerOneList.get(i).getId());
			jsonObject1.put("text", careerOneList.get(i).getName());
			jsonObject1.put("children", jsonArray2);
			jsonArray1.add(jsonObject1);
		}
		ResponseUtil.write(response, jsonArray1);
		return null;
	}
	
	@RequestMapping("/save")
	public String save(CareerOne careerOne,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(careerOne.getId()==null){
			resultTotal = careerOneService.add(careerOne);
		}else{
			resultTotal = careerOneService.update(careerOne);
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

	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		JSONObject result=new JSONObject();
		for(int i=0;i<idsStr.length;i++){
			CareerOne careerOne = careerOneService.findByIdWithTwo(Integer.parseInt(idsStr[i]));
			if(careerOne.getCareerTwoList().size()!=0){
				result.put("msg", "请先删除一级职位<font color='red'><"+careerOne.getName()+"></font>下的所有二级职位！！");
			}else{
				careerOneService.delete(Integer.parseInt(idsStr[i]));
				result.put("msg", "数据已成功删除！");
			}
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		CareerOne careerOne= null;
		careerOne=careerOneService.findById(Integer.parseInt(id));
		JSONObject jsonObject=JSONObject.fromObject(careerOne);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
}
