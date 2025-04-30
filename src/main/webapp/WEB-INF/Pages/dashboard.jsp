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
                                        <a href="#" class="nav__dropdown-item">Mail</a>
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
                                    <i class='bx bx-bell nav__icon' ></i>
                                    <span class="nav__name">Notifications</span>
                                    <i class='bx bx-chevron-down nav__icon nav__dropdown-icon'></i>
                                </a>

                                <div class="nav__dropdown-collapse">
                                    <div class="nav__dropdown-content">
                                        <a href="#" class="nav__dropdown-item">Blocked</a>
                                        <a href="#" class="nav__dropdown-item">Silenced</a>
                                        <a href="#" class="nav__dropdown-item">Publish</a>
                                        <a href="#" class="nav__dropdown-item">Program</a>
                                    </div>
                                </div>

                            </div>

                            <a href="#" class="nav__link">
                                <i class='bx bx-compass nav__icon' ></i>
                                <span class="nav__name">Explore</span>
                            </a>
                            <a href="#" class="nav__link">
                                <i class='bx bx-bookmark nav__icon' ></i>
                                <span class="nav__name">Saved</span>
                            </a>
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
                <h1>50</h1>
                <span>Customers</span>
              </div>
              <div>
                <span><i class="fa fa-users" aria-hidden="true"></i></span>
              </div>
            </div>
            <div class="card-single">
              <div>
                <h1>12</h1>
                <span>Projects</span>
              </div>
              <div>
                <i class="fa fa-list-alt" aria-hidden="true"></i>
              </div>
            </div>
            <div class="card-single">
              <div>
                <h1>15</h1>
                <span>Orders</span>
              </div>
              <div>
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
              </div>
            </div>
            <div class="card-single">
              <div>
                <h1>$50K</h1>
                <span>Income</span>
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
                  <h2>Recent Projects</h2>
                  <button>See all <i class="fa fa-arrow-right" style="margin-left:5px" aria-hidden="true"></i>
                  </button>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table>
                  
                        <thead>
                          <tr>
                            <th scope="col">Account</th>
                            <th scope="col">Due Date</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Period</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td data-label="Account">Visa - 3412</td>
                            <td data-label="Due Date">04/01/2016</td>
                            <td data-label="Amount">$1,190</td>
                            <td data-label="Period">03/01/2016 - 03/31/2016</td>
                          </tr>
                          <tr>
                            <td scope="row" data-label="Account">Visa - 6076</td>
                            <td data-label="Due Date">03/01/2016</td>
                            <td data-label="Amount">$2,443</td>
                            <td data-label="Period">02/01/2016 - 02/29/2016</td>
                          </tr>
                          <tr>
                            <td scope="row" data-label="Account">Corporate AMEX</td>
                            <td data-label="Due Date">03/01/2016</td>
                            <td data-label="Amount">$1,181</td>
                            <td data-label="Period">02/01/2016 - 02/29/2016</td>
                          </tr>
                          <tr>
                            <td scope="row" data-label="Acount">Visa - 3412</td>
                            <td data-label="Due Date">02/01/2016</td>
                            <td data-label="Amount">$842</td>
                            <td data-label="Period">01/01/2016 - 01/31/2016</td>
                          </tr>
                        </tbody>
                      </table>
                  </div>
                </div>
  
              </div>
  
            </div>
            <div class="customers">
              <div class="card">
                <div class="card-header">
                    <h2>New Customers</h2>
                    <button>See all <i class="fa fa-arrow-right" style="margin-left:5px" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="card-body">
                  <div class="customer">
                    <div class="info">
                      <img src="https://bit.ly/3bvT89p" height="40px" width="40px" alt="customer">
                      <div>
                        <h4>Malik Abushabab</h4>
                        <small>CEO</small>
                      </div>
                    </div>
                    <div class="contact">
                        <span class="fas fa-user-circle"></span>
                        <span class="fas fa-comment"></span>
                        <span class="fas fa-phone-alt"></span>
                      </div>
                  </div>
             
            
                  <div class="customer">
                    <div class="info">
                      <img src="https://bit.ly/3bvT89p" height="40px" width="40px" alt="customer">
                      <div>
                        <h4>Malik Abushabab</h4>
                        <small>CEO</small>
                      </div>
                    </div>
                    <div class="contact">
                        <span class="fas fa-user-circle"></span>
                        <span class="fas fa-comment"></span>
                        <span class="fas fa-phone-alt"></span>
                      </div>
                  </div>
                  <div class="customer">
                    <div class="info">
                      <img src="https://bit.ly/3bvT89p" height="40px" width="40px" alt="customer">
                      <div>
                        <h4>Malik Abushabab</h4>
                        <small>CEO</small>
                      </div>
                    </div>
                    <div class="contact">
                        <span class="fas fa-user-circle"></span>
                        <span class="fas fa-comment"></span>
                        <span class="fas fa-phone-alt"></span>
                      </div>
                  </div>
                  <div class="customer">
                    <div class="info">
                      <img src="https://bit.ly/3bvT89p" height="40px" width="40px" alt="customer">
                      <div>
                        <h4>Malik Abushabab</h4>
                        <small>CEO</small>
                      </div>
                    </div>
                    <div class="contact">
                        <span class="fas fa-user-circle"></span>
                        <span class="fas fa-comment"></span>
                        <span class="fas fa-phone-alt"></span>
                      </div>
                  </div>
                </div>
              </div>
  
            </div>
         
            
          </div>  
          <div class="projects">
            <div class="card">
              <div class="card-header">
                <h2>Recent Projects</h2>
                <button>See all <i class="fa fa-arrow-right" style="margin-left:5px" aria-hidden="true"></i>
 </button>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table>
                
                      <thead>
                        <tr>
                          <th scope="col">Account</th>
                          <th scope="col">Due Date</th>
                          <th scope="col">Amount</th>
                          <th scope="col">Period</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td data-label="Account">Visa - 3412</td>
                          <td data-label="Due Date">04/01/2016</td>
                          <td data-label="Amount">$1,190</td>
                          <td data-label="Period">03/01/2016 - 03/31/2016</td>
                        </tr>
                        <tr>
                          <td scope="row" data-label="Account">Visa - 6076</td>
                          <td data-label="Due Date">03/01/2016</td>
                          <td data-label="Amount">$2,443</td>
                          <td data-label="Period">02/01/2016 - 02/29/2016</td>
                        </tr>
                        <tr>
                          <td scope="row" data-label="Account">Corporate AMEX</td>
                          <td data-label="Due Date">03/01/2016</td>
                          <td data-label="Amount">$1,181</td>
                          <td data-label="Period">02/01/2016 - 02/29/2016</td>
                        </tr>
                        <tr>
                          <td scope="row" data-label="Acount">Visa - 3412</td>
                          <td data-label="Due Date">02/01/2016</td>
                          <td data-label="Amount">$842</td>
                          <td data-label="Period">01/01/2016 - 01/31/2016</td>
                        </tr>
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