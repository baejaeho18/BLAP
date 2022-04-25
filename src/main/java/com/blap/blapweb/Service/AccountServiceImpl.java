package com.blap.blapweb.Service;

import java.util.List;
import com.blap.blapweb.DTO.TagExpenditureDTO;
import com.blap.blapweb.DTO.ExpenditureDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blap.blapweb.DAO.AccountDAO;
import com.blap.blapweb.DTO.AccountDTO;
import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.Service.AccountService;

@Service
public class AccountServiceImpl implements AccountService{
   
   @Autowired
   AccountDAO accountDAO;

   @Override
   public int insertAccount(AccountDTO dto) {
      // TODO Auto-generated method stub
      return accountDAO.insertAccount(dto);
   }
   
   @Override
   public int insert_s_Account(AccountDTO dto) {
      // TODO Auto-generated method stub
      return accountDAO.insert_s_Account(dto);
   }
   @Override
   public int insert_bucket_Account(AccountDTO dto) {
      // TODO Auto-generated method stub
      return accountDAO.insert_bucket_Account(dto);
   }


   @Override
   public AccountDTO getAccount(int account_id) {
      // TODO Auto-generated method stub
      return accountDAO.getAccount(account_id);
   }
   

   @Override
   public List<AccountDTO> getAccountList() {
      // TODO Auto-generated method stub
      return accountDAO.getAccountList();
   }

   @Override
	public int countAccountList() {
		return accountDAO.countAccountList();
	}
   
   @Override
	public List<AccountDTO> selectAccountList(PageDTO dto) {
		return accountDAO.selectAccountList(dto);
	}
   
   @Override
	public List<ExpenditureDTO> getExpenditure(){
		return accountDAO.getExpenditure();
	}
	
	@Override
	public List<TagExpenditureDTO> getTagExpenditure(){
		return accountDAO.getTagExpenditure();
	}

}


