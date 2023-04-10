package BMS;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.json.*;
import com.razorpay.*;

public class OrderCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCreation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer gt = (Integer)session.getAttribute("gtotal");
		int a = gt * 1000;
		
		RazorpayClient client = null;
		String orderId = null;
		
		try 
		{
			client = new RazorpayClient("rzp_test_LAhxaIRUlCXDBh", "6UsSqlHWZ2WkMdDj7axZZZGj");
			JSONObject options = new JSONObject();
			options.put("amount", a);
			options.put("currency", "INR");
			options.put("receipt","zxr456");
			options.put("payment_capture", true);
			Order order = client.orders.create(options);
			orderId = order.get ("id");			
		} 
		catch (RazorpayException e) 
		{
			e.printStackTrace() ;
		}
		response.getWriter().append(orderId);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RazorpayClient c = null;
		try
		{
			String paymentid = request.getParameter("razorpay_payment_id");
			String orderid = request.getParameter("razorpay_order_id");
			String sign = request.getParameter("razorpay_signature");
			c = new RazorpayClient("rzp_test_LAhxaIRUlCXDBh", "6UsSqlHWZ2WkMdDj7axZZZGj");
			JSONObject options = new JSONObject();
			options.put("razorpay_payment_id",paymentid);
			options.put("razorpay_order_id",orderid);
			options.put("razorpay_signature",sign);
			
			boolean sig = Utils.verifyPaymentSignature(options, "6UsSqlHWZ2WkMdDj7axZZZGj");
			if(sig)
			{
				response.getWriter().append("Success");
			}
			else
			{
				response.getWriter().append("Fail");
			}
		}
		catch(RazorpayException e)
		{
			e.printStackTrace();
		}
		
	}
}
