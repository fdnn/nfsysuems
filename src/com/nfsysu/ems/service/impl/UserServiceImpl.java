package com.nfsysu.ems.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nfsysu.ems.dao.UserDao;
import com.nfsysu.ems.entity.User;
import com.nfsysu.ems.service.UserService;

/**
 * 用户Service实现类
 * @author 小海
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;

	@Override
	public boolean register(User user) {
		int result = userDao.register(user);
		return result>0?true:false;
	}
	
	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public List<User> find(Map<String, Object> map) {
		return userDao.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		return userDao.getTotal(map);
	}

	@Override
	public int update(User user) {
		return userDao.update(user);
	}

	@Override
	public int add(User user) {
		return userDao.add(user);
	}

	@Override
	public int delete(Integer id) {
		return userDao.delete(id);
	}

	@Override
	public User findById(Integer id) {
		return userDao.findById(id);
	}

	@Override
	public User getByUserName(String userName) {
		return userDao.getByUserName(userName);
	}

	@Override
	public boolean existNum(User user) {
		User result = userDao.existNum(user);
		return result==null?false:true;
	}

	
}
