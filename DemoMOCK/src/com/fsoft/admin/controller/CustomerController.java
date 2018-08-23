package com.fsoft.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fsoft.model.Customer;
import com.fsoft.model.Fsoft;
import com.fsoft.model.Order;
import com.fsoft.service.CustomerDAOImp;
import com.fsoft.service.OrderDAOImp;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@WebServlet(urlPatterns = {"/admin/Customer", "/admin/Customer/getAdmin", "/admin/Customer/getOrder"})
public class CustomerController extends HttpServlet {
	CustomerDAOImp cDao = new CustomerDAOImp();
	OrderDAOImp oDao = new OrderDAOImp();
       
    public CustomerController() {
        super();      
    }
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		HttpSession s = req.getSession();
		
		String id= req.getParameter("getida");
		s.setAttribute("testadd", "0");
		req.setAttribute("ListSearch", cDao.getlist());
		req.setAttribute("total", cDao.getTong());
		
		if(id!=null) {
			Customer a = cDao.get(id);
			List<Customer> ListCus = new ArrayList<Customer>();
			ListCus.add(a);
			req.setAttribute("dmlListCus", ListCus);
			forward(req, resp);
			s.removeAttribute("mess");
		
		}
		
		if (uri.contains("/admin/Customer") && !uri.contains("/admin/Customer/getAdmin") 
				&& !uri.contains("/admin/Customer/getOrder")) {
			List ListCus = cDao.getlist();
			req.setAttribute("dmlListCus", ListCus);
			forward(req, resp);
			s.removeAttribute("mess");

		}
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String uri = req.getRequestURI();
		String mess = null;
		HttpSession s = req.getSession(); 
		
		//Search
		if("Search".equals(action)) {		
			String id= req.getParameter("dmlname");	
			Customer a = cDao.get(id);

			if(a==null) {
				doGet(req, resp);
			}
			else {
				List<Customer> ListCus = new ArrayList<Customer>();
				ListCus.add(a);
				req.setAttribute("dmlListCus", ListCus);
				forward(req, resp);
			}
		}
		
		//Add or Update
		if ("postone".equals(action)) {
			if(s.getAttribute("testadd").equals("0")==false) {
				Customer check = cDao.get(req.getParameter("userid"));
				if(check==null) {
					s.setAttribute("mess", "Update Failed!");
					resp.sendRedirect(req.getContextPath() + "/admin/Customer");
					return;
				}
			}
		    Customer add = new Customer();		    
		    add.setId(req.getParameter("userid"));
		    if(s.getAttribute("testadd").equals("0")) {
		    	if(cDao.get(add.getId())!=null) {
		    		s.setAttribute("mess", "Add Failed!");
					resp.sendRedirect(req.getContextPath() + "/admin/Customer");
		    		return;
		    	}
		    }
		    String pass = cDao.encryptPass(req.getParameter("pass")); 
		    add.setPassword(pass);
		    add.setFullname(req.getParameter("name"));
		    add.setPhone(req.getParameter("phone"));
		    add.setEmail(req.getParameter("email"));
		    add.setPhoto(req.getParameter("image"));
		    add.setAdmin(true);
		    if(s.getAttribute("testadd").equals("0")) {
			    try{
				    cDao.dmlinsert(add);
				    mess="Add Successfully!";
				    s.setAttribute("mess", mess);
			    }catch(Exception e) {
			    	mess="Add Failed!";
			    	s.setAttribute("mess", mess);
			    }
		    }
		    else {
		    	try{
				    cDao.dmlinsert(add);
				    mess="Update Successfully!";
				    s.setAttribute("mess", mess);
			    }catch(Exception e) {
			    	mess="Update Failed!";
			    	s.setAttribute("mess", mess);
			    }
		    }
		    s.setAttribute("testadd", "0");
		    resp.sendRedirect(req.getContextPath() + "/admin/Customer");
		    
		}
		
		//Delete
		if ("postdel".equals(action)) {
			
			String id = req.getParameter("id");
			Customer a = cDao.get(id);
			try {
				cDao.delete(a);
				mess="Delete Successfully!";
				s.setAttribute("mess", mess);
			}catch(Exception e) {
				mess="Delete Failed!";
				s.setAttribute("mess", mess);
			}
			resp.sendRedirect(req.getContextPath() + "/admin/Customer");
		}
		
		//Json data Customer
		if (uri.contains("/admin/Customer/getAdmin")) {
			s.setAttribute("testadd", "1");
			String id = req.getParameter("nanoid");

			Customer a = cDao.get(id);
			Gson json = new Gson();		
		    resp.setContentType("text/plain");
		    req.setCharacterEncoding("UTF-8");
		    resp.getWriter().write(json.toJson(a));   
		}		
		
		//Json data Oder of Customer
		if (uri.contains("/admin/Customer/getOrder")) {
			
			String id = req.getParameter("id");
			List<Order> list = oDao.listByUser(id);
			
			Gson json = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();	
		    resp.setContentType("text/plain");
		    req.setCharacterEncoding("UTF-8");
		    resp.getWriter().write(json.toJson(list));   
		}	
		
	}
	
	private void forward(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("view", "customer/ListCus.jsp");
		req.getRequestDispatcher("/WEB-INF/views/admin/layout.jsp").forward(req, resp);
	}
	
}
