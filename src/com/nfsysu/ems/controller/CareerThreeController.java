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

import com.nfsysu.ems.entity.CareerThree;
import com.nfsysu.ems.entity.CareerTwo;
import com.nfsysu.ems.entity.PageBean;
import com.nfsysu.ems.service.CareerThreeService;
import com.nfsysu.ems.util.ResponseUtil;

/**
 * 三级职位Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/careerThree")
public class CareerThreeController {
	
	@Resource
	private CareerThreeService careerThreeService;

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
			CareerThree careerThree,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		if(careerThree.getCareerTwo()!=null){
			map.put("twoid", careerThree.getCareerTwo().getId());
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<CareerThree> careerThreeList=careerThreeService.find(map);
		Long total=careerThreeService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(careerThreeList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/save")
	public String save(CareerThree careerThree,
			@RequestParam(value="add_two",required=false)String add_two,
			HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(add_two!=null && add_two!=""){
			CareerTwo careerTwo = new CareerTwo();
			careerTwo.setId(Integer.parseInt(add_two));
			careerThree.setCareerTwo(careerTwo);
		}
		if(careerThree.getId()==null){
			resultTotal = careerThreeService.add(careerThree);
		}else{
			resultTotal = careerThreeService.update(careerThree);
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
			careerThreeService.delete(Integer.parseInt(idsStr[i]));
			result.put("msg", "数据已成功删除！");
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		CareerThree careerThree= null;
		careerThree=careerThreeService.findById(Integer.parseInt(id));
		JSONObject jsonObject=JSONObject.fromObject(careerThree);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
}
