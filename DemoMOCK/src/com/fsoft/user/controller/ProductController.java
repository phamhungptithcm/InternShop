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

import com.fsoft.model.Category;
import com.fsoft.model.Fsoft;
import com.fsoft.model.Product;
import com.fsoft.service.CategoryDAOImp;
import com.fsoft.service.ProductDAOImp;
import com.fsoft.service.SupplierDAOImp;

@WebServlet(urlPatterns = { "/product/listbycategory","/product/listbysupplier"})
public class ProductController extends HttpServlet {
	ProductDAOImp pDao = new ProductDAOImp();
	CategoryDAOImp catDao = new CategoryDAOImp();
	CategoryDAOImp cDao = new CategoryDAOImp();
	SupplierDAOImp sDao = new SupplierDAOImp();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		HttpSession session = req.getSession();
		session.setAttribute("backurl", uri);
		if (uri.contains("/product/listbycategory")) {
			Integer id = Integer.parseInt(req.getParameter("command"));
			req.setAttribute("cate", catDao.get(id));
			req.setAttribute("items", pDao.listByCategory(id));
			Long total = pDao.getTong(id);
			req.setAttribute("total", total);
			req.setAttribute("listproduct", pDao.getlist());
		} else if (uri.contains("/product/listbysupplier")) {
			Integer cid = Integer.parseInt(req.getParameter("cate"));
			String sid = req.getParameter("sup");
			req.setAttribute("cate", cDao.get(cid));
			req.setAttribute("items", pDao.listBySupplier(sid, cid));
		}
		forward(req, resp, "product/list-product.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// l?y giá tr? trong search truy?n sang trang details
		String name = req.getParameter("dml-name");
		Integer id = pDao.getIdByName(name);
		
		if (id == null) {
			for(int i=0; i < pDao.getlist().size();i++) {
				if((pDao.getlist().get(i).getName().toLowerCase()).contains(name.toLowerCase())) {
					req.setAttribute("model", pDao.get(pDao.getlist().get(i).getId()));
					
					req.setAttribute("listproduct", pDao.getlist());
					forward(req, resp, "product/detail.jsp");
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

	private void forward(HttpServletRequest req, HttpServletResponse resp, String view)
			throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);
	}
}
