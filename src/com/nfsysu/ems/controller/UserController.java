package com.nfsysu.ems.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nfsysu.ems.entity.LoginData;
import com.nfsysu.ems.entity.Major;
import com.nfsysu.ems.entity.PageBean;
import com.nfsysu.ems.entity.RecruitInfo;
import com.nfsysu.ems.entity.User;
import com.nfsysu.ems.service.MajorService;
import com.nfsysu.ems.service.RecruitInfoService;
import com.nfsysu.ems.service.UserService;
import com.nfsysu.ems.util.CryptographyUtil;
import com.nfsysu.ems.util.DateUtil;
import com.nfsysu.ems.util.HttpClientLog;
import com.nfsysu.ems.util.PageUtil;
import com.nfsysu.ems.util.ResponseUtil;
import com.nfsysu.ems.util.StringUtil;

/**
 * 用户Controller控制层
 * @author 小海
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	@Resource
	private RecruitInfoService recruitInfoService;
	@Resource
	private MajorService majorService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
	}

	// HttpClientLog log = new HttpClientLog();
	public static String JWXT_NFSYSU_HOST = "202.103.141.3";
	public static String JWXT_NFSYSU_DOMAIN = "http://202.103.141.3/";
	public static String JWXT_NFSYSU_LOGIN_PAGE = JWXT_NFSYSU_DOMAIN + "default2.aspx";
	public static String JWXT_NFSYSU_LOGIN_XS_MAIN = JWXT_NFSYSU_DOMAIN + "xs_main.aspx";
	public static String JWXT_NFSYSU_LOGIN_GRXX = JWXT_NFSYSU_DOMAIN + "xsgrxx.aspx";
	
	@RequestMapping("/GetViewAndCookie")
	public String GetViewAndCookie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		LoginData loginData = new LoginData();
		
  		String NET_SessionId = null;
  
 		HttpClient httpClient = new HttpClient();
		GetMethod getMethod = new GetMethod(JWXT_NFSYSU_LOGIN_PAGE);
		
		// log.printRequestHeadersLog(getMethod);
		
		httpClient.executeMethod(getMethod);
		
		// log.printResponseLog(getMethod);
		String content;
		BufferedReader bufr = new BufferedReader(new InputStreamReader(getMethod.getResponseBodyAsStream(),"utf-8"));
		while((content=bufr.readLine())!=null)
		{
			if(content.contains("__VIEWSTATE"))
			{
				//value="dDwyODE2NTM0OTg7Oz4MLBwRJJcOoX1lIuUJer2tovw5UQ=="
				String result = content.substring(content.indexOf("value=\"")+7, 
						content.lastIndexOf("\""));
				content=result;
				loginData.setViewState(result);// 记录下__VIEWSTATE标识
				break;
			}
		}
		
		NET_SessionId = getMethod.getResponseHeader("Set-Cookie").getValue();
		NET_SessionId = NET_SessionId.substring(NET_SessionId.indexOf("=")+1,NET_SessionId.indexOf(";"));

		loginData.setCookie(NET_SessionId);// 记录下cookies
		System.out.println("获取到请求参数为："+NET_SessionId);
		
		request.getSession().setAttribute("loginData", loginData);// 存放到session
		return "redirect:/bindJwxt.jsp";
	}

	@RequestMapping("/showImg")
	public void showImg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//"http://202.103.141.3/CheckCode.aspx"
		LoginData loginData = (LoginData) request.getSession().getAttribute("loginData");
		String ImgCookie = loginData.getCookie();
		System.out.println("============================================");
		System.out.println("收到请求参数为：" + ImgCookie);
		System.out.println("================准备用此参数去获取验证码图片===================");

		HttpClient httpClient = new HttpClient();
		GetMethod getMethodImg = new GetMethod(JWXT_NFSYSU_DOMAIN + "CheckCode.aspx");
		getMethodImg.addRequestHeader("Referer", JWXT_NFSYSU_LOGIN_PAGE);
		getMethodImg.addRequestHeader("Cookie", "ASP.NET_SessionId=" + ImgCookie);
		new HttpClientLog().printRequestHeadersLog(getMethodImg);
		httpClient.executeMethod(getMethodImg);
		byte[] img = getMethodImg.getResponseBody();
		response.getOutputStream().write(img);
		getMethodImg.releaseConnection();
	}

	private String returnLocal;
	@RequestMapping("/bindJwxt")
	public void doPost(
			@RequestParam(value="userName")String userName,
			@RequestParam(value="password")String password,
			@RequestParam(value="txtSecretCode")String txtSecretCode,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("================调用了Login的doPost()=============");
		
		// 判断数据库是否已有此学号，防止重复注册
		User user = new User();
		user.setRole(0);
		user.setUserName(userName);
		boolean result = userService.existNum(user);
		if(result){
			request.setAttribute("errorInfo", "此账号已注册！！");
			request.getRequestDispatcher("/bindJwxt.jsp").forward(request, response);
			return ;
		}
		
		LoginData loginData = (LoginData) request.getSession().getAttribute("loginData");

		loginData.setTxtUserName(userName);
		loginData.setTextBox2(password);
		loginData.setTxtSecretCode(txtSecretCode);
		
		HttpClient httpClient = new HttpClient();
		PostMethod post = new PostMethod(JWXT_NFSYSU_LOGIN_PAGE);
		
//		String __VIEWSTATE = request.getParameter("__VIEWSTATE");
//		String Button1= request.getParameter("Button1");
//		String hidPdrs= request.getParameter("hidPdrs");
//		String hidsc = request.getParameter("hidsc");
//		String lbLanguage= request.getParameter("lbLanguage");
//		String RadioButtonList1= request.getParameter("RadioButtonList1");
//		String TextBox2 = request.getParameter("TextBox2");
//		String txtSecretCode = request.getParameter("txtSecretCode");
//		String txtUserName = request.getParameter("txtUserName");
		
		NameValuePair[]  nvps = new NameValuePair[9];
		
		nvps[0] = new NameValuePair("__VIEWSTATE",loginData.getViewState());
		nvps[1] = new NameValuePair("Button1","");
		nvps[2] = new NameValuePair("hidPdrs","");
		nvps[3] = new NameValuePair("hidsc","");
		nvps[4] = new NameValuePair("lbLanguage","");
		nvps[5] = new NameValuePair("RadioButtonList1","学生");
		nvps[6] = new NameValuePair("TextBox2",loginData.getTextBox2());
		nvps[7] = new NameValuePair("txtSecretCode",loginData.getTxtSecretCode());
		nvps[8] = new NameValuePair("txtUserName",loginData.getTxtUserName());
		
		post.setRequestBody(nvps);
		// System.out.println("Cookie:"+loginData.getCookie());	
		post.addRequestHeader("Cookie", "ASP.NET_SessionId="+loginData.getCookie());
		
		new HttpClientLog().printRequestHeadersLog(post);
		
		httpClient.executeMethod(post);
		new HttpClientLog().printResponseHeadersLog(post);
		BufferedReader bufr = new BufferedReader(new InputStreamReader(post.getResponseBodyAsStream()));
		String line = null;
		// System.out.println(post.getResponseBodyAsString());
		if(post.getResponseBodyAsString().contains("验证码不正确！"))
		{
			request.setAttribute("errorInfo", "验证码错误！！");
			request.getRequestDispatcher("/bindJwxt.jsp").forward(request, response);
			return ;
		}
		Header header = post.getResponseHeader("Location");
		if(header==null)
		{
			request.setAttribute("errorInfo", "您的教务系统账号或密码错误!!");
			request.getRequestDispatcher("/bindJwxt.jsp").forward(request, response);
			return ;
		}
		returnLocal=header.getValue();
		if(!returnLocal.contains("xs_main.aspx"))
		{
			// System.out.println("不正确的返回===》Location: "+returnLocal);
			String errorInfo = post.getResponseBodyAsString();
			request.setAttribute("errorInfo", errorInfo);
			post.releaseConnection();
			request.getRequestDispatcher("/bindJwxt.jsp").forward(request, response);
			return ;
		}
		// System.out.println("Location: "+returnLocal);
		post.releaseConnection();
		String xh = returnLocal.substring(returnLocal.indexOf("?"), returnLocal.length());
		request.getSession().setAttribute("xh", xh);
		
		GetMethod get = new GetMethod(JWXT_NFSYSU_DOMAIN+returnLocal);
		get.addRequestHeader("Cookie", "ASP.NET_SessionId="+loginData.getCookie());
		new HttpClientLog().printRequestHeadersLog(get);
		httpClient.executeMethod(get);
		new HttpClientLog().printResponseLog(get);
		request.getSession().setAttribute("Cookie", "ASP.NET_SessionId="+loginData.getCookie());
		request.getSession().setAttribute("bindPower", true);
		// System.out.println(get.getResponseBodyAsString());

		request.getRequestDispatcher("/setPassword.jsp").forward(request, response);
	}
	
	@RequestMapping("/setPassword")
	public void setPassword(
			@RequestParam(value="password")String password,
			@RequestParam(value="repeatPassword")String repeat,
			HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		if(!password.equals(repeat)){
			request.setAttribute("errorInfo", "密码不一致");
			request.getRequestDispatcher("/setPassword.jsp").forward(request, response);
			return;
		}
		if(request.getSession().getAttribute("bindPower")==null 
				|| !(boolean)request.getSession().getAttribute("bindPower") ){
			request.setAttribute("errorInfo", "別耍小聪明");
			request.getRequestDispatcher("/setPassword.jsp").forward(request, response);
			return;
		}
		User user = new User();
		LoginData loginData = (LoginData) request.getSession().getAttribute("loginData");
		user.setUserName(loginData.getTxtUserName());
		password = CryptographyUtil.md5(password, "xiaohai084");// 后台二重加密
		user.setPassword(password);
		 
		HttpClient httpClient = new HttpClient();
		GetMethod get = new GetMethod(JWXT_NFSYSU_LOGIN_GRXX + request.getSession().getAttribute("xh") + "&" + "gnmkdm=N121501");
		get.addRequestHeader("Referer", JWXT_NFSYSU_LOGIN_XS_MAIN + request.getSession().getAttribute("xh"));
		get.addRequestHeader("Cookie", "ASP.NET_SessionId=" + loginData.getCookie());
		new HttpClientLog().printRequestHeadersLog(get);
		httpClient.executeMethod(get);
		new HttpClientLog().printResponseLog(get);
		
		String responseBody = get.getResponseBodyAsString();
		String xm = StringUtil.patternGrxx("xm", responseBody, 0);// 姓名
		String xb = StringUtil.patternGrxx("lbl_xb", responseBody, 0);// 性别
		Date csrq = DateUtil.formatString(StringUtil.patternGrxx("lbl_csrq", responseBody, 2), "yyyy-MM-dd");// 出生日期
		String mz = StringUtil.patternGrxx("lbl_mz", responseBody, 0);// 名族
		String zzmm = StringUtil.patternGrxx("lbl_zzmm", responseBody, 0);// 政治面貌
		String xszp = JWXT_NFSYSU_DOMAIN + StringUtil.patternGrxx("xszp", responseBody, 3);// 头像
		int dqszj = Integer.parseInt(StringUtil.patternGrxx("lbl_dqszj", responseBody, 1));// 当前所在级
		int xz = Integer.parseInt(StringUtil.patternGrxx("lbl_xz", responseBody, 1));// 学制
		Date bynf = DateUtil.formatString(dqszj + xz + "", "yyyy");// 毕业年份
		
		user.setTrueName(xm);
		user.setSex(xb);
		user.setBirthday(csrq);
		user.setPolitics(zzmm);
//		user.setPic(xszp);
		user.setGraduationYear(bynf);
		
		/*GetMethod get2 = new GetMethod(xszp);
		get2.addRequestHeader("Referer", JWXT_NFSYSU_LOGIN_GRXX + "?xh=" + request.getSession().getAttribute("xh") + "&gnmkdm=N121501");
		get2.addRequestHeader("Cookie", "ASP.NET_SessionId=" + loginData.getCookie());
		httpClient.executeMethod(get2);
		byte[] responseBody2 = get2.getResponseBody();
		File file = new File("D:\\jj");  
        if (!file.exists()) {  
            file.mkdirs();  
        }  
        FileOutputStream fos = new FileOutputStream("D:\\jj\\test.jpg");  
        fos.write(responseBody2);  */
        
        
		boolean result = userService.register(user);
		if(!result){
			request.setAttribute("errorInfo", "设置失败");
			request.getRequestDispatcher("/setPassword.jsp").forward(request, response);
			return;
		}

		request.getSession().setAttribute("bindPower", false);
		request.getRequestDispatcher("/bindSuccess.jsp").forward(request, response);
		return;
	}
	
	
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request)throws Exception{
		Subject subject=SecurityUtils.getSubject();
		UsernamePasswordToken token=new UsernamePasswordToken(user.getUserName(), CryptographyUtil.md5(user.getPassword(),"xiaohai084"));
		try{
			subject.login(token);
			Session session=subject.getSession();
			User resultUser = userService.login(user);
			session.setAttribute("currentUser", resultUser);
			session.setAttribute("remoteAddr", request.getRemoteAddr());
			return "redirect:/foreground/index.jsp";
		} catch(Exception e){
			e.printStackTrace();
//			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "用户名或密码错误");
			return "login";
		}
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/logout")
	public String logout()throws Exception{
		Subject subject=SecurityUtils.getSubject();
		Session session=subject.getSession();
		session.removeAttribute("currentUser");
		session.stop();
		return "login";
	}

	/**
	 * 更新当前用户的缓存数据
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateSessionForCurrentUser")
	public String updateSessionForCurrentUser(HttpServletRequest request)throws Exception{
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		currentUser = userService.findById(currentUser.getId());
		session.setAttribute("currentUser",currentUser);
		return null;
	}
	
	/**
	 * 分页条件查询用户
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
			@RequestParam(value="grade",required=false)Integer grade,
			User user,HttpServletResponse response)throws Exception{
		PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
		Map<String,Object> map=new HashMap<String,Object>();
		//身份条件
		map.put("role", user.getRole());
		//学生查询条件
		map.put("userName", StringUtil.formatLike(user.getUserName()));
		if(user.getMajor()!=null)	
			map.put("majorId", user.getMajor().getId());
		if(grade!=null)
			map.put("grade", grade);
		//企业查询条件
		map.put("nature", user.getNature());
		if(user.getCareerTwo()!=null){
			map.put("careerTwo", user.getCareerTwo().getId());
		}
		map.put("scale", user.getScale());
		//系管理员查询条件
		map.put("authority", user.getAuthority());
		if(user.getDep()!=null)	
			map.put("depId", user.getDep().getId());
		
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<User> userList=userService.find(map);
		Long total=userService.getTotal(map);
		JSONObject result=new JSONObject();
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM"));
		JSONArray jsonArray=JSONArray.fromObject(userList,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		ResponseUtil.write(response, result);
		return null;
	}
	
	@RequestMapping("/findById")
	public String findById(@RequestParam(value="id")String id,HttpServletRequest request,HttpServletResponse response)throws Exception{
		User user= null;
		user=userService.findById(Integer.parseInt(id));
		JsonConfig jsonConfig=new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM"));
		JSONObject jsonObject=JSONObject.fromObject(user, jsonConfig);
		ResponseUtil.write(response, jsonObject);
		return null;
	}
	
	/**
	 * 添加或者修改用户
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(User user,
			@RequestParam(value="majorId",required=false) Integer majorId,
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
		
		int resultTotal=0; // 操作的记录条数
		HttpSession session = request.getSession();
		
		user.setOrigin(user.getProvince()+user.getCity());
		
		if(majorId!=null){
			Major major = majorService.findById(majorId);
			user.setMajor(major);
		}
		
		if(user.getId()==null){
			user.setResumeNum(5);//限制学生添加简历数
			resultTotal=userService.add(user);
		}else{
			resultTotal=userService.update(user);
		}
		
		User currentUser = (User)session.getAttribute("currentUser");
		if(resultTotal>0){
			currentUser = userService.findById(currentUser.getId());
			session.setAttribute("currentUser",currentUser);
			if(user.getLnglat()!=null){
				JSONObject result=new JSONObject();
				result.put("success", true);
				ResponseUtil.write(response, result);
				return null;
			}
			request.setAttribute("color", "green");
			request.setAttribute("msg", "修改成功");
		}else{
			request.setAttribute("color", "red");
			request.setAttribute("msg", "修改失败");
		}
		
		if(currentUser.getRole()==0){
			return "forward:/student/account/basicinfo.jsp";
		}
		else{
			return "forward:/company/account/basicinfo.jsp";
		}
	}
	
	/**
	 * 管理员添加或者修改用户
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveManage")
	public String saveManage(User user,HttpServletResponse response)throws Exception{
		int resultTotal=0; // 操作的记录条数
		if(user.getId()==null){
			resultTotal=userService.add(user);
		}else{
			resultTotal=userService.update(user);
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
	
	/**
	 * 修改用户名或密码
	 * @param user
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/changeUserNameOrPassword")
	public String changeUserNameOrPassword(Integer id,
			@RequestParam(value="newUserName",required=false)String newUserName,
			@RequestParam(value="newPassword",required=false)String newPassword,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		User user=new User();
		user.setId(id);
		if(newUserName!=null && newUserName!=""){
			user.setUserName(newUserName);
		}
		if(newPassword!=null && newPassword!=""){
			user.setPassword(newPassword);
		}
		int resultTotal=userService.update(user);
		JSONObject result=new JSONObject();
		if(resultTotal>0){
			result.put("success", true);
			if(newUserName!=null){
				HttpSession session = request.getSession();
				User currentUser = (User) session.getAttribute("currentUser");
				currentUser = userService.findById(currentUser.getId());
				session.setAttribute("currentUser",currentUser);
			}
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
	/**
	 * 删除用户
	 * @param ids
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
		String []idsStr=ids.split(",");
		for(int i=0;i<idsStr.length;i++){
			userService.delete(Integer.parseInt(idsStr[i]));
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}

	/**
	 * 企业前台分页显示
	 * @return
	 */
	@RequestMapping("/index")
	public String index(@RequestParam(value="page",required=false)String page,
			@RequestParam(value="hy",required=false)String hy,
			@RequestParam(value="province",required=false)String province,
			@RequestParam(value="city",required=false)String city,
			@RequestParam(value="name",required=false)String name,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("UTF-8");
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),10);
		Map<String,Object> map=new HashMap<String,Object>();
		StringBuffer param=new StringBuffer();
		if(StringUtil.isNotEmpty(hy)){
			map.put("careerTwo", Integer.parseInt(hy));
			param.append("hy="+hy+"&");
		}
		if(StringUtil.isNotEmpty(province)){
			province = new String(province.getBytes("iso-8859-1"),"utf-8");
			map.put("province", province);
			param.append("province="+province+"&");
		}
		if(StringUtil.isNotEmpty(city)){
			city = new String(city.getBytes("iso-8859-1"),"utf-8");
			map.put("city", city);
			param.append("city="+city+"&");
		}
		if(StringUtil.isNotEmpty(name)){
			name = new String(name.getBytes("iso-8859-1"),"utf-8");
			map.put("trueName", StringUtil.formatLike(name));
			param.append("name="+name+"&");
		}

		map.put("role", 1);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<User> companyList=userService.find(map);
		
		JSONObject result=new JSONObject(); 
		result.put("companyList", companyList);
		result.put("pageCode", PageUtil.genPagination(request.getContextPath()+"/user/index.do", userService.getTotal(map), Integer.parseInt(page), 10, param.toString()));
		ResponseUtil.write(response, result);
		return null;
	}
	
	
	/**
	 * 企业详情
	 * @param userId
	 * @param page
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/detail")
	public String detail(@RequestParam(value="userId")Integer userId,
			@RequestParam(value="page",required=false)String page,HttpServletRequest request)throws Exception{
		User user=userService.findById(userId);
		
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),10);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<RecruitInfo> recruitInfoList=recruitInfoService.find(map);
		user.setRecruitInfoList(recruitInfoList);
		StringBuffer param=new StringBuffer();
		if(StringUtil.isNotEmpty(""+userId)){
			param.append("userId="+userId+"&");
		}
		request.setAttribute("pageCode", PageUtil.genPagination(request.getContextPath()+"/user/recruitInfos.do", recruitInfoService.getTotal(map), Integer.parseInt(page), 10, param.toString()));
		request.setAttribute("user", user);
		
		if(user.getRole()==1){
			return "forward:/foreground/companyDetail.jsp";
		}else{
			return "forward:/foreground/studentDetail.jsp";
		}
	}
	
	/**
	 * 企业的招聘信息分页
	 * @param userId
	 * @param page
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/recruitInfos")
	public String recruitInfos(@RequestParam(value="userId")Integer userId,
			@RequestParam(value="page",required=false)String page,
			HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		if(StringUtil.isEmpty(page)){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),10);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("start", pageBean.getStart());
		map.put("size", pageBean.getPageSize());
		List<RecruitInfo> recruitInfoList=recruitInfoService.find(map);
		StringBuffer param=new StringBuffer();
		if(StringUtil.isNotEmpty(""+userId)){
			param.append("userId="+userId+"&");
		}

		JSONObject result=new JSONObject(); 
		result.put("recruitInfoList", recruitInfoList);
		result.put("pageCode", PageUtil.genPagination(request.getContextPath()+"/user/recruitInfos.do", recruitInfoService.getTotal(map), Integer.parseInt(page), 10, param.toString()));
		ResponseUtil.write(response, result);
		return null;
	}
}
