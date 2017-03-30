package com.nfsysu.ems.service;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.CareerThree;

/**
 * 三级职业Service接口
 * @author 小海
 *
 */
public interface CareerThreeService {
	/**
	 * 查询职位集合
	 * @param map
	 * @return
	 */
	public List<CareerThree> find(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);

	/**
	 * 修改职位
	 * @param careerThree
	 * @return
	 */
	public int update(CareerThree careerThree);
	
	/**
	 * 添加职位
	 * @param careerThree
	 * @return
	 */
	public int add(CareerThree careerThree);
	
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
	public CareerThree findById(Integer id);
}
