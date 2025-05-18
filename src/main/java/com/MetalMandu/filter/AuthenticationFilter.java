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
    private static final String PRODUCTS = "/products";
    private static final String UPDATEPRODUCT = "/update-product";
    private static final String USERS = "/users";
    private static final String HEADER = "/header";
    private static final String CHANGEPASSWORD = "/changepassword";

    private static final String DELETEPRODUCT = "/delete-product";
    private static final String BUY = "/buy"; // Changed to match the base path without wildcard
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
        String contextPath = req.getContextPath();
        
        // Remove context path from URI for proper matching
        if (contextPath != null && !contextPath.isEmpty()) {
            uri = uri.substring(contextPath.length());
            System.out.println("uri in uri"+uri);
           
        }
        
        // Allow access to resources
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css") || uri.endsWith(".svg") || uri.endsWith(".webp") || uri.endsWith(".js")) {
            chain.doFilter(request, response);
            return;
        }
        
        boolean isLoggedIn = SessionUtil.getAttribute(req, "username") != null;
        String userRole = CookieUtil.getCookie(req, "role") != null ? CookieUtil.getCookie(req, "role").getValue()
                : null;

        // Check if the URI starts with "/buy/" for buy with product ID
        boolean isBuyWithProductId = uri.startsWith(BUY + "/");

        if ("admin".equals(userRole)) {
            // Admin is logged in
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                res.sendRedirect(req.getContextPath() + DASHBOARD);
            } else if (uri.endsWith(DASHBOARD) || uri.endsWith(UPDATEPRODUCT) || uri.endsWith(CHANGEPASSWORD) 
                    || uri.endsWith(DELETEPRODUCT) || uri.endsWith(LOGOUT) || uri.endsWith(USERS) 
                    || uri.endsWith(PRODUCTS) || uri.endsWith(PROFILE) || uri.endsWith(HEADER)) {
                chain.doFilter(request, response);
            } else if (uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.equals(BUY) || isBuyWithProductId) {
                res.sendRedirect(req.getContextPath() + DASHBOARD);
            } else {
                res.sendRedirect(req.getContextPath() + DASHBOARD);
            }
        } else if ("user".equals(userRole)) {
            // User is logged in
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                res.sendRedirect(req.getContextPath() + HOME);
            } else if (uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(PROFILE) 
                    || uri.endsWith(CHANGEPASSWORD) || uri.endsWith(HEADER) || uri.endsWith(LOGOUT) 
                    || uri.equals(BUY) || isBuyWithProductId) {
                chain.doFilter(request, response);
            } else if (uri.endsWith(DASHBOARD) || uri.endsWith(PRODUCTS) || uri.endsWith(UPDATEPRODUCT) 
                    || uri.endsWith(CHANGEPASSWORD) || uri.endsWith(DELETEPRODUCT) || uri.endsWith(USERS)) {
                res.sendRedirect(req.getContextPath() + HOME);
            } else {
                res.sendRedirect(req.getContextPath() + HOME);
            }
        } else {
            // Not logged in
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(LOGOUT) || uri.endsWith(HEADER)) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(req.getContextPath() + LOGIN);
            }
        }
    }

    @Override
    public void destroy() {
        // Cleanup logic, if required
    }
}