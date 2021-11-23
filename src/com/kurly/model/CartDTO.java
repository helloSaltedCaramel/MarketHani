package com.kurly.model;

public class CartDTO {
	private String cart_num;
	private String cart_pnum;
	private int cart_qty;
	private String user_id;
	
	public String getCart_num() {
		return cart_num;
	}
	public void setCart_num(String cart_num) {
		this.cart_num = cart_num;
	}
	public String getCart_pnum() {
		return cart_pnum;
	}
	public void setCart_pnum(String cart_pnum) {
		this.cart_pnum = cart_pnum;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}	
}
