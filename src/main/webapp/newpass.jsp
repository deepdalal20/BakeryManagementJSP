<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String chemail = request.getSession().getAttribute("chemail").toString();
	if(chemail == null)
	{
		response.sendRedirect("login.jsp");
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
                        <input type="password" class="password" placeholder="Enter new password" name="fpass1" required>
                        <i class="uil uil-lock icon"></i>
                    </div>
                    <div class="input-field">
                        <input type="password" class="password" placeholder="Confirm new password" name="confpass" required>
                        <i class="uil uil-lock icon"></i>
                        <i class="uil uil-eye-slash showHidePw"></i>
                    </div>
                    <div class="input-field button">
                        <input type="submit" value="Reset Password" name="fpass">
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
    <%@ page import="java.sql.*, java.io.*" %>
	<%
	
		String btn = request.getParameter("fpass");
		String npass = request.getParameter("fpass1");
		String cpass = request.getParameter("confpass");
		out.print(npass);
		out.print(btn);
		out.print(cpass);
		if(btn != null)
		{		
			try
			{
				PrintWriter pw = response.getWriter();
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
				Statement statement = connection.createStatement();
				String query = "select * from tbluser where email = '"+chemail+"'";
				ResultSet set = statement.executeQuery(query);
				if(set.next())
				{
					String ps = set.getString("password");
					if(npass.equals(cpass))
					{
						int pas = npass.length();
						int pas1 = cpass.length();
						if(pas >= 8 && pas1 >= 8)
						{
							String query1 = "UPDATE `tbluser` SET `password`='"+npass+"' WHERE email = '"+chemail+"'";
							statement.executeUpdate(query1);
							response.sendRedirect("login.jsp");
						}
						else
						{
							pw.print("<script> alert('Enter New password with atleast 8 characters'); </script>");
						}
					}
					else
					{
						pw.print("<script> alert('New Password and Confirm Password doesn't match'); </script>");
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
		else
		{
			out.print("Button not clicked");
		}
	%>
    </body>
</html>