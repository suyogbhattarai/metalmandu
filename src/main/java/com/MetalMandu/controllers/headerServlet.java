package com.MetalMandu.controllers;

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

/**
 * Loads header data like categories, brands, products, and handles optional product search.
 */
@WebServlet("/header")
public class headerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CategoryService categoryService;
    private ProductService productService;
    private BrandService brandService;

    public headerServlet() {
        super();
        this.categoryService = new CategoryService();
        this.productService = new ProductService();
        this.brandService = new BrandService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch top categories and brands
        List<CategoryModel> categories = categoryService.getTopCategories();
        List<BrandModel> brands = brandService.getAllBrand();
        List<ProductModel> products = productService.getAllProducts();
        // Add to request attributes
        request.setAttribute("categories", categories);
        request.setAttribute("products", products);
        request.setAttribute("brands", brands);

        // Handle optional search query
        String searchQuery = request.getParameter("q");
        List<ProductModel> searchResults;

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            searchResults = productService.searchProducts(searchQuery.trim());
            request.setAttribute("searchResults", searchResults);
            request.setAttribute("searchQuery", searchQuery.trim());
        }

        // Forward to JSP for rendering
        request.getRequestDispatcher("/WEB-INF/Pages/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
