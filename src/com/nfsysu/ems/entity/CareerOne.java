package com.nfsysu.ems.entity;

import java.util.List;

/**
 * 一级职业实体
 * @author 小海
 *
 */
public class CareerOne {
	private Integer id;//编号
	private String name;//职业名称
	private Integer orderNo;//排序
	private List<CareerTwo> careerTwoList;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getOrder() {
		return orderNo;
	}
	public void setOrder(Integer orderNo) {
		this.orderNo = orderNo;
	}
	public List<CareerTwo> getCareerTwoList() {
		return careerTwoList;
	}
	public void setCareerTwoList(List<CareerTwo> careerTwoList) {
		this.careerTwoList = careerTwoList;
	}
}
