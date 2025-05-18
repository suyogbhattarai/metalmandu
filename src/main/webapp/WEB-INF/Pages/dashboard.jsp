<%@ page import="java.util.List" %>
<%@ page import="com.MetalMandu.models.CategoryModel" %>
<%@ page import="com.MetalMandu.models.ProductModel" %>
<%@ page import="com.MetalMandu.models.UserModel" %>
<%@ page import="com.MetalMandu.models.BrandModel" %>
<%@ page import="java.util.List" %>
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
        
   <jsp:include page="dashboardHeader.jsp"/>


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
              <%
          // Use totalCategories instead of categoryCount to avoid duplicate variable
          int totalBrands = 0;
          if (request.getAttribute("brands") != null) {
            List<BrandModel> allBrands = (List<BrandModel>) request.getAttribute("brands");
            totalBrands = allBrands.size();
          }
        %>
        <h1><%= totalBrands %></h1>
                <span>Brands</span>
              </div>
              <div>
                <i class="fa fa-credit-card" aria-hidden="true"></i>
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
              <i class="fa fa-shopping-cart" aria-hidden="true"></i>
              </div>
            </div>
  
          </div>
  
          <div class="recent-grid">
            <div class="projects">
              <div class="card">
                <div class="card-header">
                  <h2>Products</h2>
                 <a href="${pageContext.request.contextPath}/products"><button> See All<i class="fa fa-arrow-right" style="margin-left:5px" aria-hidden="true"></i>  </button></a> 
                
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
                            <td data-label="Name"><%= product.getName() %></td>
                            <td data-label="Price"><%= product.getPrice() %></td>
                            <td data-label="Stock"><%= product.getStockQuantity() %></td>
                            <td data-label="Material"><%= product.getMaterial() %></td>
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
                 <a href="${pageContext.request.contextPath}/users"><button> See All<i class="fa fa-arrow-right" style="margin-left:5px" aria-hidden="true"></i>  </button></a> 
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
                       <a href="${pageContext.request.contextPath}/users"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> 

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

                          if ( categories != null) {
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
   <div class="projects">
            <div class="card">
              <div class="card-header">
                <h2>Brand</h2>
 
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table>
                
                      <thead>
                        <tr>
                          <th scope="col">Name</th>
                          <th scope="col">Country</th>
                      
                        </tr>
                      </thead>
                      <tbody>
                       <%
                          List<BrandModel> brands = (List<BrandModel>) request.getAttribute("brands");

                          if ( brands != null) {
                int brandCount = 0;
                    for (BrandModel brand : brands) {
          
                        	if (brandCount >= 7) break; // Only show 7 products per category
                            brandCount++;
                %>
                          <tr>
                            <td data-label="Account"><%= brand.getName() %></td>
                            <td data-label="Due Date"><%= brand.getOriginCountry() %></td>
                 
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
       
    </body>
</html>