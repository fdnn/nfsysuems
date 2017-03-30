package com.nfsysu.ems.service;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.Dynamic;
/**
 * 企业动态Service接口
 * @author 小海
 *
 */
public interface DynamicService {

	/**
	 * 查询企业动态集合
	 * @param map
	 * @return
	 */
	public List<Dynamic> find(Map<String,Object> map);

	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 修改企业动态
	 * @param dynamic
	 * @return
	 */
	public int update(Dynamic dynamic);
	
	/**
	 * 添加企业动态
	 * @param dynamic
	 * @return
	 */
	public int add(Dynamic dynamic);
	
	/**
	 * 删除企业动态
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Dynamic findById(Integer id);
	
	/**
	 * 根据UserId查找集合
	 * @param id
	 * @return
	 */
	public List<Dynamic> findByUserId(Integer id);

	/**
	 * 获取上一个
	 * @param id
	 * @return
	 */
	public Dynamic getLast(Integer id);
	
	/**
	 * 获取下一个
	 * @param id
	 * @return
	 */
	public Dynamic getNext(Integer id);
}
