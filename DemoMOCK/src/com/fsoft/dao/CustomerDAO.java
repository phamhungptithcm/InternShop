package com.fsoft.dao;

import java.util.List;

import com.fsoft.model.Customer;


public interface CustomerDAO {
	public void insert(Customer entity);
	public void dmlinsert(Customer entity);
	public void update(Customer entity);
	public void delete(Customer entity);
	public void refresh(Customer entity);
	public List<Customer> getlist();
	public Customer get(String id);
	public long getTong();
	
	public List<Customer> list();

	public String encryptPass(String pass);
	public boolean checkPass(String pass, String encryptedpass);

}
