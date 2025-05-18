<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="com.MetalMandu.models.UserModel" %>

<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/product.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">


<title>Insert title here</title>
</head>
<body>
   <jsp:include page="dashboardHeader.jsp"/>
    <div class="main-content">


        <main>
        
        <div class="projects">
              <div class="card">
                <div class="card-header">
                  <h2>Users</h2>

                  </button>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table>
                  
                        <thead>
                          <tr>
                           <th scope="col">S.N</th>
                            <th scope="col">User Name</th>
                            <th scope="col">Email</th>
                              <th scope="col"></th>
                            <th scope="col">Admin</th>
                            <th scope="col">First Name</th>
                             <th scope="col">Last Name</th>
                               <th scope="col">Address</th>
                           <th scope="col">Phone Number</th>
                          </tr>
                        </thead>
                        <tbody>
                          <%
                          List<UserModel> users = (List<UserModel>) request.getAttribute("users");

                          if ( users != null) {
                int userCount = 0;
                    for (UserModel user : users) {
                    	userCount++;
          
                        
                %>
                          <tr>
                           <td data-label="Account"><%= userCount %></td>
                            <td data-label="Account"><%= user.getUserName() %></td>
                           
                            <td 	 data-label="Due Date"><%= user.getEmail() %></td>
                                <td 	 data-label="Due Date"></td>
                            <td data-label="Amount"><%= user.isAdmin() %></td>
                            <td data-label="Period"><%= user.getFirstName() %></td>
                     <td data-label="Period"><%= user.getLastName() %></td>
                        <td data-label="Period"><%= user.getAddress() %></td>
                     <td data-label="Period"><%= user.getPhoneNumber() %></td>
        
                            
                          </tr>
                             <%
                    }
                    }
                %>
                         
                        </tbody>
                      </table>
                  </div>
                </div>
  
              </div>
              
  
        </main>
        </div>
        
<script type="text/javascript" src="${pageContext.request.contextPath}/js/products.js"></script>

</body>
</html>