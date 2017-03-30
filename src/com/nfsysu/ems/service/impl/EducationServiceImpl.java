package com.nfsysu.ems.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.EducationDao;
import com.nfsysu.ems.entity.Education;
import com.nfsysu.ems.service.EducationService;

/**
 * 教育背景Service实现类
 * @author 小海
 *
 */
@Service("educationService")
public class EducationServiceImpl implements EducationService{

	@Resource
	private EducationDao educationDao;

	@Override
	public int update(Education education) {
		// TODO Auto-generated method stub
		return educationDao.update(education);
	}

	@Override
	public int add(Education education) {
		// TODO Auto-generated method stub
		return educationDao.add(education);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return educationDao.delete(id);
	}

	@Override
	public Education findById(Integer id) {
		// TODO Auto-generated method stub
		return educationDao.findById(id);
	}

	@Override
	public List<Education> findByResumeId(Integer id) {
		// TODO Auto-generated method stub
		return educationDao.findByResumeId(id);
	}

	
}
