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
ResultSet i = null;
Statement statement = null;
Connection connection = null;
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
	statement = connection.createStatement(); 
	System.out.print("start");
	String sel = "SELECT * from tblcart where u_id = '"+ses+"'";
	i = statement.executeQuery(sel);
	while(i.next())
	{
		int pid = i.getInt("p_id");
		int qt = i.getInt("crt_qty");
		System.out.println(pid);
		System.out.println(qt);
		
		Statement st = connection.createStatement(); 
		String psel = "SELECT * from tblstock where p_id = '"+pid+"'";
		ResultSet set = st.executeQuery(psel);
		if(set.next())
		{
			System.out.print("inside");
			int stock = set.getInt("avl_stock");
			
			int n = stock - qt;
			System.out.print(n);
			String up = "UPDATE `tblstock` SET `avl_stock`='"+n+"' WHERE p_id='"+pid+"'";
			st.executeUpdate(up);
		}
	}
	String del = "Delete from tblcart where u_id = '"+ses+"'";
	statement.executeUpdate(del);
	response.sendRedirect("output.jsp");
}
catch(Exception e)
{
	System.out.print(e);
}
finally
{
	try
	{
		i.close();
		statement.close();
		connection.close();
	}
	catch(Exception ex)
	{
		System.out.print(ex);
	}
}
%>