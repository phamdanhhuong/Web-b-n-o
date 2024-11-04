package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectDB {
	public static Connection DB () {
		Connection con = null;
		String username = "sa";
        String password = "12345";
        String nameDatabase ="WebBanAo";
        String url = "jdbc:sqlserver://LAPTOP-PPR9IB31:1433;databaseName="+nameDatabase+";encrypt=false";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			con = DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
		} 	
		return con;
	} 
}
