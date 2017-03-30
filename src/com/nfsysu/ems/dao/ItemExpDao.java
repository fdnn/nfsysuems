package com.nfsysu.ems.dao;

import java.util.List;

import com.nfsysu.ems.entity.ItemExp;

/**
 * 项目经验Dao接口
 * @author 小海
 *
 */
public interface ItemExpDao {

	/**
	 * 修改项目经验
	 * @param itemExp
	 * @return
	 */
	public int update(ItemExp itemExp);
	
	/**
	 * 添加项目经验
	 * @param itemExp
	 * @return
	 */
	public int add(ItemExp itemExp);
	
	/**
	 * 删除项目经验
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public ItemExp findById(Integer id);
	
	/**
	 * 根据ResumeId查找集合
	 * @param id
	 * @return
	 */
	public List<ItemExp> findByResumeId(Integer id);
}
