


package com.MetalMandu.dao;

import com.MetalMandu.models.UserModel;
import com.MetalMandu.config.DbConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    /**
     * Retrieves the first n categories from the database
     * @param limit Maximum number of categories to retrieve
     * @return List of categories
     */
    public List<UserModel> getAllUsers() {
        List<UserModel> users = new ArrayList<>();
        String query = "SELECT * FROM user";
        
        try (Connection conn = DbConnection.getDbConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {	
            
           
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    UserModel user = new UserModel();
                    user.setId(rs.getInt("id"));
                    user.setUserName(rs.getString("user_name"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setAdmin(rs.getBoolean("is_admin"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setAddress(rs.getString("address"));
                    user.setPhoneNumber(rs.getString("phone_number"));
                    user.setActive(rs.getBoolean("is_active"));
                 
                  
                  
                    users.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Log the error or handle it appropriately
        }
        
        return users;
    }
}
