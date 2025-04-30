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
    <header class="header-default">
        <div class="container">
            <div class="header-row">
                <div class="logo">
                    <a href="./product.html">
                        <img  src="${pageContext.request.contextPath}/assets/metalmandu3/png/logo-no-background.png" alt="">
                         <!-- <p>Metal Steel Works Nepal</p> -->
                    </a>

                </div>
                <div class="nav">
                    <ul class="nav-list">
                        <li class="nav_item "><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">Home</a></li>
                        <li class="nav_item_has_children nav_item">
                            <a class="nav-link scroll-down ">New <i class="fa fa-caret-down" aria-hidden="true"></i></a>
                            <ul class="sub-menu multi-column-menu">
                                <div class="col-1">
                                    <div>
                                        <h2 style="color: #2D336B; display: flex;gap: 5px;">Featured <span><img
                                                    style="width: 30px;" src="${pageContext.request.contextPath}/assets/icons/bonfire.png"
                                                    alt=""></span></h2>
                                    </div>


                                    <li class="scroll-down"><a>Inkjet Printers</a></li>
                                    <li class="scroll-down"><a>Laser Printers</a></li>
                                    <li class="scroll-down"><a>Multifunction Printers</a></li>
                                    <li class="scroll-down"><a>3D Printers</a></li>
                                    <li class="scroll-down"><a>Portable Printers</a></li>
                                </div>
                                <div class="col-2">
                                    <div>
                                        <h2 style="color: #2D336B; display: flex;gap: 5px;">Most Sold<span style=""><img
                                                    style="width: 30px;" src="${pageContext.request.contextPath}/assets/icons/shopping.png"
                                                    alt=""></span></h2>
                                    </div>
                                    <li class="scroll-down"><a class="scroll-down">Inkjet Printers</a></li>
                                    <li class="scroll-down"><a class="scroll-down">Laser Printers</a></li>
                                    <li class="scroll-down"><a class="scroll-down">Multifunction Printers</a></li>
                                    <li class="scroll-down"><a class="scroll-down">3D Printers</a></li>
                                    <li><a href="">Portable Printers</a></li>
                                </div>
                                <div class="col-3">
                                    <div>
                                        <h2 style="color: #2D336B; display: flex;gap: 5px;">Most Affordable <span
                                                style=""><img style="width: 30px;" src="${pageContext.request.contextPath}/assets/icons/cheap.png"
                                                    alt=""></span></h2>
                                    </div>
                                    <li><a class="scroll-down">Inkjet Printers</a></li>
                                    <li><a class="scroll-down">Laser Printers</a></li>
                                    <li><a class="scroll-down">Multifunction Printers</a></li>
                                    <li><a class="scroll-down">3D Printers</a></li>
                                    <li><a class="scroll-down">Portable Printers</a></li>
                                </div>






                            </ul>
                        </li>

                        <li class="nav_item_has_children">
                            <a class="scroll-down nav-link" >Brand <i class="fa fa-caret-down" aria-hidden="true"></i></a>

                            <ul class="sub-menu single-column-menu">
                                <li><a class="scroll-down">Canon</a></li>
                                <li><a class="scroll-down">HP</a></li>
                                <li><a class="scroll-down">Epson</a></li>
                                <li><a class="scroll-down">Brother</a></li>
                                <li><a class="scroll-down">Samsung</a></li>
                                <li><a class="scroll-down">Dell</a></li>
                            </ul>
                        </li>
                        <li class="nav_item"><a href="./Research.html" class="nav-link">Research</a></li>
                        <li class="nav_item"><a href="./blog.html" class="nav-link">Blog</a></li>
                        <li class="nav_item"><a href="./Aboutus.html" class="nav-link">About Us</a></li>
                    </ul>
                    </ul>


                </div>
                <div class="icons">
                    <form  class="search-bar" action="">
                        <input placeholder="Search your product..." type="text">
                       
                        <i  class="fa fa-search" aria-hidden="true"></i>
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
            <img src="${pageContext.request.contextPath}/assets/user.png" /><a href="#"><p > <%=userName %></p></a>
          </li>
          <li>
            <img src="${pageContext.request.contextPath}/assets/edit.svg" /><a href="#">Edit profile</a>
          </li>
          <li>
            <img src="${pageContext.request.contextPath}/assets/inbox.svg" /><a href="#">Inbox</a>
          </li>
          <li>
            <img src="${pageContext.request.contextPath}/assets/cog.svg" /><a href="#">Setting</a>
          </li>
          <li><img src="${pageContext.request.contextPath}/assets/question.svg" /><a href="#">Help</a></li>
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
        </div>

        <div class="search-slide-down">
            Search:
            <input class="input" placeholder="Search your product here..">
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
                <li class="nav_item_has_children nav_item"><a href="./Research.html" class="nav-link ">Research</a></li>
                <li class="nav_item_has_children nav_item"><a href="./blog.html" class="nav-link">Blog</a></li>
                <li class="nav_item"><a href="./Aboutus.html" class="nav-link">About Us</a></li>
            </ul>
            </ul>


        </div>

    </div>

    <div class="container">
        <section class="banner">
            <ul class="mega-menu ">
                <h3 style="text-align: center; margin-bottom: 10px;">Quick <span style="color: #2D336B;">Browse</span>
                </h3>

                <li class="mega-item-has-children"><a class="scroll-down">Main Gates <span>></span></a>
                    <ul class="mega-sub-menu mega-single-column">
                        <h3 style="text-align: center; margin-bottom: 10px;">Our <span
                                style="color: #2D336B;">Products</span> </h3>
                        <li class="mega-item-has-children-2"><a class="scroll-down">
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product1" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                       Black Steel Wooden Style Main Gate

                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.50000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>Black Steel Wooden Style Main Gate
