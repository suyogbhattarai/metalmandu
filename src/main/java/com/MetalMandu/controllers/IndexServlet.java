package com.MetalMandu.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class IndexServlet
 * Handles requests for the home page.
 */
@WebServlet(urlPatterns = {"/home", "/index", ""}) // Maps root, /home, /index
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IndexServlet() {
        super();
    }

	/**
	 * Displays the home page (index.jsp located directly under webapp).
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// CORRECT: Forward to the index.jsp page (directly under webapp)
		request.getRequestDispatcher("/WEB-INF/Pages/index.jsp").forward(request, response); // <--- Path is correct
	}

	/**
	 * Handles POST requests to the home page (if any), typically redirects to GET.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}