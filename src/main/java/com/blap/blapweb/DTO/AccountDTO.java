package com.blap.blapweb.DTO;

import java.sql.Timestamp;

public class AccountDTO {
   private int account_id; //거래 아이디
   private int user_id;   //사용자 고유 아이디
   private int money;      //처리 금액
   private int type;      //거래 종류(0: 입금, 1: 출금)
   private int balance;   //잔액
   private Timestamp account_date; //처리 일자
   private int start;
   private int end;
   
   public int getAccount_id() {
      return account_id;
   }
   public void setAccount_id(int account_id) {
      this.account_id = account_id;
   }
   public int getUser_id() {
      return user_id;
   }
   public void setUser_id(int user_id) {
      this.user_id = user_id;
   }
   public int getMoney() {
      return money;
   }
   public void setMoney(int money) {
      this.money = money;
   }
   public int getType() {
      return type;
   }
   public void setType(int type) {
      this.type = type;
   }
   public int getBalance() {
      return balance;
   }
   public void setBalance(int balance) {
      this.balance = balance;
   }
   public Timestamp getAccount_date() {
      return account_date;
   }
   public void setAccount_date(Timestamp account_date) {
      this.account_date = account_date;
   }
   public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "AccountDTO [account_id=" + account_id + ", user_id=" + user_id + ", money=" + money + ", type=" + type
				+ ", balance=" + balance + ", account_date=" + account_date + ", start=" + start + ", end=" + end + "]";
	}

   
}