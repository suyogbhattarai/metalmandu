package com.MetalMandu.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
    // Database Credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/metalmandu";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    // Static block to register the JDBC driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ExceptionInInitializerError("MySQL JDBC Driver not found: " + e.getMessage());
        }
    }

    // Method to get database connection
    public static Connection getDbConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}