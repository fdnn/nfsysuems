package com.nfsysu.ems.entity;

import java.util.Date;

/**
 * 企业动态实体
 * @author 小海
 *
 */
public class Dynamic {
	private Integer id;//编号
	private String title;//开始时间
	private String content;//结束时间
	private Date time;//创建时间
	private String state;//状态      
	private User user;
	private Integer viewedNum;//浏览次数
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getViewedNum() {
		return viewedNum;
	}
	public void setViewedNum(Integer viewedNum) {
		this.viewedNum = viewedNum;
	}
	
}
