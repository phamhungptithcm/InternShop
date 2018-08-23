package com.fsoft.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;

import com.fsoft.dao.OrderStatusDAO;
import com.fsoft.model.Fsoft;
import com.fsoft.model.OrderStatus;

public class OrderStatusDAOImpl implements OrderStatusDAO{
	private Fsoft session;

	@Override
	public void insert(OrderStatus entity) {
		session.openSession().save(entity);
	}

	@Override
	public void update(OrderStatus entity) {
		session.openSession().update(entity);
	}

	@Override
	public void delete(OrderStatus entity) {
		session.openSession().delete(entity);
	}
	@Override
	public List<OrderStatus> list() {
		String hql = "FROM OrderStatus";
		Query query= session.openSession().createQuery(hql);
		return query.list();
	}

	@Override
	public OrderStatus get(Integer id) {
		return (OrderStatus) session.openSession().get(OrderStatus.class, id);
	}
	
}
