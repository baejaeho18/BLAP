package com.blap.blapweb.DTO;

public class MonthExpenditureDTO {
	private int expenditure;
	
	public int getExpenditure() {
		return expenditure;
	}
	public void setExpenditure(int expenditure) {
		this.expenditure = expenditure;
	}
	@Override
	public String toString() {
		return "MonthExpenditureDTO [expenditure=" + expenditure + "]";
	}
	
}