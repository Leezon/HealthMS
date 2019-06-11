package com.health.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.health.entity.User;
import com.health.utils.DBUtils;


public class UserDao {
	
	public int addInfo(User user,int id) {
		int num = 0;
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = DBUtils.getConnection();
			String sql = "update user set height='"+user.getHeight()+"',weight='"+user.getWeight()+"',"
					+ "birthday='"+user.getBirthday()+"',gender='"+user.getGender()+"'"
							+ "where id='"+id+"'";
			pst = DBUtils.getPst(conn, sql);
			num = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(null, pst, conn);
		}
		return num;
	}
	
	public int saveUser(User user) {
		int num = 0;
		Connection conn = null;
		PreparedStatement pst = null;
		try {
			conn = DBUtils.getConnection();

			String sql = "insert into user values(null,?,?,?,?,null,null,null,null)";

			pst = DBUtils.getPst(conn, sql);

			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getPhone());
			pst.setString(4, user.getCode());

			num = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(null, pst, conn);
		}
		return num;
	}
	
	public User login(String username, String password) {
		User user = null;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			conn = DBUtils.getConnection();

			String sql = "select * from user where username= ? and password= ?";
			pst = DBUtils.getPst(conn, sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			//处理结果
			if (rs != null && rs.next()) {
				int uid = rs.getInt("id");
				String uname = rs.getString("username");
				String pass = rs.getString("password");
				String phone = rs.getString("phone");
				String birthday = rs.getString("birthday");
				String code = rs.getString("code");
				String gender = rs.getString("gender");
				user = new User();
				user.setId(uid);
				user.setUsername(uname);
				user.setPassword(pass);
				user.setPhone(phone);
				user.setBirthday(birthday);
				user.setCode(code);
				user.setGender(gender);
				user.setWeight(rs.getInt("weight"));
				user.setHeight(rs.getInt("height"));
			} else {
				System.out.println("登录失败");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtils.close(null, pst, conn);
		}
		return user;
	}

}
