package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.RecruitInfoDao;
import com.nfsysu.ems.entity.RecAResAna;
import com.nfsysu.ems.entity.RecruitInfo;
import com.nfsysu.ems.service.RecruitInfoService;

/**
 * 证书Service实现类
 * @author 小海
 *
 */
@Service("recruitInfoService")
public class RecruitInfoServiceImpl implements RecruitInfoService{

	@Resource
	private RecruitInfoDao recruitInfoDao;

	@Override
	public List<RecruitInfo> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return recruitInfoDao.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return recruitInfoDao.getTotal(map);
	}

	@Override
	public int update(RecruitInfo recruitInfo) {
		// TODO Auto-generated method stub
		return recruitInfoDao.update(recruitInfo);
	}

	@Override
	public int add(RecruitInfo recruitInfo) {
		// TODO Auto-generated method stub
		return recruitInfoDao.add(recruitInfo);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return recruitInfoDao.delete(id);
	}

	@Override
	public RecruitInfo findById(Integer id) {
		// TODO Auto-generated method stub
		return recruitInfoDao.findById(id);
	}

	@Override
	public List<RecruitInfo> findByUserId(Integer id) {
		// TODO Auto-generated method stub
		return recruitInfoDao.findByUserId(id);
	}
	
	@Override
	public List<RecAResAna> findGroupByCreateDate(){
		// TODO Auto-generated method stub
		return recruitInfoDao.findGroupByCreateDate();
	}
	
	@Override
	public List<RecAResAna> findGroupByCity(){
		// TODO Auto-generated method stub
		return recruitInfoDao.findGroupByCity();
	}
	
	@Override
	public List<RecAResAna> findGroupByProvince(){
		// TODO Auto-generated method stub
		return recruitInfoDao.findGroupByProvince();
	}

	@Override
	public List<RecAResAna> findBySalary() {
		// TODO Auto-generated method stub
		return recruitInfoDao.findBySalary();
	}

	@Override
	public List<RecAResAna> findGroupByTypeOne() {
		// TODO Auto-generated method stub
		return recruitInfoDao.findGroupByTypeOne();
	}

	@Override
	public List<RecAResAna> findGroupByTypeTwo() {
		// TODO Auto-generated method stub
		return recruitInfoDao.findGroupByTypeTwo();
	}

	@Override
	public List<RecAResAna> findGroupByTypeThree() {
		// TODO Auto-generated method stub
		return recruitInfoDao.findGroupByTypeThree();
	}

	@Override
	public RecruitInfo getLast(Integer id) {
		// TODO Auto-generated method stub
		return recruitInfoDao.getLast(id);
	}

	@Override
	public RecruitInfo getNext(Integer id) {
		// TODO Auto-generated method stub
		return recruitInfoDao.getNext(id);
	}

}
