package com.fsoft.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fsoft.dao.SupplierDAO;
import com.fsoft.model.Fsoft;
import com.fsoft.model.Supplier;

public class SupplierDAOImp implements SupplierDAO{
	private Session session = Fsoft.openSession();
	@Override
	public void insert(Supplier entity) {
		Transaction t = session.beginTransaction();
		try {
			session.save(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}

	@Override
	public void update(Supplier entity) {
		Transaction t = session.beginTransaction();
		try {
			session.update(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}

	@Override
	public void delete(Supplier entity) {
		Transaction t = session.beginTransaction();
		try {
			session.delete(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}
	@Override
	public List<Supplier> list() {
		String hql ="FROM Supplier";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public Supplier get(String id) {
		return (Supplier) session.get(Supplier.class, id);
	}

	@Override
	public List<Object[]> inventoryBySupplier() {
		String hql = "SELECT s.companyName,COUNT(p) FROM Product p, Supplier s" + 
				" WHERE s.id = p.supplier.id" + 
				" GROUP BY s.companyName";
		return session.createQuery(hql).list();
	}

}
