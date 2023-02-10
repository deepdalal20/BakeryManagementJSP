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
    <title> Login </title>
</head>
<body>
    <center>
        <a href="index.jsp"> <img class="btn"  src="Images/seewans.png" alt="" width="72" height="57"> </a>
        <h1 style="color: white;"> Seewans Bakery </h1>
    </center>
    <div class="container">
        <div class="forms">
            <div class="form login">
                <span class="title">Login</span>
                <form action="" method="post">
                    <div class="input-field">
                        <input type="email" placeholder="Enter your email" name="logemail" required>
                        <i class="uil uil-envelope icon"></i>
                    </div>
                    <div class="input-field">
                        <input type="password" class="password" placeholder="Enter your password" name="logpass" required>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePw"></i>
                    </div>
                    <div class="checkbox-text">
                        <div class="checkbox-content">
                            <input type="checkbox" id="logCheck">
                            <label for="logCheck" class="text" name="reme">Remember me</label>
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
					
					if(Email.equals(em) && Password.equals(ps))
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
							session.setAttribute("csesid", id);
							session.setAttribute("csesname", name);
							session.setAttribute("csesemail", em);
							session.setAttribute("csescon", cont);
							session.setAttribute("csesuser", user);
							response.sendRedirect("cust.jsp");
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
			catch(Exception e){
				System.out.print(e);
			}
		}
	%>
    </body>
</html>