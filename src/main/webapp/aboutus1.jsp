<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
	String ses = (String)session.getAttribute("csesid");
	if(ses == null)
	{
		response.sendRedirect("login.jsp");
	}
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>About Us</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a href="cust.jsp"> <img class="btn"  src="seewans.png" alt="" width="72" height="57"> </a>
          <a class="navbar-brand" href="cust.jsp"><h2>Seewans Bakery</h2></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="cust.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active " aria-current="page" href="#">AboutUs</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="product.jsp">Product</a>
              </li>  
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                My Account
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                  <li><a class="dropdown-item" href="wishlist.jsp">Wishlist</a></li>
                  <li><a class="dropdown-item" href="orderhistory.jsp">Order History</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
                </ul>
              </li>
            </ul>
            <a class="btn btn-outline-warning" href="cart.jsp" role="button">
                <i class="fa-solid fa-cart-shopping"></i>
              </a>
          </div>
        </div>
      </nav>

            <img class="mb-4" src="seewans.png" alt="" width="72" height="57"> 
      <div class="container my-4"> 
      
      <div class="row featurette d-flex justify-content-center align-items-center">
        <div class="col-md-7 order-md-2">
          <p class="lead">The reason behind developing a bakery management system is that
            now a days bakery industries are sweeping the market with their
            innovative food items so to provide proper detail to buyers as well as
            sellers bakery management system is created. This system is mainly
            developed for buyers(customers),sellers(shopkeepers)and admin
            which helps them to know product details, availability ,price and also
            sell the bakery products easily without any difficulties.</p>
        </div>
        <div class="col-md-5 order-md-1">
          <img src="bakery8.png">
        </div>
      </div>
    </div>
    </div>
    <div class="container">
    <div class="row featurette d-flex justify-content-center align-items-center">
        <div class="col-md-7">
          <p class="lead">The reason behind developing a bakery management system is that
            now a days bakery industries are sweeping the market with their
            innovative food items so to provide proper detail to buyers as well as
            sellers bakery management system is created. This system is mainly
            developed for buyers(customers),sellers(shopkeepers)and admin
            which helps them to know product details, availability ,price and also
            sell the bakery products easily without any difficulties.</p>
        </div>
        <div class="col-md-5">
          <img src="bakery9.jpg">
        </div>
      </div>
    </div>
    </div>
    <script src="https://kit.fontawesome.com/96531cd29f.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>
</html>