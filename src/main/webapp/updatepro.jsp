<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.PrintWriter, java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<% 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String ses = (String)session.getAttribute("asesid");
if(ses == null)
{
	response.sendRedirect("login.jsp");
}
String p_id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
    <title>
      Update Product
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

<h3>Update product</h3>
<%
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
		Statement statement = connection.createStatement();
		String query = "select * from tblproduct where p_id = '"+p_id+"'";
		ResultSet set = statement.executeQuery(query);
		if(set.next())
		{
			String pname = set.getString("p_name");
			String pimage = set.getString("p_image");
			String pcat = set.getString("category");
			String status = set.getString("p_status");
			String pprice = set.getString("p_price");
			System.out.print(pname);
		%>
<div>
  <form action="" method="post">
    <label for="fname">Product Name: </label>
    <input type="text" id="fname" name="p_name" value="<%out.print(pname);%>" required>

    <label for="fname">Product Price: </label>
    <input type="text" id="fname" name="p_price" value="<%out.print(pprice);%>" required>

    <label for="country">Category id: </label>
    <select name="p_cat" id="country" class="box">
         <option value="<%out.print(pcat);%>"><%out.print(pcat);%></option>
      </select><br>

    <label for="lname">Product Image: </label>
    <input type="file" id="lname" name="p_image" value="Upload Image" required> <br><br>

    <label for="country">Status: </label>
    <select name="p_status" id="country" class="box">
         <option value="instock">In Stock</option>
         <option value="outofstock">Out of Stock</option>
      </select>
  
    <input type="submit" name="upproduct" value="Submit">
  </form>
</div>
<%
		}
		String btn = request.getParameter("upproduct");
		if(btn != null)
		{
			String name = request.getParameter("p_name");
	    	String image = request.getParameter("p_image");
	    	String cat = request.getParameter("p_cat");
	    	String price = request.getParameter("p_price");
	    	String status = request.getParameter("p_status");
	    	
	    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
			String date = LocalDateTime.now().format(formatter);
			if(name != null && image != null && cat != null && status != null && price != null)
			{
				String query1 = "UPDATE `tblproduct` SET `p_name`='"+name+"', `p_image`='"+image+"', `category`='"+cat+"', `p_price`='"+price+"', `date`='"+date+"' WHERE p_id='"+p_id+"'";
				statement.executeUpdate(query1);
				response.sendRedirect("edproduct.jsp");
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