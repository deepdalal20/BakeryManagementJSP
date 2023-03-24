	package BMS;
import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class SendMail {
	public static boolean Sendmail(String to, String subject, String body)
	{
		boolean flag = false;
		Properties props = new Properties();
		props.put("mail.smtp.auth", true);
		props.put("mail.smtp.starttls.enable", true);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.host", "smtp.gmail.com");
		
		String username = "bakery1management@gmail.com";
		String password = "gfkiovvlfxqfnzzd";
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication()
			{
				return new PasswordAuthentication(username, password);
			}
		});
		
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			message.setText(body);
			
			Transport.send(message);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		  
		return flag;
	}
	
//	public static void main(String[] agrs)
//	{
//		if(Sendmail("20bmiit106@gmail.com", "xya", "abc"))
//		{
//			System.out.println("Send");
//		}
//		else
//		{
//			System.out.println("not send");
//		}
//	}
}