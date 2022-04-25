package com.blap.blapweb.DAO;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blap.blapweb.DTO.AccountDTO;
import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.DTO.TagExpenditureDTO;
import com.blap.blapweb.DTO.ExpenditureDTO;


@Repository   
public interface AccountDAO {

   
   public int insertAccount(AccountDTO dto);
   public int insert_s_Account(AccountDTO dto);
   public int insert_bucket_Account(AccountDTO dto);
   public AccountDTO getAccount(int account_id);
   public List<AccountDTO> getAccountList();
   public int countAccountList();
   public List<AccountDTO> selectAccountList(PageDTO dto);
   public List<ExpenditureDTO> getExpenditure();	
   public List<TagExpenditureDTO> getTagExpenditure();
}