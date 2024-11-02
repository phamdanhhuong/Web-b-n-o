package dao;

import java.sql.CallableStatement;
import java.sql.Connection;

import services.connectDB;

public class hoadonDao {
	public static boolean CheckOut(int userId, String phuongThuc, String diaChi) {
		String sql = "{call sp_Checkout(?, ?, ?)}";
		Connection db = connectDB.DB();
		try {
			CallableStatement statement = db.prepareCall(sql);
			statement.setInt(1, userId);
            statement.setString(2, phuongThuc);
            statement.setString(3, diaChi);
            statement.execute();
            db.close();
            return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
}
