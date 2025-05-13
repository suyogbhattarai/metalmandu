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
}
