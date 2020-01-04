package com.ymq.service;

import javax.servlet.http.HttpServletRequest;

import com.ymq.bean.AjaxResult;
import com.ymq.bean.User;

public interface UserService {

	void registerUser(User user);

	void login(HttpServletRequest request, String role, AjaxResult result, String userAccount, String userPsw);

	void editUser(AjaxResult result,Integer id, String userName, String userPsw);

}
