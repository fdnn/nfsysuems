package com.nfsysu.ems.entity;

/**
 * 招聘信息和简历分析实体
 * @author Administrator
 *
 */
public class RecAResAna {

	private String city; // 市
	private int cityNum; // 市数量
	private String salary; // 薪资水平
	private int salaryNum; // 薪资水平数量
	private String province; // 省
	private int provinceNum; // 省数量
	private String createDate; // 发布时间
	private int createDateNum; // 发布那天总的数量
	
	private String one; // 一级职业
	private String two; // 二级职业
	private String three; // 三级职业
	private int num; // 数量
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getCityNum() {
		return cityNum;
	}
	public void setCityNum(int cityNum) {
		this.cityNum = cityNum;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public int getSalaryNum() {
		return salaryNum;
	}
	public void setSalaryNum(int salaryNum) {
		this.salaryNum = salaryNum;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public int getProvinceNum() {
		return provinceNum;
	}
	public void setProvinceNum(int provinceNum) {
		this.provinceNum = provinceNum;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getCreateDateNum() {
		return createDateNum;
	}
	public void setCreateDateNum(int createDateNum) {
		this.createDateNum = createDateNum;
	}
	public String getOne() {
		return one;
	}
	public void setOne(String one) {
		this.one = one;
	}
	public String getTwo() {
		return two;
	}
	public void setTwo(String two) {
		this.two = two;
	}
	public String getThree() {
		return three;
	}
	public void setThree(String three) {
		this.three = three;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
