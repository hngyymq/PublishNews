package com.ymq.serviceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ymq.bean.AjaxResult;
import com.ymq.bean.User;
import com.ymq.dao.UserDao;
import com.ymq.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;
	
	@Override
	public void registerUser(User user) {
		dao.insertUser(user);
	}

	@Override
	public void login(HttpServletRequest request, String role,AjaxResult result,String userAccount, String userPsw) {
		User user = dao.queryUser(userAccount,userPsw,role);
		if(user==null) {
			result.setFlag(false);
			result.setMessage("登陆时，用户名和密码不匹配");
			System.out.println("登陆时，用户名和密码不匹配");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			result.setMessage("登陆成功");
			System.out.println(user);
		}
	}

	@Override
	public void editUser(AjaxResult result,Integer id, String userName, String userPsw) {
		try{
			dao.updateUser(id,userName,userPsw);
		}catch (Exception e) {
			result.setFlag(false);
			result.setMessage("登陆时，用户名和密码不匹配");
			e.printStackTrace();
		}
		
		
	}

}
