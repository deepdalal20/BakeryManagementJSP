<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.PrintWriter, java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String ses = (String)session.getAttribute("asesid");
if(ses == null)
{
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>
      New Product
    </title>
  </head>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #fa9200;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #fa9200;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<body>

<h3>Add new product</h3>

<div>
  <form action="" method="post">
    <label for="fname">Product Name: </label>
    <input type="text" id="fname" name="p_name" placeholder="Enter Product name" required>

    <label for="fname">Product Price: </label>
    <input type="text" id="fname" name="p_price" placeholder="Enter Product Price" required>

    <label for="country">Category: </label>
    <select name="p_cat" id="country" class="box">
                     <%
                     try
                     {
	                    Class.forName("com.mysql.cj.jdbc.Driver");
	         			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
	         			Statement statement = connection.createStatement(); 
	         			String query1 = "select * from tblcategory";
	         			ResultSet set = statement.executeQuery(query1);
                     	while(set.next())
                     	{
                     %>
         <option value="<%out.print(set.getString("c_id"));%>"><%out.print(set.getString("c_name"));%></option>
         <%
                     	}
                     }
                     catch(Exception ex)
                     {
                    	 System.out.print(ex);
                     }
         %>
      </select><br>

    <label for="lname">Product Image: </label>
    <input type="file" id="lname" name="p_image" placeholder="Upload Image" required> <br><br>

    <label for="country">Status: </label>
    <select name="p_status" id="country" class="box">
         <option value="instock">In Stock</option>
         <option value="outofstock">Out of Stock</option>
      </select>
  
    <input type="submit" name="regproduct" value="Submit">
  </form>
</div>
<%
try 
{
	String a = request.getParameter("regproduct");
    if(a!= null)
    {
    	String name = request.getParameter("p_name");
    	String image = request.getParameter("p_image");
    	String cat = request.getParameter("p_cat");
    	String status = request.getParameter("p_status");
    	String price = request.getParameter("p_price");
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
		String date = LocalDateTime.now().format(formatter);
    	
    	if(name != null && image != null && cat != null && status != null && price != null)
    	{
    		Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
			Statement statement = connection.createStatement(); 
			String query1 = "select p_name from tblproduct where p_name = '"+name+"'";
			ResultSet set = statement.executeQuery(query1);
			if(set.next())
			{
				out.print("<script>alert('Product already exists');</script>");
			}
			else
			{
				String q1 = "INSERT INTO `tblproduct`(`p_name`, `category`, `p_image`, `p_price`, `p_status`, `date`) VALUES ('"+name+"','"+cat+"','"+image+"','"+price+"','"+status+"', '"+date+"')";
				statement.executeUpdate(q1);
				response.sendRedirect("edproduct.jsp");
			}
    	}
    	else
    	{
    		out.print("<script>alert('Enter all the Details properly...');</script>");
    	}
    }
}
catch(Exception e)
{
	System.out.print(e);
}
%>
</body>
</html>