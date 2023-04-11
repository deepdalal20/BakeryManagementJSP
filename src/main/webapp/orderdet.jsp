<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.PrintWriter, java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String ses = (String)session.getAttribute("csesid");
if(ses == null)
{
	response.sendRedirect("login.jsp");
}

String paymentId = request.getParameter("razorpay_payment_id");
session.setAttribute("payment", paymentId);


DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
String date = LocalDateTime.now().format(formatter);

String name = (String)session.getAttribute("oname");
String email = (String)session.getAttribute("oemail");
String add = (String)session.getAttribute("oadd");
String city = (String)session.getAttribute("ocity");
String state = (String)session.getAttribute("ostate");
String pin = (String)session.getAttribute("opincode");
int gt = (int)session.getAttribute("gtotal");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
Statement statement = connection.createStatement(); 
String ins = "INSERT INTO `tblorderdetail`(`u_id`, `od_name`, `od_email`, `od_address`, `od_city`, `od_state`, `od_pin`, `od_total`, `od_pay`, `od_date`) VALUES ('"+ses+"', '"+name+"', '"+email+"', '"+add+"', '"+city+"', '"+state+"', '"+pin+"', '"+gt+"', '"+paymentId+"', '"+date+"')";
int i = statement.executeUpdate(ins);
if(i > 0)
{
	session.removeAttribute("oname");
	session.removeAttribute("oemail");
	session.removeAttribute("oadd");
	session.removeAttribute("ocity");
	session.removeAttribute("ostate");
	session.removeAttribute("opincode");
	session.removeAttribute("gtotal");
	response.sendRedirect("copyord.jsp");
}
else
{
	out.print("Something went wrong");
}
%>