package com.nfsysu.ems.entity;

import java.util.List;

/**
 * 系实体
 * @author 小海
 *
 */
public class Dep {
	private Integer id;//编号
	private String name;//系名
	private List<Major> majorList;//专业
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
	public List<Major> getMajorList() {
		return majorList;
	}
	public void setMajorList(List<Major> majorList) {
		this.majorList = majorList;
	}
	
	
}
