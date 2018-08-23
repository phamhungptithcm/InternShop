package com.fsoft.admin.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fsoft.model.Order;
import com.fsoft.model.OrderStatus;
import com.fsoft.model.Supplier;
import com.fsoft.service.OrderDAOImp;
import com.fsoft.service.OrderDetailDAOImp;
import com.fsoft.service.OrderStatusDAOImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/admin/order")
public class OrderController extends HttpServlet{
	OrderDAOImp oDao = new OrderDAOImp();
	OrderDetailDAOImp odDao = new OrderDetailDAOImp();
	OrderStatusDAOImpl osDao = new OrderStatusDAOImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		HttpSession session = req.getSession();
		switch (command) {
		case "view":
			req.setAttribute("staByMonth", oDao.statisticOrderByMonth());
			req.setAttribute("staByYear", oDao.statisticOrderByYear());
			req.setAttribute("staByQuarter", oDao.statisticOrderByQuarter());
			req.setAttribute("orderStatus", osDao.list());
			req.setAttribute("order", oDao.list());
			req.setAttribute("total", oDao.list().size());
			forward(req, resp, "order/list_order.jsp");
			session.removeAttribute("message");
			break;
		default:
			this.doPost(req, resp);;
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		System.out.println(command);
		HttpSession session = req.getSession();
		switch (command) {
		case "update":
			Integer id = Integer.parseInt(req.getParameter("id"));
			Integer orderStatusId = Integer.parseInt(req.getParameter("orderStatus"));
			Date shippedDate = null;
			try {
				shippedDate = new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter("shippedDate"));
			} catch (ParseException e1) {
				e1.printStackTrace();
			}

			Order order = oDao.get(id);
			OrderStatus orderStatus = osDao.get(orderStatusId);
			if (order == null) {
				session.setAttribute("message", id + " does not exist");
			} else {
				order.setOrderStatus(orderStatus);
				order.setShippedDate(shippedDate);
				try {
					oDao.update(order);
					session.setAttribute("message", "Update successfully");
				} catch (Exception e) {
					session.setAttribute("message", "Update failed");
				}
			}
			resp.sendRedirect(this.getServletContext().getContextPath() + "/admin/order?command=view");
			break;
		case "getorder":
			Integer gid = Integer.parseInt(req.getParameter("id"));
			Order gorder = oDao.get(gid);
			System.out.println(gid);
			Gson json = new Gson();
			
		    resp.setContentType("text/plain");
		    req.setCharacterEncoding("UTF-8");
		    resp.getWriter().write(json.toJson(gorder));
			break;
		case "getorderDetail":
			Integer odid =Integer.parseInt(req.getParameter("id"));
			System.out.println(odid);
			Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();	
		    resp.setContentType("text/plain");
		    req.setCharacterEncoding("UTF-8");
		    resp.getWriter().write(gson.toJson(odDao.listByOrder(odid)));  
			break;
		default:
			this.doGet(req, resp);
			break;
		}
	}
	private void forward(HttpServletRequest req, HttpServletResponse resp,String view)
			throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/admin/layout.jsp").forward(req, resp);
	}
}
