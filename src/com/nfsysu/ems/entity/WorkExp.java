package com.nfsysu.ems.entity;

import java.util.Date;

/**
 * 工作/实习经历实体
 * @author 小海
 *
 */
public class WorkExp {
	private Integer id;//编号
	private Date start;//开始时间
	private Date end;//结束时间
	private String unitName;//单位名
	private String unitNature;//单位性质      
	private String unitIndustry;//单位行业
	private String unitScale;//单位规模
	private String jobName;//职位名称
	private String jobDept;//职位部门
	private String jobType;//职位类型
	private String salary;//待遇
	private String jobDescription;//工作/实习描述
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
	public String getUnitName() {
		return unitName;
	}
	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}
	public String getUnitNature() {
		return unitNature;
	}
	public void setUnitNature(String unitNature) {
		this.unitNature = unitNature;
	}
	public String getUnitIndustry() {
		return unitIndustry;
	}
	public void setUnitIndustry(String unitIndustry) {
		this.unitIndustry = unitIndustry;
	}
	public String getUnitScale() {
		return unitScale;
	}
	public void setUnitScale(String unitScale) {
		this.unitScale = unitScale;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getJobDept() {
		return jobDept;
	}
	public void setJobDept(String jobDept) {
		this.jobDept = jobDept;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getJobDescription() {
		return jobDescription;
	}
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	public Resume getResume() {
		return resume;
	}
	public void setResume(Resume resume) {
		this.resume = resume;
	}
	
}
