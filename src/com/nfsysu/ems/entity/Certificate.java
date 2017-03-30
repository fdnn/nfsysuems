package com.nfsysu.ems.entity;

import java.util.Date;

/**
 * 证书实体
 * @author 小海
 *
 */
public class Certificate {
	private Integer id;//编号
	private Date time;//获取时间
	private String name;//证书名
	private Resume resume;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Resume getResume() {
		return resume;
	}
	public void setResume(Resume resume) {
		this.resume = resume;
	}
	
}
