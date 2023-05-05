<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.security.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="loginstyle.css">
    <title> Forgot Password</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	String errmsg = "";
	if (cookies != null) {
	     for (Cookie cookie : cookies) {
	       if(cookie.getName().equals("errcookie")) 
	       {
	         errmsg = cookie.getValue();
	         System.out.print(errmsg);
	         out.print("<center><div style='padding: 0px; background-color: orange; color: black; height: 25px; width: 100%; border-radius: 99px'>"+errmsg+"</div></center>");
	       }
	    }
	}
%>
    <center>
        <a href="index.jsp"> <img class="btn"  src="seewans.png" alt="" width="72" height="57"> </a>
        <h1 style="color: white;"> Seewans Bakery </h1>
    </center>
    <div class="container">
        <div class="forms">
            <div class="form login">
                <span class="title">Forgot Password</span>
                <form action="ForgotPassword" method="post">
                <div class="input-field">
                    <input type="email" placeholder="Enter your email" name="femail" required>
                    <i class="uil uil-envelope icon"></i>
                </div>
                <div class="input-field button">
                        <input type="submit" value="Generate OTP" name="fpass">
                    </div>
                </form>
                <div class="login-signup">
                    <span class="text">Not a user?
                        <a href="register.jsp" class="text signup-link">Signup Now</a>
                    </span>
                </div>
            </div>
        </div>
    </div>
    </body>
</html>