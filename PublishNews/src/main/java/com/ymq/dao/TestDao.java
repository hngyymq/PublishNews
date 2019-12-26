package com.ymq.dao;

import org.springframework.stereotype.Repository;

import com.ymq.bean.User;

@Repository
public interface TestDao {
	public User queryUser();
}
