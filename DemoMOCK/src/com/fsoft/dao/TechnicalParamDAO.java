package com.fsoft.dao;

import com.fsoft.model.TechnicalParam;

public interface TechnicalParamDAO {
	public void insert(TechnicalParam entity);
	public void update(TechnicalParam entity);
	public void delete(TechnicalParam entity);
	public TechnicalParam get(Integer id);
}	
