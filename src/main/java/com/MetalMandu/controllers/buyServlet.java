package com.MetalMandu.controllers;
import com.MetalMandu.service.BrandService;
import com.MetalMandu.service.CategoryService;
import com.MetalMandu.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.MetalMandu.models.BrandModel;
import com.MetalMandu.models.CategoryModel;
import com.MetalMandu.models.ProductModel;
import com.MetalMandu.service.BrandService;
import com.MetalMandu.service.CategoryService;
import com.MetalMandu.service.ProductService;
import com.MetalMandu.models.BrandModel;
import com.MetalMandu.models.CategoryModel;
import com.MetalMandu.models.ProductModel;
/**
 * Servlet implementation class buyServlet
 */
@WebServlet("/buy/*")
public class buyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private CategoryService categoryService;
	   private ProductService productService;
	   private BrandService brandService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buyServlet() {
        super();
        this.categoryService = new CategoryService();
        this.productService = new ProductService();
        this.brandService = new BrandService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 List<BrandModel> brands = brandService.getAllBrand();
		 request.setAttribute("brands", brands);
		List<CategoryModel> categories = categoryService.getTopCategories();
		 List<ProductModel> products = productService.getAllProducts();
		
		// Set categories as a request attribute
		request.setAttribute("categories", categories);
		 request.setAttribute("products", products);
		System.out.println("categories"+categories);
		System.out.println("prooducts"+products);
		request.getRequestDispatcher("/WEB-INF/Pages/buy.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
