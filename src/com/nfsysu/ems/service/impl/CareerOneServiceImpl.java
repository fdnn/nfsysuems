package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.CareerOneDao;
import com.nfsysu.ems.entity.CareerOne;
import com.nfsysu.ems.service.CareerOneService;

/**
 * 一级职位Service实现类
 * @author 小海
 *
 */
@Service("careerOneService")
public class CareerOneServiceImpl implements CareerOneService{

	@Resource
	private CareerOneDao careerOneDao;

	@Override
	public List<CareerOne> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return careerOneDao.find(map);
	}
	
	@Override
	public List<CareerOne> findWithTwo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return careerOneDao.findWithTwo(map);
	}
	
	@Override
	public List<CareerOne> findWithTwoAndThree(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return careerOneDao.findWithTwoAndThree(map);
	}

	@Override
	public int update(CareerOne careerOne) {
		// TODO Auto-generated method stub
		return careerOneDao.update(careerOne);
	}

	@Override
	public int add(CareerOne careerOne) {
		// TODO Auto-generated method stub
		return careerOneDao.add(careerOne);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return careerOneDao.delete(id);
	}

	@Override
	public CareerOne findById(Integer id) {
		// TODO Auto-generated method stub
		return careerOneDao.findById(id);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return careerOneDao.getTotal(map);
	}

	@Override
	public CareerOne findByIdWithTwo(Integer id) {
		// TODO Auto-generated method stub
		return careerOneDao.findByIdWithTwo(id);
	}
}
