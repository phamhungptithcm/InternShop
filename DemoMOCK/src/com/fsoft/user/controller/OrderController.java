package com.fsoft.user.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.collections.set.SynchronizedSortedSet;

import com.fsoft.helper.CartItem;
import com.fsoft.helper.CartService;
import com.fsoft.model.BillingInfo;
import com.fsoft.model.Customer;
import com.fsoft.model.Order;
import com.fsoft.model.OrderDetail;
import com.fsoft.service.OrderDAOImp;
import com.fsoft.service.OrderDetailDAOImp;
import com.fsoft.service.OrderStatusDAOImpl;
import com.fsoft.service.ProductDAOImp;

@WebServlet(urlPatterns = { "/order/bilinfo.php", "/order/revieworder.php", "/order/checkout.php" })
public class OrderController extends HttpServlet {
	OrderDAOImp oDao = new OrderDAOImp();
	OrderStatusDAOImpl osDao = new OrderStatusDAOImpl();
	ProductDAOImp pDao = new ProductDAOImp();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		HttpSession session = req.getSession();
		if (uri.contains("/order/bilinfo.php")) {
			session.setAttribute("backurl", this.getServletContext().getContextPath() + "/order/bilinfo.php");
			forward(req, resp, "order/billinginfo.jsp");
		} else if (uri.contains("/order/revieworder.php")) {
			forward(req, resp, "order/revieworder.jsp");
		} else if (uri.contains("/order/checkout.php")) {
			this.doPost(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		HttpSession session = req.getSession();
		if (uri.contains("/order/bilinfo.php")) {
			String email = req.getParameter("email");
			String fullname = req.getParameter("fullname");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String country = req.getParameter("country");
			Integer postCode = Integer.parseInt(req.getParameter("postcode"));
			BillingInfo model = new BillingInfo(email, fullname, address, phone, postCode, country);
			session.setAttribute("billinginfo", model);
			resp.sendRedirect(this.getServletContext().getContextPath() + "/order/revieworder.php");
			session.removeAttribute("messagefail");
		}
		else if(uri.contains("/order/checkout.php"))
		{
			BillingInfo billingInfo = (BillingInfo) session.getAttribute("billinginfo");
			CartService cartService = (CartService) session.getAttribute("cart");
			Customer user = (Customer) session.getAttribute("user");
			Order order = new Order();
			order.setAmount(cartService.getAmount());
			order.setOrderDate(new Date());
			order.setCustomer(user);
			order.setOrderStatus(osDao.get(1));
			order.setShipAddress(billingInfo.getAddress());
			order.setPostCode(billingInfo.getPostCode());
			try {
				oDao.purchase(order, cartService);
				req.setAttribute("message", "Order Successfully");
			} catch (Exception e) {
				req.setAttribute("message", "Order Failed");
			}
			forward(req, resp, "order/viewResult.jsp");
			session.removeAttribute("checkLogin");
		}
		else
		{
			this.doGet(req, resp);
		}
	}
	private void forward(HttpServletRequest req, HttpServletResponse resp, String view)
			throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);
	}
}
