package com.store.service;


import com.store.dao.LoginDao;
import com.store.model.User;

public class LoginService {
	
	LoginDao dao = new LoginDao();
			
	public boolean getUser(String uname, String pass){
		User user = dao.getUser(uname, pass);
		if(user!=null){
			return true;
		}
		return false;
	}
	
	public int addUser(User user){
		int count = dao.addUser(user);
		return count;
	}
	
	public boolean getAdmin(String uname, String pass){
		if(uname.equals("admin") && pass.equals("admin")){
			return true;
		}
		else{
			return false;
		}
	}
	
	public int getUserByName(String username){
		int userid = dao.getUserByName(username);
		return userid;
	}

}
