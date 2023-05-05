package BMS;

import java.sql.*;

public class DataCon {
	public static Connection con = null;
	public static Statement st = null;
	public static ResultSet rs = null;
	
	DataCon()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
			Statement statement = connection.createStatement();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
