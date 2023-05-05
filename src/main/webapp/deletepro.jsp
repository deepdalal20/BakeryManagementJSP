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
String id = request.getParameter("id");
%>
<%@ page import="java.sql.*, java.io.PrintWriter" %>
<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
	Statement statement = connection.createStatement();
	String q = "select * from tblstock where p_id ='"+id+"'";
	ResultSet s = statement.executeQuery(q);
	if(s.next())
	{
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
    <title>Delete Category</title>
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
  </head>
<body>
	
	<div>
        <h1>Product still has stock remaining</h1>
        <h2>Would you like to delete the product still?</h2> 
        <form action="" method="post"> 
        	<input type="hidden" name="id" value="<%out.print(id);%>">
        	<input type="submit" value="Yes" name="first">
        	<input type="submit" value="No" name="second">
        </form>
     </div>
      
      <%
	      	String btn1 = request.getParameter("first");
	      	String btn2 = request.getParameter("second");
	      	
	      	if(btn1 != null)
	      	{
	      			String q2 = "DELETE FROM tblstock WHERE p_id='"+id+"'";
	      			statement.executeUpdate(q2);
	      			String q3 = "DELETE FROM tblproduct WHERE p_id='"+id+"'";
	      			statement.executeUpdate(q3);
	      			response.sendRedirect("edproduct.jsp");
	      	}
	      	if(btn2 != null)
	      	{
	      		response.sendRedirect("edproduct.jsp");
	      	}
	}
	else
	{ 
      String query = "DELETE FROM tblproduct WHERE p_id='"+id+"'";
		statement.executeUpdate(query);
		response.sendRedirect("edproduct.jsp");
	}
}
	catch(Exception e)
	{
		System.out.print(e);
	}
      %>
</body>
</html>