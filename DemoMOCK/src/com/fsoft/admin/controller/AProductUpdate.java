package com.fsoft.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fsoft.model.Category;
import com.fsoft.model.Product;
import com.fsoft.model.Supplier;
import com.fsoft.model.TechnicalParam;
import com.fsoft.service.CategoryDAOImp;
import com.fsoft.service.ProductDAOImp;
import com.fsoft.service.SupplierDAOImp;
import com.fsoft.service.TechnicalParamDAOIpm;

/**
 * Servlet implementation class AProductUpdate
 */
@WebServlet("/admin/modify/update")
public class AProductUpdate extends HttpServlet {
	ProductDAOImp pDAO = new ProductDAOImp();
	CategoryDAOImp cDAO = new CategoryDAOImp();
	SupplierDAOImp sDAO = new SupplierDAOImp();
	TechnicalParamDAOIpm tDAO = new TechnicalParamDAOIpm();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AProductUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer pid;
		Product p;
		String command = request.getParameter("command");
		
		switch (command) {
		case "getupdateproduct":
			pid = Integer.parseInt(request.getParameter("pid"));
			p = pDAO.get(pid);
			
			request.setAttribute("product", p);
			request.setAttribute("listcategory", cDAO.list());
			request.setAttribute("listsupplier", sDAO.list());
			forward(request,response,"product/updateproduct.jsp");
			break;
			
		case "getupdatetechchparam":
			pid = Integer.parseInt(request.getParameter("pid"));
			p = pDAO.get(pid);
			
			if(p.getTechnicalParam() != null) {
				request.setAttribute("product", p);
				forward(request,response,"product/updatetechparam.jsp");
				break;
				
			}  
			if(p.getTechnicalParam() == null) {
				TechnicalParam t = new TechnicalParam();
				t.setId(pid);
				
				tDAO.insert(t);
				
				p.setTechnicalParam(t);
				pDAO.update(p);
				
				request.setAttribute("product", p);
				forward(request,response,"product/updatetechparam.jsp");
				break;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("command");
		
		switch(action) {
		case "updateproduct":
			String pname = request.getParameter("productname");
			String discount = request.getParameter("discount");
			String quantity = request.getParameter("quantity");
			String price = request.getParameter("price");
			String supplier = request.getParameter("supplier");
			String category = request.getParameter("category");
			String description = request.getParameter("description");
			Integer pid = Integer.parseInt(request.getParameter("pid"));
			
			Product up = pDAO.get(pid);
			Category uc = cDAO.get(Integer.parseInt(category));
			Supplier us = sDAO.get(supplier);
			
			up.setName(pname);
			up.setDiscount(Double.parseDouble(discount));
			up.setUnitsInStock(Integer.parseInt(quantity));
			up.setUnitPrice(Double.parseDouble(price));
			up.setSupplier(us);
			up.setCategory(uc);
			up.setDescription(description);
			
			pDAO.update(up);
			
			System.out.println("Update product successfully");
			request.setAttribute("listproduct", pDAO.getlist());
			request.setAttribute("listcategory", cDAO.list());
			request.setAttribute("listsupplier", sDAO.list());
			forward(request,response,"product/listproduct.jsp");
			break;
			
		case "updatetechparam":
			String cpu = request.getParameter("cpu");
			String ram = request.getParameter("ram");
			String driver = request.getParameter("driver");
			String screen = request.getParameter("screen");
			String screencard = request.getParameter("screencard");
			String connectionport = request.getParameter("connectionport");
			String operatingsystem = request.getParameter("operatingsystem");
			String size = request.getParameter("size");
			Integer tid = Integer.parseInt(request.getParameter("tid"));
			
			TechnicalParam t = tDAO.get(tid);
			
			t.setCpu(cpu);
			t.setRam(ram);
			t.setDrive(driver);
			t.setScreen(screen);
			t.setScreenCard(screencard);
			t.setConnectionPort(connectionport);
			t.setOperatingSystem(operatingsystem);
			t.setSize(size);
			
			tDAO.update(t);
			
			response.sendRedirect(this.getServletContext().getContextPath()+ "/admin/product");
			break;
		}
	}
	private void forward(HttpServletRequest request, HttpServletResponse response, String view) throws ServletException, IOException {
		request.setAttribute("view", view);
		request.getRequestDispatcher("/WEB-INF/views/admin/layout.jsp").forward(request, response);
	}

}
