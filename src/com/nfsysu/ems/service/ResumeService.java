package com.nfsysu.ems.service;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.RecAResAna;
import com.nfsysu.ems.entity.Resume;
/**
 * 简历Service接口
 * @author 小海
 *
 */
public interface ResumeService {
	/**
	 * 查询简历集合
	 * @param map
	 * @return
	 */
	public List<Resume> find(Map<String,Object> map);
	
	public Map<String,Object> newData();
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);

	/**
	 * 修改简历
	 * @param resume
	 * @return
	 */
	public int update(Resume resume);
	
	/**
	 * 添加简历
	 * @param resume
	 * @return
	 */
	public int add(Integer userId);
	
	/**
	 * 删除简历
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Resume findById(Integer id);

	/**
	 * 根据userId查找集合
	 * @param id
	 * @return
	 */
	public List<Resume> findByUserId(Integer id);
	


	/**
	 * 查询简历分析结果-发布时间
	 * @return
	 */
	public List<RecAResAna> findGroupByCreateDate();

	/**
	 * 查询简历分析结果-市
	 * @return
	 */
	public List<RecAResAna> findGroupByCity();
	
	/**
	 * 查询简历分析结果-省
	 * @return
	 */
	public List<RecAResAna> findGroupByProvince();

	/**
	 * 查询薪资分析结果
	 * @return
	 */
	public List<RecAResAna> findBySalary();

	/**
	 * 查询简历分析结果-职业one
	 * @return
	 */
	public List<RecAResAna> findGroupByTypeOne();


	/**
	 * 查询简历分析结果-职业two
	 * @return
	 */
	public List<RecAResAna> findGroupByTypeTwo();


	/**
	 * 查询简历分析结果-职业three
	 * @return
	 */
	public List<RecAResAna> findGroupByTypeThree();
}
