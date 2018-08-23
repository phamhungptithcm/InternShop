package com.fsoft.admin.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fsoft.model.Category;
import com.fsoft.model.Product;
import com.fsoft.model.Supplier;
import com.fsoft.model.TechnicalParam;
import com.fsoft.service.CategoryDAOImp;
import com.fsoft.service.ProductDAOImp;
import com.fsoft.service.SupplierDAOImp;
import com.fsoft.service.TechnicalParamDAOIpm;

/**
 * Servlet implementation class AProductController
 */
@WebServlet(urlPatterns = {"/admin/delete", "/admin/product", "/admin/product/category", "/admin/product/supplier"})
public class AProductController extends HttpServlet {
	ProductDAOImp pDAO = new ProductDAOImp();
	CategoryDAOImp cDAO = new CategoryDAOImp();
	SupplierDAOImp sDAO = new SupplierDAOImp();
	TechnicalParamDAOIpm tDAO = new TechnicalParamDAOIpm();
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		session.setAttribute("backurl",uri);
		Integer pid;
		Product a;
		
		if (uri.contains("/admin/delete")) {
			pid = Integer.parseInt(request.getParameter("pid"));
			a = pDAO.get(pid);
			pDAO.delete(a);
			System.out.println("Delete Successfully");
			request.setAttribute("listproduct", pDAO.getlist());
			request.setAttribute("listcategory", cDAO.list());
			request.setAttribute("listsupplier", sDAO.list());
			response.sendRedirect(this.getServletContext().getContextPath() + "/admin/product");
			return;
		}
		if(uri.contains("/admin/product/category")) {
			Integer cid = Integer.parseInt(request.getParameter("cid"));
			request.setAttribute("listproduct", pDAO.listByCategory(cid));
			request.setAttribute("total", pDAO.listByCategory(cid).size());
			request.setAttribute("listcategory", cDAO.list());
			request.setAttribute("listsupplier", sDAO.list());
			forward(request,response, "product/listproduct.jsp");
			return;
		}
		if(uri.contains("/admin/product/supplier")) {
			String sid = request.getParameter("sid");
			request.setAttribute("listproduct", pDAO.listBySupplier(sid));
			request.setAttribute("total", pDAO.listBySupplier(sid).size());
			request.setAttribute("listcategory", cDAO.list());
			request.setAttribute("listsupplier", sDAO.list());
			forward(request,response, "product/listproduct.jsp");
			return;
		}
		if (uri.contains("/admin/product")) {
			request.setAttribute("total", pDAO.getlist().size());
			request.setAttribute("listproduct", pDAO.getlist());
			request.setAttribute("total", pDAO.getlist().size());
			request.setAttribute("listcategory", cDAO.list());
			request.setAttribute("listsupplier", sDAO.list());
			forward(request,response, "product/listproduct.jsp");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pname = request.getParameter("productname");
		String discount = request.getParameter("discount");
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");
		String supplier = request.getParameter("supplier");
		String category = request.getParameter("category");
		String action = request.getParameter("command");
		String description = request.getParameter("description");
		
		if(action.equals("addproduct")) {
			Product p = new Product();
			Category c = cDAO.get(Integer.parseInt(category));
			Supplier s = sDAO.get(supplier);
			TechnicalParam t = new TechnicalParam();
			Date date = new Date();
			
			p.setName(pname);
			p.setDiscount(Double.parseDouble(discount));
			p.setUnitsInStock(Integer.parseInt(quantity));
			p.setUnitPrice(Double.parseDouble(price));
			p.setSupplier(s);
			p.setCategory(c);
			p.setAvailable(true);
			p.setImage("product.jpg");
			p.setProductDate(date);
			p.setViewCount(0);
			p.setDescription(description);

			pDAO.insert(p);

			System.out.println("Add new product successfully");
			response.sendRedirect(this.getServletContext().getContextPath() +"/admin/product");
		}
	}
	
	private void forward(HttpServletRequest request, HttpServletResponse response, String view) throws ServletException, IOException {
		request.setAttribute("view", view);
		request.getRequestDispatcher("/WEB-INF/views/admin/layout.jsp").forward(request, response);
	}
}
