<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.PrintWriter, java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String ses = (String)session.getAttribute("asesid");
	String pid = request.getParameter("pid");
	if(ses == null)
	{
		response.sendRedirect("login.jsp");
	}
		ResultSet set = null;
		Statement statement = null;
		Connection connection = null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
			statement = connection.createStatement();
			String query = "select * from tblproduct where p_id= '"+pid+"'";
			set = statement.executeQuery(query);
			if(set.next())
			{	
%>
<!DOCTYPE html>
<html>
<head>
    <title>
        Restock
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

<h3>Restock</h3>

<div>
  <form action="" method="post">
    <label for="fname">Product Name: </label> <%out.print(set.getString("p_name")); %> <br><br>

    <label for="fname">Product Price: </label><%out.print(set.getString("p_price")); %><br><br>

    <label for="lname">Available Quantity: </label>
    <input type="text" id="lname" name="qty" value="0" required> <br><br>
  
    <input type="submit" name="restock" value="Submit">
  </form>
</div>
<%
	}
			
	String btn = request.getParameter("restock");
	String qty = request.getParameter("qty");
	if(btn!=null)
	{
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
		String date = LocalDateTime.now().format(formatter);
		Statement statement1 = connection.createStatement();
		String query1 = "select * from tblstock where p_id = '"+pid+"'";
		ResultSet set1 = statement1.executeQuery(query1);
		if(set1.next())
		{ 	
			String up = "Update tblstock set avl_stock='"+qty+"', date='"+date+"' where p_id='"+pid+"'";
			statement.executeUpdate(up);
			response.sendRedirect("edproduct.jsp");
		}
		else		
		{
			String up = "INSERT INTO `tblstock`(`p_id`, `avl_stock`, `date`) VALUES ('"+pid+"','"+qty+"', '"+date+"')";
			statement.executeUpdate(up);
			response.sendRedirect("edproduct.jsp");
		}
	}
	}
	catch(Exception e)
	{
		System.out.print(e);
	}
	finally 
	{
	    try 
	    {
	      set.close();
	      statement.close();
	      connection.close();
	    } 
	    catch(Exception e)
	    {
	    	System.out.print(e);
	    }
	}		
%>
</body>
</html>