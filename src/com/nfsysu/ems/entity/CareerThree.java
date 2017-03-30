package com.nfsysu.ems.entity;


/**
 * 职业实体
 * @author 小海
 *
 */
public class CareerThree {
	private Integer id;//编号
	private String name;//职业名称
	private CareerTwo careerTwo;
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
	public CareerTwo getCareerTwo() {
		return careerTwo;
	}
	public void setCareerTwo(CareerTwo careerTwo) {
		this.careerTwo = careerTwo;
	}
}
