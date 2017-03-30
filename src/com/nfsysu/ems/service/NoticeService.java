package com.nfsysu.ems.service;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.Notice;
/**
 * 通知Service接口
 * @author 小海
 *
 */
public interface NoticeService {
	/**
	 * 查询通知集合
	 * @param map
	 * @return
	 */
	public List<Notice> find(Map<String,Object> map);

	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 修改通知
	 * @param notice
	 * @return
	 */
	public int update(Notice notice);
	
	/**
	 * 添加通知
	 * @param notice
	 * @return
	 */
	public int add(Notice notice);
	
	/**
	 * 删除通知
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Notice findById(Integer id);
	
	/**
	 * 获取上一个
	 * @param id
	 * @return
	 */
	public Notice getLast(Integer id);
	
	/**
	 * 获取下一个
	 * @param id
	 * @return
	 */
	public Notice getNext(Integer id);
}
