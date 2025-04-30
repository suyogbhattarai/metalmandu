package com.MetalMandu.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MetalMandu.util.CookieUtil;
import com.MetalMandu.util.SessionUtil;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CookieUtil.deleteCookie(response, "role");
		SessionUtil.invalidateSession(request);
		response.sendRedirect(request.getContextPath() + "/login");
	}

}
