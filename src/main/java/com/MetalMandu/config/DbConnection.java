package com.MetalMandu.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DbConnection {

    // --- Database Credentials (Replace with your actual details) ---
    private static final String DB_URL = "jdbc:mysql://localhost:3306/metalmandu"; // Your DB URL
    private static final String DB_USER = "root";        // Your DB Username
    private static final String DB_PASSWORD = "";          // Your DB Password
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver"; // MySQL 8+ driver
    
	private static final String DB_NAME = "metalmandu";
	private static final String URL = "jdbc:mysql://localhost:3306/metalmandu";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";

	public static Connection getDbConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}
}