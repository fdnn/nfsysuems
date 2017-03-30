package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.CertificateDao;
import com.nfsysu.ems.entity.Certificate;
import com.nfsysu.ems.service.CertificateService;

/**
 * 证书Service实现类
 * @author 小海
 *
 */
@Service("certificateService")
public class CertificateServiceImpl implements CertificateService{

	@Resource
	private CertificateDao certificateDao;

	@Override
	public List<Certificate> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return certificateDao.find(map);
	}

	@Override
	public int update(Certificate certificate) {
		// TODO Auto-generated method stub
		return certificateDao.update(certificate);
	}

	@Override
	public int add(Certificate certificate) {
		// TODO Auto-generated method stub
		return certificateDao.add(certificate);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return certificateDao.delete(id);
	}

	@Override
	public Certificate findById(Integer id) {
		// TODO Auto-generated method stub
		return certificateDao.findById(id);
	}

	@Override
	public List<Certificate> findByResumeId(Integer id) {
		// TODO Auto-generated method stub
		return certificateDao.findByResumeId(id);
	}
}
