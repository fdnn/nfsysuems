package com.nfsysu.ems.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.ItemExpDao;
import com.nfsysu.ems.entity.ItemExp;
import com.nfsysu.ems.service.ItemExpService;

/**
 * 项目经验Service实现类
 * @author 小海
 *
 */
@Service("itemExpService")
public class ItemExpServiceImpl implements ItemExpService{

	@Resource
	private ItemExpDao itemExpDao;

	@Override
	public int update(ItemExp itemExp) {
		// TODO Auto-generated method stub
		return itemExpDao.update(itemExp);
	}

	@Override
	public int add(ItemExp itemExp) {
		// TODO Auto-generated method stub
		return itemExpDao.add(itemExp);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return itemExpDao.delete(id);
	}

	@Override
	public ItemExp findById(Integer id) {
		// TODO Auto-generated method stub
		return itemExpDao.findById(id);
	}

	@Override
	public List<ItemExp> findByResumeId(Integer id) {
		// TODO Auto-generated method stub
		return itemExpDao.findByResumeId(id);
	}
}
