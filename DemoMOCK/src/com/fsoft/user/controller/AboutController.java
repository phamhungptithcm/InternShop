package com.fsoft.user.controller;

import java.io.IOException;
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

@WebServlet(urlPatterns="/home/about.php")
public class AboutController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String url = this.getServletContext().getContextPath() + "/home/about.php";
		session.setAttribute("backurl", url);
		forward(req, resp, "home/about.jsp");
	}
	private void forward(HttpServletRequest req, HttpServletResponse resp,String view) throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);
	}
}
