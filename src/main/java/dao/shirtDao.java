package dao;

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
}
