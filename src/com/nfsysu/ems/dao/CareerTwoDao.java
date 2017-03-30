package com.nfsysu.ems.dao;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.CareerTwo;

/**
 * 三级职业Dao接口
 * @author 小海
 *
 */
public interface CareerTwoDao {
	/**
	 * 查询职位集合
	 * @param map
	 * @return
	 */
	public List<CareerTwo> find(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);

	/**
	 * 修改职位
	 * @param careerTwo
	 * @return
	 */
	public int update(CareerTwo careerTwo);
	
	/**
	 * 添加职位
	 * @param careerTwo
	 * @return
	 */
	public int add(CareerTwo careerTwo);
	
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
	public CareerTwo findById(Integer id);
	
	public CareerTwo findByIdWithThree(Integer id);
	
	/**
	 * 根据oneid查找实体
	 * @param id
	 * @return
	 */
	public CareerTwo findByOneId(Integer id);
}
