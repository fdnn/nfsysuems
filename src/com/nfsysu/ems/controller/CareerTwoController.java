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
import com.nfsysu.ems.entity.CareerTwo;
import com.nfsysu.ems.entity.PageBean;
import com.nfsysu.ems.service.CareerTwoService;
import com.nfsysu.ems.util.ResponseUtil;

/**
 * 二级职位Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/careerTwo")
public class CareerTwoController {
	
	@Resource
	private CareerTwoService careerTwoService;


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
			CareerTwo careerTwo,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		if(careerTwo.getCareerOne()!=null){
			map.put("oneid", careerTwo.getCareerOne().getId());
		}
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<CareerTwo> careerTwoList=careerTwoService.find(map);
		Long total=careerTwoService.getTotal(map);
		JSONObject result=new JSONObject();
		JSONArray jsonArray=JSONArray.fromObject(careerTwoList);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("/save")
	public String save(CareerTwo careerTwo,
			@RequestParam(value="add_one",required=false)String add_one,
			HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(add_one!=null && add_one!=""){
			CareerOne careerOne = new CareerOne();
			careerOne.setId(Integer.parseInt(add_one));
			careerTwo.setCareerOne(careerOne);
		}
		if(careerTwo.getId()==null){
			resultTotal = careerTwoService.add(careerTwo);
		}else{
			resultTotal = careerTwoService.update(careerTwo);
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
			CareerTwo careerTwo = careerTwoService.findByIdWithThree(Integer.parseInt(idsStr[i]));
			if(careerTwo.getCareerThreeList().size()!=0){
				result.put("msg", "请先删除二级职位<font color='red'><"+careerTwo.getName()+"></font>下的所有三级职位！！");
			}else{
				careerTwoService.delete(Integer.parseInt(idsStr[i]));
				result.put("msg", "数据已成功删除！");
			}
		}
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		CareerTwo careerTwo= null;
		careerTwo=careerTwoService.findById(Integer.parseInt(id));
		JSONObject jsonObject=JSONObject.fromObject(careerTwo);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
}
