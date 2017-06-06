package com.store.service;

import java.util.List;

import com.store.dao.CartDAO;
import com.store.model.Product;

public class CartService {

	CartDAO cdao = new CartDAO();

	public int addProductList(int userid, int productid) {
		int count = cdao.addProductList(userid, productid);
		return count;
	}
	
	public int deleteProductFromList(int userid, int productid){
		int count = cdao.deleteProductFromList(userid, productid);
		return count;
	}
	public List<Product> getProductList(int userid) {
		List<Product> list = cdao.getProductList(userid);
		return list;
	}
}