</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Staircase<span>></span>
                            </a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product2" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                       SC01
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Shutter
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                       SC02
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon PIXMA series
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Brother MFC-J995DW
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product5.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Railings
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Brother MFC-J995DW is an
                                        all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon MAXIFY MB2720
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon MAXIFY MB2720
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.70000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon MAXIFY MB2720
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Expression Premium XP-7100
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product2" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Expression Premium XP-7100
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color:#2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                        <li class="mega-item-has-children-2"><a class="scroll-down">Envy Pro 6455 <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product3.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Envy Pro 6455
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.100000</p>
                                    <p> <span style="color:#2D336B;">Description:</span>The Envy Pro 6455
                                        is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                    </ul>
                </li>
                <li class="mega-item-has-children"><a class="scroll-down">Laser Printers <span>></span></a>
                    <ul class="mega-sub-menu mega-single-column">
                        <h3 style="text-align: center; margin-bottom: 10px;">Our <span
                                style="color: #2D336B;">Products</span> </h3>
                        <li class="mega-item-has-children-2"><a href="">HP OfficeJet Pro 9015 <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product2\" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        HP OfficeJet Pro 9015
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.50000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The HP OfficeJet Pro 9015
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Epson EcoTank ET-4760 <span>></span>
                            </a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product3.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Epson EcoTank ET-4760
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon PIXMA series
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon PIXMA series
                                    </h2>
                                    <p> <span style="color:#2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon PIXMA series
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Brother MFC-J995DW
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product5.webp\" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Brother MFC-J995DW
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Brother MFC-J995DW is an
                                        all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon MAXIFY MB2720
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product5.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon MAXIFY MB2720
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.70000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon MAXIFY MB2720
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Expression Premium XP-7100
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product2\" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Expression Premium XP-7100
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                        <li class="mega-item-has-children-2"><a class="scroll-down">Envy Pro 6455 <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Envy Pro 6455
                                    </h2>
                                    <p> <span style="color:#2D336B;">Price:</span> Rs.100000</p>
                                    <p> <span style="color:#2D336B;">Description:</span>The Envy Pro 6455
                                        is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                    </ul>
                </li>
                <li class="mega-item-has-children"><a class="scroll-down">All-in-One Printers <span>></span></a>
                    <ul class="mega-sub-menu mega-single-column">
                        <h3 style="text-align: center; margin-bottom: 10px;">Our <span
                                style="color: #2D336B;">Products</span> </h3>
                        <li class="mega-item-has-children-2"><a class="scroll-down">HP OfficeJet Pro 9015
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product1.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        HP OfficeJet Pro 9015
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.50000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The HP OfficeJet Pro 9015
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Epson EcoTank ET-4760 <span>></span>
                            </a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product5.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Epson EcoTank ET-4760
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon PIXMA series
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product5.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon PIXMA series
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon PIXMA series
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Brother MFC-J995DW
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer6.png" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Brother MFC-J995DW
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Brother MFC-J995DW is an
                                        all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon MAXIFY MB2720 </a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product5.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon MAXIFY MB2720
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.70000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon MAXIFY MB2720
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Expression Premium XP-7100
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Expression Premium XP-7100
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                        <li class="mega-item-has-children-2"><a class="scroll-down">Envy Pro 6455 <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Envy Pro 6455
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.100000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Envy Pro 6455
                                        is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                    </ul>
                </li>
                <li class="mega-item-has-children"><a class="scroll-down">3D Printers <i class="fa fa-angle-right"
                            aria-hidden="true"></i></a>
                    <ul class="mega-sub-menu mega-single-column">
                        <h3 style="text-align: center; margin-bottom: 10px;">Our <span
                                style="color: #2D336B;">Products</span> </h3>
                        <li class="mega-item-has-children-2"><a class="scroll-down">HP OfficeJet Pro 9015
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        HP OfficeJet Pro 9015
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.50000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The HP OfficeJet Pro 9015
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Epson EcoTank ET-4760 <span>></span>
                            </a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Epson EcoTank ET-4760
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon PIXMA series
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon PIXMA series
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon PIXMA series
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Brother MFC-J995DW
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Brother MFC-J995DW
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Brother MFC-J995DW is an
                                        all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon MAXIFY MB2720
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon MAXIFY MB2720
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.70000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon MAXIFY MB2720
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Expression Premium XP-7100
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Expression Premium XP-7100
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                        <li class="mega-item-has-children-2"><a class="scroll-down">Envy Pro 6455 <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Envy Pro 6455
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.100000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Envy Pro 6455
                                        is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                    </ul>
                </li>
                <li class="mega-item-has-children"><a class="scroll-down">Photo Printers <i class="fa fa-angle-right"
                            aria-hidden="true"></i></a>
                    <ul class="mega-sub-menu mega-single-column">
                        <h3 style="text-align: center; margin-bottom: 10px;">Our <span
                                style="color: #2D336B;">Products</span> </h3>
                        <li class="mega-item-has-children-2"><a class="scroll-down">HP OfficeJet Pro 9015
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        HP OfficeJet Pro 9015
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.50000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The HP OfficeJet Pro 9015
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Epson EcoTank ET-4760 <span>></span>
                            </a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Epson EcoTank ET-4760
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon PIXMA series
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/priter4.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon PIXMA series
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon PIXMA series
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Brother MFC-J995DW
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/metalmandu3/product/product4.webp" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Brother MFC-J995DW
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Brother MFC-J995DW is an
                                        all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon MAXIFY MB2720
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer7.png" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon MAXIFY MB2720
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.70000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon MAXIFY MB2720
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Expression Premium XP-7100
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer5.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Expression Premium XP-7100
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                        <li class="mega-item-has-children-2"><a class="scroll-down">Envy Pro 6455 <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/1016065.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Envy Pro 6455
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.100000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Envy Pro 6455
                                        is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                    </ul>
                </li>

                <li class="mega-item-has-children"><a class="scroll-down">Dot Matrix Printers <i
                            class="fa fa-angle-right" aria-hidden="true"></i></a>
                    <ul class="mega-sub-menu mega-single-column">
                        <h3 style="text-align: center; margin-bottom: 10px;">Our <span
                                style="color: #2D336B;">Products</span> </h3>
                        <li class="mega-item-has-children-2"><a class="scroll-down">HP OfficeJet Pro 9015
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/1016065.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        HP OfficeJet Pro 9015
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.50000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The HP OfficeJet Pro 9015
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Epson EcoTank ET-4760 <span>></span>
                            </a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer5.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Epson EcoTank ET-4760
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon PIXMA series
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/priter4.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon PIXMA series
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon PIXMA series
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Brother MFC-J995DW
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer6.png" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Brother MFC-J995DW
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Brother MFC-J995DW is an
                                        all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon MAXIFY MB2720
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer7.png" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon MAXIFY MB2720
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.70000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon MAXIFY MB2720
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Expression Premium XP-7100
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer5.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Expression Premium XP-7100
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                        <li class="mega-item-has-children-2"><a class="scroll-down">Envy Pro 6455 <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/1016065.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Envy Pro 6455
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.100000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Envy Pro 6455
                                        is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                    </ul>
                </li>
                <li class="mega-item-has-children"><a class="scroll-down">Large Format Printers <i
                            class="fa fa-angle-right" aria-hidden="true"></i></a>
                    <ul class="mega-sub-menu mega-single-column">
                        <h3 style="text-align: center; margin-bottom: 10px;">Our <span
                                style="color: #2D336B;">Products</span> </h3>
                        <li class="mega-item-has-children-2"><a class="scroll-down">HP OfficeJet Pro 9015
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/1016065.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        HP OfficeJet Pro 9015
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.50000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The HP OfficeJet Pro 9015
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Epson EcoTank ET-4760 <span>></span>
                            </a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer5.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Epson EcoTank ET-4760
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon PIXMA series
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/priter4.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon PIXMA series
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon PIXMA series
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Brother MFC-J995DW
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer6.png" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Brother MFC-J995DW
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Brother MFC-J995DW is an
                                        all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Canon MAXIFY MB2720
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer7.png" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Canon MAXIFY MB2720
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.70000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>TheCanon MAXIFY MB2720
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>
                        <li class="mega-item-has-children-2"><a class="scroll-down">Expression Premium XP-7100
                                <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/printer5.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Expression Premium XP-7100
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.40000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Epson Expression Premium
                                        XP-7100 is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                        <li class="mega-item-has-children-2"><a class="scroll-down">Envy Pro 6455 <span>></span></a>
                            <div class="mega-sub-menu-2 mega-multi-column">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/assets/1016065.jpg" alt="">

                                </div>
                                <div class="product-desc">
                                    <h2 style="color: #2D336B;">
                                        Envy Pro 6455
                                    </h2>
                                    <p> <span style="color: #2D336B;">Price:</span> Rs.100000</p>
                                    <p> <span style="color: #2D336B;">Description:</span>The Envy Pro 6455
                                        is an all-in-one inkjet printer designed to cater to various printing,
                                        scanning, and copying needs, particularly for home or small office use</p>
                                </div>
                            </div>
                        </li>

                    </ul>
                </li>

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

        

    </div>
       <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col">
                    <h4>company</h4>
                    <ul>
                        <li><a href="#">about us</a></li>
                        <li><a href="#">our services</a></li>
                        <li><a href="#">privacy policy</a></li>
                        <li><a href="#">affiliate program</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>get help</h4>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">shipping</a></li>
                        <li><a href="#">returns</a></li>
                        <li><a href="#">order status</a></li>
                        <li><a href="#">payment options</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>online shop</h4>
                    <ul>
                        <li><a href="#">watch</a></li>
                        <li><a href="#">bag</a></li>
                        <li><a href="#">shoes</a></li>
                        <li><a href="#">dress</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>follow us</h4>
                    <div class="social-links">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i>
                        </a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                        <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
        </div>
   </footer>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/script.js">
   
	
	


</script>


</html>