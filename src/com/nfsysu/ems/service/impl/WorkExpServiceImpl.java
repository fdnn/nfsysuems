package com.nfsysu.ems.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.WorkExpDao;
import com.nfsysu.ems.entity.WorkExp;
import com.nfsysu.ems.service.WorkExpService;

/**
 * 工作/实习经验Service实现类
 * @author 小海
 *
 */
@Service("workExpService")
public class WorkExpServiceImpl implements WorkExpService{

	@Resource
	private WorkExpDao workExpDao;

	@Override
	public int update(WorkExp workExp) {
		// TODO Auto-generated method stub
		return workExpDao.update(workExp);
	}

	@Override
	public int add(WorkExp workExp) {
		// TODO Auto-generated method stub
		return workExpDao.add(workExp);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return workExpDao.delete(id);
	}

	@Override
	public WorkExp findById(Integer id) {
		// TODO Auto-generated method stub
		return workExpDao.findById(id);
	}

	@Override
	public List<WorkExp> findByResumeId(Integer id) {
		// TODO Auto-generated method stub
		return workExpDao.findByResumeId(id);
	}
}
