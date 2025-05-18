	package com.MetalMandu.service;
	import com.MetalMandu.models.ProductModel;
	import com.MetalMandu.dao.ProductDAO;
	import java.util.List;
	
	public class ProductService {
	    private ProductDAO productDAO;
	    
	    public ProductService() {
	        this.productDAO = new ProductDAO();
	    }
	    
	    public List<ProductModel> getAllProducts() {
	        return productDAO.getAllProducts();
	    }
	    
	    // Basic search by keyword
	    public List<ProductModel> searchProducts(String keyword) {
	        if (keyword == null || keyword.trim().isEmpty()) {
	            return getAllProducts(); // Return all products if no search term
	        }
	        return productDAO.searchProducts(keyword.trim());
	    }
	    
	    // Advanced search with multiple criteria
	    public List<ProductModel> advancedSearch(String keyword, Integer categoryId, Integer brandId, 
	                                           Double minPrice, Double maxPrice) {
	        return productDAO.advancedSearch(keyword, categoryId, brandId, minPrice, maxPrice);
	    }
	}