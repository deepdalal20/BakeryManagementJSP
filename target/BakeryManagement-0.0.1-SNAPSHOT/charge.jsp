<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.razorpay.*, org.json.*" %>
<%
    String amount = request.getParameter("amount");
    String email = request.getParameter("email");

    RazorpayClient razorpayClient = new RazorpayClient("rzp_test_S0Vuhi4Ie4sANs", "ITG4WKiRkw8xWThDU1wk4muo");

    try {
        JSONObject options = new JSONObject();
        options.put("amount", amount);
        options.put("currency", "INR");
        options.put("receipt", "order_rcptid_11");
        options.put("payment_capture", "1");
        options.put("notes", new JSONObject().put("email", email));

        Order order = razorpayClient.Orders.orderCreate(options);

        String orderId = order.get("id").toString();
        response.sendRedirect("https://checkout.razorpay.com/v1/payment?order_id=" + orderId);

    } catch (RazorpayException e) {
        // Handle the exception
        out.println("Error: " + e.getMessage());
    }
%>