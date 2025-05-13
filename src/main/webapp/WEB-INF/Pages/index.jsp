
<%@ page import="java.util.List" %>
<%@ page import="com.MetalMandu.models.CategoryModel" %>
<%@ page import="com.MetalMandu.models.ProductModel" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Metal Mandu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="to-top-btn">
        <i class="fa fa-angle-double-up" aria-hidden="true"></i>
        <p style="font-size: 15px;">Top</p>
    </div>
    <jsp:include page="header.jsp"/>
    <div class="container">
        <section class="banner">
<ul class="mega-menu">
    <h3 style="text-align: center; margin-bottom: 10px;">Quick <span style="color: #2D336B;">Browse</span></h3>

    <%
        List<CategoryModel> categories = (List<CategoryModel>) request.getAttribute("categories");
        List<ProductModel> products = (List<ProductModel>) request.getAttribute("products");

        if (categories != null && products != null) {
            for (CategoryModel category : categories) {
    %>
        <li class="mega-item-has-children">
            <a class="scroll-down"><%= category.getName() %> <span>></span></a>
            <ul class="mega-sub-menu mega-single-column">
                <h3 style="text-align: center; margin-bottom: 10px;">Our <span style="color: #2D336B;">Products</span></h3>
                <%
                int productCount = 0;
                    for (ProductModel product : products) {
                        if (product.getCategoryID() == category.getId()) {
                        	if (productCount >= 7) break; // Only show 7 products per category
                            productCount++;
                %>
                    <li class="mega-item-has-children-2">
                        <a class="scroll-down"><%= product.getName() %> <span>></span></a>
                        <div class="mega-sub-menu-2 mega-multi-column">
                            <div class="product-image">
                                <img src="<%= request.getContextPath() %>/assets/metalmandu3/product/<%= product.getImage() %>" alt="">
                            </div>
                            <div class="product-desc">
                                <h2 style="color: #2D336B;"><%= product.getName() %></h2>
                                <p><span style="color: #2D336B;">Price:</span> Rs.<%= product.getPrice() %></p>
                                <p><span style="color: #2D336B;">Description:</span> <%= product.getDescription() %></p>
                            </div>
                        </div>
                    </li>
                <%
                        }
                    }
                %>
            </ul>
        </li>
    <%
            }
        }
    %>
