package com.blap.blapweb.DTO;

public class MonthBudgetDTO {
	private int budget;
	
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	@Override
	public String toString() {
		return "MonthBudgetDTO [budget=" + budget + "]";
	}
	
}