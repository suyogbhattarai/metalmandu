
<%@ page import="com.MetalMandu.models.CategoryModel" %>
<%@ page import="com.MetalMandu.models.ProductModel" %>
<%@ page import="com.MetalMandu.models.BrandModel" %>
<%@ page import="java.util.List" %>
<%@ page import="com.MetalMandu.models.ProductModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
 <header class="header-default">
        <div class="container">
            <div class="header-row">
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/home">
                        <img  src="${pageContext.request.contextPath}/assets/metalmandu3/png/logo-no-background.png" alt="">
                         <!-- <p>Metal Steel Works Nepal</p> -->
                    </a>

                </div>
                <div class="nav">
                    <ul class="nav-list">
         
                        <li class="nav_item "><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
                        <li class="nav_item_has_children nav_item">
                            <a class="nav-link scroll-down ">New <i class="fa fa-caret-down" aria-hidden="true"></i></a>
                            <ul class="sub-menu multi-column-menu">
                                <div class="col-1">
                                    <div>
                                        <h2 style="color: #2D336B; display: flex;gap: 5px;">Featured <span><img
                                                    style="width: 30px;" src="${pageContext.request.contextPath}/assets/icons/bonfire.png"
                                                    alt=""></span></h2>
                                    </div>

 <%
 List<CategoryModel> categories = (List<CategoryModel>) request.getAttribute("categories");

   
                          if ( categories != null) {
                int categoryCount = 0;
                    for (CategoryModel category : categories) {
                    	 if (categoryCount <= 1 && categoryCount <= 4  ) {
                    
                    	if (categoryCount == 4) break; // Only show 7 products per category
                        categoryCount++;
          
                        
                %>
                                    <li class="scroll-down"><a><%= category.getName() %></a></li>
                                                         <%
                    }
                    }
                    }
                %>
                                <div class="col-2">
                                    <div>
                                        <h2 style="color: #2D336B; display: flex;gap: 5px;">Most Sold<span style=""><img
                                                    style="width: 30px;" src="${pageContext.request.contextPath}/assets/icons/shopping.png"
                                                    alt=""></span></h2>
                                    </div>
                                  <%

   
                          if ( categories != null) {
                int categoryCount = 3;
                    for (CategoryModel category : categories) {
                    	 if (categoryCount <= 4 && categoryCount <= 5  ) {
                    
                    	if (categoryCount == 5) break; // Only show 7 products per category
                        categoryCount++;
          
                        
                %>
                                    <li class="scroll-down"><a><%= category.getName() %></a></li>
                                                         <%
                    }
                    }
                    }
                %>
                                </div>
                                <div class="col-3">
                                    <div>
                                        <h2 style="color: #2D336B; display: flex;gap: 5px;">Most Affordable <span
                                                style=""><img style="width: 30px;" src="${pageContext.request.contextPath}/assets/icons/cheap.png"
                                                    alt=""></span></h2>
                                    </div>
                                   <%

   
                          if ( categories != null) {
                int categoryCount = 0;
                    for (CategoryModel category : categories) {
                    	 if (categoryCount <= 6 && categoryCount <= 7  ) {
                    
                    	if (categoryCount == 4) break; // Only show 7 products per category
                        categoryCount++;
          
                        
                %>
                                    <li class="scroll-down"><a><%= category.getName() %></a></li>
                                                         <%
                    }
                    }
                    }
                %>
                            
                                </div>






                            </ul>
                        </li>

                        <li class="nav_item_has_children">
                            <a class="scroll-down nav-link" >Brand <i class="fa fa-caret-down" aria-hidden="true"></i></a>

                            <ul class="sub-menu single-column-menu">
               <%
                          List<BrandModel> brands = (List<BrandModel>) request.getAttribute("brands");

                          if ( brands != null) {
                int brandCount = 0;
                    for (BrandModel brand : brands) {
          
                        	if (brandCount >= 7) break; // Only show 7 products per category
                            brandCount++;
                %>
                                <li><a class="scroll-down"><%= brand.getName() %></a></li>

                                          <%
                    }
                    }
                %>
                          
                            </ul>
                        </li>
       
                        <li class="nav_item"><a href="./Aboutus.html" class="nav-link">About Us</a></li>
                    </ul>
                    </ul>


                </div>
                <div class="icons">
                <form class="search-bar" action="${pageContext.request.contextPath}/header" method="get">
                
    <input type="text" name="q" placeholder="Search..." />
   <i class="fa fa-search" aria-hidden="true"></i>
</form>


<% 
    String userName = (String) session.getAttribute("username");
%>

