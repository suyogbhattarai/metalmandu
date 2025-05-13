package com.MetalMandu.service;

import com.MetalMandu.models.UserModel;
import com.MetalMandu.config.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateProfile {

    public boolean updateUserProfile(UserModel user) {
        String sql = "UPDATE user SET first_name = ?, last_name = ?, email = ?, phone_number = ?, address = ? WHERE id = ?";

        try (Connection conn = DbConnection.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set parameters
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPhoneNumber());
            stmt.setString(5, user.getAddress());
            stmt.setInt(6, user.getId()); // Use ID for WHERE clause

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean updateUserPassword(UserModel user) {
        String sql = "UPDATE user SET password = ? WHERE id = ?";
        try (Connection conn =  DbConnection.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getPassword());
            stmt.setInt(2, user.getId());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
