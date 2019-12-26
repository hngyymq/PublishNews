package com.ymq.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ymq.bean.User;
import com.ymq.dao.TestDao;
import com.ymq.service.Test;

@Service
public class TestImpl implements Test {
	
	@Autowired
	private TestDao dao;
	
	public User queryUser() {
		User user = dao.queryUser();
		return user;
	}

}
