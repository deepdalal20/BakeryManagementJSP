<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="loginstyle.css">
    <title> OTP Verification</title>
</head>
<body>
    <center>
        <a href="index.jsp"> <img class="btn"  src="seewans.png" alt="" width="72" height="57"> </a>
        <h1 style="color: white;"> Seewans Bakery </h1>
    </center>
    <div class="container">
        <div class="forms">
            <div class="form login">
                <span class="title">OTP for Registration</span>
                <form action="" method="post">
                <div class="input-field">
                    <input type="text" placeholder="Enter your OTP" name="fotp" required>
                    <i class="uil uil-envelope icon"></i>
                </div>
                <div class="input-field button">
                        <input type="submit" value="Verify OTP" name="vpass">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%
    	String btn = request.getParameter("vpass");
    	if(btn != null)
    	{
    		String sotp = request.getSession().getAttribute("OTP").toString();
    		String eotp = request.getParameter("fotp");
    		if(sotp.equals(eotp))
    		{
    			response.sendRedirect("newpass.jsp");
    		}
    		else
    		{
    			/* out.println("<div style='padding: 5px;\r\n"
						+ "                                    background-color: #ffffb3;\r\n"
						+ "                                    color: black;\r\n"
						+ "                                    height: 25px'>\r\n"
						+ "                                        <center>Invalid Email Id type</center>\r\n"
						+ "                                    </div>");
				RequestDispatcher rd = request.getRequestDispatcher("fpotpverify.jsp");
				rd.include(request, response); */
    		}
    	}
    %>
    </body>
</html>