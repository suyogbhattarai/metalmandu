package com.MetalMandu.controllers;
import com.MetalMandu.service.CategoryService;
import com.MetalMandu.service.ProductService;
import com.MetalMandu.service.BrandService;
import com.MetalMandu.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MetalMandu.models.CategoryModel;
import com.MetalMandu.models.ProductModel;
import com.MetalMandu.models.UserModel;
import com.MetalMandu.models.BrandModel;
import java.util.List;/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private CategoryService categoryService;
	   private ProductService productService;
	   private UserService userService;
	   private BrandService brandService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
        super();
        this.categoryService = new CategoryService();
        this.productService = new ProductService();
        this.brandService = new BrandService();
        this.userService = new UserService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<CategoryModel> categories = categoryService.getTopCategories();
		 List<ProductModel> products = productService.getAllProducts();
		 List<BrandModel> brands = brandService.getAllBrand();
		 List<UserModel> users = userService.getAllUsers();
		 
			request.setAttribute("categories", categories);
			request.setAttribute("brands", brands);
			 request.setAttribute("products", products);
			 request.setAttribute("users", users);
			System.out.println("categories"+categories);
			System.out.println("brands"+brands);
			System.out.println("prooducts"+products);
   	 request.getRequestDispatcher("/WEB-INF/Pages/dashboard.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
