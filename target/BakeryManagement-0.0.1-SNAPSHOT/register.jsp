<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.security.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Base64" %>
<%@page import="java.util.*" %>
<%@ page import="BMS.Encrypt" %>
<%! Encrypt e = new Encrypt(); %>
<html>
    <head>
        <link rel="stylesheet" href="form_style.css">
        <title> Register </title>
    </head>
    <body>
<div class="banner">
    <center>
        <a href="index.jsp"> <img class="btn"  src="seewans.png" width="72" height="57"> </a>
        <h1 style="color: white;">Seewans Bakery</h1>
    </center>
        <div class="container">
            <div class="card">
                <div class="inner-box" id="card">
                    <div class="card-front">
                        <h2>REGISTER</h2>
                        <form action="" method="post">
                            <input type="text" class="input-box" placeholder="Name" name="name" required>
                            <input type="email" placeholder="Email" class="input-box" name="regemail" required>
                            <input type="password" class="input-box" placeholder="Password" name="regpass" required>
                            <input type="int" class="input-box" placeholder="Contact Number" name="contact" required>
                            <button type="submit" class="submit-btn" name="submit">Submit</button>
                        </form>
                        <a href="login.jsp"><button type="button" class="btn">I've an account</button></a>
                    </div> 
                </div>
            </div>
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    <script src="https://kit.fontawesome.com/81448a00ad.js" crossorigin="anonymous"></script>
    <%@ page import="java.sql.*, java.io.PrintWriter, java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
	<%
		PrintWriter pw = response.getWriter();
		String btn = request.getParameter("submit");
		
		String Name = request.getParameter("name");
		String Email = request.getParameter("regemail");
		String Password = request.getParameter("regpass");
		String Contact = request.getParameter("contact");
		
		if(btn != null)
		{
			String hashpass = e.EncryptPassword(Password);
		try
		{
			
			String user = "customer";
			String status = "active";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
			String date = LocalDateTime.now().format(formatter);
			int con = Contact.length();
			int pas = Password.length();
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
			Statement statement = connection.createStatement(); 
			String query1 = "select email from tbluser where email = '"+Email+"'";
			ResultSet set = statement.executeQuery(query1);
			if(set.next())
			{
				pw.print("<script> alert('Email already exists'); </script>");
			}
			else
			{
				if(con == 10)
				{
					if(pas >= 8)
					{
						
						String query = "insert into tbluser(`name`,`email`,`password`,`contact`, `user`, `status`, `date`) values ('"+Name+"','"+Email+"','"+hashpass+"','"+Contact+"','"+user+"', '"+status+"','"+date+"')";
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
		}
		catch(Exception x){
			System.out.print(x);
		}
		}
	%>
    </body>
</html>