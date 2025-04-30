package com.MetalMandu.service;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.SQLException;

import com.MetalMandu.config.DbConnection;
import com.MetalMandu.models.UserModel;

/**
 * RegisterService handles the registration of new students. It manages database
 * interactions for student registration.
 */
public class RegisterService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public RegisterService() {
		try {
			this.dbConn = DbConnection.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	/**
	 * Registers a new student in the database.
	 *
	 * @param UserModel the student details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	public Boolean addUser(UserModel UserModel) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}

		
		String insertQuery = "INSERT INTO user (user_name,email,password) "
				+ "VALUES (?, ?, ?)";

		try (
				PreparedStatement insertUser = dbConn.prepareStatement(insertQuery)) {

	

			// Insert student details
			insertUser.setString(1, UserModel.getUserName());
			insertUser.setString(2, UserModel.getEmail());
			insertUser.setString(3, UserModel.getPassword());
			

			return insertUser.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during User registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}
