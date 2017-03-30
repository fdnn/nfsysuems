package com.nfsysu.ems.entity;

import java.util.Date;
import java.util.List;


/**
 * 用户实体
 * @author 小海
 *
 */
public class User {
	private Integer id;//编号
	private String userName;//用户名
	private String password;//密码
	private Major major;//专业
	private String pic;//头像/企业logo 
	private String address;//地址
	private Date birthday;//出生日期
	private String email;//电子邮件
	private Date graduationYear;//毕业年份
	private String trueName;//真实姓名
	private String origin;//籍贯
	private String politics;//政治面貌
	private String qq;//QQ
	private String salary;//现就业工资
	private String sex;//性别q
	private String status;//就业情况
	private String tel;//固定电话
	private String unit;//就业单位
	private Integer role;//0-学生，1-企业，2-管理员
	/*为了更好地在后台管理管理员，将管理员二级身份从role里分离出来*/
	private Integer authority;//管理员二级身份：0-顶级管理员，1-系高级管理员，2-系普通管理员
	private CareerTwo careerTwo;//企业_行业/二级行业
	private String introduction;//企业_简介
	private String url;//企业_网址
	private Integer resumeNum;//学生_简历数
	private String nature;//企业_性质
	private String scale;//企业_规模
	private String linkman;//联系人
	private String phone;//联系手机
	private String lnglat;//经纬度
	private Dep dep;//专业
	private String province;//省
	private String city;//市
	private List<Resume> resumeList;//简历集合-学生
	private List<RecruitInfo> recruitInfoList;//招聘信息集合-企业
	private List<Dynamic> dynamicList;//新闻集合-企业
	private List<Notice> noticeList;//通知集合-管理员
	public Integer getId() {
		return id;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getGraduationYear() {
		return graduationYear;
	}
	public void setGraduationYear(Date graduationYear) {
		this.graduationYear = graduationYear;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getPolitics() {
		return politics;
	}
	public void setPolitics(String politics) {
		this.politics = politics;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	public Integer getResumeNum() {
		return resumeNum;
	}
	public void setResumeNum(Integer resumeNum) {
		this.resumeNum = resumeNum;
	}
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLnglat() {
		return lnglat;
	}
	public void setLnglat(String lnglat) {
		this.lnglat = lnglat;
	}
	public Dep getDep() {
		return dep;
	}
	public void setDep(Dep dep) {
		this.dep = dep;
	}
	public List<Resume> getResumeList() {
		return resumeList;
	}
	public void setResumeList(List<Resume> resumeList) {
		this.resumeList = resumeList;
	}
	public List<RecruitInfo> getRecruitInfoList() {
		return recruitInfoList;
	}
	public void setRecruitInfoList(List<RecruitInfo> recruitInfoList) {
		this.recruitInfoList = recruitInfoList;
	}
	public List<Notice> getNoticeList() {
		return noticeList;
	}
	public void setNoticeList(List<Notice> noticeList) {
		this.noticeList = noticeList;
	}
	public List<Dynamic> getDynamicList() {
		return dynamicList;
	}
	public void setDynamicList(List<Dynamic> dynamicList) {
		this.dynamicList = dynamicList;
	}
	public Integer getAuthority() {
		return authority;
	}
	public void setAuthority(Integer authority) {
		this.authority = authority;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public CareerTwo getCareerTwo() {
		return careerTwo;
	}
	public void setCareerTwo(CareerTwo careerTwo) {
		this.careerTwo = careerTwo;
	}
}
