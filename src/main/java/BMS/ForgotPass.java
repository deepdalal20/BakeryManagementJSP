package BMS;
import java.io.*;


import java.sql.*;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ForgotPass extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		res.setContentType("text/html");
		String email = null;
		email = req.getParameter("femail");
		try {
			if(email != null)
			{
				int flag = 0;
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
				Statement statement = connection.createStatement();
				String query = "select email from tbluser";
				ResultSet rs = statement.executeQuery(query);
				
				while(rs.next())
				{
					String cemail = rs.getString("email");
					if(email.equals(cemail))
					{
						flag = 1;
					}
				}
				
				if(flag == 1)
				{
					int min = 100000;
					int max = 999999;
					int range = max - min + 1;
					int otp = (int)(Math.random() * range) + min;
					HttpSession session = req.getSession();
					session.setAttribute("OTP", otp);
					session.setAttribute("chemail", email);
					
					String subject = "OTP for email verification";
					String body = "Your OTP is: " + otp;
					
					if(SendMail.Sendmail(email, subject, body))
					{
						res.sendRedirect("fpotpverify.jsp");
					}
					else
					{
						Cookie errcookie = new Cookie("errcookie","OTP_not_sent!!please_check_internet_connection");
						errcookie.setMaxAge(10);
						res.addCookie(errcookie);
						
						RequestDispatcher rd = req.getRequestDispatcher("forgetpass.jsp");
						rd.forward(req, res);
					}
				}
				else
				{
					Cookie errcookie = new Cookie("errcookie","This_email_id_dosen't_exist_in_our_database");
					errcookie.setMaxAge(10);
					res.addCookie(errcookie);
					
					RequestDispatcher rd = req.getRequestDispatcher("forgetpass.jsp");
					rd.forward(req, res);
				}
			}
			else
			{
				Cookie errcookie = new Cookie("errcookie","please_enter_email_in_the_field");
				errcookie.setMaxAge(10);
				res.addCookie(errcookie);
				
				RequestDispatcher rd = req.getRequestDispatcher("forgetpass.jsp");
				rd.forward(req, res);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
