package com.store.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	
	User user;
	
	List<Product> list = new ArrayList<Product>();

	public Cart(){
		
	}
	
	public Cart(User user, List<Product> list){
		this.user = user;
		this.list = list;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Product> getList() {
		return list;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}
	
}
