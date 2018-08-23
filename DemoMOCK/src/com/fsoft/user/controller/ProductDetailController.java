package com.fsoft.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;

import com.fsoft.model.Fsoft;
import com.fsoft.model.Product;
import com.fsoft.service.ProductDAOImp;

@WebServlet("/product/detail")
public class ProductDetailController extends HttpServlet{
	private Fsoft session;
	ProductDAOImp pDao = new ProductDAOImp();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Integer id = Integer.parseInt(req.getParameter("id"));
		session.setAttribute("backurl", this.getServletContext().getContextPath()+"/product/detail?id="+id);
		req.setAttribute("model", pDao.get(id));
		// truy?n listproduct vào search
		List listproduct = pDao.getlist();
		req.setAttribute("listproduct", listproduct);
		forward(req, resp, "product/detail.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// l?y giá tr? trong search và truy?n lên trang details
        String name = req.getParameter("dml-name");        
		Integer id =  pDao.getIdByName(name);
		List<Product> listproduct = new ArrayList<Product>();
		listproduct = pDao.getlist();
		
		// n?u không t?m th?y
		if(id==null) {
			for(int i=0; i < listproduct.size();i++) {
				if((listproduct.get(i).getName().toLowerCase()).contains(name.toLowerCase())) {
					req.setAttribute("model", get(listproduct.get(i).getId()));
					req.setAttribute("view", "product/detail.jsp");
					req.setAttribute("listproduct", listproduct);
					req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);	
					return;
				}
			}
			
			Integer id2 = Integer.parseInt(req.getParameter("id"));
			req.setAttribute("model", get(id2));	
			forward(req, resp, "product/list-product.jsp");
		}
		
		// n?u t?m th?y
		else {
			// truy?n listproduct vào search
			
			req.setAttribute("listproduct", listproduct);
			
			// ð?y d? li?u lên trang details
			req.setAttribute("model", get(id));
			req.setAttribute("view", "product/detail.jsp");
			req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);		
		}
	}
	
	private void forward(HttpServletRequest req, HttpServletResponse resp,String view) throws ServletException, IOException {
			req.setAttribute("view", view);
			req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);
	}
	
	private Product get(Integer id) {
		return (Product) session.openSession().get(Product.class, id);
	}
}
