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
    // Existing method
    public List<ProductModel> getAllProducts() {
        List<ProductModel> products = new ArrayList<>();
        String query = "SELECT * FROM products";
        
        try (Connection conn = DbConnection.getDbConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {	
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    products.add(extractProductFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Log the error or handle it appropriately
        }
        
        return products;
    }
    
    // New method for searching products by keyword
    public List<ProductModel> searchProducts(String keyword) {
        List<ProductModel> products = new ArrayList<>();
        String query = "SELECT * FROM products WHERE name LIKE ? OR description LIKE ?";
        
        try (Connection conn = DbConnection.getDbConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            
            String searchTerm = "%" + keyword + "%";
            pstmt.setString(1, searchTerm);
            pstmt.setString(2, searchTerm);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    products.add(extractProductFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Log the error or handle it appropriately
        }
        
        return products;
    }
    
    // New method for advanced search with multiple criteria
    public List<ProductModel> advancedSearch(String keyword, Integer categoryId, Integer brandId, 
                                           Double minPrice, Double maxPrice) {
        List<ProductModel> products = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM products WHERE 1=1");
        List<Object> parameters = new ArrayList<>();
        
        // Add search conditions if parameters are provided
        if (keyword != null && !keyword.isEmpty()) {
            queryBuilder.append(" AND (name LIKE ? OR description LIKE ?)");
            String searchTerm = "%" + keyword + "%";
            parameters.add(searchTerm);
            parameters.add(searchTerm);
        }
        
        if (categoryId != null) {
            queryBuilder.append(" AND category_id = ?");
            parameters.add(categoryId);
        }
        
        if (brandId != null) {
            queryBuilder.append(" AND brand_id = ?");
            parameters.add(brandId);
        }
        
        if (minPrice != null) {
            queryBuilder.append(" AND price >= ?");
            parameters.add(minPrice);
        }
        
        if (maxPrice != null) {
            queryBuilder.append(" AND price <= ?");
            parameters.add(maxPrice);
        }

        try (Connection conn = DbConnection.getDbConnection();
             PreparedStatement pstmt = conn.prepareStatement(queryBuilder.toString())) {
            
            // Set parameters in the prepared statement
            for (int i = 0; i < parameters.size(); i++) {
                pstmt.setObject(i + 1, parameters.get(i));
            }
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    products.add(extractProductFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Log the error or handle it appropriately
        }
        
        return products;
    }
    
    // Helper method to extract product from ResultSet to avoid duplicated code
    private ProductModel extractProductFromResultSet(ResultSet rs) throws SQLException {
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
        return product;
    }
}