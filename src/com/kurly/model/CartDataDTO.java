package com.kurly.model;

/**
 * [장바구니 페이지 데이터 가져오기위한 DTO객체]
 * kurly_cart 테이블, kurly_price 테이블 JOIN
 * @author HOIT
 */
public class CartDataDTO {
	private String cart_pnum;
	private String p_image;
	private String p_name;
	private int p_price;
	private int salePrice;
	private int p_point;
	private int cart_qty;
	
	
	public String getCart_pnum() {
		return cart_pnum;
	}
	public void setCart_pnum(String cart_pnum) {
		this.cart_pnum = cart_pnum;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getP_point() {
		return p_point;
	}
	public void setP_point(int p_point) {
		this.p_point = p_point;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	
	
}
