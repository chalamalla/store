package com.store.service;

import java.util.List;

import com.store.dao.WishListDAO;
import com.store.model.Product;

public class WishListService {

	WishListDAO wdao = new WishListDAO();
	
	public int addProductList(int userid, int productid) {
		int count = wdao.addProductList(userid, productid);
		return count;
	}
	
	public int deleteProductFromList(int userid, int productid){
		int count = wdao.deleteProductFromList(userid, productid);
		return count;
	}
	public List<Product> getProductList(int userid) {
		List<Product> list = wdao.getProductList(userid);
		return list;
	}
}