package com.kurly.model;

/**
 * - user 주문내역 불러올 때 사용할 DTO
 * - user_mypage_orderlist.jsp에서 사용
 * - OrderDAO의 loadOrderHistory에서 load시 사용
 * @author HOIT
 *
 */
public class OrderHistoryDTO {
	private int o_id;
	private String o_date;
	private int o_total;
	private int p_num;
	private int p_count;
	private String p_name;
	private String p_image;
	
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int o_id) {
		this.o_id = o_id;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getO_total() {
		return o_total;
	}
	public void setO_total(int o_total, int o_point_use, int o_del_fee) {
		this.o_total = o_total - o_point_use + o_del_fee;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	
}
