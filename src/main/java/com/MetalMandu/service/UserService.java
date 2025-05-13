package com.MetalMandu.service;

import com.MetalMandu.dao.UserDAO;
import com.MetalMandu.models.UserModel;
import java.util.List;

public class UserService {
    private UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    /**
     * Retrieves the first 7 categories from the database
     * @return List of up to 7 categories
     */
    public List<UserModel> getAllUsers( ) {
        return userDAO.getAllUsers();
    }
}