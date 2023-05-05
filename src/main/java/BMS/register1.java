package BMS;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.*;
import BMS.Encrypt;

public class register1 extends HttpServlet 
{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		doGet(req, res);
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		try 
		{
			Encrypt e = new Encrypt();
			String Name = req.getParameter("name");
			String Email = req.getParameter("regemail");
			String Password = req.getParameter("regpass");
			String Contact = req.getParameter("contact");
			String hashpass = e.EncryptPassword(Password);
			String user = "customer";
			String status = "active";
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
			String date = LocalDateTime.now().format(formatter);
			
			DataCon dc = new DataCon();
			res.setContentType("text/html");
			PrintWriter out = res.getWriter();
			out.println("<link rel='shortout icon' type='image/x-icon' href='seewans.png'>");
			
			Cookie rname = new Cookie("rname", Name);
			Cookie remail = new Cookie("remail", Email);
			Cookie rpass = new Cookie("rpass", Password);
			Cookie rcon = new Cookie("rcon", Contact);
			Cookie ruser = new Cookie("ruser", user);
			Cookie rstatus = new Cookie("rstatus", status);
			Cookie rhash = new Cookie("rhash", hashpass);
			rname.setMaxAge(60);
			remail.setMaxAge(60);
			rpass.setMaxAge(60);
			rcon.setMaxAge(60);
			ruser.setMaxAge(60);
			rstatus.setMaxAge(60);
			rhash.setMaxAge(60);
			res.addCookie(rname);
			res.addCookie(remail);
			res.addCookie(rpass);
			res.addCookie(rcon);
			res.addCookie(ruser);
			res.addCookie(rstatus);
			res.addCookie(rhash);
			if(Name != null && Email != null && Password != null && Contact != null && user != null && status != null)
			{
				if(Password.length() >= 8)
				{
						String regex = "^(.+)@(.+)$";
						Pattern pattern = Pattern.compile(regex);
						Matcher matcher = pattern.matcher((CharSequence)Email);
						if(matcher.matches())
						{
							if(Contact.length() >= 10)
							{
							regex = "(0/91)?[0-9][0-9]{9}";
							pattern = Pattern.compile(regex);
							matcher = pattern.matcher((CharSequence)Contact);
								if(matcher.matches())
								{
									if(Contact.substring(0,1).equals("6") || Contact.substring(0,1).equals("7") || Contact.substring(0,1).equals("8") || Contact.substring(0,1).equals("9"))
									{
										Cookie rname1 = new Cookie("rname1", Name);
										Cookie remail1 = new Cookie("remail1", Email);
										Cookie rpass1 = new Cookie("rpass1", Password);
										Cookie rcon1 = new Cookie("rcon1", Contact);
										Cookie ruser1 = new Cookie("ruser1", user);
										Cookie rstatus1 = new Cookie("rstatus1", status);
										Cookie rhash1 = new Cookie("rhash1", hashpass);
										rname1.setMaxAge(60);
										remail1.setMaxAge(60);
										rpass1.setMaxAge(60);
										rcon1.setMaxAge(60);
										ruser1.setMaxAge(60);
										rstatus1.setMaxAge(60);
										rhash1.setMaxAge(60);
										res.addCookie(rname1);
										res.addCookie(remail1);
										res.addCookie(rpass1);
										res.addCookie(rcon1);
										res.addCookie(ruser1);
										res.addCookie(rstatus1);
										res.addCookie(rhash1);
										
										String query = "select email from tbluser where email = '"+Email+"'";
										dc.rs = dc.st.executeQuery(query);
										int flag = 0;
										while(dc.rs.next())
										{
											if(Email.equals(DataCon.rs.getString("Email")))
											{
												flag = 1;
											}
										}
										if(flag == 0)
										{
											int min = 100000;
											int max = 999999;
											int range = max - min + 1;
											int otp = (int)(Math.random() * range) + min;
											HttpSession session = req.getSession();
											session.setAttribute("OTP", otp);
											
											String to = Email;
											String subject = "OTP for Email verification";
											String Body = "Thank you for connecting with us. Your OTP is: " + otp;
											
											if(SendMail.Sendmail(to, subject, Body))
											{
												res.sendRedirect("rotpverify.jsp");
											}
											else
											{
												out.println("<div style='padding: 5px;\r\n"
												+ "                                    background-color: #ffffb3;\r\n"
												+ "                                    color: black;\r\n"
												+ "                                    height: 25px'>\r\n"
												+ "                                        <center>OTP not sent!!please check your internet connection</center>\r\n"
												+ "                                    </div>");
												RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
												rd.include(req, res);
											}
										}
										else
										{
											out.println("<div style='padding: 5px;\r\n"
											+ "                                    background-color: #ffffb3;\r\n"
											+ "                                    color: black;\r\n"
											+ "                                    height: 25px'>\r\n"
											+ "                                        <center>This Email Id already exist!!</center>\r\n"
											+ "                                    </div>");
											RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
											rd.include(req, res);
										}
									}
									else
									{
										out.println("<div style='padding: 5px;\r\n"
										+ "                                    background-color: #ffffb3;\r\n"
										+ "                                    color: black;\r\n"
										+ "                                    height: 25px'>\r\n"
										+ "                                        <center>Enter valid Contact No</center>\r\n"
										+ "                                    </div>");
										RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
										rd.include(req, res);
									}
								}
								else
								{
									out.println("<div style='padding: 5px;\r\n"
									+ "                                    background-color: #ffffb3;\r\n"
									+ "                                    color: black;\r\n"
									+ "                                    height: 25px'>\r\n"
									+ "                                        <center>Enter valid Contact No</center>\r\n"
									+ "                                    </div>");
									RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
									rd.include(req, res);
								}
							}
							else
							{
								out.println("<div style='padding: 5px;\r\n"
								+ "                                    background-color: #ffffb3;\r\n"
								+ "                                    color: black;\r\n"
								+ "                                    height: 25px'>\r\n"
								+ "                                        <center>Enter valid Contact No</center>\r\n"
								+ "                                    </div>");
								RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
								rd.include(req, res);
							}
						}
						else
						{
							out.println("<div style='padding: 5px;\r\n"
							+ "                                    background-color: #ffffb3;\r\n"
							+ "                                    color: black;\r\n"
							+ "                                    height: 25px'>\r\n"
							+ "                                        <center>Enter valid Email Id</center>\r\n"
							+ "                                    </div>");
							RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
							rd.include(req, res);
						}
				}
				else
				{
					out.println("<div style='padding: 5px;\r\n"
					+ "                                    background-color: #ffffb3;\r\n"
					+ "                                    color: black;\r\n"
					+ "                                    height: 25px'>\r\n"
					+ "                                        <center>Password should be eight characters or long</center>\r\n"
					+ "                                    </div>");
					RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
					rd.include(req, res);
				}
			}
			else
			{
				out.println("<div style='padding: 5px;\r\n"
				+ "                                    background-color: #ffffb3;\r\n"
				+ "                                    color: black;\r\n"
				+ "                                    height: 25px'>\r\n"
				+ "                                        <center>Enter all details properly</center>\r\n"
				+ "                                    </div>");
				RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
				rd.include(req, res);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}