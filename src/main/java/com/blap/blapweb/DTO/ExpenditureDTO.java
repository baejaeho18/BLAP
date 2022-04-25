package com.blap.blapweb.DTO;

import java.util.Date;

public class ExpenditureDTO {
	private Date account_date;
	private int money;
	
	public Date getAccount_date() {
		return account_date;
	}
	public void setAccount_date(Date account_date) {
		this.account_date = account_date;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
}