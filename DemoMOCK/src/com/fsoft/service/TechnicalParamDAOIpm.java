package com.fsoft.service;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fsoft.dao.TechnicalParamDAO;
import com.fsoft.model.Fsoft;
import com.fsoft.model.Product;
import com.fsoft.model.TechnicalParam;

public class TechnicalParamDAOIpm implements TechnicalParamDAO{
	private Session session = Fsoft.openSession();
	
	@Override
	public void insert(TechnicalParam entity) {
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
	public void update(TechnicalParam entity) {
		// TODO Auto-generated method stub
		Transaction t = session.beginTransaction();
		session.update(entity);
        t.commit();
	}

	@Override
	public void delete(TechnicalParam entity) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public TechnicalParam get(Integer id) {
		// TODO Auto-generated method stub
		session.clear();
		return (TechnicalParam) session.get(TechnicalParam.class, id);
	}
}
