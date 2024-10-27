package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.shirt;
import services.connectDB;

public class shirtDao {
	public static List<shirt> LayDS() {
		Connection db = connectDB.DB();
		try {
			List<shirt> list = new ArrayList<shirt>();
			String query = "select * from shirt";
			Statement state = db.createStatement();
			ResultSet rs =state.executeQuery(query);
			while(rs.next()) {
				list.add(new shirt(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
			}
			db.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public static boolean AddShirt(shirt item) {
		String sql = "{call sp_InsertShirt(?, ?, ?, ?, ?)}";
		Connection db = connectDB.DB();
		try {
			CallableStatement statement = db.prepareCall(sql);
			statement.setString(1, item.getTen());
            statement.setString(2, item.getLink());
            statement.setString(3, item.getMota());
            statement.setInt(4, item.getGia());
            statement.setString(5, item.getLoai());
            statement.execute();
            db.close();
            return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public static boolean UpdateShirt(shirt item) {
		String sql = "{call sp_UpdateShirt(?, ?, ?, ?, ?, ?)}";
		Connection db = connectDB.DB();
		try {
			CallableStatement statement = db.prepareCall(sql);
			statement.setInt(1, item.getId());
            statement.setString(2, item.getTen());
            statement.setString(3, item.getLink());
            statement.setString(4, item.getMota());
            statement.setInt(5, item.getGia());
            statement.setString(6, item.getLoai());
            statement.execute();
            db.close();
            return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	public static boolean DeleteShirt(int id) {
		String sql = "{call sp_DeleteShirt(?)}";
		Connection db = connectDB.DB();
		try {
			CallableStatement statement = db.prepareCall(sql);
			statement.setInt(1, id);
            statement.execute();
            db.close();
            return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public static shirt LayItemTheoID(int id) {
		Connection db = connectDB.DB();
		try {
			shirt item = null;
			String query = "select * from shirt where id="+id;
			Statement state = db.createStatement();
			ResultSet rs =state.executeQuery(query);
			if(rs.next()) {
				item = new shirt(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6));
			}
			db.close();
			return item;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
