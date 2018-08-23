package com.fsoft.dao;

import java.util.List;

import com.fsoft.model.Category;
	
public interface CategoryDAO {
	public void insert(Category entity);
	public void update(Category entity);
	public void delete(Category entity);
	public List<Category> list();
	public Category get(Integer id);
	public List<Object[]> inventoryByCategory();
}
