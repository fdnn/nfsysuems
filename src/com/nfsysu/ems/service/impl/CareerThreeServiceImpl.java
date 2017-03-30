package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.CareerThreeDao;
import com.nfsysu.ems.entity.CareerThree;
import com.nfsysu.ems.service.CareerThreeService;

/**
 * 三级级职位Service实现类
 * @author 小海
 *
 */
@Service("careerThreeService")
public class CareerThreeServiceImpl implements CareerThreeService{

	@Resource
	private CareerThreeDao careerThreeDao;

	@Override
	public List<CareerThree> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return careerThreeDao.find(map);
	}

	@Override
	public int update(CareerThree careerThree) {
		// TODO Auto-generated method stub
		return careerThreeDao.update(careerThree);
	}

	@Override
	public int add(CareerThree careerThree) {
		// TODO Auto-generated method stub
		return careerThreeDao.add(careerThree);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return careerThreeDao.delete(id);
	}

	@Override
	public CareerThree findById(Integer id) {
		// TODO Auto-generated method stub
		return careerThreeDao.findById(id);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return careerThreeDao.getTotal(map);
	}
}
