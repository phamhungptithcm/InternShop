package com.fsoft.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fsoft.service.CategoryDAOImp;
import com.fsoft.service.ProductDAOImp;
import com.fsoft.service.SupplierDAOImp;

@WebServlet("/admin/home/index.php")
public class AHomeController extends HttpServlet{
	ProductDAOImp pDao = new ProductDAOImp();
	CategoryDAOImp cDao = new CategoryDAOImp();
	SupplierDAOImp sDao = new SupplierDAOImp();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session!=null) {
			req.getSession().removeAttribute("mobiles");
		} 
		req.setAttribute("citems", cDao.inventoryByCategory());
		req.setAttribute("sitems", sDao.inventoryBySupplier());
		req.setAttribute("mobiles", pDao.listByCategory(1));
		req.setAttribute("mtotal", pDao.listByCategory(1).size());
		req.setAttribute("tablets", pDao.listByCategory(2));
		req.setAttribute("ttotal", pDao.listByCategory(2).size());
		req.setAttribute("laptops", pDao.listByCategory(3));
		req.setAttribute("ltotal", pDao.listByCategory(3).size());
		forward(req, resp, "home/index.jsp");
		session.removeAttribute("mess");
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String[] results = req.getParameterValues("checkVH");
		HttpSession session = req.getSession();
		
		if(results == null) {
			resp.sendRedirect(req.getContextPath() + "/admin/home/index.php");
			return;
		}
		
		if ("motServlet".equals(action)) {
			//become false all
			for(int i=0; i<pDao.listByCategory(1).size(); i++) {
				 pDao.updateVH(pDao.listByCategory(1).get(i).getId(), false);
			}
			for (int i = 0; i < results.length; i++) {
				Integer id = Integer.parseInt(results[i]);
			    pDao.updateVH(id, true);
			}
		} else if ("haiServlet".equals(action)) {
			//become false all
			for(int i=0; i<pDao.listByCategory(2).size(); i++) {
				 pDao.updateVH(pDao.listByCategory(2).get(i).getId(), false);
			}
			
			for (int i = 0; i < results.length; i++) {
				Integer id = Integer.parseInt(results[i]);
			    pDao.updateVH(id, true);
			}
		} else if("baServlet".equals(action)) {			
			//become false all
			for(int i=0; i<pDao.listByCategory(3).size(); i++) {
				 pDao.updateVH(pDao.listByCategory(3).get(i).getId(), false);
			}
			
			for (int i = 0; i < results.length; i++) {
				Integer id = Integer.parseInt(results[i]);
			    pDao.updateVH(id, true);
			}
		}
		
		session.setAttribute("mess", "Successfully!");
		resp.sendRedirect(req.getContextPath() + "/admin/home/index.php");
		
		
		
		
//		HttpSession session = req.getSession();
//		Integer id = Integer.parseInt(req.getParameter("id"));
//		Product uProduct = new Product();
//		
//		uProduct = pDao.get(id);
//		uProduct.setViewHome(true);
//		try {
//			pDao.update(uProduct);
//			session.setAttribute("message", "Successfully");
//		} catch (Exception e) {
//			session.setAttribute("message", "Failed");
//		}
//		resp.getWriter().write("OK");
	}
	
	
	private void forward(HttpServletRequest req, HttpServletResponse resp, String view)
			throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/admin/layout.jsp").forward(req, resp);
	}
}
