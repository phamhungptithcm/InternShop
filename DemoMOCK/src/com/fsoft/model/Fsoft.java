package com.fsoft.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

public class Fsoft {
	static SessionFactory factory;
	static{
		Configuration config = new AnnotationConfiguration().configure("hibernate.cfg.xml");
		factory = config.buildSessionFactory();
	}
	public static Session openSession(){
		Session session = factory.openSession();
		return session;
	}
}
