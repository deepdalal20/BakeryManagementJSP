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
<%@ page import="java.sql.*, java.io.PrintWriter, java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
      input[type=submit] {
  background-color: #fa9200;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 25px;
}
</style>
    <title>Wishlist</title>
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
                <a class="nav-link" href="aboutus1.jsp">AboutUs</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="product.jsp">Product</a>
              </li>  
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                My Account
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item active " aria-current="page" href="profile.jsp">Profile</a></li>
                  <li><a class="dropdown-item" href="#">Wishlist</a></li>
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

      <section class="uts">
        <div>
             <h1 class="primary-head">Wishlist</h1>
        </div>
    </section>
	<section class="m-b-remove">
	<div class="container2">

		<table class="table">
			<thead>
				<tr>
		          <th>Name</th>
		          <th>Image</th>
					<th>Price</th>
				</tr>
			</thead>
			<tbody>
        <%
        try
        {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
        	Statement statement = connection.createStatement();
        	String query = "select * from tblwishlist where u_id = '"+ses+"'";
        	ResultSet set = statement.executeQuery(query);
        	if (!set.isBeforeFirst()) {
        		%>
	        		<tr>
		                <td>Wishlist is Empty</td>
		            </tr>
        		<%
             } 
        	else 
        	{
	        	while(set.next())
	        	{
        %>
				<tr>
					<td id="name" data-label="Name"><%out.print(set.getString("wl_name")); %></td>
          <td id="image" data-label="Image"><img src="<%out.print(set.getString("wl_image")); %>" style="width: 100px; height: 100px;"></td>
					<td id="price" data-label="Price"><%out.print(set.getString("wl_price")); %></td>
          <td><a href="product.jsp"><input type="submit" value="Add to Cart"></a></td>
          <td><a href="removewl.jsp?delete=<%out.print(set.getString("wl_id")); %>"><input type="submit" value="Remove from Wishlist"></a></td>
				</tr>
				<%
	        	}
        	}
        }
        catch(Exception e)
        {
        	System.out.print(e);
        }
		%>
			</tbody>
		</table>
	</div>
</section>
	<section class="m-remove">
		<div class="main-cart">
			<div class="cart-left">
      <div>
            <a href="product.jsp"> <input type="submit" value="Return to Shopping"> </a>
            <a href="clearwl.jsp"> <input type="submit" value="Clear Wishlist"> </a>
            <br>
          </div>
			</div>
	</section>        
            <script src="https://kit.fontawesome.com/96531cd29f.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    </body>
    </html>