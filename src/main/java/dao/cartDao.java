package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import beans.cart;
import beans.cartDetail;
import beans.shirt;
import services.connectDB;

public class cartDao {
	public static List<cart> DSCart(int id) {
		Connection db = connectDB.DB();
		try {
			List<cart> list = new ArrayList<cart>();
			String query = "select * from Cart where userId="+id;
			Statement state = db.createStatement();
			ResultSet rs =state.executeQuery(query);
			while(rs.next()) {
				list.add(new cart(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5)));
			}
			db.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public static List<cartDetail> DsCartDetail(int id) {
		Connection db = connectDB.DB();
		try {
			List<cartDetail> list = new ArrayList<cartDetail>();
			String query = "select * from Cart join shirt on shirtId = shirt.id where userId="+id;
			Statement state = db.createStatement();
			ResultSet rs =state.executeQuery(query);
			while(rs.next()) {
				list.add(new cartDetail(new cart(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5)), new shirt(rs.getInt(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10), rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getInt(15))));
			}
			db.close();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public static boolean AddToCart(cart item) {
		String sql = "{call sp_AddToCart(?, ?, ?, ?)}";
		Connection db = connectDB.DB();
		try {
			CallableStatement statement = db.prepareCall(sql);
			statement.setInt(1, item.getUid());
            statement.setInt(2, item.getShirtId());
            statement.setInt(3, item.getQuantity());
            statement.setString(4, item.getSize());
            statement.execute();
            db.close();
            return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public static boolean RemoveFromCart(int id) {
		String sql = "{call sp_RemoveFromCart(?)}";
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
	
	public static boolean Update(int idcart,int quantity, String size) {
		String sql = "{call sp_RemoveFromCart(?)}";
		Connection db = connectDB.DB();
		try {
			String query = "update Cart set quantity = ? ,size = ? where cartId = ? ";
			PreparedStatement state = db.prepareStatement(query);
			state.setInt(1, quantity);
			state.setString(2, size);
			state.setInt(3, idcart);
			state.execute();
            db.close();
            return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
}
