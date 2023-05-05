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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
    <title>Cart</title>
  </head>
  <body>
<%
	Cookie[] cookies = request.getCookies();
	String errmsg1 = "";
	if (cookies != null) {
	     for (Cookie cookie : cookies) {
	       if(cookie.getName().equals("uperr")) 
	       {
	         errmsg1 = cookie.getValue();
	         System.out.print(errmsg1);
	         out.print("<center><div style='padding: 0px; background-color: orange; color: black; height: 25px; width: 100%; border-radius: 99px'>"+errmsg1+"</div></center>");
	       }
	    }
	}
%>
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
      <a class="btn btn-outline-warning active" aria-current="page" href="#" role="button">
                <i class="fa-solid fa-cart-shopping"></i>
              </a>
    </div>
  </div>
</nav>
      <section class="uts">
        <div>
             <h1 class="primary-head">Cart</h1>
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
					<th>Quantity</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
      <%
      int gt = 0;
        try
        {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
        	Statement statement = connection.createStatement();
        	String query = "select * from tblcart where u_id = '"+ses+"'";
        	ResultSet set = statement.executeQuery(query);
        	if (!set.isBeforeFirst()) {
        		%>
	        		<tr>
		                <td>Cart is Empty</td>
		            </tr>
        		<%
             } 
        	else 
        	{
	        	while(set.next())
	        	{
	        		String qty1 = set.getString("crt_qty");
	            	String pr = set.getString("crt_price");
        %>
				<tr>
					<td id="name" data-label="Name"><%out.print(set.getString("crt_name")); %></td>
          			<td id="image" data-label="image"><img src="<%out.print(set.getString("crt_image")); %>" style="width: 100px; height: 100px;"></td>
					<td id="price" data-label="Price"><%out.print(set.getString("crt_price")); %></td>
          			<td id="quntity" data-label="Quantity">
		            <form action="updatecrt.jsp" method="post">
		                <input type="hidden" name="product_id" value="<%out.print(set.getString("p_id")); %>">
		                <input type="hidden" name="cart_id" value="<%out.print(set.getString("crt_id")); %>">
		                <input type="number" min="1" name="cart_quantity" value="<%out.print(qty1); %>">
		                <input type="submit" name="update_cart" value="Update" class="option-btn">
	            	</form>
            <%
              int p = Integer.parseInt(pr);
              int q1 = Integer.parseInt(qty1);
              int sum = p*q1;
              //System.out.println("gt = "+gt+" ");
              gt = gt + sum;
              //System.out.println("sum = "+sum+" ");
              //System.out.print("gt1 = "+gt);
            %>
					<td id="total" data-label="Total">₹<%out.print(sum); %></td>
          <td> <form method="post" action="removecrt.jsp">
                <input type="hidden" name="cart_id" value="<%out.print(set.getString("crt_id")); %>">
                <input type="submit" value="Remove"></a>
            </form>    
          </td>
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
            <br>
          </div>
			</div>
			<div class="cart-right">
				<table class="table1">

					<h2 class="center">Cart total</h2>
					<hr class="carttotals">

					<tbody>
					<tr>
					  <td class="price" data-label="Name">₹<%out.print(gt); %></td>
					  <% session.setAttribute("gtotal", gt); %>
					</tr>

					</tbody>
				</table>
        <br>
            <a href="billing.jsp"> <input type="submit" value="Check Out"> </a>
            <a href="clearcrt.jsp"> <input type="submit" value="Clear Cart"> </a>
			</div>
      
		</div>
	</section>     
    <script src="https://kit.fontawesome.com/96531cd29f.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>
</html>