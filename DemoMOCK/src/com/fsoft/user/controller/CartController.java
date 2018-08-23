package com.fsoft.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fsoft.helper.CartItem;
import com.fsoft.helper.CartService;
import com.fsoft.model.Product;
import com.fsoft.service.ProductDAOImp;

@WebServlet(urlPatterns = { "/cart/add", "/cart/view" })
public class CartController extends HttpServlet {
	ProductDAOImp pDao = new ProductDAOImp();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("/cart/view")) {
			HttpSession session = req.getSession();
			session.setAttribute("backurl", this.getServletContext().getContextPath() + "/cart/view");
			forward(req, resp, "cart/giohang.jsp");
		} else {
			this.doPost(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("/cart/add")) {
			StringBuffer path = req.getRequestURL();
			HttpSession session = req.getSession();
			String command = req.getParameter("command");
			Integer id = Integer.parseInt(req.getParameter("id"));
			CartService cart = (CartService) session.getAttribute("cart");
			String backurl = (String) session.getAttribute("backurl");
			if (cart == null) {
				cart = new CartService();
				session.setAttribute("cart", cart);
			}
			try {
				Product p = pDao.get(id);
				CartItem item = new CartItem();
				switch (command) {
				case "plus":
					if (cart.getCartItems().containsKey(id)) {
						item = cart.getCartItems().get(id);
						cart.addToCart(id, item);
					} else {
						item.setId(p.getId());
						item.setName(p.getName());
						item.setImage(p.getImage());
						item.setDiscount(p.getDiscount());
						item.setUnitPrice(p.getUnitPrice());
						item.setQuantity(1);
						cart.addToCart(id, item);
					}
					break;
				case "update":
					Integer newQuantity = Integer.parseInt(req.getParameter("qty"));
					if (cart.getCartItems().containsKey(id)) {
						item = cart.getCartItems().get(id);
						cart.updateItem(id, newQuantity, item);
					}
					break;
				case "remove":
					cart.removeItem(id);
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.setAttribute("cart", cart);
			resp.sendRedirect(backurl);
		} else {
			this.doGet(req, resp);
			;
		}
	}

	private void forward(HttpServletRequest req, HttpServletResponse resp, String view)
			throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);
	}
}
