<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, java.io.PrintWriter" %>
<% 
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	String em = (String)session.getAttribute("csesemail");
	if(em == null)
	{
		response.sendRedirect("login.jsp");
	}
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
	Statement statement = connection.createStatement();
	String query = "select * from tbluser where email = '"+em+"'";
	ResultSet set = statement.executeQuery(query);
	if(set.next())
	{
		String id = set.getString("id");
		session.setAttribute("csesid", id);
	}
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Seewans bakery</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
        <a href="cust.jsp"> <img class="btn"  src="seewans.png" alt="" width="72" height="57"> </a>
          <a class="navbar-brand" href="cust.php"><h2>Seewans Bakery</h2></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active " aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="aboutus1.jsp">AboutUs</a>
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
      
      <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>Attention please!</strong> All the product are available for and can be delivery only in surat city.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
     
      <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <a href="product.jsp"><img src="bakery3.jpg" class="d-block w-100" alt="..."></a>
            <div class="carousel-caption d-none d-md-block">
              <h5>WE WELCOME YOU TO SEEWAANS BAKERS AND COOKIES</h5>
              <p>Need some butter in life.</p>
            </div>
          </div>
          <div class="carousel-item">
          <a href="product.jsp"><img src="bakery2.jpg" class="d-block w-100" alt="..."></a>
            <div class="carousel-caption d-none d-md-block">
              <h5>THE BEST YOU CAN GET</h5>
              <p>looking for some naamkeen.</p>
            </div>
          </div>
          <div class="carousel-item">
          <a href="productjsp"><img src="bakery7.jpg" class="d-block w-100" alt="..."></a>
            <div class="carousel-caption d-none d-md-block">
              <h5>EXPERIENCE THE HEAVEN </h5>
              <p>Want some mouth watering experience.</p>
            </div>
          </div>
          <div class="carousel-item">
          <a href="product.jsp"><img src="choco.jpg" class="d-block w-100" alt="..."></a>
            <div class="carousel-caption d-none d-md-block">
              <h5>DIVE INTO THE WORLD OF CHOCOLATE</h5>
              <p>Melt your mouth with creamy Chocolate.</p>
            </div>
          </div>       
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </div>
    <footer class="bg-dark text-center text-white">

  <div class="container p-4">

    <section class="mb-4">
      <br>
      <h3> Connect With Us </h3>

      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
        <i class="fab fa-facebook-f"></i>
      </a>


      <a class="btn btn-outline-light btn-floating m-1" href="#!" role="button">
        <i class="fab fa-twitter"></i>
      </a>


      <a class="btn btn-outline-light btn-floating m-1" href="https://www.seewans.com/" role="button">
        <i class="fab fa-google"></i>
      </a>

      <a class="btn btn-outline-light btn-floating m-1" href="https://www.instagram.com/deepdalal20/" role="button">
        <i class="fa-brands fa-instagram"></i>
      </a>
      
    </section>
</footer>

    <script src="https://kit.fontawesome.com/96531cd29f.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
  </body>
</html>