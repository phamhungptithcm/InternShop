package com.fsoft.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fsoft.dao.OrderDAO;
import com.fsoft.helper.CartItem;
import com.fsoft.helper.CartService;
import com.fsoft.model.Fsoft;
import com.fsoft.model.Order;
import com.fsoft.model.OrderDetail;

public class OrderDAOImp implements OrderDAO {
	private Session session = Fsoft.openSession();
	OrderDetailDAOImp odDao = new OrderDetailDAOImp();
	ProductDAOImp pDao = new ProductDAOImp();

	@Override
	public void insert(Order entity) {
		Transaction t = session.beginTransaction();
		try {
			session.save(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}

	}

	@Override
	public void update(Order entity) {
		Transaction t = session.beginTransaction();
		try {
			session.update(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}

	@Override
	public List<Order> list() {
		String hql = "FROM Order";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public Order get(Integer id) {
		return (Order) session.get(Order.class, id);
	}

	@Override
	public List<Order> listByUser(String id) {
		String hql = "FROM Order WHERE customer.id=:cid";
		Query query = session.createQuery(hql);
		query.setParameter("cid", id);
		return query.list();
	}

	public void purchase(Order order, CartService cartService) {
		this.insert(order);
		for (CartItem item : cartService.getItem()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setDiscount(item.getDiscount());
			orderDetail.setOrder(order);
			orderDetail.setProduct(pDao.get(item.getId()));
			orderDetail.setQuantity(item.getQuantity());
			orderDetail.setUnitPrice(item.getUnitPrice());
			odDao.insert(orderDetail);
		}
		cartService.getCartItems().clear();
	}

	@Override
	public List<Object[]> statisticOrderByYear() {
		String hql = "SELECT YEAR(orderDate),COUNT(id) FROM Order"
				+ " GROUP BY YEAR(orderDate)";
		return session.createQuery(hql).list();
	}

	@Override
	public List<Object[]> statisticOrderByMonth() {
		String hql = "SELECT MONTH(orderDate),COUNT(id) FROM Order "
				+ " WHERE YEAR(orderDate) = YEAR(GETDATE())"
				+ " GROUP BY MONTH(orderDate)";
		return session.createQuery(hql).list();
	}

	@Override
	public List<Object[]> statisticOrderByQuarter() {
		String hql = "SELECT CEILING(MONTH(orderDate)/3.0),COUNT(id) FROM Order "
				+ " WHERE YEAR(orderDate) = YEAR(GETDATE())"
				+ " GROUP BY CEILING(MONTH(orderDate)/3.0) ";
		return session.createQuery(hql).list();
	}

}
