package com.blap.blapweb.DTO;

import java.sql.Timestamp;

public class BudgetDTO {
	private int budget_id;
	private int bucket_id;
	private String budget_name;
	private int budget;
	private int expenditure;
	private int difference;
	private Timestamp regdate;
	
	public int getBudget_id() {
		return budget_id;
	}
	public void setBudget_id(int budget_id) {
		this.budget_id = budget_id;
	}
	public int getBucket_id() {
		return bucket_id;
	}
	public void setBucket_id(int bucket_id) {
		this.bucket_id = bucket_id;
	}
	public String getBudget_name() {
		return budget_name;
	}
	public void setBudget_name(String budget_name) {
		this.budget_name = budget_name;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public int getExpenditure() {
		return expenditure;
	}
	public void setExpenditure(int expenditure) {
		this.expenditure = expenditure;
	}
	public int getDifference() {
		return difference;
	}
	public void setDifference(int difference) {
		this.difference = difference;
	}	
	public Timestamp getregdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}	
	
}