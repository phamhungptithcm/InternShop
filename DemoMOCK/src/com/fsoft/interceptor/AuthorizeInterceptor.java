package com.fsoft.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fsoft.model.Customer;

@WebFilter(urlPatterns= {"/order/*","/account/change.php","/account/edit.php","/account/logout.php"})
public class AuthorizeInterceptor implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("da vao");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String cpath = req.getContextPath();
		String reqAction = req.getRequestURI().replace(cpath, "");
		HttpSession session = req.getSession();
		Customer user = (Customer) session.getAttribute("user");
		if(user == null)
		{
			session.setAttribute("reqAction", reqAction);
			session.setAttribute("checkLogin", "fail");
			resp.sendRedirect(cpath+"/cart/view");
			return;
		}
		else
		{
			chain.doFilter(request, response);
		}
	}
	private void forward(HttpServletRequest req, HttpServletResponse resp, String view)
			throws ServletException, IOException {
		req.setAttribute("view", view);
		req.getRequestDispatcher("/WEB-INF/views/user/layout.jsp").forward(req, resp);
	}
}
