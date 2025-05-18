<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="com.MetalMandu.models.CategoryModel" %>
<%@ page import="com.MetalMandu.models.ProductModel" %>
<%@ page import="com.MetalMandu.models.BrandModel" %>
<%@ page import="com.MetalMandu.models.ProductModel" %>
<%@ page import ="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import ="jakarta.servlet.http.HttpServletResponse" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/buy.css">
    
    
</head>
<body>
  <jsp:include page="header.jsp"/>
    <div class="container">
 <div class="product-container">
<%
    List<CategoryModel> categories = (List<CategoryModel>) request.getAttribute("categories");
    List<ProductModel> products = (List<ProductModel>) request.getAttribute("products");

    int productId = -1;
    try {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            productId = Integer.parseInt(idParam);
            System.out.println("Extracted product ID from parameter: " + productId);
        } else {
            System.out.println("Product ID parameter is missing.");
        }
    } catch (NumberFormatException e) {
        System.out.println("Invalid product ID format in parameter.");
    }

    if (categories != null && products != null) {
        for (ProductModel product : products) {
            if (product.getId() == productId) {
%>
    <div class="product-image">
        <img src="<%= request.getContextPath() %>/assets/metalmandu3/product/<%= product.getImage() %>" alt="Product Image">
    </div>
    <div class="product-details">
        <h1 class="product-title"><%= product.getName() %></h1>
        <div style="display: flex; align-items: center; margin-bottom: 10px;">
            <span class="rating">★★★★★</span>
            <span class="reviews">(150 reviews)</span>
            <span class="stock">In stock: <%= product.getStockQuantity() %></span>
        </div>
        <p class="price">Rs:<%= product.getPrice() %></p>
        <p class="description"><%= product.getDescription() %></p>
        <div class="divider"></div>
        <div class="colors"><p><strong>Colours:</strong> Black White</p></div>
        <div class="quantity-selector">
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="1" value="1">
        </div>
        <button class="btn" id="place-order-btn">Place Order</button>
    </div>
<%
            }
        }
    }
%>



 </div>
    
       
    </div>
    
    <!-- Order Modal -->
    <div class="modal" id="order-modal">
        <div class="modal-content">
            <h2 class="modal-title">Delivery Information</h2>
            <form id="delivery-form">
                <div class="form-group">
                    <label for="fullName">Full Name *</label>
                    <input type="text" id="fullName" name="fullName" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number *</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                <div class="form-group">
                    <label for="address">Address *</label>
                    <input type="text" id="address" name="address" required>
                </div>
                <div class="form-group">
                    <label for="city">City *</label>
                    <input type="text" id="city" name="city" required>
                </div>
                <div class="form-group">
                    <label for="state">State/Province *</label>
                    <input type="text" id="state" name="state" required>
                </div>
                <div class="form-group">
                    <label for="zipCode">Zip/Postal Code *</label>
                    <input type="text" id="zipCode" name="zipCode" required>
                </div>
                <div class="form-group">
                    <label>Delivery Method *</label>
                    <div class="delivery-method">
                        <input type="radio" id="cod" name="deliveryMethod" value="cash" checked disabled>
                        <label for="cod">Cash on Delivery</label>
                    </div>
                </div>
                <button type="submit" class="btn" id="confirm-btn" disabled>Confirm Order</button>
            </form>
        </div>
    </div>
    
    <!-- Success Message -->
    <div class="success-message" id="success-message">
        Your order has been placed successfully!
    </div>
    <jsp:include page="footer.jsp"/>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/buy.js"></script>
</body>
</html>