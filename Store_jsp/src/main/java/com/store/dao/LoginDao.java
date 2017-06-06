package com.store.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.store.model.User;

public class LoginDao {

	Connection conn;

	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/devops";
	String username = "Ashwitha";
	String password = "password";

	public LoginDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public User getUser(String uname, String pass) {
		String query = "select * from users where username=? and password=?";
		User user = null;
		try {
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, uname);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				user = new User(rs.getString("name"), rs.getString("username"), rs.getString("password"),
						rs.getString("emailID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public int getUserByName(String username){
		String query = "select * from users where username = ?";
		int userid=0;
		try{
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, username);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				System.out.println(rs.getInt("id"));
				userid = rs.getInt("id");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return userid;
	}

	public int addUser(User user) {
		int num = 0;
		String query = "insert into users(name, username, password, emailID) values(?,?,?,?)";
		try {
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setString(2, user.getUsername());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getEmailID());
			num = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
}
