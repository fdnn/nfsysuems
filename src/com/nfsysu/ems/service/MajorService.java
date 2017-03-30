package com.nfsysu.ems.service;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.Major;
/**
 * 专业Service接口
 * @author 小海
 *
 */
public interface MajorService {
	/**
	 * 查询专业集合
	 * @param map
	 * @return
	 */
	public List<Major> find(Map<String,Object> map);

	/**
	 * 修改专业
	 * @param major
	 * @return
	 */
	public int update(Major major);
	
	/**
	 * 添加专业
	 * @param major
	 * @return
	 */
	public int add(Major major);
	
	/**
	 * 删除专业
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Major findById(Integer id);
	
	/**
	 * 根据depId查找实体
	 * @param id
	 * @return
	 */
	public List<Major> findByDepId(Integer id);
}
