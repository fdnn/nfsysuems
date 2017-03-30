package com.nfsysu.ems.service;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.Dep;
/**
 * 系Service接口
 * @author 小海
 *
 */
public interface DepService {
	/**
	 * 查询系集合
	 * @param map
	 * @return
	 */
	public List<Dep> find(Map<String,Object> map);

	/**
	 * 修改系
	 * @param dep
	 * @return
	 */
	public int update(Dep dep);
	
	/**
	 * 添加系
	 * @param dep
	 * @return
	 */
	public int add(Dep dep);
	
	/**
	 * 删除系
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Dep findById(Integer id);
}
