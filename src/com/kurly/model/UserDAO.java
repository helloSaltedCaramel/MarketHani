package com.kurly.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private static final UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	private Connection connect() {
		
		try {
			Context ctx = new InitialContext();
			
			DataSource data = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			con = data.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return con;
	}
	
	private void connectClose() {
		try {
			if(con != null) {con.close();}
			if(pstmt != null) {pstmt.close();}
			if(rs != null) {rs.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertUser(UserDTO dto) {
		int result = 0;
		
		final String sql = 
				"insert into kurly_user values(?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'))";
		
		try {
			pstmt = connect().prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pwd());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setString(4, dto.getUser_email());
			pstmt.setString(5, dto.getUser_phone());
			pstmt.setString(6, dto.getUser_addr());
			pstmt.setString(7, dto.getUser_gender());
			pstmt.setInt(8, dto.getUser_point());
			pstmt.setString(9, dto.getUser_birthday());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("UserDAO insertUser 에러발생");
		} finally {
			connectClose();
		}
		
		return result;
	}
	
	public UserOrderDTO getUserData(String user_id) {
		UserOrderDTO dto = new UserOrderDTO();
		
		final String sql = "select user_id, user_name, user_email, user_phone, user_addr, user_point from kurly_user where user_id = ?";
		
		try {
			pstmt = connect().prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_addr(rs.getString("user_addr"));
				dto.setUser_point(rs.getInt("user_point"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			connectClose();
		}
		
		return dto;
	}
	
	public String loginCheck(LoginDTO dto) {
		String username = null;
		
		final String id_sql = "select user_id, user_name from kurly_user where user_id = ? and user_pwd = ?";
		
		try {
			pstmt = connect().prepareStatement(id_sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				username = rs.getString("user_name");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("UserDAO: loginCheck error occured");
		} finally {
			connectClose();
		}
		
		return username;
		
	}
	
	public String ajaxIdDistinct(String user_id) {
		String isAvailable = "true";
		
		final String sql = "select user_id from kurly_user where user_id = ?";
		
		try {
			pstmt = connect().prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isAvailable = "false";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectClose();
		}
		
		return isAvailable;
	}
	
	public String getUserAddress(String user_id) {
		String addr = "not found";
		
		final String sql = "select user_addr from kurly_user where user_id = ?";
		
		try {
			pstmt = connect().prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				addr = rs.getString("user_addr");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			connectClose();
		}
		
		return addr;
	}
}
