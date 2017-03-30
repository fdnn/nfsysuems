package com.nfsysu.ems.dao;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.ApplyRecord;

/**
 * 应聘记录Dao接口
 * @author 小海
 *
 */
public interface ApplyRecordDao {
	/**
	 * 查询应聘记录集合
	 * @param map
	 * @return
	 */
	public List<ApplyRecord> find(Map<String,Object> map);

	/**
	 * 修改应聘记录
	 * @param applyRecord
	 * @return
	 */
	public int update(ApplyRecord applyRecord);
	
	/**
	 * 添加应聘记录
	 * @param applyRecord
	 * @return
	 */
	public int add(ApplyRecord applyRecord);
	
	/**
	 * 删除应聘记录
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public ApplyRecord findById(Integer id);
	
	/**
	 * 根据UserId查找集合
	 * @param id
	 * @return
	 */
	public List<ApplyRecord> findByUserId(Integer id);

}
