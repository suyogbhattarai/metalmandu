<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>Sign in & Sign up Form</title>
  </head>
  <body>
    <div class="container-login">
      <div class="forms-container">
        <div class="signin-signup">
          <form action="${pageContext.request.contextPath}/login" method="post" class="sign-in-form">
            <img class="login-logo" src="${pageContext.request.contextPath}/assets/metalmandu3/png/logo-no-background.png" alt="">
            <%-- Display Messages --%>
            <% if (request.getAttribute("success") != null) { %>
    <p style="color:green; text-align: center;">Registration successful! Please log in.</p>
<% } %>
 <% if (request.getAttribute("error") != null) { %>
    <p style="color:red; text-align: center;"><%= request.getAttribute("error") %></p>
<% } %>

            <h2 class="title">Sign in</h2>
            <div class="input-field">
              <i class="fa fa-user" aria-hidden="true"></i>
              <input name="usernamelogin" type="text" placeholder="Username" />
            </div>
            <div class="input-field">
              <i class="fa fa-lock" aria-hidden="true"></i>
              <input name="passwordlogin" type="password" placeholder="Password" />
            </div>
            <input type="submit" value="Login" class="btn solid" />
            <p class="social-text">Or Sign in with social platforms</p>
            <div class="social-media">
      
              <a href="#" class="social-icon">
                <i class="fa fa-google" aria-hidden="true"></i>
              </a>
              <a href="#" class="social-icon">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
            </div>
          </form>
          <form action="${pageContext.request.contextPath}/register" method="post" class="sign-up-form">
            <img class="login-logo" src="${pageContext.request.contextPath}/assets/metalmandu3/png/logo-no-background.png" alt="">
            <h2 class="title">Sign up</h2>
            <% if (request.getAttribute("success") != null) { %>
    <p style="color:green; text-align: center;">Registration successful! Please log in.</p>
<% } %>
 <% if (request.getAttribute("error") != null) { %>
    <p style="color:red; text-align: center;"><%= request.getAttribute("error") %></p>
<% } %>
               <%-- Display Sign up Error Messages (if any are set) --%>

            <div class="input-field">
              <i class="fa fa-user" aria-hidden="true"></i>
              <input name="username" type="text" placeholder="Username" />
            </div>
            <div class="input-field">
              <i class="fa fa-envelope" aria-hidden="true"></i>
              <input name="email" type="email" placeholder="Email" />
            </div>
            <div class="input-field">
              <i class="fa fa-lock" aria-hidden="true"></i>
              <input name="password" type="password" placeholder="Password" />
            </div>
            <input type="submit" class="btn" value="Sign up" />
            <p class="social-text">Or Sign up with social platforms</p>
            <div class="social-media">
          
              <a href="#" class="social-icon">
                <i class="fa fa-google" aria-hidden="true"></i>
              </a>
              
              <a href="#" class="social-icon">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
            </div>
          </form>
        </div>
      </div>

      <div class="panels-container">
        <div class="panel left-panel">
          <div class="content">
            <h3>New here ?</h3>
            <p>
              Sign up to be our customer and purchase our goods
            </p>
            <button class="btn transparent" id="sign-up-btn">
              Sign up
            </button>
          </div>
          <img src="${pageContext.request.contextPath}/assets/log.svg" class="image" alt="" />
        </div>
        <div class="panel right-panel">
          <div class="content">
            <h3>One of us ?</h3>
            <p>
      
            </p>
            <button class="btn transparent" id="sign-in-btn">
              Sign in
            </button>
          </div>
          <img src="${pageContext.request.contextPath}/assets/register.svg" class="image" alt="" />
        </div>
      </div>
    </div>

    <script >

const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container-login");


sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});




sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});

    </script>
  </body>
</html>
