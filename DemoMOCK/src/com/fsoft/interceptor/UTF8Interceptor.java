package com.fsoft.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(urlPatterns="/*")
public class UTF8Interceptor implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if(request.getCharacterEncoding() == null)
	    {
	        request.setCharacterEncoding("UTF-8");
	    }
		response.setCharacterEncoding("UTF-8");
	    chain.doFilter(request, response);
	}
}
