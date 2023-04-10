<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.PrintWriter" %>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String ses = (String)session.getAttribute("csesid");
if(ses == null)
{
	response.sendRedirect("login.jsp");
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
Statement statement = connection.createStatement(); 
String ins = "INSERT INTO tblord SELECT * FROM tblcart where u_id ='"+ses+"'";
statement.executeUpdate(ins);
response.sendRedirect("clearcrt1.jsp");
%>