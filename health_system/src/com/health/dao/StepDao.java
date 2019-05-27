package com.health.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.health.entity.Step;
import com.health.utils.DBUtils;

public class StepDao {
	public ArrayList<Step> findStepById(int id) {

		ArrayList<Step> array = new ArrayList<Step>();
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "select * from step where id='"+id+"' order by date desc limit 7";
			pst = DBUtils.getPst(conn, sql);
			rs = pst.executeQuery();
			while (rs.next()) {
//				int sid = rs.getInt(1);
				int step = rs.getInt(2);
				String date = rs.getString(3);

				Step s = new Step();
				s.setId(id);
				s.setStep(step);
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
