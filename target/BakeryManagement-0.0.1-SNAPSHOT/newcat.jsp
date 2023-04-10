<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<html lang="en">
<head>
    <title>
      New Category
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
<h3>New Category</h3>
<div>
  <form action="" method="post">
    <label for="fname">New Category Name: </label>
    <input type="text" id="fname" name="c_name" placeholder="Enter Category name" required>
  
    <input type="submit" name="regcat" value="Submit">
  </form>
</div>
<%@ page import="java.sql.*, java.io.*" %>
	<%
	
		String btn = request.getParameter("regcat");
		String category = request.getParameter("c_name");
	
		if(btn != null)
		{		
			try
			{
				PrintWriter pw = response.getWriter();
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
				Statement statement = connection.createStatement();
				String query = "select * from tblcategory where c_name = '"+category+"'";
				ResultSet set = statement.executeQuery(query);
				if(!set.next())
				{
					String query1 = "insert into tblcategory (`c_name`) values ('"+category+"')";
					statement.executeUpdate(query1);
					response.sendRedirect("category.jsp");
				}
				else
				{
					String oldcat = set.getString(2);
					pw.print("<script>alert('Category already available');</script>");
				}
			}
			catch(Exception e){
				System.out.print(e);
			}
		}
	%>
</body>
</html>