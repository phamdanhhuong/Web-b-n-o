package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import beans.account;
import services.connectDB;

public class accountDao {
	public static boolean Login(String uname, String pw) {
		Connection db  = connectDB.DB();		
		try {
			String query = "{call sp_Login(?,?)}";
			CallableStatement state = db.prepareCall(query);
			state.setString(1, uname);
			state.setString(2, pw);
			ResultSet rs = state.executeQuery();
			if(rs.next()) {
				acc = new account(rs.getInt(1), rs.getInt(2));
				db.close();
				return true;
			}
			db.close();
			return false;
		} catch (Exception e) {
			
		}
		return false;
	}
	public static boolean Register(String uname, String pw) {
		Connection db  = connectDB.DB();		
		try {
			String query = "{call sp_CreateAccount(?,?)}";
			CallableStatement state = db.prepareCall(query);
			state.setString(1, uname);
			state.setString(2, pw);
			state.execute();
			db.close();
			return true;
		} catch (Exception e) {
			System.out.println("Lỗi từ SQL Server: " + e.getMessage());
		}
		return false;
	}
	public static account acc = null;
}