</ul>


            <div class="slide-container">
	
                <div class="slides">
                    <img id="img-slide" src="${pageContext.request.contextPath}/assets/metalmandu3/carousel/image-1.jpg" class="active">
                    <img id="img-slide" src="${pageContext.request.contextPath}/assets/metalmandu3/carousel/image-2.jpg">
                    <img id="img-slide" src="${pageContext.request.contextPath}/assets/metalmandu3/carousel/image-3.jpg">
                    <img id="img-slide" src="${pageContext.request.contextPath}/assets/metalmandu3/carousel/image-4.jpg">
                    <img id="img-slide" src="${pageContext.request.contextPath}/assets/metalmandu3/carousel/image-5.jpg">
                </div>
            
                <div class="buttons">
                    <span class="next">&#10095;</span>
                    <span class="prev">&#10094;</span>
                </div>
            
                <div class="dotsContainer">
                    <div class="dot active" attr='0' onclick="switchImage(this)"></div>
                    <div class="dot" attr='1' onclick="switchImage(this)"></div>
                    <div class="dot" attr='2' onclick="switchImage(this)"></div>
                    <div class="dot" attr='3' onclick="switchImage(this)"></div>
                    <div class="dot" attr='4' onclick="switchImage(this)"></div>
                </div>
            
            </div>

        </section>
        <!-- <section class="todays-section">

            <h1 class="title">This month</h1>
            <div id="type">
                <p class="topic" >Best Selling Products</p>
                <a class="btn scroll-down " >View All</a>
            </div>





            <div class="products-row">
                <div class="product-box">
                    <img src="${pageContext.request.contextPath}/assets/printer3.png" alt="">
                    <p class="product-title" style="margin: 10px 0px;font-size: 20px;font-weight: 500;">HP OfficeJet Pro
                        9015</p>
                    <p style="margin: 15px 0px;font-size: 17px;font-weight: 500;display: flex;align-items: center;">
                        <span style="font-weight: 350;;color: #2D336B;font-size: 20px;">Rs:70000</span><span
                            style="font-weight: 350;font-size: 15px;text-decoration: line-through;margin-left: 5px; color: black;">Rs:80000</span>
                    </p>
                    <div style="margin: 15px 0px;" class="rating">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>

                    </div>
                    <div class="icons">
                        <i class="fa fa-eye" aria-hidden="true"></i>
                        <i class="fa fa-heart-o" aria-hidden="true"></i>
                    </div>
                    <div class="off">
                        5%off
                    </div>
                    <a href="./productDetail.html" class="buy-btn">
                        <span style="display: flex;justify-content: center;">Buy Now</span>
                    </a>
                </div>
                <div class="product-box">
                    <img src="${pageContext.request.contextPath}/assets/printer7.png" alt="">
                    <p class="product-title" style="margin: 10px 0px;font-size: 20px;font-weight: 500;">Epson EcoTank
                        ET-4760</p>
                    <p style="margin: 15px 0px;font-size: 17px;font-weight: 500;display: flex;align-items: center;">
                        <span style="font-weight: 350;;color:#2D336B;font-size: 20px;">Rs:40000</span><span
                            style="font-weight: 350;font-size: 15px;text-decoration: line-through;margin-left: 5px; color: black;">Rs.50000</span>
                    </p>
                    <div style="margin: 15px 0px;" class="rating">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>

                    </div>
                    <div class="icons">
                        <i class="fa fa-eye" aria-hidden="true"></i>
                        <i class="fa fa-heart-o" aria-hidden="true"></i>
                    </div>
                    <div class="off">
                        10%off
                    </div>
                    <a href="./productDetail.html" class="buy-btn">
                        <span style="display: flex;justify-content: center;">Buy Now</span>
                    </a>
                </div>
                <div class="product-box">
                    <img src="${pageContext.request.contextPath}/assets/priter4.jpg" alt="">
                    <p class="product-title" style="margin: 10px 0px;font-size: 20px;font-weight: 500;">
                        Canon PIXMA series</p>
                    <p style="margin: 15px 0px;font-size: 17px;font-weight: 500;display: flex;align-items: center;">
                        <span style="font-weight: 350;;color:#2D336B;font-size: 20px;">Rs:30000</span><span
                            style="font-weight: 350;font-size: 15px;text-decoration: line-through;margin-left: 5px; color: black;">Rs:40000</span>
                    </p>
                    <div style="margin: 15px 0px;" class="rating">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        

                    </div>
                    <div class="icons">
                        <i class="fa fa-eye" aria-hidden="true"></i>
                        <i class="fa fa-heart-o" aria-hidden="true"></i>
                    </div>
                    <div class="off">
                        20%off
                    </div>
                    <a href="./productDetail.html" class="buy-btn">
                        <span style="display: flex;justify-content: center;">Buy Now</span>
                    </a>
                </div>
                <div class="product-box">
                    <img src="${pageContext.request.contextPath}/assets/printer3.png" alt="">
                    <p class="product-title" style="margin: 10px 0px;font-size: 20px;font-weight: 500;">HP OfficeJet Pro
                        9015</p>
                    <p style="margin: 15px 0px;font-size: 17px;font-weight: 500;display: flex;align-items: center;">
                        <span style="font-weight: 350;;color: #2D336B;font-size: 20px;">Rs:10000</span><span
                            style="font-weight: 350;font-size: 15px;text-decoration: line-through;margin-left: 5px; color: black;">Rs:120000</span>
                    </p>
                    <div style="margin: 15px 0px;" class="rating">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>

                    </div>
                    <div class="icons">
                        <i class="fa fa-eye" aria-hidden="true"></i>
                        <i class="fa fa-heart-o" aria-hidden="true"></i>
                    </div>
                    <div class="off">
                        5%off
                    </div>
                    <a href="./productDetail.html" class="buy-btn">
                        <span style="display: flex;justify-content: center;">Buy Now</span>
                    </a>
                </div>
            </div>
        </section> -->
    	<header class=".product-slide-header">
            <section class="todays-section">
                <h1 class="title">This month</h1>
                <div id="type">
                    <p class="topic" >Best Selling Products</p>
                    <div class="controls">
                        <p>
                           

                        </p>
                        <a class="btn scroll-down " >View All</a>
                    </div>
                  
                 
                </div>
           
            </section>
      
		
		</header>
		<section class="products-slider">
            <span class="left">&#10094;</span>
            <span class="right">&#10095;</span>
			<!-- <div class="product">

				<picture>
					<img src="image/banner2.png" alt="">
				</picture>
				<p class="product-title" style="margin: 10px 0px;font-size: 20px;font-weight: 500;">HP OfficeJet Pro
                    9015</p>
                <p style="margin: 15px 0px;font-size: 17px;font-weight: 500;display: flex;align-items: center;">
                    <span style="font-weight: 350;;color: #2D336B;font-size: 20px;">Rs:10000</span><span
                        style="font-weight: 350;font-size: 15px;text-decoration: line-through;margin-left: 5px; color: black;">Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    5%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
			</div>
			<div class="product">
				<picture>
					<img src="image/banner1.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Two</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div>
			<div class="product">
				<picture>
					<img src="image/banner3.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Three</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div>
			<div class="product">
				<picture>
					<img src="image/banner4.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Four</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div>
			<div class="product">
				<picture>
					<img src="image/watch.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Five</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div>
			<div class="product">
				<picture>
					<img src="image/delta.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Six</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div>
			<div class="product">
				<picture>
					<img src="image/image3.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Seven</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div>
			<div class="product">
				<picture>
					<img src="image/image2.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Eight</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div>
			<div class="product">
				<picture>
					<img src="image/nokia.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Nine</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div>
			<div class="product">
				<picture>
					<img src="image/nokia-air.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Ten</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div>
			<div class="product">
				<picture>
					<img src="image/feature_3.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Eleven</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div>
			<div class="product">   
				<picture>
					<img src="image/one.png" alt="">
				</picture>
				<div class="detail">
					<p>
						<b>Product Twelve</b><br>
						<small>New arrival</small>
					</p>
					<samp>$45.00</samp>
				</div>
				<div class="button">
					<p class="star">
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
						<strong>&star;</strong>
					</p>
					<a href="#">Add-cart</a>
				</div>
			</div> -->
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product1" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    5%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product2" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    10%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product3.jpg" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    20%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    5%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product5.webp" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    5%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product1" alt="">
                </picture>
               
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    10%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product2" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    20%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    5%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
        </section>

        <header class=".product-slide-header">
            <section class="todays-section">
                <h1 class="title">This month</h1>
                <div id="type">
                    <p class="topic" >Best Selling Products</p>
                    <div class="controls">
                        <p>
                           

                        </p>
                        <a class="btn scroll-down " >View All</a>
                    </div>
                  
                 
                </div>
           
            </section>
      
		
		</header>
		<section class="products-slider">
            <span class="left">&#10094;</span>
            <span class="right">&#10095;</span>
		
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product1" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    5%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product2" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    10%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product3.jpg" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    20%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    5%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product5.webp" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    5%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product1" alt="">
                </picture>
               
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    10%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product2" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    20%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
            <div class="product-box">
                <picture>
                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">
                </picture>
                <p class="product-title" >HP OfficeJet Pro
                    9015</p>
                <p class="price" >
                    <span class="actual-price" >Rs:10000</span><span class="discount-price"
                        >Rs:120000</span>
                </p>
                <div style="margin: 15px 0px;" class="rating">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <i class="fa fa-star" aria-hidden="true"></i>

                </div>
                <div class="icons">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <i class="fa fa-heart-o" aria-hidden="true"></i>
                </div>
                <div class="off">
                    5%off
                </div>
                <a href="./productDetail.html" class="buy-btn">
                    <span style="display: flex;justify-content: center;">Buy Now</span>
                </a>
            </div>
        </section>

        

    </div>
     <jsp:include page="footer.jsp"/>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/script.js">
   
	
	


</script>


</html>