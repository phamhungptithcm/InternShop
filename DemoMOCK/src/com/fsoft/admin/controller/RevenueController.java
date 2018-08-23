package com.fsoft.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fsoft.service.ReportDAOImpl;

@WebServlet("/admin/revenue")
public class RevenueController extends HttpServlet{
	private ReportDAOImpl rDao = new ReportDAOImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("reCate", rDao.revenueByCategory());
		req.setAttribute("reSupp", rDao.revenueBySupplier());
		req.setAttribute("reProd", rDao.revenueByProduct());
		req.setAttribute("reCus", rDao.revenueByCustomer());
		req.setAttribute("reYear", rDao.revenueByYear());
		req.setAttribute("reQuarter", rDao.revenueByQuarter());
		req.setAttribute("reMonth", rDao.revenueByMonth());
		
		forward(req, resp, "revenue/list_revenue.jsp");
	}
	private void forward(HttpServletRequest req, HttpServletResponse resp,String view)
			throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/admin/layout.jsp").forward(req, resp);
	}
}
