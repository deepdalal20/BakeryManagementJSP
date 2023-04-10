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

<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
    
  </head>
    <style>
      body {
        text-align: center;
      }
        h1 {
          color: #88B04B;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
        p {
          color: #404F5E;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-size:20px;
          margin: 0;
        }
        input[type=submit] {
          background-color: #fa9200;
          border: none;
          color: white;
          padding: 10px 20px;
          text-decoration: none;
          margin: 4px 2px;
          cursor: pointer;
        }
    </style>
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
                <a class="nav-link" href="aboutus1.jsp">AboutUs</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="product.jsp">Product</a>
              </li>  
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
      <div>
        <h1>Thank you for Shopping with us.</h1>
        <h2>You have succesfully placed your order.</h2> 
        <p>We received your order<br/> You'll receive your order very soon!</p>
        <!-- <p> Your Payment id is: <?php echo $payment; unset($_SESSION['razorpay_payment_id']); ?></p>-->
      </div>
      <a href="product.jsp"><input type="submit" value="Return to shop"></a>
      <script src="https://kit.fontawesome.com/96531cd29f.js" crossorigin="anonymous"></script>
    </body>
</html>