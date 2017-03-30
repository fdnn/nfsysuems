package com.nfsysu.ems.service;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.RecAResAna;
import com.nfsysu.ems.entity.RecruitInfo;
/**
 * 招聘信息Service接口
 * @author 小海
 *
 */
public interface RecruitInfoService {
	/**
	 * 查询招聘信息集合
	 * @param map
	 * @return
	 */
	public List<RecruitInfo> find(Map<String,Object> map);

	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);

	/**
	 * 修改招聘信息
	 * @param recruitInfo
	 * @return
	 */
	public int update(RecruitInfo recruitInfo);
	
	/**
	 * 添加招聘信息
	 * @param recruitInfo
	 * @return
	 */
	public int add(RecruitInfo recruitInfo);
	
	/**
	 * 删除招聘信息
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public RecruitInfo findById(Integer id);
	
	/**
	 * 根据UserId查找集合
	 * @param id
	 * @return
	 */
	public List<RecruitInfo> findByUserId(Integer id);

	/**
	 * 查询招聘信息分析结果-发布时间
	 * @return
	 */
	public List<RecAResAna> findGroupByCreateDate();

	/**
	 * 查询招聘信息分析结果-市
	 * @return
	 */
	public List<RecAResAna> findGroupByCity();
	
	/**
	 * 查询招聘信息分析结果-省
	 * @return
	 */
	public List<RecAResAna> findGroupByProvince();

	/**
	 * 查询薪资分析结果
	 * @return
	 */
	public List<RecAResAna> findBySalary();

	/**
	 * 查询招聘信息分析结果-职业one
	 * @return
	 */
	public List<RecAResAna> findGroupByTypeOne();


	/**
	 * 查询招聘信息分析结果-职业two
	 * @return
	 */
	public List<RecAResAna> findGroupByTypeTwo();


	/**
	 * 查询招聘信息分析结果-职业three
	 * @return
	 */
	public List<RecAResAna> findGroupByTypeThree();

	/**
	 * 获取上一个
	 * @param id
	 * @return
	 */
	public RecruitInfo getLast(Integer id);
	
	/**
	 * 获取下一个
	 * @param id
	 * @return
	 */
	public RecruitInfo getNext(Integer id);
}
