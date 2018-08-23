package com.fsoft.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fsoft.dao.ProductDAO;
import com.fsoft.model.Fsoft;
import com.fsoft.model.Product;

public class ProductDAOImp implements ProductDAO{
	private Session session = Fsoft.openSession();
	@Override
	public List<Product> listByCategory(Integer id) {
		session.clear();
		String hql = "FROM Product as p WHERE category.id=:cid";
		Query query = session.createQuery(hql);
		query.setParameter("cid", id);
		return  query.list();
	}
	public Product get(Integer id) {
		return (Product) session.get(Product.class, id);
	}
	
	public Product getProduct(String name) {
		return (Product) session.get(Product.class, name);
	}
	
	@Override
	public void insert(Product entity) {
		// TODO Auto-generated method stub
		Transaction t = session.beginTransaction();
		try {
			session.save(entity);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}
	@Override
	public void update(Product entity) {
		// TODO Auto-generated method stub
		Transaction t = session.beginTransaction();
		try {
			session.update(entity);
			t.commit();
		}catch(Exception e) {
			t.rollback();
		}
	}
	@Override
	public void delete(Product entity) {
		// TODO Auto-generated method stub
		Transaction t = session.beginTransaction();
		try {
			session.delete(entity);
			t.commit();
		}catch(Exception e) {
			t.rollback();
		}
	}
	@Override
	public void refresh(Product entity) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<Product> listBySupplier(String sid, Integer cid) {
		String hql = "FROM Product as p WHERE supplier.id=:supid AND category.id =:cateid";
		Query query = session.createQuery(hql);
		query.setParameter("supid", sid);
		query.setParameter("cateid", cid);
		return  query.list();
	}
	@Override
	public List<Product> listBySupplier(String sid) {
		String hql = "FROM Product as p WHERE supplier.id=:supid";
		Query query = session.createQuery(hql);
		query.setParameter("supid", sid);
		return  query.list();
	}
	@Override
	public long getTong(Integer id) {
		String hql = "SELECT count(*) FROM Product as p WHERE category.id=:cid";
		Query query = session.createQuery(hql);
		query.setParameter("cid", id);
		Long total = (Long) query.uniqueResult();
		return total;
	}
	@Override
	public List<Product> getlist(){
		String hql = "FROM Product as p";
		Query query = session.createQuery(hql);
		return query.list();
	}
	@Override
	public Integer getIdByName(String name) {
		String hql ="SELECT p.id FROM Product as p where p.name=:cname";       
	    Query query = session.createQuery(hql);
		query.setParameter("cname", name);	
		Integer id =  (Integer) query.uniqueResult();
		return id;
	}
	
	@Override
	public void updateVH(Integer id, boolean vh) {
		Transaction t = session.beginTransaction();
		String hql = "update Product c set c.viewHome = :vh where c.id = :cid";
		Query query = session.createQuery(hql);
		query.setParameter("cid", id);
		query.setParameter("vh", vh);
		query.executeUpdate();
		t.commit();
	}
	
}
