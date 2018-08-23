package com.fsoft.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fsoft.dao.OrderDetailDAO;
import com.fsoft.model.Fsoft;
import com.fsoft.model.OrderDetail;

public class OrderDetailDAOImp implements OrderDetailDAO{
	private Session session = Fsoft.openSession();
	@Override
	public void insert(OrderDetail entity) {
		Transaction t = session.beginTransaction();
		try {
			session.save(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}
	@Override
	public void update(OrderDetail entity) {
		Transaction t = session.beginTransaction();
		try {
			session.update(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}
	@Override
	public void delete(OrderDetail entity) {
		Transaction t = session.beginTransaction();
		try {
			session.delete(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}
	@Override
	public List<OrderDetail> list() {
		String hql = "FROM OrderDetail";
		Query query= session.createQuery(hql);
		return query.list();
	}
	@Override
	public OrderDetail get(Integer id) {
		return (OrderDetail) session.get(OrderDetail.class, id);
	}
	@Override
	public List<OrderDetail> listByOrder(Integer id) {
		String hql = "FROM OrderDetail WHERE order.id=:cid";
		Query query = session.createQuery(hql);
		query.setParameter("cid", id);
		return query.list();
	}

}
