<%@ page import="java.util.List" %>
<%@ page import="com.MetalMandu.models.CategoryModel" %>
<%@ page import="com.MetalMandu.models.ProductModel" %>
<%@ page import="com.MetalMandu.models.UserModel" %>
<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--========== BOX ICONS ==========-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

        <!--========== CSS ==========-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/dashboard.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <title>Metal Mandu</title>
    </head>
    <body>
        <!--========== HEADER ==========-->
        <header class="header">
            <div class="header__container">
               
                <img  src="${pageContext.request.contextPath}/assets/metalmandu3/png/logo-no-background.png" class="header__logo" alt="">

    
                <div class="header__search">
                    <input type="search" placeholder="Search" class="header__input">
                    <i class='bx bx-search header__icon'></i>
                </div>
    
                <div class="header__toggle">
                    <i class='bx bx-menu' id="header-toggle"></i>
                </div>
            </div>
        </header>

        <!--========== NAV ==========-->
        <div class="nav" id="navbar">
            <nav class="nav__container">
                <div>
                    <a href="#" class="nav__link nav__logo">
                     
                        <i style="font-size: 20px; margin-right: 10px;margin-top: 5px; color: #2D336B   ;" class="fa fa-bars" aria-hidden="true"></i>
                        <img  class="nav__logo-name" src="${pageContext.request.contextPath}/assets/metalmandu3/png/logo-no-background.png" class="header__logo" alt="">
                    </a>
    
                    <div class="nav__list">
                        <div class="nav__items">
                            <h3 class="nav__subtitle">Profile</h3>
    
                            <a href="#" class="nav__link active">
                                <i class='bx bx-home nav__icon' ></i>
                                <span class="nav__name">Home</span>
                            </a>
                            
                            <div class="nav__dropdown">
                                <a href="#" class="nav__link">
                                    <i class='bx bx-user nav__icon' ></i>
                                    <span class="nav__name">Profile</span>
                                    <i class='bx bx-chevron-down nav__icon nav__dropdown-icon'></i>
                                </a>

                                <div class="nav__dropdown-collapse">
                                    <div class="nav__dropdown-content">
                                        <a href="#" class="nav__dropdown-item">Passwords</a>
                                    
                                        <a href="#" class="nav__dropdown-item">Accounts</a>
                                    </div>
                                </div>
                            </div>

                            <a href="#" class="nav__link">
                                <i class='bx bx-message-rounded nav__icon' ></i>
                                <span class="nav__name">Messages</span>
                            </a>
                        </div>
    
                        <div class="nav__items">
                            <h3 class="nav__subtitle">Menu</h3>
    
                            <div class="nav__dropdown">
                                <a href="#" class="nav__link">
                                   <i style="margin-right:6px;" class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    <span class="nav__name">Manage</span>
                                    <i class='bx bx-chevron-down nav__icon nav__dropdown-icon'></i>
                                </a>

                                <div class="nav__dropdown-collapse">
                                    <div class="nav__dropdown-content">
                                        <a href="#" class="nav__dropdown-item">Products</a>
                                        <a href="#" class="nav__dropdown-item">Categories</a>
                                        <a href="#" class="nav__dropdown-item">Brand</a>
                                        <a href="#" class="nav__dropdown-item">Users</a>
                                    </div>
                                </div>

                            </div>

                       
                       
                        </div>
                    </div>
                </div>

                <div  class="nav__link nav__logout">
                    <i class='bx bx-log-out nav__icon' ></i>
                   	<form class="logoutForm" action="${pageContext.request.contextPath}/logout" method="post">
							<input  type="submit" class="nav-button" value="Logout" />
						</form>
            
                </div>
            </nav>
        </div>

        <!--========== CONTENTS ==========-->

        
    



    <div class="main-content">


        <main>
          <div class="cards">
            <div class="card-single">
              <div>
                 <%
          // Use allUsers instead of users to avoid duplicate variable
          int customerCount = 0;
          if (request.getAttribute("users") != null) {
            List<UserModel> allUsers = (List<UserModel>) request.getAttribute("users");
            for (UserModel user : allUsers) {
              if (user != null && !user.isAdmin()) {
                customerCount++;
              }
            }
          }
        %>
        <h1> <%= customerCount %></h1>
       
                <span>Customers</span>
              </div>
              <div>
                <span><i class="fa fa-users" aria-hidden="true"></i></span>
              </div>
            </div>
            <div class="card-single">
              <div>
   <h1>
        <%
          // Use totalCategories instead of categoryCount to avoid duplicate variable
          int totalCategories = 0;
          if (request.getAttribute("categories") != null) {
            List<CategoryModel> allCategories = (List<CategoryModel>) request.getAttribute("categories");
            totalCategories = allCategories.size();
          }
        %>
        <%= totalCategories %>
      </h1>
                <span>Categories</span>
              </div>
              <div>
                <i class="fa fa-list-alt" aria-hidden="true"></i>
              </div>
            </div>
            <div class="card-single">
              <div>
                <h1>7</h1>
                <span>Brands</span>
              </div>
              <div>
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
              </div>
            </div>
            <div class="card-single">
              <div>
                <h1>
        <%
          int totalProducts = 0;
          if (request.getAttribute("products") != null) {
            List<ProductModel> allProducts = (List<ProductModel>) request.getAttribute("products");
            totalProducts = allProducts.size();
          }
        %>
        <%= totalProducts %>
      </h1>
                <span>Products</span>
              </div>
              <div>
                <i class="fa fa-credit-card" aria-hidden="true"></i>
              </div>
            </div>
  
          </div>
  
          <div class="recent-grid">
            <div class="projects">
              <div class="card">
                <div class="card-header">
                  <h2>Products</h2>
                  <button>See all <i class="fa fa-arrow-right" style="margin-left:5px" aria-hidden="true"></i>
                  </button>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table>
                  
                        <thead>
                          <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Material</th>
                          </tr>
                        </thead>
                        <tbody>
                          <%
                          List<ProductModel> products = (List<ProductModel>) request.getAttribute("products");

                          if ( products != null) {
                int productCount = 0;
                    for (ProductModel product : products) {
          
                        	if (productCount >= 7) break; // Only show 7 products per category
                            productCount++;
                %>
                          <tr>
                            <td data-label="Account"><%= product.getName() %></td>
                            <td data-label="Due Date"><%= product.getPrice() %></td>
                            <td data-label="Amount"><%= product.getStockQuantity() %></td>
                            <td data-label="Period"><%= product.getMaterial() %></td>
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
  
            </div>
            <div class="customers">
              <div class="card">
                <div class="card-header">
                    <h2>Customers</h2>
                    <button>See all <i class="fa fa-arrow-right" style="margin-left:5px" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="card-body">
                  <%
                          List<UserModel> users = (List<UserModel>) request.getAttribute("users");

                          if ( users != null) {
                int userCount = 0;
                    for (UserModel user : users) {
                    	 if (!user.isAdmin() ) {
                        	if (userCount >= 9) break; // Only show 7 products per category
                            userCount++;
                %>
                  <div class="customer">
                    <div class="info">
                     
                       <img  src="${pageContext.request.contextPath}/assets/user.png" height="40px" width="40px" alt="customer" />
                      <div>
                        <h4><%
    String firstName = user.getFirstName();
    String lastName = user.getLastName();
    if (firstName != null && lastName != null) {
  %>
    <%= firstName %> <%= lastName %>
  <%
    } else {
  %>
    <%= user.getUserName() %>
  <%
    }
  %></h4>
                        <small><%= user.getEmail() %></small>
                      </div>
                    </div>
                    <div class="contact">
                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>

	                      </div>
                  </div>
                              <%
                    }
                    }
                    }
                %>
              </div>
  
            </div>
         
            
          </div>  
          <div class="projects">
            <div class="card">
              <div class="card-header">
                <h2>Category</h2>
                <button>See all <i class="fa fa-arrow-right" style="margin-left:5px" aria-hidden="true"></i>
 </button>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table>
                
                      <thead>
                        <tr>
                          <th scope="col">Name</th>
                          <th scope="col">Description</th>
                      
                        </tr>
                      </thead>
                      <tbody>
                       <%
                          List<CategoryModel> categories = (List<CategoryModel>) request.getAttribute("categories");

                          if ( products != null) {
                int categoryCount = 0;
                    for (CategoryModel category : categories) {
          
                        	if (categoryCount >= 7) break; // Only show 7 products per category
                            categoryCount++;
                %>
                          <tr>
                            <td data-label="Account"><%= category.getName() %></td>
                            <td data-label="Due Date"><%= category.getDescription() %></td>
                 
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

          </div>

          
  
        </main>
      </div>
  
  
     

        <!--========== MAIN JS ==========-->
        <script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
    </body>
</html>