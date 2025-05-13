<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


                                    <li class="scroll-down"><a>Inkjet Printers</a></li>
                                    <li class="scroll-down"><a>Laser Printers</a></li>
                                    <li class="scroll-down"><a>Multifunction Printers</a></li>
                                    <li class="scroll-down"><a>3D Printers</a></li>
                                    <li class="scroll-down"><a>Portable Printers</a></li>
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

</body>

</html>