package com.store.service;

import java.util.List;

import com.store.dao.CategoryDao;
import com.store.model.Category;
import com.store.model.Product;

public class CategoryService {
	
		CategoryDao cdao = new CategoryDao();
		
		public int addcategory(String categoryName) {
			int count=0;
			count = cdao.addcategory(categoryName);
			return count;
		}

		public Category getCategory(int categoryId) {
			Category c = cdao.getCategory(categoryId);
			return c;
		}
		
		public Category getCategory(String categoryName) {
			Category c = cdao.getCategory(categoryName);
			return c;
		}

		public boolean updateCategory(String categoryName, String changed_name) {
			boolean flag = false;
			cdao.updateCategory(categoryName, changed_name);
			return flag;
		}

		public int deleteCategory(String categoryName) {
			int count=0;
			count = cdao.deleteCategory(categoryName);
			return count;
		}

		public List<Category> getAll() {
			List<Category> list = cdao.getAll();
			return list;
		}

		public List<Product> getProducts(String categoryName) {
			List<Product> productList = cdao.getProducts(categoryName);
			return productList;
		}
	}
