package com.fsoft.dao;

import java.util.List;

import com.fsoft.helper.CartService;
import com.fsoft.model.Order;


public interface OrderDAO {
	public void insert(Order entity);
	public void update(Order entity);
	public List<Order> list();
	public Order get(Integer id);
	public List<Order> listByUser(String id);
	public void purchase(Order order, CartService cartService);
	public List<Object[]> statisticOrderByYear();
	public List<Object[]> statisticOrderByMonth();
	public List<Object[]> statisticOrderByQuarter();
}
