package com.MetalMandu.controllers;

import java.io.IOException;

import com.MetalMandu.models.UserModel;
import com.MetalMandu.service.LoginService;
import com.MetalMandu.util.CookieUtil;
import com.MetalMandu.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * LoginController is responsible for handling login requests. It interacts with
 * the LoginService to authenticate users.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final LoginService loginService;

	/**
	 * Constructor initializes the LoginService.
	 */
	public LoginServlet() {
		this.loginService = new LoginService();
	}

	/**
	 * Handles GET requests to the login page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/Pages/login.jsp").forward(request, response);
	}

	/**
	 * Handles POST requests for user login.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String username = req.getParameter("usernamelogin");
	    String password = req.getParameter("passwordlogin");

	    UserModel loginAttempt = new UserModel(username, password);
	    System.out.println("Attempting login for: " + loginAttempt.getUserName());

	    // Get full user details if credentials are valid
	    UserModel authenticatedUser = loginService.getAuthenticatedUserDetails(loginAttempt);

	    if (authenticatedUser != null) {
	        // Set user details and username in session
	        SessionUtil.setAttribute(req, "userDetails", authenticatedUser);
	        SessionUtil.setAttribute(req, "username", authenticatedUser.getUserName());

	        // Set role cookie and redirect
	        if (authenticatedUser.isAdmin()) {
	            CookieUtil.addCookie(resp, "role", "admin", 5 * 24 * 60 * 60);
	            resp.sendRedirect(req.getContextPath() + "/dashboard");
	        } else {
	            CookieUtil.addCookie(resp, "role", "user", 5 * 30);
	            resp.sendRedirect(req.getContextPath() + "/home");
	        }
	    } else {
	        handleLoginFailure(req, resp, false);  // false indicates invalid credentials
	    }
	}


	/**
	 * Handles login failures by setting attributes and forwarding to the login
	 * page.
	 *
	 * @param req         HttpServletRequest object
	 * @param resp        HttpServletResponse object
	 * @param loginStatus Boolean indicating the login status
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Our server is under maintenance. Please try again later!";
		} else {
			errorMessage = "User credential mismatch. Please try again!";
		}
		req.setAttribute("error", errorMessage);
		req.getRequestDispatcher("/WEB-INF/Pages/login.jsp").forward(req, resp);
	}

}