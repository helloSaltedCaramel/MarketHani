package com.kurly.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CartDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private static final CartDAO instance = new CartDAO();
	
	public static CartDAO getInstance() {
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
	
	public String addCartByList(CartDTO dto) {
		String result = "false";
		boolean exist = false;
		
		final String checkSql = "select cart_qty from kurly_cart where cart_pnum = ? and cart_userId = ?";
		final String insertSql = "insert into kurly_cart values(cart_seq.nextval, ?, 1, ?)";
		final String updateSql = "update kurly_cart set cart_qty = cart_qty + 1 where cart_pnum = ? and cart_userId = ?";
		
		try {
			con = connect();
			pstmt = con.prepareStatement(checkSql);
			pstmt.setString(1, dto.getCart_pnum());
			pstmt.setString(2, dto.getUser_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				exist = true;
			}
			pstmt.close(); rs.close();
			
			if(exist) {
				pstmt = con.prepareStatement(updateSql); 
				pstmt.setString(1, dto.getCart_pnum());
				pstmt.setString(2, dto.getUser_id());
			} else {
				pstmt = con.prepareStatement(insertSql);
				pstmt.setString(1, dto.getCart_pnum());
				pstmt.setString(2, dto.getUser_id());
			}
			
			int updateResult = pstmt.executeUpdate();		
			
			if(updateResult > 0) {
				result = "true"; 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;		
	}
	
}
