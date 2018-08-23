package com.fsoft.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fsoft.model.Category;
import com.fsoft.service.CategoryDAOImp;
import com.google.gson.Gson;

@WebServlet("/admin/category")
public class CategoryController extends HttpServlet {
	CategoryDAOImp cDao = new CategoryDAOImp();

	public CategoryController() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		HttpSession session = req.getSession();
		String command = req.getParameter("command");
		switch (command) {
		case "view":
			req.setAttribute("items", cDao.inventoryByCategory());
			req.setAttribute("cates", cDao.list());
			Integer total = cDao.list().size();
			req.setAttribute("total", total);
			forward(req, resp, "category/list_cate.jsp");
			session.removeAttribute("message");
			break;
		default:
			this.doPost(req, resp);
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String command = req.getParameter("command");
		System.out.println(command);
		String uri = req.getRequestURI();
		switch (command) {
		case "view":
			this.doGet(req, resp);
			break;
		case "add":
			String name = req.getParameter("cname");
			try {
				Category addCate = new Category();
				addCate.setName(name);
				cDao.insert(addCate);
				session.setAttribute("message", "Insert successfully");
			} catch (Exception e) {
				session.setAttribute("message", "Insert failed");
			}
			resp.sendRedirect(this.getServletContext().getContextPath() + "/admin/category?command=view");
			break;
		case "update":
			Integer uid = Integer.parseInt(req.getParameter("cid"));
			String uname = req.getParameter("cname");
			Category uCate = cDao.get(uid);
			if (uCate == null) {
				session.setAttribute("message", uid + " does not exist");
			} else {
				uCate.setName(uname);
				try {
					cDao.update(uCate);
					session.setAttribute("message", "Update successfully");
				} catch (Exception e) {
					session.setAttribute("message", "Update failed");
				}
			}
			resp.sendRedirect(this.getServletContext().getContextPath() + "/admin/category?command=view");
			break;
		case "getcate":
			try {
				Integer cid = Integer.parseInt(req.getParameter("id"));
				Category gcate = cDao.get(cid);
				System.out.println(gcate.getName());
				Gson gson = new Gson();

				resp.setContentType("text/plain");
				req.setCharacterEncoding("UTF-8");
				System.out.println(gson.toJson(gcate));
				resp.getWriter().write(gson.toJson(gcate));
			} catch (Exception e) {
				forward(req, resp, "home/index.jsp");
			}

			break;
		case "delete":
			try {
				Integer id = Integer.parseInt(req.getParameter("id"));
				Category entity = cDao.get(id);
				cDao.delete(entity);
				session.setAttribute("message", "Delete successfully");
			} catch (Exception e) {
				session.setAttribute("message", "Delete failed");
			}
			resp.sendRedirect(this.getServletContext().getContextPath() + "/admin/category?command=view");
			break;
		}
	}

	private void forward(HttpServletRequest req, HttpServletResponse resp, String view)
			throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/admin/layout.jsp").forward(req, resp);
	}
}
