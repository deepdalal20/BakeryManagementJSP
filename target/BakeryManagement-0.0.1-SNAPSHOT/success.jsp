<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.razorpay.*, org.json.*" %>
<%
  String orderId = request.getParameter("razorpay_order_id");
  String paymentId = request.getParameter("razorpay_payment_id");
  String signature = request.getParameter("razorpay_signature");

  RazorpayClient client = new RazorpayClient("key_id", "key_secret");
  JSONObject attributes = new JSONObject();
  attributes.put("razorpay_order_id", orderId);
  attributes.put("razorpay_payment_id", paymentId);
  attributes.put("razorpay_signature", signature);

  try 
  {
    client.Payments.capture(paymentId, attributes);
    // Payment successful, update your database or perform any other necessary actions
    out.println("Payment successful!");
  } catch (RazorpayException e) {
    // Payment failed, handle the error
    out.println("Payment failed: " + e.getMessage());
  }
%>
