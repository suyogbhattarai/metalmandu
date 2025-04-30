package com.MetalMandu.controllers;

import java.io.IOException;
import java.time.LocalDate;


import com.MetalMandu.models.UserModel;
import com.MetalMandu.service.RegisterService;

import com.MetalMandu.util.PasswordUtil;
import com.MetalMandu.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * RegisterController handles user registration requests and processes form
 * submissions. It also manages file uploads and account creation.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private final RegisterService registerService = new RegisterService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/Pages/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Validate and extract student models
			String validationMessage = validateRegistrationForm(req);
			if (validationMessage != null) {
				handleError(req, resp, validationMessage);		
				return;
			}

			UserModel UserModel = extractUserModel(req);
			Boolean isAdded = registerService.addUser(UserModel);

			if (isAdded == null) {
				handleError(req, resp, "Our server is under maintenance. Please try again later!");
			} else if (isAdded) {
			
						handleSuccess(req, resp, "Your account is successfully created!", "/WEB-INF/Pages/login.jsp");
				
			} else {
				handleError(req, resp, "Could not register your account. Please try again later!");
			}
		} catch (Exception e) {
			handleError(req, resp, "An unexpected error occurred. Please try again later!");
			e.printStackTrace(); // Log the exception
		}
	}

	private String validateRegistrationForm(HttpServletRequest req) {
	
		String username = req.getParameter("username");

		String email = req.getParameter("email");

		String password = req.getParameter("password");
	

		// Check for null or empty fields first

		if (ValidationUtil.isNullOrEmpty(username))
			return "Username is required.";
		
	
		if (ValidationUtil.isNullOrEmpty(email))
			return "Email is required.";

		if (ValidationUtil.isNullOrEmpty(password))
			return "Password is required.";



	


		// Validate fields
		if (!ValidationUtil.isAlphanumericStartingWithLetter(username))
			return "Username must start with a letter and contain only letters and numbers.";
		
		if (!ValidationUtil.isValidEmail(email))
			return "Invalid email format.";
		
		if (!ValidationUtil.isValidPassword(password))
			return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";
	

		// Check if the date of birth is at least 16 years before today
	



		return null; // All validations passed
	}

	private UserModel extractUserModel(HttpServletRequest req) throws Exception {
	
		String username = req.getParameter("username");

		String email = req.getParameter("email");
	

		String password = req.getParameter("password");

		// Assuming password validation is already done in validateRegistrationForm
		password = PasswordUtil.encrypt(username, password);

	


		return new UserModel(username,email,password);
	}



	private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
			throws ServletException, IOException {
		req.setAttribute("success", message);
		req.getRequestDispatcher(redirectPage).forward(req, resp);
	}

	private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
			throws ServletException, IOException {
		req.setAttribute("error", message);
		
		req.setAttribute("username", req.getParameter("username"));
	
		req.setAttribute("email", req.getParameter("email")); 
		
		req.getRequestDispatcher("/WEB-INF/Pages/login.jsp").forward(req, resp);
	}
}