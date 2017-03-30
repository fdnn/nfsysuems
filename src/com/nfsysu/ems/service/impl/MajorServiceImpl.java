package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.MajorDao;
import com.nfsysu.ems.entity.Major;
import com.nfsysu.ems.service.MajorService;

/**
 * 专业Service实现类
 * @author 小海
 *
 */
@Service("majorService")
public class MajorServiceImpl implements MajorService{

	@Resource
	private MajorDao majorDao;

	@Override
	public List<Major> find(Map<String, Object> map) {
		return majorDao.find(map);
	}

	@Override
	public int update(Major major) {
		return majorDao.update(major);
	}

	@Override
	public int add(Major major) {
		return majorDao.add(major);
	}

	@Override
	public int delete(Integer id) {
		return majorDao.delete(id);
	}

	@Override
	public Major findById(Integer id) {
		return majorDao.findById(id);
	}

	@Override
	public List<Major> findByDepId(Integer id) {
		return majorDao.findByDepId(id);
	}

}
