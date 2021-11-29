package com.kurly.model;

public class PriceSumDTO {	// CartDataDAO, UserOrderAction에서 사용
	private int costSum;
	private int saleSum;
	private int discountSum;
	private int pointSum;
	
	public int getCostSum() {
		return costSum;
	}
	public void setCostSum(int costSum) {
		this.costSum = costSum;
	}
	public int getSaleSum() {
		return saleSum;
	}
	public void setSaleSum(int saleSum) {
		this.saleSum = saleSum;
	}
	public int getDiscountSum() {
		return discountSum;
	}
	public void setDiscountSum(int costSum, int saleSum) {
		this.discountSum = saleSum - costSum;
	}
	public int getPointSum() {
		return pointSum;
	}
	public void setPointSum(int pointSum) {
		this.pointSum = pointSum;
	}
}
