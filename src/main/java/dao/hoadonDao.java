package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import beans.chiTietHoaDon;
import beans.hoaDon;
import beans.shirt;
import services.connectDB;

public class hoadonDao {
	public static boolean CheckOut(int userId, String phuongThuc, String diaChi, String tenNguoiNhan, int sdt) {
		String sql = "{call sp_Checkout(?, ?, ?, ?, ?)}";
		Connection db = connectDB.DB();
		try {
			CallableStatement statement = db.prepareCall(sql);
			statement.setInt(1, userId);
            statement.setString(2, phuongThuc);
            statement.setString(3, diaChi);
            statement.setString(4, tenNguoiNhan);
            statement.setInt(5, sdt);
            statement.execute();
            db.close();
            return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public static List<chiTietHoaDon> getListDetail(int idHoaDon) {
		String sql = "{call sp_getListDetail(?)}";
		Connection db = connectDB.DB();
		try {
			CallableStatement statement = db.prepareCall(sql);
			statement.setInt(1, idHoaDon);
            ResultSet rs = statement.executeQuery();
            List<chiTietHoaDon> kq = new ArrayList<chiTietHoaDon>();
            while(rs.next()) {
            	kq.add(new chiTietHoaDon(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getInt(6), new shirt(rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11), rs.getString(12))));
            }
            db.close();
            return kq;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public static List<hoaDon> getListHoaDon(int userId) {
		String sql = "select * from HoaDon where userId = ?";
		Connection db = connectDB.DB();
		try {
			PreparedStatement statement =db.prepareStatement(sql); 
			statement.setInt(1,userId);
            ResultSet rs = statement.executeQuery();
            List<hoaDon> kq = new ArrayList<hoaDon>();
            while(rs.next()) {
            	kq.add(new hoaDon(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getString(5), rs.getString(6),rs.getInt(7),rs.getString(8), getListDetail(rs.getInt(1))));
            }
            db.close();
            return kq;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
