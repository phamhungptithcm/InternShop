package com.fsoft.dao;

import java.util.List;

import com.fsoft.model.Product;

public interface ProductDAO {
	public void insert(Product entity);
	public void update(Product entity);
	public void delete(Product entity);
	public void refresh(Product entity);
	public List<Product> listByCategory(Integer id);
	public List<Product> listBySupplier(String sid, Integer cid);
	public List<Product> listBySupplier(String sid);
	public Product get(Integer id);
	public Product getProduct(String name);
	public long getTong(Integer id);
	public List<Product> getlist();
	public Integer getIdByName(String name);
	public void updateVH(Integer id, boolean vh);
}
