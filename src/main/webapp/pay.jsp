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
<html>
    <head>
        <title>
            Razor Pay
        </title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="loginstyle.css">
        <style>
		button{
		  background-color: #fa9200;
		  border: none;
		  color: white;
		  padding: 10px 20px;
		  text-decoration: none;
		  margin: 4px 2px;
		  cursor: pointer;
		  border-radius: 25px;
		}
		</style>
    </head>
    <body>
        <div>
            <a href="cust.jsp"> <img class="btn"  src="seewans.png" alt="" width="72" height="57"> </a>
            <h1 style="color: white;"> Seewans Bakery </h1>
        </div>
	<button id="rzp-button1" name="rzp-button1" class="submit-btn">Proceed to pay </button>
</body>

<%@ page import="com.razorpay.*, org.json.*" %>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script> 
	var xhttp = new XMLHttpRequest();
	var RazorpayOrderId;
	function CreateOrderID()
	{
		xhttp.open("GET","OrderCreation",false);
		http.send();
		Razorpay0rderId = http.responseText;
		OpenCheckout();
	}
</script>
<script>
var options = {
    "key": "rzp_test_LAhxaIRUlCXDBh", // Enter the Key ID generated from the Dashboard
    "amount": "<%out.print(a);%>", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "Seewans",
    "description": "Test Transaction",
    "image": "seewans.png",
    "order_id": RazorpayOrderId, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    "callback_url": "orderdet.jsp",
    "prefill": {
        "name": "<%out.print(name);%>",
        "email": "<%out.print(em);%>",
        "contact": "<%out.print(con);%>"
    },
    "notes": {
        "address": "Razorpay Corporate Office"
    },
    "theme": {
        "color": "#3399cc"
    }
};
var rzp1 = new Razorpay(options);
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}
</script>
</html>


