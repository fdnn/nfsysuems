package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.ApplyRecordDao;
import com.nfsysu.ems.entity.ApplyRecord;
import com.nfsysu.ems.service.ApplyRecordService;

/**
 * 证书Service实现类
 * @author 小海
 *
 */
@Service("applyRecordService")
public class ApplyRecordServiceImpl implements ApplyRecordService{

	@Resource
	private ApplyRecordDao applyRecordDao;

	@Override
	public List<ApplyRecord> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return applyRecordDao.find(map);
	}

	@Override
	public int update(ApplyRecord applyRecord) {
		// TODO Auto-generated method stub
		return applyRecordDao.update(applyRecord);
	}

	@Override
	public int add(ApplyRecord applyRecord) {
		// TODO Auto-generated method stub
		return applyRecordDao.add(applyRecord);
	}

	@Override 
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return applyRecordDao.delete(id);
	}

	@Override
	public ApplyRecord findById(Integer id) {
		// TODO Auto-generated method stub
		return applyRecordDao.findById(id);
	}

	@Override
	public List<ApplyRecord> findByUserId(Integer id) {
		// TODO Auto-generated method stub
		return applyRecordDao.findByUserId(id);
	}
}
