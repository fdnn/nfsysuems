package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.CareerTwoDao;
import com.nfsysu.ems.entity.CareerTwo;
import com.nfsysu.ems.service.CareerTwoService;

/**
 * 二级级职位Service实现类
 * @author 小海
 *
 */
@Service("careerTwoService")
public class CareerTwoServiceImpl implements CareerTwoService{

	@Resource
	private CareerTwoDao careerTwoDao;

	@Override
	public List<CareerTwo> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return careerTwoDao.find(map);
	}

	@Override
	public int update(CareerTwo careerTwo) {
		// TODO Auto-generated method stub
		return careerTwoDao.update(careerTwo);
	}

	@Override
	public int add(CareerTwo careerTwo) {
		// TODO Auto-generated method stub
		return careerTwoDao.add(careerTwo);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return careerTwoDao.delete(id);
	}

	@Override
	public CareerTwo findById(Integer id) {
		// TODO Auto-generated method stub
		return careerTwoDao.findById(id);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return careerTwoDao.getTotal(map);
	}

	@Override
	public CareerTwo findByIdWithThree(Integer id) {
		// TODO Auto-generated method stub
		return careerTwoDao.findByIdWithThree(id);
	}

	@Override
	public CareerTwo findByOneId(Integer id) {
		// TODO Auto-generated method stub
		return careerTwoDao.findByOneId(id);
	}
}
