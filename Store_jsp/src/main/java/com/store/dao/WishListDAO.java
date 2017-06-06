package com.store.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.store.model.Product;
import com.store.service.ProductService;

public class WishListDAO {

	List<Product> list = new ArrayList<Product>();
	ProductService ps = new ProductService();

	Connection conn;

	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/devops";
	String username = "Ashwitha";
	String password = "password";

	public WishListDAO(){
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int addProductList(int userid, int productid) {
		int count = 0;
		try {
			String query = "insert into wishlist(userid,productid) values(?,?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, userid);
			pst.setInt(2, productid);
			count = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int deleteProductFromList(int userid, int productid) {
		int count = 0;
		try {
			System.out.println("userid : " + userid + " productid: " + productid);
			String query = "delete from wishlist where userid = ? and productid = ?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, userid);
			pst.setInt(2, productid);
			count = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public List<Product> getProductList(int userid) {
		try {
			String sql = "select * from wishlist where userid = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, userid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Product product = ps.getProduct(rs.getInt("productid"));
				list.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
