package com.MetalMandu.controllers;

import com.MetalMandu.models.UserModel;
import com.MetalMandu.service.UpdateProfile;
import com.MetalMandu.util.PasswordUtil;
import com.MetalMandu.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/changepassword")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UpdateProfile updateService = new UpdateProfile();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	try {
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("userDetails");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        boolean hasError = false;

        // Decrypt and check current password
        String decryptedCurrent = PasswordUtil.decrypt(user.getPassword(), user.getUserName());
        if (decryptedCurrent == null || !decryptedCurrent.equals(currentPassword)) {
            request.setAttribute("currentPasswordError", "Incorrect current password.");
            hasError = true;
        }

        // New password validations
        if (!ValidationUtil.isValidPassword(newPassword)) {
            request.setAttribute("newPasswordError", "Password must be at least 8 characters long, include upper & lowercase letters, a digit, and a special character.");
            hasError = true;
        }

        if (newPassword == null || confirmPassword == null || !newPassword.equals(confirmPassword)) {
            request.setAttribute("confirmPasswordError", "Passwords do not match.");
            hasError = true;
        }

        if (hasError) {
            request.setAttribute("passwordError", "Please correct the errors below.");
            request.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(request, response);
            return;
        }

        // Encrypt and update
        String encryptedNew = PasswordUtil.encrypt(user.getUserName(), newPassword);
        user.setPassword(encryptedNew);

        boolean updated = updateService.updateUserPassword(user);

        if (updated) {
            session.setAttribute("userDetails", user);
            request.setAttribute("passwordSuccess", "Password changed successfully.");
        } else {
            request.setAttribute("passwordError", "Failed to update password.");
        }

        request.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(request, response);
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    }
}
