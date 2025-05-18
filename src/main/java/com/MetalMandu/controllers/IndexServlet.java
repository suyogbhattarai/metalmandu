package com.MetalMandu.controllers;
import com.MetalMandu.service.BrandService;
import com.MetalMandu.service.CategoryService;
import com.MetalMandu.service.ProductService;

import jakarta.servlet.ServletException;

import com.MetalMandu.models.BrandModel;
import com.MetalMandu.models.CategoryModel;
import com.MetalMandu.models.ProductModel;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class IndexServlet
 * Handles requests for the home page.
 */
@WebServlet(urlPatterns = {"/home", "/index", ""}) // Maps root, /home, /index
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private CategoryService categoryService;
	   private ProductService productService;
	   private BrandService brandService;
    public IndexServlet() {
        super();
        this.categoryService = new CategoryService();
        this.productService = new ProductService();
        this.brandService = new BrandService();
    }

	/**
	 * Displays the home page (index.jsp located directly under webapp).
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// CORRECT: Forward to the index.jsp page (directly under webapp)
		 List<BrandModel> brands = brandService.getAllBrand();
		 request.setAttribute("brands", brands);
		List<CategoryModel> categories = categoryService.getTopCategories();
		 List<ProductModel> products = productService.getAllProducts();
		
		// Set categories as a request attribute
		request.setAttribute("categories", categories);
		 request.setAttribute("products", products);
		System.out.println("categories"+categories);
		System.out.println("prooducts"+products);
		request.getRequestDispatcher("/WEB-INF/Pages/index.jsp").forward(request, response); // <--- Path is correct
	}

	/**
	 * Handles POST requests to the home page (if any), typically redirects to GET.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}