package com.nfsysu.ems.entity;

import java.util.List;

/**
 * 职业实体
 * @author 小海
 *
 */
public class CareerTwo {
	private Integer id;//编号
	private String name;//职业名称
	private CareerOne careerOne;
	private List<CareerThree> careerThreeList;
	
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
	public List<CareerThree> getCareerThreeList() {
		return careerThreeList;
	}
	public void setCareerThreeList(List<CareerThree> careerThreeList) {
		this.careerThreeList = careerThreeList;
	}
	public CareerOne getCareerOne() {
		return careerOne;
	}
	public void setCareerOne(CareerOne careerOne) {
		this.careerOne = careerOne;
	}
}
