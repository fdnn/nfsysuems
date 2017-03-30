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

import com.nfsysu.ems.entity.ApplyRecord;
import com.nfsysu.ems.entity.RecruitInfo;
import com.nfsysu.ems.entity.Resume;
import com.nfsysu.ems.entity.User;
import com.nfsysu.ems.service.ApplyRecordService;
import com.nfsysu.ems.service.RecruitInfoService;
import com.nfsysu.ems.util.DateUtil;
import com.nfsysu.ems.util.ResponseUtil;

/**
 * 应聘记录Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/applyRecord")
public class ApplyRecordController {
	
	@Resource
	private ApplyRecordService applyRecordService;
	@Resource
	private RecruitInfoService recruitInfoService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}
	

	@RequestMapping("/save")
	public String save(ApplyRecord applyRecord,
			@RequestParam(value="methor",required=false)Integer methor,
			@RequestParam(value="recruitInfoId",required=false)String recruitInfoId,
			@RequestParam(value="resumeId",required=false)String resumeId,
			HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("currentUser");
		applyRecord.setUser(currentUser);
		int resultTotal=0; // 操作的记录条数
		//用户前台
		if(applyRecord.getId()==null){
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("userId", currentUser.getId());
			//收藏操作
			if(methor!=null&&methor==0){
				RecruitInfo r = new RecruitInfo();
				r.setId((Integer.parseInt(recruitInfoId)));
				applyRecord.setRecruitInfo(r);
				applyRecord.setIsStore(1);
				applyRecord.setStoreTime(DateUtil.getCurrentDateTimestamp());
				map.put("recruitInfoId", Integer.parseInt(recruitInfoId));
			}
			//申请操作
			if(methor!=null&&methor==1){
				RecruitInfo q = new RecruitInfo();
				q.setId((Integer.parseInt(recruitInfoId)));
				applyRecord.setRecruitInfo(q);
				Resume r = new Resume();
				r.setId((Integer.parseInt(resumeId)));
				applyRecord.setResume(r);
				applyRecord.setIsApply(1);
				applyRecord.setApplyTime(DateUtil.getCurrentDateTimestamp());
				map.put("recruitInfoId", Integer.parseInt(recruitInfoId));
			}
			List<ApplyRecord> applyRecordList=applyRecordService.find(map);
			if(applyRecordList.size()==0){
				resultTotal = applyRecordService.add(applyRecord);
			}else{
				//已有数据
				applyRecord.setId(applyRecordList.get(0).getId());
				resultTotal = applyRecordService.update(applyRecord);
			}
		}
		//用户后台
		else{
			//已有收藏进行申请操作
			if(methor!=null&&methor==1){
				Resume r = new Resume();
				r.setId((Integer.parseInt(resumeId)));
				applyRecord.setResume(r);
				applyRecord.setIsApply(1);
				applyRecord.setApplyTime(DateUtil.getCurrentDateTimestamp());
			}
			resultTotal = applyRecordService.update(applyRecord);
			applyRecord = applyRecordService.findById(applyRecord.getId());
			if(applyRecord.getIsStore()==0 && applyRecord.getIsApply()==0 && applyRecord.getIsInform()==0)
				applyRecordService.delete(applyRecord.getId());
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
	
	
	@RequestMapping("/findByUserIdAndOther")
	public String findByUserIdAndOther(@RequestParam(value="type")String type,HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("currentUser");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put(type, "1");
		map.put("userId", currentUser.getId());
		List<ApplyRecord> applyRecordList=applyRecordService.find(map);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
		JSONArray jsonArray=JSONArray.fromObject(applyRecordList,jsonConfig);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
	@RequestMapping("/findByRecruitInfoIdIdAndOther")
	public String findByRecruitInfoIdIdAndOther(@RequestParam(value="type")String type,HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("currentUser");
		List<RecruitInfo> recruitInfoList = recruitInfoService.findByUserId(currentUser.getId());
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("isApply", "1");
		map.put("recruitInfoList", recruitInfoList);
		List<ApplyRecord> applyRecordList=applyRecordService.find(map);
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONArray jsonArray=JSONArray.fromObject(applyRecordList,jsonConfig);
		ResponseUtil.write(response, jsonArray);
		return null;
	}
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		ApplyRecord applyRecord= null;
		applyRecord=applyRecordService.findById(Integer.parseInt(id));
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
		JSONObject jsonObject=JSONObject.fromObject(applyRecord, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	//收藏
	@RequestMapping("/findByUserIdAndRecruitInfoId")
	public String findByUserIdAndRecruitInfoId(
			@RequestParam(value="recruitInfoId",required=false)String recruitInfoId
			,HttpServletRequest request,HttpServletResponse response)throws Exception{
		JSONObject result=new JSONObject(); 
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("currentUser");
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("userId", currentUser.getId());
		map.put("recruitInfoId", Integer.parseInt(recruitInfoId));
		map.put("isStore", 1);
		List<ApplyRecord> applyRecordList=applyRecordService.find(map);
		if(applyRecordList.size()==0){
			result.put("isStore", true);
		}else{
			result.put("isStore", false);
		}
		map.put("isApply", 1);
		applyRecordList=applyRecordService.find(map);
		if(applyRecordList.size()==0){
			result.put("isApply", true);
		}else{
			result.put("isApply", false);
		}
		
		
		ResponseUtil.write(response, result);
		return null;
	}
	
}
