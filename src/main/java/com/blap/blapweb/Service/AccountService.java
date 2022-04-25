package com.blap.blapweb.Service;

import java.util.List;
import com.blap.blapweb.DTO.TagExpenditureDTO;
import com.blap.blapweb.DTO.ExpenditureDTO;

import com.blap.blapweb.DTO.AccountDTO;
import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.ExpenditureDTO;
import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.DTO.TagExpenditureDTO;

public interface AccountService{
   public int insertAccount(AccountDTO dto);
   public AccountDTO getAccount(int account_id);
   public List<AccountDTO> getAccountList();
   public int countAccountList();
   public List<AccountDTO> selectAccountList(PageDTO dto);
   public List<ExpenditureDTO> getExpenditure();
   public List<TagExpenditureDTO> getTagExpenditure();
   public int insert_s_Account(AccountDTO dto);
   public int insert_bucket_Account(AccountDTO dto);
}