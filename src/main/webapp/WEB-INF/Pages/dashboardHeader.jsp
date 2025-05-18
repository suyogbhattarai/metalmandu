<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/dashboardHeader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
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
    
                            <a href="${pageContext.request.contextPath}/dashboard" class="nav__link active">
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
                                        <a href="${pageContext.request.contextPath}/profile" class="nav__dropdown-item">Password</a>
                                    
                                        <a href="${pageContext.request.contextPath}/profile" class="nav__dropdown-item">Account</a>
                                    </div>
                                </div>
                            </div>

                            
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
                                        <a href="${pageContext.request.contextPath}/products" class="nav__dropdown-item">Products</a>
                                   
                                        <a href="${pageContext.request.contextPath}/users" class="nav__dropdown-item">Users</a>
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
         <script src="${pageContext.request.contextPath}/js/dashboardHeader.js"></script>
</body>

</html>