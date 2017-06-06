package com.store.model;

import java.util.ArrayList;
import java.util.List;

public class Category {

	int categoryId;
	String categoryName;
	static List<Product> list = new ArrayList<Product>();
	
	public Category() {
	}

	public Category(int categoryId, String categoryName) {
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public List<Product> getList() {
		return list;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}

	public String toString(){		
		return " categoryId = " + categoryId + " categoryName = " + categoryName;	
	}
}
