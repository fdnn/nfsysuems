package com.nfsysu.ems.entity;


/**
 * 专业实体
 * @author 小海
 *
 */
public class Major {
	private Integer id;//编号
	private String name;//专业名
	private Dep dep;//系
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
	public Dep getDep() {
		return dep;
	}
	public void setDep(Dep dep) {
		this.dep = dep;
	}
	
	
}
