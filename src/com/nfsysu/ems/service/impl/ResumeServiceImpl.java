package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.CertificateDao;
import com.nfsysu.ems.dao.EducationDao;
import com.nfsysu.ems.dao.ItemExpDao;
import com.nfsysu.ems.dao.ResumeDao;
import com.nfsysu.ems.dao.WorkExpDao;
import com.nfsysu.ems.entity.Certificate;
import com.nfsysu.ems.entity.Education;
import com.nfsysu.ems.entity.ItemExp;
import com.nfsysu.ems.entity.RecAResAna;
import com.nfsysu.ems.entity.Resume;
import com.nfsysu.ems.entity.WorkExp;
import com.nfsysu.ems.service.ResumeService;

/**
 * 简历Service实现类
 * @author 小海
 *
 */
@Service("resumeService")
public class ResumeServiceImpl implements ResumeService{

	@Resource
	private ResumeDao resumeDao;
	@Resource
	private CertificateDao certificateDao;
	@Resource
	private EducationDao educationDao;
	@Resource
	private ItemExpDao itemExpDao;
	@Resource
	private WorkExpDao workExpDao;

	@Override
	public List<Resume> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return resumeDao.find(map);
	}

	@Override
	public int update(Resume resume) {
		// TODO Auto-generated method stub
		return resumeDao.update(resume);
	}

	@Override
	public int add(Integer userId) {
		// TODO Auto-generated method stub
		return resumeDao.add(userId);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		for(Certificate certificate:certificateDao.findByResumeId(id)){
			certificateDao.delete(certificate.getId());
		}
		for(Education education:educationDao.findByResumeId(id)){
			educationDao.delete(education.getId());
		}
		for(ItemExp itemExp:itemExpDao.findByResumeId(id)){
			itemExpDao.delete(itemExp.getId());
		}
		for(WorkExp workExp:workExpDao.findByResumeId(id)){
			workExpDao.delete(workExp.getId());
		}
		return resumeDao.delete(id);
	}

	@Override
	public Resume findById(Integer id) {
		// TODO Auto-generated method stub
		return resumeDao.findById(id);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return resumeDao.getTotal(map);
	}

	@Override
	public List<Resume> findByUserId(Integer id) {
		// TODO Auto-generated method stub
		return resumeDao.findByUserId(id);
	}

	@Override
	public List<RecAResAna> findGroupByCreateDate() {
		// TODO Auto-generated method stub
		return resumeDao.findGroupByCreateDate();
	}

	@Override
	public List<RecAResAna> findGroupByCity() {
		// TODO Auto-generated method stub
		return resumeDao.findGroupByCity();
	}

	@Override
	public List<RecAResAna> findGroupByProvince() {
		// TODO Auto-generated method stub
		return resumeDao.findGroupByProvince();
	}

	@Override
	public List<RecAResAna> findBySalary() {
		// TODO Auto-generated method stub
		return resumeDao.findBySalary();
	}

	@Override
	public List<RecAResAna> findGroupByTypeOne() {
		// TODO Auto-generated method stub
		return resumeDao.findGroupByTypeOne();
	}

	@Override
	public List<RecAResAna> findGroupByTypeTwo() {
		// TODO Auto-generated method stub
		return resumeDao.findGroupByTypeTwo();
	}

	@Override
	public List<RecAResAna> findGroupByTypeThree() {
		// TODO Auto-generated method stub
		return resumeDao.findGroupByTypeThree();
	}

	@Override
	public Map<String,Object> newData() {
		// TODO Auto-generated method stub
		return resumeDao.newData();
	}
}
