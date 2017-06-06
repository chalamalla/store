package com.store.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.store.model.Category;
import com.store.model.Product;

public class CategoryDao {

	ArrayList<Category> list = new ArrayList<Category>();
	ArrayList<Product> productList  = new ArrayList<Product>();
	
	Connection conn;

	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/devops";
	String username = "Ashwitha";
	String password = "password";

	public CategoryDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int addcategory(String categoryName) {
		int count=0;
		try {
			String query = "insert into category(categoryName) value(?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, categoryName);
			count = pst.executeUpdate();
			String query1 = "select * from category where categoryName=?";
			PreparedStatement pst1 = conn.prepareStatement(query1);
			pst.setString(1, categoryName);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				Category c = new Category(rs.getInt("id"),rs.getString("categoryName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public Category getCategory(int categoryId) {
		Category c = null;
		try {
			String query = "select * from category where id = ? ";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, categoryId);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				c = new Category(rs.getInt("id"),rs.getString("categoryName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	
	public Category getCategory(String categoryName) {
		Category c = null;
		try {
			String query = "select * from category where categoryName = ? ";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, categoryName);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				c = new Category(rs.getInt("id"),rs.getString("categoryName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	public boolean updateCategory(String categoryName, String changed_name) {
		boolean flag = false;
		try{
			String query = "update category set categoryName = ? where categoryName = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, changed_name);
			pst.setString(2, categoryName);
			flag = pst.execute();
		}catch(Exception e ){
			e.printStackTrace();
		}
		return flag;
	}

	public int deleteCategory(String categoryName) {
		int count = 0;
		try{
			String query = "delete from category where categoryName = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, categoryName);
			count = pst.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

	public List<Category> getAll() {
		try{
			String query = "select * from category";
			PreparedStatement pst = conn.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				Category c = new Category(rs.getInt("id"),rs.getString("categoryName"));
				list.add(c);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}

	public List<Product> getProducts(String categoryName) {
		try{
			String query = "select * from product where category=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, categoryName);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				CategoryDao cdao = new CategoryDao();
				Category c = cdao.getCategory(categoryName);
				Product p = new Product(rs.getString("productName"),rs.getDouble("price"),rs.getInt("quantity"),c,rs.getString("productDesc"));
				productList.add(p);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return productList;
	}
}
