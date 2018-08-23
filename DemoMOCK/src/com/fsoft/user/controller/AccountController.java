package com.fsoft.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fsoft.model.Customer;
import com.fsoft.service.CustomerDAOImp;

import sun.print.resources.serviceui;

@WebServlet("/account/login")
public class AccountController extends HttpServlet{
	CustomerDAOImp cDAO = new CustomerDAOImp();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid;
		String pass;
		String name;
		String email;
		String phone;
		String pic;
		String rem;
		Customer user;
		String action = req.getParameter("command");
		HttpSession session = req.getSession();
		String backurl = (String) session.getAttribute("backurl");
		PrintWriter out = resp.getWriter();
		
		switch (action) {
		case "login":
			uid = req.getParameter("username");
			pass = req.getParameter("password");
			rem = req.getParameter("remember");
			user = cDAO.get(uid);
			
			if(user == null)
			{
				req.setAttribute("loginmessage", "Username doesn't exist");
				forward(req,resp,"home/index.jsp");
			}
			else if(!cDAO.checkPass(pass, user.getPassword()))
			{
				req.setAttribute("loginmessage", "Wrong password");
				req.setAttribute("username", uid);
				forward(req,resp,"home/index.jsp");
			}
			else
			{
				session.setAttribute("user", user);
				Cookie cid = new Cookie("cid", uid);
				Cookie cpw = new Cookie("cpw", pass);
				if(rem !=null)
				{
					cid.setMaxAge(30*24*60*60);
					cpw.setMaxAge(30*24*60*60);
				}
				else
				{
					cid.setMaxAge(0);
					cpw.setMaxAge(0);
				}
				resp.addCookie(cid);
				resp.addCookie(cpw);
				System.out.println("Login Successfully");
				if(user.getAdmin() == true)
				{
					resp.sendRedirect(this.getServletContext().getContextPath() + "/admin/home/index.php");
					return;
				}
				resp.sendRedirect(backurl);
				session.removeAttribute("checkLogin");
			}
			break;
			
		case "register":
			uid = req.getParameter("username");
			pass = req.getParameter("password1");
			name = req.getParameter("fullname");
			email = req.getParameter("email");
			phone = req.getParameter("phone");
			pic = req.getParameter("pic");
			user = cDAO.get(uid);
			
			if(user != null) {
				req.setAttribute("registermessage", "Your username already exist");
				req.setAttribute("fullname", name);
				req.setAttribute("email", email);
				req.setAttribute("phone", phone);
				forward(req,resp,"home/index.jsp");
			} else {
				Customer a = new Customer();
				a.setId(uid);
				a.setPassword(cDAO.encryptPass(pass));
				a.setFullname(name);
				a.setEmail(email);
				a.setPhone(phone);
				if (pic == null) {
					a.setPhoto("User.jpg");
				} else {
					a.setPhoto(pic);
				}					
				a.setAdmin(false);
				
				cDAO.insert(a);
					
				System.out.println("Register Successfully");
				resp.sendRedirect(backurl);
			}
			break;
			
		case "logout":
			session.removeAttribute("user");
			System.out.println("Log out Successfully");
			resp.sendRedirect(backurl);
		}
	}
	
	private void forward(HttpServletRequest req, HttpServletResponse resp,String view) throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);
	}
}
