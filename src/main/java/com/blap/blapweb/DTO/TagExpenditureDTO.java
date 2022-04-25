package com.blap.blapweb.DTO;

public class TagExpenditureDTO {
	private String Tag_name;
	private int Expenditure_sum;
	public String getTag_name() {
		return Tag_name;
	}
	public void setTag_name(String tag_name) {
		Tag_name = tag_name;
	}
	public int getExpenditure_sum() {
		return Expenditure_sum;
	}
	public void setExpenditure_sum(int expenditure_sum) {
		Expenditure_sum = expenditure_sum;
	}
	@Override
	public String toString() {
		return "TagExpenditureDTO [Tag_name=" + Tag_name + ", Expenditure_sum=" + Expenditure_sum + "]";
	}
	
}