package com.nfsysu.ems.dao;

import java.util.List;

import com.nfsysu.ems.entity.WorkExp;

/**
 * 工作/实习经验Dao接口
 * @author 小海
 *
 */
public interface WorkExpDao {

	/**
	 * 修改工作/实习经验
	 * @param workExp
	 * @return
	 */
	public int update(WorkExp workExp);
	
	/**
	 * 添加工作/实习经验
	 * @param workExp
	 * @return
	 */
	public int add(WorkExp workExp);
	
	/**
	 * 删除工作/实习经验
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public WorkExp findById(Integer id);
	
	/**
	 * 根据ResumeId查找集合
	 * @param id
	 * @return
	 */
	public List<WorkExp> findByResumeId(Integer id);
}
