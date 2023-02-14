<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ses = (String)session.getAttribute("asesid");
	if(ses == null)
	{
		response.sendRedirect("login.jsp");
	}
	String id = request.getParameter("id");
%>
<%@ page import="java.sql.*, java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
    <title>
      Update Category
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
<%
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
		Statement statement = connection.createStatement();
		String query = "select * from tblcategory where c_id = '"+id+"'";
		ResultSet set = statement.executeQuery(query);
		if(set.next())
		{
			String cit = set.getString(1);
			String cname = set.getString(2);
		%>
		<h3>Update Category</h3>

		<div>
		  <form action="" method="post">
		    <label for="fname">Update Category Name: </label>
		    <input type="text" id="fname" name="c_name" value="<%out.print(cname);%>" required>
		  
		    <input type="submit" name="upcat" value="Submit">
		  </form>
		</div>
		
		<%
		}
		String btn = request.getParameter("upcat");
		if(btn != null)
		{
			String name = request.getParameter("c_name");
			String query1 = "UPDATE `tblcategory` SET `c_name`='"+name+"' WHERE c_id='"+id+"'";
			statement.executeUpdate(query1);
			response.sendRedirect("category.jsp");
		}
	}
	catch(Exception e)
	{
		System.out.print(e);
	}
%>
</body>
</html>