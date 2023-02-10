<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*, java.io.PrintWriter" %>
	<%
		PrintWriter pw = response.getWriter();
		String Name = request.getParameter("name");
		String Email = request.getParameter("regemail");
		String Password = request.getParameter("regpass");
		String Contact = request.getParameter("contact");
		String user = "customer";
		int con = Contact.length();
		int pas = Password.length();
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
			if(con == 10)
			{
				if(pas >= 8)
				{
					Statement statement = connection.createStatement(); 
					String query = "insert into tbluser(`name`,`email`,`password`,`contact`, `user`) values ('"+Name+"','"+Email+"','"+Password+"','"+Contact+"','"+user+"')";
					statement.executeUpdate(query);
					session.setAttribute("csesemail", Email);
					response.sendRedirect("cust.jsp");
				}
				else
				{
					pw.print("<script> alert('Password must be of 8 or more characters.'); </script>");
				}
			}
			else
			{
				pw.print("<script> alert('Enter proper Contact Details.'); </script>");
			}
		}
		catch(Exception e){
			System.out.print(e);
		}
		
	
	%>

</body>
</html>