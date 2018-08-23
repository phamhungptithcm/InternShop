package com.fsoft.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fsoft.model.Supplier;
import com.fsoft.service.SupplierDAOImp;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet(urlPatterns = { "/admin/supplier" })
public class SupplierController extends HttpServlet {
	SupplierDAOImp sDao = new SupplierDAOImp();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String command = req.getParameter("command");
		switch (command) {
		case "view":
			req.setAttribute("items", sDao.inventoryBySupplier());
			req.setAttribute("sups", sDao.list());
			Integer total = sDao.list().size();
			req.setAttribute("total", total);
			forward(req, resp, "supplier/list_sup.jsp");
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
		switch (command) {
		case "view":
			this.doGet(req, resp);
			break;
		case "add":
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String photo = req.getParameter("photo");
			if (photo == null) {
				photo = "abc.jpg";
			}
			Supplier sup = sDao.get(id);
			if (sup != null) {
				session.setAttribute("message", "Duplicate Supplier Code");
			} else {
				Supplier addSup = new Supplier();
				addSup.setId(id);
				addSup.setCompanyName(name);
				addSup.setEmail(email);
				addSup.setPhone(phone);
				addSup.setLogo(photo);
				try {
					sDao.insert(addSup);
					session.setAttribute("message", "Insert successfully");
				} catch (Exception e) {
					session.setAttribute("message", "Insert failed");
				}
			}
			resp.sendRedirect(this.getServletContext().getContextPath() + "/admin/supplier?command=view");
			break;
		case "update":
			String uid = req.getParameter("id");
			String uname = req.getParameter("name");
			String uemail = req.getParameter("email");
			String uphone = req.getParameter("phone");
			String uphoto = req.getParameter("photo");

			Supplier uSup = sDao.get(uid);
			if (uphoto == null) {
				uphoto = uSup.getLogo();
			}
			if (uSup == null) {
				session.setAttribute("message", uid + " does not exist");
			} else {
				uSup.setCompanyName(uname);
				uSup.setEmail(uemail);
				uSup.setPhone(uphone);
				uSup.setLogo(uphoto);
				try {
					sDao.update(uSup);
					session.setAttribute("message", "Update successfully");
				} catch (Exception e) {
					session.setAttribute("message", "Update failed");
				}
			}
			resp.sendRedirect(this.getServletContext().getContextPath() + "/admin/supplier?command=view");
			break;
		case "getsup":
			String gid = req.getParameter("id");
			Supplier gsup = sDao.get(gid);
			Gson json = new GsonBuilder().setPrettyPrinting().create();

			req.setCharacterEncoding("UTF-8");
			resp.getWriter().write(json.toJson(gsup));
			break;
		case "delete":
			try {
				String did = req.getParameter("id");
				Supplier entity = sDao.get(did);
				sDao.delete(entity);
				session.setAttribute("message", "Delete successfully");
			} catch (Exception e) {
				session.setAttribute("message", "Delete failed");
			}
			resp.sendRedirect(this.getServletContext().getContextPath() + "/admin/supplier?command=view");
			break;
		}
	}

	private void forward(HttpServletRequest req, HttpServletResponse resp, String view)
			throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/admin/layout.jsp").forward(req, resp);
	}
}
