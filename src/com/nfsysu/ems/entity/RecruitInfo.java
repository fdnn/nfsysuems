package com.nfsysu.ems.entity;

import java.util.Date;

/**
 * 招聘信息实体
 * @author 小海
 *
 */
public class RecruitInfo {
	private Integer id;//编号
	private User user;//
	private String state;//审核状态
	private Date refreshDate;//刷新时间
	private String name;//职位名称
	private String city;//市
	private String nature;//职位性质
	private CareerThree careerThree;//三级职位类型
	private String recruitNum;//招聘人数
	private String salary;//薪资待遇
	private String welfare;//福利待遇
	private String sex;//性别要求
	private String degree;//学历要求
	private String workExp;//工作经验
	private String description;//职位描述
	private String linkman;//联系人
	private String tel;//固定电话
	private String phone;//联系手机
	private String email;//联系邮箱
	private Integer viewedNum;//浏览次数
	private String resumeNum;//应聘简历数
	private String linkAddress;//联系地址
	private Date createDate;//创建时间
	private Date checkedDate;//审核时间
	private String province;//省 
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getRefreshDate() {
		return refreshDate;
	}
	public void setRefreshDate(Date refreshDate) {
		this.refreshDate = refreshDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getRecruitNum() {
		return recruitNum;
	}
	public void setRecruitNum(String recruitNum) {
		this.recruitNum = recruitNum;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getWelfare() {
		return welfare;
	}
	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getWorkExp() {
		return workExp;
	}
	public void setWorkExp(String workExp) {
		this.workExp = workExp;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getViewedNum() {
		return viewedNum;
	}
	public void setViewedNum(Integer viewedNum) {
		this.viewedNum = viewedNum;
	}
	public String getResumeNum() {
		return resumeNum;
	}
	public void setResumeNum(String resumeNum) {
		this.resumeNum = resumeNum;
	}
	public String getLinkAddress() {
		return linkAddress;
	}
	public void setLinkAddress(String linkAddress) {
		this.linkAddress = linkAddress;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getCheckedDate() {
		return checkedDate;
	}
	public void setCheckedDate(Date checkedDate) {
		this.checkedDate = checkedDate;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public CareerThree getCareerThree() {
		return careerThree;
	}
	public void setCareerThree(CareerThree careerThree) {
		this.careerThree = careerThree;
	}
}
