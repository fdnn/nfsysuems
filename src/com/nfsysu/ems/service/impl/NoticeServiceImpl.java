package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.NoticeDao;
import com.nfsysu.ems.entity.Notice;
import com.nfsysu.ems.service.NoticeService;

/**
 * 通知Service实现类
 * @author 小海
 *
 */
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Resource
	private NoticeDao noticeDao;

	@Override
	public List<Notice> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeDao.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return noticeDao.getTotal(map);
	}
	
	@Override
	public int update(Notice notice) {
		// TODO Auto-generated method stub
		return noticeDao.update(notice);
	}

	@Override
	public int add(Notice notice) {
		// TODO Auto-generated method stub
		return noticeDao.add(notice);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return noticeDao.delete(id);
	}

	@Override
	public Notice findById(Integer id) {
		// TODO Auto-generated method stub
		return noticeDao.findById(id);
	}

	@Override
	public Notice getLast(Integer id) {
		// TODO Auto-generated method stub
		return noticeDao.getLast(id);
	}

	@Override
	public Notice getNext(Integer id) {
		// TODO Auto-generated method stub
		return noticeDao.getNext(id);
	}
}
