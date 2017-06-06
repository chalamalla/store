package com.store.model;

import com.store.model.Category;

public class Product {
	private int id;
	private String name;
	private double price;
	private int quantity;
	private Category category;
	private String productDesc;

	public Product() {

	}

	public Product(int id,String name, double price, int quantity, Category category, String productDesc) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.category = category;
		this.quantity = quantity;
		this.productDesc=productDesc;
	}

	public Product(String name, double price, int quantity, Category category, String productDesc) {
		this.name = name;
		this.price = price;
		this.category = category;
		this.quantity = quantity;
		this.productDesc=productDesc;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String toString() {
		return "productId = " + id + " productName = " + name + " productPrice = " + price + " product Category "
				+ category + " productDesc " + productDesc;
	}
}
