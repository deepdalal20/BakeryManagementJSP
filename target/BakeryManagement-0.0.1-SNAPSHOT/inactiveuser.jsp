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
		String i = "inactive";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
		Statement statement = connection.createStatement();
		String query = "UPDATE `tbluser` SET `status`='"+i+"' WHERE id='"+id+"'";
		statement.executeUpdate(query);
		response.sendRedirect("customer.jsp");
	}
	catch(Exception e)
	{
		System.out.print(e);
	}
%>