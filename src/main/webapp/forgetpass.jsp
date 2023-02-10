<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	    	if(errmsg!=null)
		    {
		    	out.println("<script>alert('" + errmsg + "')</script>");
		    }
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
    </body>
</html>