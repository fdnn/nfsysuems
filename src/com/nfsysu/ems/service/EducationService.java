package com.nfsysu.ems.service;

import java.util.List;

import com.nfsysu.ems.entity.Education;
/**
 * 教育背景Service接口
 * @author 小海
 *
 */
public interface EducationService {
	/**
	 * 修改教育背景
	 * @param education
	 * @return
	 */
	public int update(Education education);
	
	/**
	 * 添加教育背景
	 * @param education
	 * @return
	 */
	public int add(Education education);
	
	/**
	 * 删除教育背景
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Education findById(Integer id);
	
	/**
	 * 根据ResumeId查找集合
	 * @param id
	 * @return
	 */
	public List<Education> findByResumeId(Integer id);
}