<% if (userName != null) { %>
     <div class="action">
     <p  class="username">Hi! <%=   userName %></p>
      <div class="profile" onclick="menuToggle();">
        <img  src="${pageContext.request.contextPath}/assets/user.png" />
      </div>
      <div class="menu">
        <h3><br /><span></span></h3>
        <ul>
          <li>
            <img src="${pageContext.request.contextPath}/assets/user.png" /><a href="${pageContext.request.contextPath}/profile"><p > <%=userName %></p></a>
          </li>
          <li>
            <img src="${pageContext.request.contextPath}/assets/edit.svg" /><a href="${pageContext.request.contextPath}/profile">Edit profile</a>
          </li>

          <li>
       	<form class="logoutForm" action="${pageContext.request.contextPath}/logout" method="post">
							<input type="submit" class="nav-button" value="Logout" />
						</form>
          </li>
        </ul>
      </div>
    </div>
<% } else { %>
    <a style="display: flex; align-items: center; gap: 6px;" class="login" href="${pageContext.request.contextPath}/register">
        <i style="font-style:normal; font-size: 17px;">Login</i>
        <span><i class="fa fa-sign-in" aria-hidden="true"></i></span>
    </a>
<% } %>
                    
                    
                    
                </div>

                <div class="hamburger">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
                
            

         




            </div>
        </div>
      
        <div class="search-slide-down">
            Search:
            <i class="fa fa-search" aria-hidden="true"></i>
   <form action="${pageContext.request.contextPath}/header" method="get">
    <input type="text" class="input" name="q" placeholder="Search..." />
    <button type="submit">Search</button>
    <br>
             <%
    List<ProductModel> searchResults = (List<ProductModel>) request.getAttribute("searchResults");
    String searchQuery = (String) request.getAttribute("searchQuery");
    if (searchQuery != null && !searchQuery.isEmpty()) {
%>
    <h3>Search Results for "<%= searchQuery %>":</h3>
    <% if (searchResults != null && !searchResults.isEmpty()) {
        for (ProductModel product : searchResults) { %>
            <div class="search-result-item">
                <p><strong><%= product.getName() %></strong></p>
                <p><%= product.getDescription() %></p>
                <p>Price: $<%= product.getPrice() %></p>
            </div>
    <%  }
       } else { %>
        <p>No products found for "<%= searchQuery %>".</p>
    <% } %>
<% } %>
</form>
    <br>
    
  
             
   



        
 
        </div>
         <div class="search-drop-down" id="searchDropDown"
     style="position: relative; padding-bottom: 8px; <%= (searchQuery != null && !searchQuery.isEmpty()) ? "display: block;" : "display: none;" %>">

    <button onclick="document.getElementById('searchDropDown').style.display='none'"
            style="position: fixed; top: 80px; right: 60px; background: transparent; border: none; font-size: 50px; cursor: pointer;">
        &times;
    </button>

    <%
    if (searchQuery != null && !searchQuery.isEmpty()) {
    %>
        <div class="container">
            <h3 style="font-size: 25px; margin-bottom: 20px; color: #2D336B;">
                Search Results for "<%= searchQuery %>":
            </h3>
        </div>
        <% if (searchResults != null && !searchResults.isEmpty()) {
            for (ProductModel product : searchResults) { %>
                <div class="container">
                    <div style="padding: 12px; border-bottom: 1px solid #eee;overflow-y:auto; margin-bottom: 8px;display:flex; gap:50px;align-items:center;">
                                        <img style="max-width:50px;" src="${pageContext.request.contextPath}/assets/metalmandu3/product/<%= product.getImage() %>" alt="">
                    
                        <p style="margin: 0; font-size: 14px; color: #444;">
                           <a style="margin: 0; font-size: 14px; color: #444; cursor:pointer;"  href="${pageContext.request.contextPath}/buy/?id=<%= product.getId() %>"><strong><%= product.getName() %></strong></a> 
                           <br>
                           Price:<%= product.getPrice() %>
                           <br>
                           Description:<%= product.getDescription() %>
                                                   <br>
                        <a style="margin: 0; font-size: 14px;text-decoration:underline; color: #444; cursor:pointer;"  href="${pageContext.request.contextPath}/buy/?id=<%= product.getId() %>">View Product</a>
                        </p>

                        
                    </div>
                </div>
        <%  }
        } else { %>
            <div class="container">
                <p style="font-size: 16px;margin-bottom: 20px; color: #666;">No products found for "<%= searchQuery %>".</p>
            </div>
        <% } %>
    <% } %>

</div>

        
      

    </header>
   
    <div class="side-menu">
        <div class="cross">
            <i class="fa fa-times" aria-hidden="true"></i>
        </div>

        <div class="nav">
            <ul class="nav-list">
                <li class=" nav_item_has_children nav_item "><a href="${pageContext.request.contextPath}/index.html" class="nav-link"> Home</a></li>
             
         
                <li class="nav_item_has_children nav_item">  <a class="nav-link scroll-down"> New <i class="fa fa-caret-down" aria-hidden="true"></i></a>
                  
                    <ul class="sub-menu single-column-menu">
                        <li><a class="scroll-down">Featured</a></li>
                        <li><a class="scroll-down">Most Sold </a></li>
                        <li><a class="scroll-down">Most Affordable</a></li>
                      
                    </ul>
                </li>

                <li class="nav_item_has_children">
                    <a  class="nav-link scroll-down">Category <i class="fa fa-caret-down" aria-hidden="true"></i></a>

                    <ul class="sub-menu single-column-menu">
                        <li><a ></a></li>
                        <li><a >Furniture</a></li>
                        <li><a >Outdoor</a></li>
                        <li><a >Office</a></li>
                        <li><a>Construction</a></li>
                        <li><a>Finishes</a></li>
                         <li><a>Decor</a></li>
                    </ul>
                </li>
         
                <li class="nav_item"><a href="./Aboutus.html" class="nav-link">About Us</a></li>
            </ul>
            </ul>


        </div>

    </div>

</body>

</html>