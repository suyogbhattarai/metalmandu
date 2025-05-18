package com.MetalMandu.service;

import com.MetalMandu.models.ProductModel;
import com.MetalMandu.config.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class updateProduct {

    public boolean updateProductDetails(ProductModel product) {
        String sql = "UPDATE products SET name = ?, description = ?, price = ?, stockQuantity = ?, material = ?,dimensions = ?, image = ?, category_id = ?,brand_id = ? WHERE id = ?";

        try (Connection conn = DbConnection.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set parameters
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setDouble(3, product.getPrice());
            stmt.setInt(4, product.getStockQuantity());
            stmt.setString(5, product.getMaterial());
            stmt.setString(6, product.getDimensions()); // Use ID for WHERE clause
            stmt.setString(7, product.getImage());
            stmt.setInt(8, product.getCategoryID());
            stmt.setInt(9, product.getBrandID());
            stmt.setInt(10, product.getId());
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

