package com.kurly.model;

public class OrderDetailDTO { 
	private int od_num;
	private int o_id;
	private int p_num;
	private int o_price;
	private int o_discount_price;
	private int o_final_price;
	private int o_qty;
	
	private String p_image;
	private String p_name;
	private String p_seller;
	
	public int getOd_num() {
		return od_num;
	}
	public void setOd_num(int od_num) {
		this.od_num = od_num;
	}
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public int getO_discount_price() {
		return o_discount_price;
	}
	public void setO_discount_price(int o_discount_price) {
		this.o_discount_price = o_discount_price;
	}
	public int getO_final_price() {
		return o_final_price;
	}
	public void setO_final_price(int o_final_price) {
		this.o_final_price = o_final_price;
	}
	public int getO_qty() {
		return o_qty;
	}
	public void setO_qty(int o_qty) {
		this.o_qty = o_qty;
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
	public String getP_seller() {
		return p_seller;
	}
	public void setP_seller(String p_seller) {
		this.p_seller = p_seller;
	}
	
	
	
	
}
