package com.MetalMandu.controllers;

import com.MetalMandu.service.BrandService;
import com.MetalMandu.service.CategoryService;
import com.MetalMandu.service.ProductService;
import com.MetalMandu.models.BrandModel;
import com.MetalMandu.models.CategoryModel;
import com.MetalMandu.models.ProductModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Servlet for handling product search operations
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService;
    
    public SearchServlet() {
        super();
        this.productService = new ProductService();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	  request.getRequestDispatcher("/WEB-INF/Pages/header.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	 try {
             String keyword = request.getParameter("q");
             System.out.println("Search keyword received: " + keyword);

             List<ProductModel> searchResults = 
                 (keyword != null && !keyword.trim().isEmpty()) ? 
                 productService.searchProducts(keyword) : 
                 List.of();

             request.setAttribute("searchResults", searchResults);
             System.out.println("Search results size: " + searchResults.size());

             request.getRequestDispatcher("/WEB-INF/Pages/header.jsp").forward(request, response);

         } catch (Exception e) {
             System.err.println("Error in SearchServlet: " + e.getMessage());
             e.printStackTrace();
             response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred during search.");
         }
        doGet(request, response);
    }
}
