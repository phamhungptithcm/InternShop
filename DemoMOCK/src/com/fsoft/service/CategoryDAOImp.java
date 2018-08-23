package com.fsoft.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fsoft.dao.CategoryDAO;
import com.fsoft.model.Category;
import com.fsoft.model.Fsoft;

public class CategoryDAOImp implements CategoryDAO {
	private Session session = Fsoft.openSession();

	@Override
	public void insert(Category entity) {
		Transaction t = session.beginTransaction();
		try {
			session.save(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}

	@Override
	public void update(Category entity) {
		Transaction t = session.beginTransaction();
		try {
			session.update(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}

	@Override
	public void delete(Category entity) {
		Transaction t = session.beginTransaction();
		try {
			session.delete(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}

	@Override
	public List<Category> list() {
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public Category get(Integer id) {
		return (Category) session.get(Category.class, id);
	}

	@Override
	public List<Object[]> inventoryByCategory() {
		String hql = "SELECT c.name,COUNT(p) FROM Product p, Category c" + 
				" WHERE c.id = p.category.id" + 
				" GROUP BY c.name";
		return session.createQuery(hql).list();
	}

}
