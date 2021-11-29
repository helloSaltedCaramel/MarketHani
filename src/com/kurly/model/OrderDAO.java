package com.kurly.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private static final OrderDAO instance = new OrderDAO();
	
	public static OrderDAO getInstance() {
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
	
	public int insertOrder(String user_id, String o_to_name, String o_to_addr,	String o_to_message, String o_to_phone,
									int o_point_use, int o_point_get, String o_pay_method, int o_total, int o_del_fee) {
		
		int o_id = -1;
		
		OrderDTO dto = new OrderDTO();
		
		final String sql = "insert into kurly_order values(o_id_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		
		try {
			pstmt = connect().prepareStatement(sql);
			
			pstmt.setString(1, user_id); pstmt.setString(2, o_to_name);
			pstmt.setString(3, o_to_addr); pstmt.setString(4, o_to_message);
			pstmt.setString(5, o_to_phone); pstmt.setInt(6, o_point_use);
			pstmt.setInt(7, o_point_get); pstmt.setString(8, o_pay_method);
			pstmt.setInt(9, o_total); pstmt.setInt(10, o_del_fee);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			o_id = loadO_id(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectClose();
		}
		
		return o_id;
	}
	
	private int loadO_id(String user_id) {
		int o_id = -1;
		
		final String sql = "select o_id from kurly_order where user_id = 'alsghl9607' order by o_date desc";
		
		try {
			pstmt = connect().prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				o_id = rs.getInt("o_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connectClose();
		}
		
		return o_id;
	}

}
