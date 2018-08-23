package com.fsoft.dao;

import java.util.List;

import com.fsoft.model.OrderDetail;

public interface OrderDetailDAO {
	public void insert(OrderDetail entity);
	public void update(OrderDetail entity);
	public void delete(OrderDetail entity);
	public List<OrderDetail> list();
	public OrderDetail get(Integer id);
	public List<OrderDetail> listByOrder(Integer id);
}
