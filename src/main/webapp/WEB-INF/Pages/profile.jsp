<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    com.MetalMandu.models.UserModel user = (com.MetalMandu.models.UserModel) session.getAttribute("userDetails");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/profile.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>
  <jsp:include page="header.jsp"/>
    <div class="container-profile">
        <div class="profile-card">
            <!-- Tab navigation -->
            <div class="tab-header">
                <button class="tab-btn active-profile" data-tab="profile">Profile</button>
                <button class="tab-btn" data-tab="edit-profile">Edit Profile</button>
                <button class="tab-btn" data-tab="change-password">Change Password</button>
            </div>
            
            <!-- Tab content -->
            <div class="tab-content">
                <!-- Profile View -->
                <div class="tab-pane active-profile" id="profile">
                    <h2>Profile Details</h2>
                                      <% if (request.getAttribute("updateSuccess") != null) { %>
    <div class="success-message"><%= request.getAttribute("updateSuccess") %></div>
<% } %>
    <% if (request.getAttribute("passwordSuccess") != null) { %>
            <div class="success-message"><%= request.getAttribute("passwordSuccess") %></div>
            <ht/>
        <% } %>
                    <div class="profile-info">
                                           <div class="info-group">
    <span class="label">User Name:</span>
    <span class="value"><%= user.getUserName() %></span>
</div>
<div class="info-group">
    <span class="label">Email:</span>
    <span class="value"><%= user.getEmail() %></span>
</div>
                       <div class="info-group">
    <span class="label">First Name:</span>
    <span class="value"><%= user.getFirstName() %></span>
</div>
<div class="info-group">
    <span class="label">Last Name:</span>
    <span class="value"><%= user.getLastName() %></span>
</div>

<div class="info-group">
    <span class="label">Phone:</span>
    <span class="value"><%= user.getPhoneNumber() %></span>
</div>
<div class="info-group">
    <span class="label">Address:</span>
    <span class="value"><%= user.getAddress() %></span>
</div>

                    
                    </div>
                </div>
                
                <!-- Edit Profile Form -->
                <div class="tab-pane" id="edit-profile">
                    <h2>Edit Profile</h2>
   <% if (request.getAttribute("updateError") != null) { %>
    <div class="error-message"><%= request.getAttribute("updateError") %></div>
<% } %>
                    
                    <div class="edit-form">
                         <form id="profileForm" method="post" action="${pageContext.request.contextPath}/profile">
    <div class="form-row">
        <div class="form-group">
                    <% if (request.getAttribute("firstNameError") != null) { %>
    <div class="error-message"><%= request.getAttribute("firstNameError") %></div>
<% } %>
            <label for="firstName">First Name</label>

            <input type="text" id="firstName" name="firstName" value="<%= user.getFirstName() %>">
        </div>
        <div class="form-group">
                                <% if (request.getAttribute("lastNameError") != null) { %>
    <div class="error-message"><%= request.getAttribute("lastNameError") %></div>
<% } %>
            <label for="lastName">Last Name</label>

            <input type="text" id="lastName" name="lastName" value="<%= user.getLastName() %>">
        </div>
    </div>
    <div class="form-group">
                        <% if (request.getAttribute("emailError") != null) { %>
    <div class="error-message"><%= request.getAttribute("emailError") %></div>
<% } %>
        <label for="email">Email Address</label>

        <input type="email" id="email" name="email" value="<%= user.getEmail() %>">
    </div>
    <div class="form-group">
                        <% if (request.getAttribute("phoneError") != null) { %>
    <div class="error-message"><%= request.getAttribute("phoneError") %></div>
<% } %>
        <label for="phone">Phone Number</label>

        <input type="tel" id="phone" name="phone" value="<%= user.getPhoneNumber() %>">
    </div>
    <div class="form-group">
                        <% if (request.getAttribute("addressError") != null) { %>
    <div class="error-message"><%= request.getAttribute("addressError") %></div>
<% } %>
        <label for="address">Address</label>

        <textarea id="address" name="address" rows="3"><%= user.getAddress() %></textarea>
    </div>
    <div class="form-actions">
        <button type="submit" class="save-btn">Save</button>
    </div>
</form>
                         
                </div>
                </div>
                
                <!-- Change Password Form -->
                <div class="tab-pane" id="change-password">
                    <h2>Change Password</h2>
   <% if (request.getAttribute("passwordError") != null) { %>
            <div class="error-message"><%= request.getAttribute("passwordError") %></div> 
            <hr/>
        <% } %>

    
          <form action="${pageContext.request.contextPath}/changepassword" method="post" class="edit-form">
                    <div class="edit-form">
                        <div class="form-group">
       <% if (request.getAttribute("currentPasswordError") != null) { %>
            <div class="error-message"><%= request.getAttribute("currentPasswordError") %></div>
        <% } %>
                            <label for="currentPassword">Current Password</label>
                            <input required type="password" name="currentPassword" id="currentPassword" placeholder="Enter your current password">
                        </div>
                        <div class="form-group">
        <% if (request.getAttribute("newPasswordError") != null) { %>
            <div class="error-message"><%= request.getAttribute("newPasswordError") %></div>
        <% } %>
                            <label for="newPassword">New Password</label>
                            <input required type="password" name="newPassword" id="newPassword" placeholder="Enter your new password">
                        </div>
                        <div class="form-group">
                <% if (request.getAttribute("confirmPasswordError") != null) { %>
            <div class="error-message"><%= request.getAttribute("confirmPasswordError") %></div>
        <% } %>
                            <label for="confirmPassword">Confirm New Password</label>
                            <input required type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm your new password">
                        </div>
                        <div class="form-actions">
                            <button type="button" class="cancel-btn">Cancel</button>
                            <button type="submit" class="save-btn">Update Password</button>
                        </div>
                    </div>
          </form>
                    </div>
                </div>
            </div>
        </div>
        
  
    
 <jsp:include page="footer.jsp"/>	

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/profile.js">


</script>
</html>