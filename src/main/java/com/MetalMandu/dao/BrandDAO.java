package com.MetalMandu.dao;

import com.MetalMandu.models.BrandModel;
import com.MetalMandu.config.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BrandDAO {
    /**
     * Retrieves the first n categories from the database
     * @param limit Maximum number of categories to retrieve
     * @return List of categories
     */
    public List<BrandModel> getAllBrand() {
        List<BrandModel> brands = new ArrayList<>();
        String query = "SELECT id, name, originCountry FROM brands ";
        
        try (Connection conn = DbConnection.getDbConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {	
            
          
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    BrandModel brand = new BrandModel(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("originCountry")
                    );
                    brands.add(brand);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Log the error or handle it appropriately
        }
        
        return brands;
    }
}