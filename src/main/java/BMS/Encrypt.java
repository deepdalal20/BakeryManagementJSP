package BMS;


import java.security.*;

public class Encrypt {
	public static String EncryptPassword(String pass) throws NoSuchAlgorithmException
	{
		MessageDigest m = MessageDigest.getInstance("MD5");
		m.update(pass.getBytes());
		
		byte[] bytes = m.digest();
		
		StringBuilder s = new StringBuilder();
		
		for(int i=0; i<bytes.length; i++)
		{
			s.append(Integer.toString((bytes[i]&0xff) + 0x100, 16).substring(1));
		}
		
		return s.toString();
	}
	
	/*public static void main(String[] args) throws NoSuchAlgorithmException
	{
		System.out.println(EncryptPassword("Shivam"));
	}*/
}
