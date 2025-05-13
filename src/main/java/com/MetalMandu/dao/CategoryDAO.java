package com.MetalMandu.dao;

import com.MetalMandu.models.CategoryModel;
import com.MetalMandu.config.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    /**
     * Retrieves the first n categories from the database
     * @param limit Maximum number of categories to retrieve
     * @return List of categories
     */
    public List<CategoryModel> getTopCategories(int limit) {
        List<CategoryModel> categories = new ArrayList<>();
        String query = "SELECT id, name, description FROM categories LIMIT ?";
        
        try (Connection conn = DbConnection.getDbConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {	
            
            pstmt.setInt(1, limit);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    CategoryModel category = new CategoryModel(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description")
                    );
                    categories.add(category);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Log the error or handle it appropriately
        }
        
        return categories;
    }
}