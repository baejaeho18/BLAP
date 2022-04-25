package com.blap.blapweb.DTO;


public class BudgetBalanceDTO {
	private int balance;

	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "BudgetBalanceDTO [balance=" + balance + "]";
	}
	
}