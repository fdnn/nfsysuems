package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.DynamicDao;
import com.nfsysu.ems.entity.Dynamic;
import com.nfsysu.ems.service.DynamicService;

/**
 * 企业动态Service实现类
 * @author 小海
 *
 */
@Service("dynamicService")
public class DynamicServiceImpl implements DynamicService{

	@Resource
	private DynamicDao dynamicDao;

	@Override
	public List<Dynamic> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dynamicDao.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dynamicDao.getTotal(map);
	}
	
	@Override
	public int update(Dynamic dynamic) {
		// TODO Auto-generated method stub
		return dynamicDao.update(dynamic);
	}

	@Override
	public int add(Dynamic dynamic) {
		// TODO Auto-generated method stub
		return dynamicDao.add(dynamic);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return dynamicDao.delete(id);
	}

	@Override
	public Dynamic findById(Integer id) {
		// TODO Auto-generated method stub
		return dynamicDao.findById(id);
	}

	@Override
	public List<Dynamic> findByUserId(Integer id) {
		// TODO Auto-generated method stub
		return dynamicDao.findByUserId(id);
	}

	@Override
	public Dynamic getLast(Integer id) {
		// TODO Auto-generated method stub
		return dynamicDao.getLast(id);
	}

	@Override
	public Dynamic getNext(Integer id) {
		// TODO Auto-generated method stub
		return dynamicDao.getNext(id);
	}

}
