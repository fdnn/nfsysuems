package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.DepDao;
import com.nfsysu.ems.dao.MajorDao;
import com.nfsysu.ems.entity.Dep;
import com.nfsysu.ems.entity.Major;
import com.nfsysu.ems.service.DepService;

/**
 * 系Service实现类
 * @author 小海
 *
 */
@Service("depService")
public class DepServiceImpl implements DepService{

	@Resource
	private DepDao depDao;
	@Resource
	private MajorDao majorDao;

	@Override
	public List<Dep> find(Map<String, Object> map) {
		return depDao.find(map);
	}

	@Override
	public int update(Dep dep) {
		return depDao.update(dep);
	}

	@Override
	public int add(Dep dep) {
		return depDao.add(dep);
	}

	@Override
	public int delete(Integer id) {
		for(Major major:majorDao.findByDepId(id)){
			majorDao.delete(major.getId());
		}
		return depDao.delete(id);
	}

	@Override
	public Dep findById(Integer id) {
		return depDao.findById(id);
	}

}
