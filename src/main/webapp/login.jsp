<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="BMS.Encrypt" %>
<%! Encrypt e = new Encrypt(); %>
<%
	Cookie[] cookies=request.getCookies();
	String userName = "", password = "";
	if (cookies != null) {
	     for (Cookie cookie : cookies) {
	       if(cookie.getName().equals("RemId")) {
	         userName = cookie.getValue();
	       }
	       if(cookie.getName().equals("RemPass")){
	         password = cookie.getValue();
	       }
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
    <title> Login </title>
</head>
<body>
    <center>
        <a href="index.jsp"> <img class="btn"  src="seewans.png" alt="" width="72" height="57"> </a>
        <h1 style="color: white;"> Seewans Bakery </h1>
    </center>
    <div class="container">
        <div class="forms">
            <div class="form login">
                <span class="title">Login</span>
                <form action="" method="post">
                    <div class="input-field">
                        <input type="email" value="<%=userName%>" placeholder="Enter your email" name="logemail" required>
                        <i class="uil uil-envelope icon"></i>
                    </div>
                    <div class="input-field">
                        <input type="password" class="password" value="<%=password%>"placeholder="Enter your password" name="logpass" required>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePw"></i>
                    </div>
                    <div class="checkbox-text">
                        <div class="checkbox-content">
                            <input type="checkbox" id="logCheck" name="reme">
                            <label for="logCheck" class="text">Remember me</label>
                        </div>
                        <a href="forgetpass.jsp" class="text">Forgot password?</a>
                    </div>
                    <div class="input-field button">
                        <input type="submit" value="Login" name="logsub">
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
    <%@ page import="java.sql.*, java.io.PrintWriter" %>
	<%
	
		String btn = request.getParameter("logsub");
	
		if(btn != null)
		{
			PrintWriter pw = response.getWriter();
			String Email = request.getParameter("logemail");
			String Password = request.getParameter("logpass");
			String reme = request.getParameter("reme");
			String hashpass = e.EncryptPassword(Password);
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
				Statement statement = connection.createStatement();
				String query = "select * from tbluser where email = '"+Email+"'";
				ResultSet set = statement.executeQuery(query);
				if(set.next())
				{
					String em = set.getString("email");
					String ps = set.getString("password");
					String status = set.getString("status");
					String st = "active";
					if(Email.equals(em) && hashpass.equals(ps))
					{
						if(status.equals(st))
						{
							String id = set.getString("id");
							String name = set.getString("name");
							String cont = set.getString("contact");
							String user = set.getString("user");
							
							if(user.equals("admin"))
							{
								session.setAttribute("asesid", id);
								session.setAttribute("asesname", name);
								session.setAttribute("asesemail", em);
								session.setAttribute("asescon", cont);
								session.setAttribute("asesuser", user);
								response.sendRedirect("admin.jsp");
							}
							else
							{
								if(reme != null)
								{
									session.setAttribute("csesid", id);
									session.setAttribute("csesname", name);
									session.setAttribute("csesemail", em);
									session.setAttribute("csescon", cont);
									session.setAttribute("csesuser", user);																		
									Cookie Remid = new Cookie("RemId", Email);
									Cookie Rempass = new Cookie("RemPass", Password);
									Remid.setMaxAge(60*60*1);
									Rempass.setMaxAge(60*60*1);
									response.addCookie(Remid);
									response.addCookie(Rempass);
							
									response.sendRedirect("cust.jsp");
								}
								else
								{
									session.setAttribute("csesid", id);
									session.setAttribute("csesname", name);
									session.setAttribute("csesemail", em);
									session.setAttribute("csescon", cont);
									session.setAttribute("csesuser", user);
									response.sendRedirect("cust.jsp");
								}
							}
						}
						else
						{
							pw.print("<script> alert('Your account is inactive'); </script>");
						}
					}
					else
					{
						pw.print("<script> alert('Wrong Email or Password!!'); </script>");
					}
				}
				else
				{
					pw.print("<script> alert('User not found!!'); </script>");
				}
			}
			catch(Exception x){
				System.out.print(x);
			}
		}
	%>
    </body>
</html>