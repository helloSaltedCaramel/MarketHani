package com.kurly.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CartDataDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private static final CartDataDAO instance = new CartDataDAO();
	
	public static CartDataDAO getInstance() {
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
	
	public List<CartDataDTO> loadCartData(String user_id) {
		List<CartDataDTO> list = new ArrayList<>();
		
		final String sql = 
				"select c.cart_num, c.cart_pnum, p.p_image, p.p_name, p.p_price, ROUND(p.p_price*(1-p.p_discount*0.01)) salePrice, p.p_point, c.cart_qty " + 
				"from kurly_cart c " + 
				"join kurly_product p " + 
				"on c.cart_pnum = p.p_num " + 
				"where c.cart_userid = ? " +
				"order by c.cart_pnum desc";
		
		try {
			pstmt = connect().prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CartDataDTO dto = new CartDataDTO();
				dto.setCart_num(rs.getString("cart_num"));
				dto.setCart_pnum(rs.getString("cart_pnum"));
				dto.setP_image(rs.getString("p_image"));
				dto.setP_name(rs.getString("p_name"));
				dto.setP_price(rs.getInt("p_price"));
				dto.setSalePrice(rs.getInt("saleprice"));
				dto.setP_point(rs.getInt("p_point"));
				dto.setCart_qty(rs.getInt("cart_qty"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("[CartDataDAO 오류발생]");
			e.printStackTrace();
		} finally {
			connectClose();
		}
		
		return list;	
	}
	
	public String quantityControl(String cart_num, boolean isIncrease) {
		String resText = "error";
		
		final String decreaseSql = "update kurly_cart set cart_qty = cart_qty - 1 where cart_num = ?";
		final String increaseSql = "update kurly_cart set cart_qty = cart_qty + 1 where cart_num = ?";
		
		try {
			
			pstmt = connect().prepareStatement(isIncrease ? increaseSql : decreaseSql);
			pstmt.setString(1, cart_num);
			int result = pstmt.executeUpdate();
			
			if(result > 0) {
				resText = "updated";
			}
			
		} catch (SQLException e) {
			System.out.println("[ajax: quantityControl 오류 발생]");
			e.printStackTrace();
		} finally {
			connectClose();
		}
		
		return resText;
	}
	
	public String deleteCartProduct(String cart_num) {
		String resText = "error";
		
		final String sql = "delete from kurly_cart where cart_num = ?";
		
		try {
			pstmt = connect().prepareStatement(sql);
			pstmt.setString(1, cart_num);
			
			int result = pstmt.executeUpdate();
			System.out.println(result);
			
			if(result > 0) {
				resText = "deleted";
			}
			
		} catch (SQLException e) {
			System.out.println("[ajax: deleteCartProduct 오류 발생]");
			e.printStackTrace();
		} finally {
			connectClose();
		}
		
		return resText;
	}
	
	public PriceSumDTO getSumPrice(String user_id) {
		PriceSumDTO dto = new PriceSumDTO();
		
		final String sql = "select sum(p.p_price*c.cart_qty) costSum, sum(round(p.p_price*(1-p.p_discount*0.01))*cart_qty) saleSum, sum(p_point * cart_qty) pointSum " + 
								"from kurly_cart c " + 
								"join kurly_product p " + 
								"on c.cart_pnum = p.p_num " + 
								"where c.cart_userid = ?";
		
		try {
			pstmt = connect().prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int costSum = rs.getInt("costsum");
				int saleSum = rs.getInt("salesum");
				
				dto.setCostSum(costSum);
				dto.setSaleSum(saleSum);
				dto.setPointSum(rs.getInt("pointsum"));
				dto.setDiscountSum(costSum, saleSum);
			}
		} catch (SQLException e) {
			System.out.println("[PriceSumDTO: getSumPrice() 오류발생]");
			e.printStackTrace();
		} finally {
			connectClose();
		}
		
		return dto;
	}
}
