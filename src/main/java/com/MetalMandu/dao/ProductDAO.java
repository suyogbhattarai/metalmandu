


package com.MetalMandu.dao;

import com.MetalMandu.models.ProductModel;
import com.MetalMandu.config.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    /**
     * Retrieves the first n categories from the database
     * @param limit Maximum number of categories to retrieve
     * @return List of categories
     */
    public List<ProductModel> getAllProducts() {
        List<ProductModel> products = new ArrayList<>();
        String query = "SELECT * FROM products";
        
        try (Connection conn = DbConnection.getDbConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {	
            
           
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ProductModel product = new ProductModel();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setDescription(rs.getString("description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setStockQuantity(rs.getInt("stockQuantity"));
                    product.setMaterial(rs.getString("material"));
                    product.setDimensions(rs.getString("dimensions"));
                    product.setImage(rs.getString("image"));
                    product.setCategoryID(rs.getInt("category_id"));
                    product.setBrandID(rs.getInt("brand_id"));
                 
                  
                  
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Log the error or handle it appropriately
        }
        
        return products;
    }
}
