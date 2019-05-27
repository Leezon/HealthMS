package com.health.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.health.entity.Sleep;
import com.health.utils.DBUtils;

public class SleepDao {
	public ArrayList<Sleep> findSleepById(int id) {

		ArrayList<Sleep> array = new ArrayList<Sleep>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from sleep where id='"+id+"' order by date desc limit 7";
			pst = DBUtils.getPst(conn, sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				int ssleep = rs.getInt(2);
				int dsleep = rs.getInt(3);
				int awake = rs.getInt(4);
				String date = rs.getString(5);

				Sleep s = new Sleep();
				s.setId(id);
				s.setSsleep(ssleep);
				s.setDsleep(dsleep);
				s.setAwake(awake);
				s.setDate(date);

				array.add(s);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(rs, pst, conn);
		}

		return array;

	}


}
