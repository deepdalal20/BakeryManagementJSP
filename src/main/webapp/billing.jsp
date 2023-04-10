<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String ses = (String)session.getAttribute("csesid");
	if(ses == null)
	{
		response.sendRedirect("login.jsp");
	}
	
	String em = (String)session.getAttribute("csesemail");
	String name = (String)session.getAttribute("csesname");
	String con = (String)session.getAttribute("csescon");
	int gt = (int)session.getAttribute("gtotal");
	if(gt == 0)
	{
		response.sendRedirect("cart.jsp");
	}
	int a = gt * 100;
	
%>
<%@ page import="java.sql.*, java.io.PrintWriter, java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Shipping Details Page </title>
    <!-- custom css file link  -->
    <link rel="stylesheet" href="billstyle.css">

</head>
<body>

<div class="container">

    <form action="" method="post">

        <div class="row">

            <div class="col">

                <h3 class="title">Shipping Details</h3>

                <div class="inputBox">
                    <span>full name :</span>
                    <input type="text" value="<%=name%>" name="bname" required>
                </div>
                <div class="inputBox">
                    <span>email :</span>
                    <input type="email" value="<%=em%>" name="bemail" required>
                </div>
                <div class="inputBox">
                    <span>address :</span>
                    <input type="text" placeholder="room - street - locality" name="baddress" required>
                </div>
                <div class="inputBox">
                    <span>city :</span>
                    <input type="text" placeholder="mumbai" name="bcity" required>
                </div>

                <div class="flex">
                    <div class="inputBox">
                        <span>state :</span>
                        <input type="text" placeholder="india" name="bstate" required>
                    </div>
                    <div class="inputBox">
                        <span>Pin code :</span>
                        <input type="text" placeholder="123 456" name="pincode" required>
                    </div>
                </div>
            </div>

        </div>
	  	<input type="submit" name="rzp-button1" class="submit-btn" value="Proceed to pay">
    </form>
    <%
	    String btn = request.getParameter("rzp-button1");
	    if(btn != null)
	    {
		    session.setAttribute("oname", request.getParameter("bname"));
		    session.setAttribute("oemail", request.getParameter("bemail"));
		    session.setAttribute("oadd", request.getParameter("baddress"));
		    session.setAttribute("ocity", request.getParameter("bcity"));
		    session.setAttribute("ostate", request.getParameter("bstate"));
	    	session.setAttribute("opincode", request.getParameter("pincode"));	
	  		//System.out.print("Sessionss");
	  		response.sendRedirect("pay.jsp");
	    }
    %>
</div>    
</body>
</html>