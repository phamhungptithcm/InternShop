package com.fsoft.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fsoft.dao.CustomerDAO;
import com.fsoft.model.Customer;
import com.fsoft.model.Fsoft;

public class CustomerDAOImp implements CustomerDAO{
	private Session s = Fsoft.openSession();
	private Fsoft fs;
	private Session session = fs.openSession();
	private Transaction t = session.beginTransaction();
	
	@Override
	public void insert(Customer a) {
		try {
			session.save(a);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
	}
	
	@Override
	public List<Customer> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String encryptPass(String pass) {
		String encryptedpass = BCrypt.hashpw(pass, BCrypt.gensalt());
		return encryptedpass;
	}
	
	@Override
	public boolean checkPass(String pass, String encryptedpass) {
		if (BCrypt.checkpw(pass, encryptedpass))
			return true;
		return false;
	}

	
	@Override
	public void dmlinsert(Customer entity) {
		Transaction tran = s.beginTransaction();
		try{
		s.merge(entity);
		tran.commit();
		}catch(Exception e) {
			tran.rollback();
		}
	}

	@Override
	public void update(Customer entity) {
		Transaction tran = s.beginTransaction();
		try {
	        s.update(entity);
	        tran.commit();
		}catch(Exception e) {
			tran.rollback();
		}
	}

	@Override
	public void delete(Customer entity) {
		// TODO Auto-generated method stub
		Transaction tran = s.beginTransaction();
		try {
	        s.delete(entity);
	        tran.commit(); 
		}catch(Exception e) {
			tran.rollback();
		}
	}

	@Override
	public void refresh(Customer entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Customer> getlist() {
		String hql = "FROM Customer";
		Query query = s.createQuery(hql);
		return  query.list();
	}

	@Override
	public Customer get(String id) {
		String hql = "FROM Customer WHERE id = '"+id+"'";
		Query query = s.createQuery(hql);
		Customer a =  (Customer) query.uniqueResult();
		if(a==null)
			return null;
		else 
			return a;
	}
	
	@Override
	public long getTong() {
		String hql = "SELECT count(*) FROM Customer";
		Query query = s.createQuery(hql);
		Long total = (Long) query.uniqueResult();
		return total;
	}
	
	
}
