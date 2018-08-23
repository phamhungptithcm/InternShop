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

import com.fsoft.model.Product;
import com.fsoft.service.ProductDAOImp;

@WebServlet(urlPatterns="/home/index.php")
public class HomeController extends HttpServlet{
	ProductDAOImp pDao = new ProductDAOImp();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String url = this.getServletContext().getContextPath() + "/home/index.php";
		session.setAttribute("backurl", url);
		req.setAttribute("mobiles", pDao.listByCategory(1));
		req.setAttribute("tablets", pDao.listByCategory(2));
		req.setAttribute("laptops", pDao.listByCategory(3));
		forward(req, resp, "home/index.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("dml-name");
		Integer id = pDao.getIdByName(name);
		
		if (id == null) {
			for(int i=0; i < pDao.getlist().size();i++) {
				if((pDao.getlist().get(i).getName().toLowerCase()).contains(name.toLowerCase())) {
					req.setAttribute("model", pDao.get(pDao.getlist().get(i).getId()));
					req.setAttribute("view", "product/detail.jsp");
					req.setAttribute("listproduct", pDao.getlist());
					req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);	
					return;
				}
			}
			doGet(req, resp);
		} else {
			req.setAttribute("listproduct", pDao.getlist());
			// xét model cho details
			req.setAttribute("model", pDao.get(id));
			forward(req, resp, "product/detail.jsp");
		}
	}
	
	
	
	private void forward(HttpServletRequest req, HttpServletResponse resp,String view) throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);
	}
}
