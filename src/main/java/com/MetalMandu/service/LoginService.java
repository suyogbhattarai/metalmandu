package com.MetalMandu.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.MetalMandu.config.DbConnection;
import com.MetalMandu.models.UserModel;
import com.MetalMandu.util.PasswordUtil;

/**
 * Service class for handling login operations. Connects to the database,
 * verifies user credentials, and returns login status.
 */
public class LoginService {

	private Connection dbConn;
	private boolean isConnectionError = false;

	/**
	 * Constructor initializes the database connection. Sets the connection error
	 * flag if the connection fails.
	 */
	public LoginService() {
		try {
			dbConn = DbConnection.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	/**
	 * Validates the user credentials against the database records.
	 *
	 * @param studentModel the StudentModel object containing user credentials
	 * @return true if the user credentials are valid, false otherwise; null if a
	 *         connection error occurs
	 */
	public Boolean loginUser(UserModel UserModel) {
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}

		String query = "SELECT user_name, password,is_admin FROM user WHERE user_name = ?";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, UserModel.getUserName());
			ResultSet result = stmt.executeQuery();
			
			

			if (result.next()) {
				System.out.println("result data"+result.getBoolean("is_admin"));
				return validatePassword(result, UserModel);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("exception!");
			return null;
		}

		return false;
	}
	
	public Boolean adminStatus(UserModel UserModel) {
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}
		String query = "SELECT user_name,password,is_admin FROM user WHERE user_name = ?";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, UserModel.getUserName());
			ResultSet result = stmt.executeQuery();
			
			
			

			if (result.next()) {
				System.out.println("result data"+result.getBoolean("is_admin"));
				
				return result.getBoolean("is_admin");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		return null;
		
	}

	/**
	 * Validates the password retrieved from the database.
	 *
	 * @param result       the ResultSet containing the username and password from
	 *                     the database
	 * @param studentModel the StudentModel object containing user credentials
	 * @return true if the passwords match, false otherwise
	 * @throws SQLException if a database access error occurs
	 */
	private boolean validatePassword(ResultSet result, UserModel UserModel) throws SQLException {
		String dbUsername = result.getString("user_name");
		String dbPassword = result.getString("password");
		System.out.println(dbUsername);
		System.out.println(dbPassword);


		return dbUsername.equals(UserModel.getUserName())
				&& PasswordUtil.decrypt(dbPassword, dbUsername).equals(UserModel.getPassword());
	}
}
