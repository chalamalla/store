package com.store.service;

import java.util.List;

import com.store.dao.ProductDao;
import com.store.model.Category;
import com.store.model.Product;

public class ProductService {

	ProductDao pdao = new ProductDao();
	CategoryService cservice = new CategoryService();

	public int addProduct(String pname, Double price, int quantity, String cname, String productDesc) {
		Category c = cservice.getCategory(cname);
		Product product = new Product(pname, price, quantity, c, productDesc);
		int count = pdao.addProduct(product);
		return count;
	}

	public Product getProduct(String productName) {
		Product product = pdao.getProduct(productName);
		return product;
	}

	public Product getProduct(int productid) {
		Product product = pdao.getProduct(productid);
		return product;
	}
	
	public int updateProduct(String pname, Double price, int quantity, String cname, String productDesc) {
		Category c = cservice.getCategory(cname);
		Product product = pdao.getProduct(pname);
		System.out.println(product);
		System.out.println(product.getId());
		product.setPrice(price);
		product.setQuantity(quantity);
		product.setCategory(c);
		product.setProductDesc(productDesc);
		int count = pdao.updateProduct(product);
		return count;
	}

	public List<Product> allProducts() {
		List<Product> products = pdao.allProducts();
		return products;
	}

	public int deleteProduct(String productName) {
		int count = pdao.deleteProduct(productName);
		return count;
	}

	public int deleteProductByCat(String categoryName) {
		int count = pdao.deleteProductByCat(categoryName);
		return count;
	}

	public boolean isProductExists(String productName) {
		List<Product> list = allProducts();
		boolean flag = false;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getName().equals(productName)) {
				flag = true;
			}
		}
		return flag;
	}
}