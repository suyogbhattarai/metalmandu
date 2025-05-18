package com.MetalMandu.controllers;

import com.MetalMandu.service.DeleteProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/delete-product")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final DeleteProductService deleteProductService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        this.deleteProductService = new DeleteProductService();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     * Handles the POST request to delete a product
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Extract product ID from request
            String productIdStr = req.getParameter("productId");
            
            if (productIdStr == null || productIdStr.trim().isEmpty()) {
                handleError(req, resp, "Product ID is required");
                return;
            }
            
            int productId;
            try {
                productId = Integer.parseInt(productIdStr);
            } catch (NumberFormatException e) {
                handleError(req, resp, "Invalid product ID format");
                return;
            }
            
            // Attempt to delete the product
            boolean isDeleted = deleteProductService.deleteProduct(productId);
            
            if (isDeleted) {
                // Product deleted successfully
                handleSuccess(req, resp, "Product deleted successfully");
            } else {
                // Failed to delete product
                handleError(req, resp, "Failed to delete product. Please try again later.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            handleError(req, resp, "An unexpected error occurred. Please try again later.");
        }
    }
    
    /**
     * Handle success response
     */
    private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message) 
            throws ServletException, IOException {
        req.setAttribute("successUpdate", message);
        resp.sendRedirect(req.getContextPath() + "/products");
    }
    
    /**
     * Handle error response
     */
    private void handleError(HttpServletRequest req, HttpServletResponse resp, String message) 
            throws ServletException, IOException {
        req.setAttribute("errorUpdate", message);
        resp.sendRedirect(req.getContextPath() + "/products");
    }
}