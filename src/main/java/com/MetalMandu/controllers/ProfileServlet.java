package com.MetalMandu.controllers;

import com.MetalMandu.models.UserModel;
import com.MetalMandu.service.UpdateProfile;
import com.MetalMandu.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UpdateProfile updateProfileService = new UpdateProfile();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(request, response);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        boolean hasError = false;
        																																																																																		
        if ( !ValidationUtil.isAlphabetic(firstName)) {
            request.setAttribute("firstNameError", "First name should only have alphabetic letters");
            hasError = true;
        }

        if ( !ValidationUtil.isAlphabetic(lastName)) {
            request.setAttribute("lastNameError", "Last name should only have alphabetic letters");
            hasError = true;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("emailError", "Please enter a valid email address.");
            hasError = true;
        }

        if (!ValidationUtil.isValidPhoneNumber(phone)) {
            request.setAttribute("phoneError", "Phone number must start with 98 and be 10 digits.");
            hasError = true;
        }

        if (ValidationUtil.isNullOrEmpty(address)) {
            request.setAttribute("addressError", "Address cannot be empty.");
            hasError = true;
        }

        if (hasError) {
            request.setAttribute("formError", "Please correct the errors below.");
            request.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("userDetails");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Update user fields
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhoneNumber(phone);
        user.setAddress(address);

        boolean updated = updateProfileService.updateUserProfile(user);

        if (updated) {
            session.setAttribute("userDetails", user); // Refresh session user
            request.setAttribute("updateSuccess", "Profile updated successfully.");
        } else {
            request.setAttribute("formError", "Failed to update profile.");
        }

        request.getRequestDispatcher("/WEB-INF/Pages/profile.jsp").forward(request, response);
    }
}
