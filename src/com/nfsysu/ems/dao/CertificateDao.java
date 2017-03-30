package com.nfsysu.ems.dao;

import java.util.List;
import java.util.Map;

import com.nfsysu.ems.entity.Certificate;

/**
 * 证书Dao接口
 * @author 小海
 *
 */
public interface CertificateDao {
	/**
	 * 查询证书集合
	 * @param map
	 * @return
	 */
	public List<Certificate> find(Map<String,Object> map);

	/**
	 * 修改证书
	 * @param certificate
	 * @return
	 */
	public int update(Certificate certificate);
	
	/**
	 * 添加证书
	 * @param certificate
	 * @return
	 */
	public int add(Certificate certificate);
	
	/**
	 * 删除证书
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Certificate findById(Integer id);
	
	/**
	 * 根据ResumeId查找集合
	 * @param id
	 * @return
	 */
	public List<Certificate> findByResumeId(Integer id);
}
