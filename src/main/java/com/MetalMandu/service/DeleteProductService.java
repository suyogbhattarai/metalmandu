
package com.MetalMandu.service;

import com.MetalMandu.config.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteProductService {
    /**
     * Deletes a product from the database by ID
     * 
     * @param productId The ID of the product to delete
     * @return true if deletion was successful, false otherwise
     */
    public boolean deleteProduct(int productId) {
        String sql = "DELETE FROM products WHERE id = ?";
        
        try (Connection conn = DbConnection.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            // Set parameter
            stmt.setInt(1, productId);
            
            // Execute the delete operation
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}