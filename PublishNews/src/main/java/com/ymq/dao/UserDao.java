package com.ymq.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ymq.bean.AjaxResult;
import com.ymq.bean.User;

@Repository
public interface UserDao {

	void insertUser(User user);

	User queryUser(@Param("userAccount")String userAccount, @Param("userPsw") String userPsw, @Param("role") String role);

	void updateUser(@Param("id")Integer id,@Param("userName") String userName,@Param("userPsw")String userPsw);

}
