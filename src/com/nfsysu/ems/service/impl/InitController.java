package com.nfsysu.ems.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.nfsysu.ems.entity.CareerOne;
import com.nfsysu.ems.entity.Dep;
import com.nfsysu.ems.entity.Dynamic;
import com.nfsysu.ems.entity.Major;
import com.nfsysu.ems.entity.Notice;
import com.nfsysu.ems.entity.RecruitInfo;
import com.nfsysu.ems.service.CareerOneService;
import com.nfsysu.ems.service.DepService;
import com.nfsysu.ems.service.DynamicService;
import com.nfsysu.ems.service.MajorService;
import com.nfsysu.ems.service.NoticeService;
import com.nfsysu.ems.service.RecruitInfoService;

@Component
public class InitController implements ServletContextListener,ApplicationContextAware{

	private static ApplicationContext applicationContext;
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext application=servletContextEvent.getServletContext();
		DepService depService = (DepService)applicationContext.getBean("depService");
		List<Dep> depList = depService.find(new HashMap<String,Object>());
		application.setAttribute("depList", depList);
		MajorService majorService = (MajorService)applicationContext.getBean("majorService");
		List<Major> majorList = majorService.find(new HashMap<String,Object>());
		application.setAttribute("majorList", majorList);
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		CareerOneService careerOneService = (CareerOneService)applicationContext.getBean("careerOneService");
		RecruitInfoService recruitInfoService = (RecruitInfoService)applicationContext.getBean("recruitInfoService");
		map.put("orderNum", 5);
		List<CareerOne> careerOneList = careerOneService.findWithTwo(map);
		application.setAttribute("careerOneList", careerOneList);
		map.put("start", 0);
		map.put("size", 15);
		List<RecruitInfo> recruitInfoList = null; 
		recruitInfoList = recruitInfoService.find(map);
		application.setAttribute("newRecruitInfoList", recruitInfoList);
		
		List rilList = new ArrayList();
		for(int i=0;i<careerOneList.size();i++){
			map.put("careerOne", careerOneList.get(i).getId());
			recruitInfoList = recruitInfoService.find(map);
			rilList.add(recruitInfoList);
		}
		application.setAttribute("rilList", rilList);
		
		
		
		map.put("size", 7);
		NoticeService noticeService = (NoticeService)applicationContext.getBean("noticeService");
		List<Notice> noticeList = noticeService.find(map);
		application.setAttribute("noticeListIndex", noticeList);
		DynamicService dynamicService = (DynamicService)applicationContext.getBean("dynamicService");
		List<Dynamic> dynamicList = dynamicService.find(map);
		application.setAttribute("dynamicListIndex", dynamicList);
	}

	@SuppressWarnings("static-access")
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// TODO Auto-generated method stub
		this.applicationContext=applicationContext;
	}
}
