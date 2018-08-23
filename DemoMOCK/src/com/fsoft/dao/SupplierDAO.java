package com.fsoft.dao;

import java.util.List;

import com.fsoft.model.Supplier;

public interface SupplierDAO {
	public void insert(Supplier entity);
	public void update(Supplier entity);
	public void delete(Supplier entity);
	public List<Supplier> list();
	public Supplier get(String id);
	public List<Object[]> inventoryBySupplier();
}
