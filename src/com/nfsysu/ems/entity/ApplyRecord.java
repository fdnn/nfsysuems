package com.nfsysu.ems.entity;

import java.util.Date;

/**
 * 应聘记录实体
 * @author 小海
 *
 */
public class ApplyRecord {
	private Integer id;//编号
	private User user;//用户
	private RecruitInfo recruitInfo;//招聘信息
	private Integer isStore;//是否收藏
	private Date storeTime;//收藏时间
	private Integer isApply;//是否申请
	private Date applyTime;//申请时间
	private Resume resume;//申请投递的简历
	private String applyState;//申请状态
	private Integer isInform;//是否通知
	private Date informTime;//通知时间
	private String informTopic;//通知主题
	private String informContent;//通知内容
	private String informState;//通知状态
	private Integer isRefuse;//是否回绝
	private Date interviewTime;//面试时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public RecruitInfo getRecruitInfo() {
		return recruitInfo;
	}
	public void setRecruitInfo(RecruitInfo recruitInfo) {
		this.recruitInfo = recruitInfo;
	}
	public Integer getIsStore() {
		return isStore;
	}
	public void setIsStore(Integer isStore) {
		this.isStore = isStore;
	}
	public Date getStoreTime() {
		return storeTime;
	}
	public void setStoreTime(Date storeTime) {
		this.storeTime = storeTime;
	}
	public Integer getIsApply() {
		return isApply;
	}
	public void setIsApply(Integer isApply) {
		this.isApply = isApply;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public Resume getResume() {
		return resume;
	}
	public void setResume(Resume resume) {
		this.resume = resume;
	}
	public String getApplyState() {
		return applyState;
	}
	public void setApplyState(String applyState) {
		this.applyState = applyState;
	}
	public Integer getIsInform() {
		return isInform;
	}
	public void setIsInform(Integer isInform) {
		this.isInform = isInform;
	}
	public Date getInformTime() {
		return informTime;
	}
	public void setInformTime(Date informTime) {
		this.informTime = informTime;
	}
	public String getInformTopic() {
		return informTopic;
	}
	public void setInformTopic(String informTopic) {
		this.informTopic = informTopic;
	}
	public String getInformContent() {
		return informContent;
	}
	public void setInformContent(String informContent) {
		this.informContent = informContent;
	}
	public String getInformState() {
		return informState;
	}
	public void setInformState(String informState) {
		this.informState = informState;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getIsRefuse() {
		return isRefuse;
	}
	public void setIsRefuse(Integer isRefuse) {
		this.isRefuse = isRefuse;
	}
	public Date getInterviewTime() {
		return interviewTime;
	}
	public void setInterviewTime(Date interviewTime) {
		this.interviewTime = interviewTime;
	}
	
}
