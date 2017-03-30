package com.nfsysu.ems.entity;

import java.util.Date;

/**
 * 项目经历实体
 * @author 小海
 *
 */
public class ItemExp {
	private Integer id;//编号
	private Date start;//开始时间
	private Date end;//结束时间
	private String itemName;//项目名
	private String description;//描述
	private Resume resume;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Resume getResume() {
		return resume;
	}
	public void setResume(Resume resume) {
		this.resume = resume;
	}
	
}
