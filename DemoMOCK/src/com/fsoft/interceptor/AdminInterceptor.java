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

@WebFilter(urlPatterns="/admin/*")
public class AdminInterceptor implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		String cpath = req.getContextPath();
		String reqAction = req.getRequestURI().replace(cpath, "");
		HttpSession session = req.getSession();
		
		Customer user = (Customer) session.getAttribute("user");
		if(user == null)
		{
			session.setAttribute("reqAction", reqAction);
			resp.sendRedirect(cpath+"/home/index.php");
			return;
		}
		else
		{
			if(user.getAdmin() == false)
			{
				session.setAttribute("reqAction", reqAction);
				resp.sendRedirect(cpath+"/home/index.php");
				return;
			}
			else {
				session.removeAttribute("checkAmin");
			}
		}
		chain.doFilter(request, response);
	}
}
