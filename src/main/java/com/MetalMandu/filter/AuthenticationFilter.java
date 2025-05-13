package com.MetalMandu.filter;



import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.MetalMandu.util.CookieUtil;
import com.MetalMandu.util.SessionUtil;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

	private static final String LOGIN = "/login";
	private static final String REGISTER = "/register";
	private static final String HOME = "/home";
	private static final String ROOT = "/";
	private static final String DASHBOARD = "/dashboard";
	private static final String CHANGEPASSWORD = "/changepassword";

	

	private static final String LOGOUT = "/logout";

	private static final String PROFILE = "/profile";
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// Initialization logic, if required
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		
		// Allow access to resources
		if (uri.endsWith(".png") || uri.endsWith(".jpg") ||uri.endsWith(".svg") || uri.endsWith(".webp") || uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith("")) {
			chain.doFilter(request, response);
			return;
		}
		
		boolean isLoggedIn = SessionUtil.getAttribute(req, "username") != null;
		String userRole = CookieUtil.getCookie(req, "role") != null ? CookieUtil.getCookie(req, "role").getValue()
				: null;

		if ("admin".equals(userRole)) {
			// Admin is logged in
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
				res.sendRedirect(req.getContextPath() + DASHBOARD);
				
			}
			
			if (uri.endsWith(LOGOUT) ) {
				chain.doFilter(request, response);
				
			}
			else if (uri.endsWith(PROFILE) ) {
				chain.doFilter(request, response);
				
			}
			else if (uri.endsWith(CHANGEPASSWORD) ) {
				chain.doFilter(request, response);
				
			}
			else if (uri.endsWith(DASHBOARD) ) {
				chain.doFilter(request, response);
			}  else {
				res.sendRedirect(req.getContextPath() + DASHBOARD);
			}
		} else if ("user".equals(userRole)) {
			// User is logged in
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
				res.sendRedirect(req.getContextPath() + HOME);
			}
			else if (uri.endsWith(LOGOUT) ) {
				chain.doFilter(request, response);
				
			}
			else if (uri.endsWith(PROFILE) ) {
				chain.doFilter(request, response);
				
			}
			else if (uri.endsWith(CHANGEPASSWORD) ) {
				chain.doFilter(request, response);
				
			}
			else if (uri.endsWith(LOGOUT) ) {
				res.sendRedirect(req.getContextPath() + REGISTER);
			}
			else if (uri.endsWith(HOME) || uri.endsWith(ROOT) ) {
				chain.doFilter(request, response);
			} else if (uri.endsWith(DASHBOARD) ) {
				res.sendRedirect(req.getContextPath() + HOME);
			} else {
				res.sendRedirect(req.getContextPath() + HOME);
			}
		} else {
			// Not logged in
			if (uri.endsWith(DASHBOARD)) {
				
				res.sendRedirect(req.getContextPath() + LOGIN);
			} 
			
			else if (uri.endsWith(LOGOUT) ) {
				chain.doFilter(request, response);
			}
			else if (uri.endsWith(CHANGEPASSWORD) ) {
				res.sendRedirect(req.getContextPath() + LOGIN);
				
			}
			
			else if (uri.endsWith(PROFILE) ) {
				res.sendRedirect(req.getContextPath() + LOGIN);
			}
			
	
			else  {
				chain.doFilter(request, response);
			}
		}
	}

	@Override
	public void destroy() {
		// Cleanup logic, if required
	}
}
