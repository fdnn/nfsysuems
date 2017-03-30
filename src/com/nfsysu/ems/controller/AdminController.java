package com.nfsysu.ems.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nfsysu.ems.entity.CareerOne;
import com.nfsysu.ems.entity.CareerThree;
import com.nfsysu.ems.entity.CareerTwo;
import com.nfsysu.ems.entity.User;
import com.nfsysu.ems.service.CareerOneService;
import com.nfsysu.ems.service.UserService;
import com.nfsysu.ems.util.ResponseUtil;

/**
 * 管理员Controller层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Resource
	private CareerOneService careerOneService;
	@Resource
	private UserService userService;
	/**
	 * 刷新职位缓存
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/refreshCareer")
	public String refreshSystem(HttpServletRequest request,HttpServletResponse response)throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		List<CareerOne> careerOneList=careerOneService.findWithTwoAndThree(map);
		List<CareerTwo> careerTwoList;
		List<CareerThree> careerThreeList;
		JSONArray jsonArrayS = new JSONArray();
		JSONArray jsonArrayS2 = new JSONArray();
		JSONArray jsonArrayS3 = new JSONArray();
		JSONObject jsonObjectS = new JSONObject();
		JSONObject jsonObjectS2 = new JSONObject();
		JSONObject jsonObjectS3 = new JSONObject();
		
		for(int i = 0;i<careerOneList.size();i++){
			jsonArrayS2.clear();
			careerTwoList = careerOneList.get(i).getCareerTwoList();
			for (int j = 0; j < careerTwoList.size(); j++) {
				jsonArrayS3.clear();
				careerThreeList = careerTwoList.get(j).getCareerThreeList();
				for (int k = 0; k < careerThreeList.size(); k++) {
					jsonObjectS3.put("CodeValue", ""+careerThreeList.get(k).getId());
					jsonObjectS3.put("CodeName", careerThreeList.get(k).getName());
					jsonArrayS3.add(jsonObjectS3);
				}
				jsonObjectS2.put("CodeValue", ""+careerTwoList.get(j).getId());
				jsonObjectS2.put("CodeName", careerTwoList.get(j).getName());
				jsonObjectS2.put("znhycdoe", jsonArrayS3);
				jsonArrayS2.add(jsonObjectS2);
			}
			jsonObjectS.put("CodeValue", ""+careerOneList.get(i).getId());
			jsonObjectS.put("CodeName", careerOneList.get(i).getName());
			jsonObjectS.put("maxhycode", jsonArrayS2);
			jsonArrayS.add(jsonObjectS);			
		}
		OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(request.getServletContext().getRealPath("/")+"static\\zyzn\\load_hycode.js"),"UTF-8");
		out.write("var znhycode = "+jsonArrayS.toString());
		System.out.println("OK");
		out.flush();
		out.close();
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("/saveInfo")
	public String saveInfo(User user,
			@RequestParam(value="file_pic",required=false) MultipartFile file_pic,
			HttpServletRequest request,HttpServletResponse response)throws Exception{
		//上传图片
		if(file_pic!=null && file_pic.getOriginalFilename()!=null && file_pic.getOriginalFilename().length()>0){
			String filePath=request.getServletContext().getRealPath("/");
			String originalFilename = file_pic.getOriginalFilename();//原始名称
			String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));//新的图片名称
			file_pic.transferTo(new File(filePath+"userImages//touxiang//"+newFileName));//将内存中的数据写入磁盘
			user.setPic(newFileName);//新图片写入user
		}else{user.setPic(null);}
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		user.setId(currentUser.getId());
		int resultTotal = userService.update(user);
		JSONObject result=new JSONObject(); 
		if(resultTotal>0){
			currentUser = userService.findById(currentUser.getId());
			session.setAttribute("currentUser",currentUser);
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	@RequestMapping("/updatePassword")
	public String changeUserNameOrPassword(Integer id,
			@RequestParam(value="newPassword",required=false)String newPassword,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		User user=new User();
		user.setId(id);
		if(newPassword!=null && newPassword!=""){
			user.setPassword(newPassword);
		}
		int resultTotal=userService.update(user);
		JSONObject result=new JSONObject();
		if(resultTotal>0){
			HttpSession session = request.getSession();
			User currentUser = (User) session.getAttribute("currentUser");
			currentUser.setPassword(newPassword);
			session.setAttribute("currentUser",currentUser);
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
}
