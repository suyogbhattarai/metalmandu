<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.MetalMandu.models.CategoryModel" %>
<%@ page import="com.MetalMandu.models.ProductModel" %>
<%@ page import="com.MetalMandu.models.UserModel" %>
<%@ page import="com.MetalMandu.models.BrandModel" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/product.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

<title>Products - Metal Mandu</title>
</head>
<body>
   <jsp:include page="dashboardHeader.jsp"/>
   <div class="main-content">
        <main>
        <div class="projects">
              <div class="card">
                <div class="card-header">
                  <h2>Products</h2>
                  
                  <!-- Success and Error Messages -->
                  <% if (request.getAttribute("successUpdate") != null) { %>
                    <div >
                        <p style="color:green; text-align: center;"><%= request.getAttribute("successUpdate") %></p>
                    </div>
                  <% } %>
                  
                  <% if (request.getAttribute("errorUpdate") != null) { %>
                    <div >
                        <p style="color:red; text-align: center;"><%= request.getAttribute("errorUpdate") %></p>
                    </div>
                  <% } %>
                  
                  <% if (request.getAttribute("success") != null) { %>
                    <div >
                        <p style="color:green; text-align: center;"><%= request.getAttribute("success") %></p>
                    </div>
                  <% } %>
                  
                  <% if (request.getAttribute("error") != null) { %>
                    <div c>
                        <p style="color:red; text-align: center;"><%= request.getAttribute("error") %></p>
                    </div>
                  <% } %>
                  
                  <button id="addProductBtn" class="add">
                    Add Product<i class="fa fa-plus-circle" aria-hidden="true"></i>
                  </button>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table>
                        <thead>
                          <tr>
                             <th scope="col"></th>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Material</th>
                            <th scope="col">Dimensions</th>
                            <th scope="col">Category</th>
                            <th scope="col">Brand</th>
                            <th scope="col">Update</th>
                            <th scope="col">Delete</th>
                          </tr>
                        </thead>
                        <tbody>
                          <%
                          List<ProductModel> products = (List<ProductModel>) request.getAttribute("products");
                          Map<Integer, String> categoryMap = (Map<Integer, String>) request.getAttribute("categoryMap");
                          Map<Integer, String> brandMap = (Map<Integer, String>) request.getAttribute("brandMap");
                          if (products != null) {
                            for (ProductModel product : products) {
                          %>
                          <tr>
                          <td ><img class="imageText" src="${pageContext.request.contextPath}/assets/metalmandu3/product/<%= product.getImage() %>" alt=""></img></td>
                            <td data-label="ID"><%= product.getId() %></td>
                            <td data-label="Name"><%= product.getName() %></td>
                            <td data-label="Price"><%= product.getPrice() %></td>
                            <td data-label="Stock"><%= product.getStockQuantity() %></td>
                            <td data-label="Material"><%= product.getMaterial() %></td>
                            <td data-label="Dimensions"><%= product.getDimensions() %></td>
                            <td data-label="Category"><%= categoryMap.get(product.getCategoryID()) %></td>
                            <td data-label="Brand"><%= brandMap.get(product.getBrandID()) %></td>
                            <td>
                              <button class="edit" data-id="<%= product.getId() %>">
                                Update <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                              </button>
                            </td>
                            <td>
                              <button class="delete" data-id="<%= product.getId() %>">
                                Delete <i class="fa fa-trash" aria-hidden="true"></i>
                              </button>
                              
                            </td>
                            
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
         <div id="productModal" class="modal">
    <div class="modal-content">
      <div class="modal-header">
        <h3 id="modalTitle">Add Product</h3>
        <span class="close">&times;</span>
      </div>

      <form method="post" action="${pageContext.request.contextPath}/update-product" id="productForm" enctype="multipart/form-data">
        <input type="hidden" id="productId" name="productId">
        <div class="form-group">
          <label for="name">Name</label>
          <input type="text" class="form-control" name="name" id="name" required>
          <div class="error-message" id="name-error">Please enter a product name</div>
        </div>
        <div class="form-group">
          <label for="price">Price</label>
          <input type="number" step="0.01" class="form-control" name="price" id="price" required>
          <div class="error-message" id="price-error">Please enter a valid price</div>	
        </div>
        <div class="form-group">
          <label for="stock">Stock Quantity</label>
          <input type="number" class="form-control" id="stock" name="stock" required>
          <div class="error-message" id="stock-error">Please enter a valid stock quantity</div>
        </div>
        <div class="form-group">
          <label for="material">Material</label>
          <input type="text" class="form-control" id="material" name="material" required>
          <div class="error-message" id="material-error">Please enter the material</div>
        </div>
        <div class="form-group">
          <label for="dimensions">Dimensions</label>
          <input type="text" class="form-control" id="dimensions" name="dimensions" required>
          <div class="error-message" id="dimensions-error">Please enter dimensions</div>
        </div>
        <div class="form-group">
        <label for="brand">Brand</label>
        <select class="form-control" id="brand" name="brand" required>
          <option value="">Select Brand</option>
           <%
              List<BrandModel> brands = (List<BrandModel>) request.getAttribute("brands");
              if (brands != null) {
                for (BrandModel brand : brands) {
           %>
          <option value="<%= brand.getName() %>"><%= brand.getName() %></option>
           <%
                }
              }
           %>
        </select>
        <div class="error-message" id="brand-error">Please select a brand</div>
      </div>

      <div class="form-group">
        <label for="category">Category</label>
        <select class="form-control" id="category" name="category" required>
          <option value="">Select Category</option>
           <%
              List<CategoryModel> categories = (List<CategoryModel>) request.getAttribute("categories");
              if (categories != null) {
                for (CategoryModel category : categories) {
           %>
          <option value="<%= category.getName() %>"><%= category.getName() %></option>
           <%
                }
              }
           %>
        </select>
        <div class="error-message" id="category-error">Please select a category</div>
      </div>

      <div class="form-group">
        <label for="image">Product Image</label>
        <input type="file" id="image" accept="image/*" name="image" style="display: none;">
        <input type="hidden" id="existingImage" name="existingImage">
        <label for="image" class="custom-file-upload">
          Choose Image
        </label>
        <div class="file-name" id="file-name">No file chosen</div>
        <div class="error-message" id="image-error">Please select an image</div>
        <div class="image-preview" id="image-preview">
          <span class="no-image">No image selected</span>
        </div>
      </div>
        <div class="form-group">
          <label for="description">Description</label> 
          <textarea class="form-control" id="description" required name="description" rows="3"></textarea>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" id="cancelBtn">Cancel</button>
          <button type="submit" class="btn btn-primary" id="saveBtn" >Save</button>
        </div>
      </form>
    </div>
  </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/products.js"></script>

</html>