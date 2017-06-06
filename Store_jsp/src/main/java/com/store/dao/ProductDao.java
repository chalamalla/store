package com.store.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.store.model.Category;
import com.store.model.Product;
import com.store.service.CategoryService;

public class ProductDao {

	ArrayList<Product> list = new ArrayList<Product>();
	CategoryService cs = new CategoryService();

	Connection conn;
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/devops";
	String username = "Ashwitha";
	String password = "password";

	public ProductDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int addProduct(Product product) {
		int count = 0;
		try {
			String query = "insert into product(productName,price,quantity,category,productDesc) values(?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, product.getName());
			pst.setDouble(2, product.getPrice());
			pst.setInt(3, product.getQuantity());
			pst.setInt(4, product.getCategory().getCategoryId());
			pst.setString(5, product.getProductDesc());
			count = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public Product getProduct(String productName) {
		Product product = null;
		try {
			String query = "select * from product where productName = ? ";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, productName);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				CategoryDao cdao = new CategoryDao();
				Category c = cdao.getCategory(rs.getInt("category"));
				product = new Product(rs.getInt(1),rs.getString(2), rs.getDouble(3), rs.getInt(4), c, rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	public Product getProduct(int productid) {
		Product product = null;
		try {
			String query = "select * from product where id = ? ";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, productid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				CategoryDao cdao = new CategoryDao();
				Category c = cdao.getCategory(rs.getInt("category"));
				product = new Product(rs.getInt(1),rs.getString(2), rs.getDouble(3), rs.getInt(4), c, rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return product;
	}

	
	public List<Product> allProducts() {
		try {
			String query = "select * from product";
			PreparedStatement pst = conn.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				CategoryDao cdao = new CategoryDao();
				Category c = cdao.getCategory(rs.getInt("category"));
				Product p = new Product(rs.getString("productName"), rs.getDouble("price"), rs.getInt("quantity"), c,
						rs.getString("productDesc"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int updateProduct(Product p) {
		int count = 0;
		try {
			String query = "update product set productName = ?, price =?, quantity =?, category=?, productDesc=? where id=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1,p.getName());
			pst.setDouble(2,p.getPrice());
			pst.setInt(3,p.getQuantity());
			pst.setInt(4,p.getCategory().getCategoryId());             
			pst.setString(5,p.getProductDesc());
			System.out.println(p.getId());
			pst.setInt(6, p.getId());
			count = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int deleteProduct(String productName) {
		int count = 0;
		try {
			String query = "delete from product where productName=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1,productName);
			count = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int deleteProductByCat(String categoryName) {
		int count = 0;
		Category c = cs.getCategory(categoryName);
		try {
			String query = "delete from product where category=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1,c.getCategoryId());
			count = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}