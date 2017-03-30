package com.nfsysu.ems.service;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.CareerOne;

/**
 * 一级职业Service接口
 * @author 小海
 *
 */
public interface CareerOneService {
	/**
	 * 查询职位集合
	 * @param map
	 * @return
	 */
	public List<CareerOne> find(Map<String,Object> map);
	
	public List<CareerOne> findWithTwo(Map<String,Object> map);
	
	public List<CareerOne> findWithTwoAndThree(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);

	/**
	 * 修改职位
	 * @param careerOne
	 * @return
	 */
	public int update(CareerOne careerOne);
	
	/**
	 * 添加职位
	 * @param careerOne
	 * @return
	 */
	public int add(CareerOne careerOne);
	
	/**
	 * 删除职位
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public CareerOne findById(Integer id);
	
	public CareerOne findByIdWithTwo(Integer id);
}
