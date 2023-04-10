<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String chemail = request.getSession().getAttribute("chemail").toString();
	if(chemail == null)
	{
		response.sendRedirect("login.jsp");
	}
%>
    <%
    	Cookie[] c = request.getCookies();
    String errmsg = null;
    
    if(c != null)
    {
    	for(Cookie cookie : c)
    	{
    		if(cookie.getName().equals("errmsg"))
    		{
    			errmsg = cookie.getValue().toString();
    		}
    	}
    }
    
    if(errmsg!=null)
    {
    	out.println("<script>alert(" + errmsg + ")</script>");
    }
    %>
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
    <center>
        <a href="index.jsp"> <img class="btn"  src="seewans.png" alt="" width="72" height="57"> </a>
        <h1 style="color: white;"> Seewans Bakery </h1>
    </center>
    <div class="container">
        <div class="forms">
            <div class="form login">
                <span class="title">Forgot Password</span>
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
    <script>
        const container = document.querySelector(".container"),
            pwShowHide = document.querySelectorAll(".showHidePw"),
            pwFields = document.querySelectorAll(".password");

        pwShowHide.forEach(eyeIcon =>{
        eyeIcon.addEventListener("click", ()=>{
            pwFields.forEach(pwField =>{
                if(pwField.type ==="password"){
                    pwField.type = "text";

                    pwShowHide.forEach(icon =>{
                        icon.classList.replace("uil-eye-slash", "uil-eye");
                    })
                }else{
                    pwField.type = "password";

                    pwShowHide.forEach(icon =>{
                        icon.classList.replace("uil-eye", "uil-eye-slash");
                    })
                }
            }) 
        })
    })
    </script>
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