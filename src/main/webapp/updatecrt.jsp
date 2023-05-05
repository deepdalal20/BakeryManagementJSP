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
<%@ page import="java.sql.*, java.io.PrintWriter, java.time.LocalDateTime, java.time.format.DateTimeFormatter, jakarta.servlet.http.Cookie" %>
<%
	String crid = request.getParameter("cart_id");
	String qty = request.getParameter("cart_quantity");
	String pid = request.getParameter("product_id");
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
		Statement statement = connection.createStatement();
		
		String q4 = "Select * from tblstock where p_id = '"+pid+"'";
		ResultSet set2 = statement.executeQuery(q4);
		if(set2.next())
		{
			String st = set2.getString("avl_stock");
			int q = Integer.parseInt(qty);
			int s = Integer.parseInt(st);
			if(q > s)
			{
				Cookie uperr = new Cookie("uperr","Enough_Quantity_not_available");
				uperr.setMaxAge(10);
				response.addCookie(uperr);
				response.sendRedirect("cart.jsp");
			}
			else
			{
				String query = "update tblcart set crt_qty = '"+qty+"' where crt_id = '"+crid+"'";
				statement.executeUpdate(query);
				response.sendRedirect("cart.jsp");
			}
		}
	}
	catch(Exception e)
	{
		System.out.print(e);
	}
%>