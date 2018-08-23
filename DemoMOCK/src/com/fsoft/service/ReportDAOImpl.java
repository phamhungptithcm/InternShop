package com.fsoft.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.fsoft.dao.ReportDAO;
import com.fsoft.model.Fsoft;

public class ReportDAOImpl implements ReportDAO{
	private Session session = Fsoft.openSession();
	@SuppressWarnings("unchecked")
	public List<Object[]> revenueByCategory() {
		String hql = "SELECT d.product.category.name,"
				+ " SUM(d.quantity),"
				+ " SUM(d.quantity * d.unitPrice * (1-d.discount)),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY d.product.category.name";
		Query query = session.createQuery(hql);
		query.setMaxResults(7);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	public List<Object[]> revenueBySupplier() {
		String hql = "SELECT d.product.supplier.companyName,"
				+ " SUM(d.quantity),"
				+ " SUM(d.quantity * d.unitPrice * (1-d.discount)),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY d.product.supplier.companyName";
		Query query = session.createQuery(hql);
		query.setMaxResults(7);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> revenueByProduct() {
		String hql = "SELECT d.product.name,"
				+ " SUM(d.quantity),"
				+ " SUM(d.quantity * d.unitPrice * (1-d.discount)),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY d.product.name";
		Query query = session.createQuery(hql);
		query.setMaxResults(7);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> revenueByCustomer() {
		String hql = "SELECT  d.order.customer.id,"
				+ " SUM(d.quantity),"
				+ " SUM(d.quantity * d.unitPrice * (1-d.discount)),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY d.order.customer.id"
				+ " ORDER BY SUM(d.quantity * d.unitPrice * (1-d.discount)) DESC";
		Query query = session.createQuery(hql);
		query.setMaxResults(7);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> revenueByYear() {
		String hql = "SELECT YEAR(d.order.orderDate),"
				+ " SUM(d.quantity),"
				+ " SUM(d.quantity * d.unitPrice * (1-d.discount)),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY YEAR(d.order.orderDate)";
		Query query = session.createQuery(hql);
		query.setMaxResults(7);
		return query.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> revenueByMonth() {
		String hql = "SELECT MONTH(d.order.orderDate),"
				+ " SUM(d.quantity),"
				+ " SUM(d.quantity * d.unitPrice * (1-d.discount)),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY MONTH(d.order.orderDate)"
				+ " ORDER BY MONTH(d.order.orderDate)";
		return session.createQuery(hql).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> revenueByQuarter() {
		String hql = "SELECT CEILING(MONTH(d.order.orderDate)/3.0),"
				+ " SUM(d.quantity),"
				+ " SUM(d.quantity * d.unitPrice * (1-d.discount)),"
				+ " MIN(d.unitPrice),"
				+ " MAX(d.unitPrice),"
				+ " AVG(d.unitPrice)"
				+ " FROM OrderDetail d"
				+ " GROUP BY CEILING(MONTH(d.order.orderDate)/3.0)";
		return session.createQuery(hql).list();
	}
}
