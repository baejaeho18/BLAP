package com.blap.blapweb.DAOImpl;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blap.blapweb.DTO.AccountDTO;
import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.DAO.AccountDAO;
import com.blap.blapweb.DTO.TagExpenditureDTO;
import com.blap.blapweb.DTO.ExpenditureDTO;
@Repository
public class AccountDAOImpl implements AccountDAO{
   @Autowired
   SqlSession sqlSession;
   
   public int insertAccount(AccountDTO dto) {
      int result=sqlSession.insert("Account.insertAccount",dto); 
      return result;
   }

   public AccountDTO getAccount(int account_id) {
      AccountDTO result=sqlSession.selectOne("Account.getAccount", account_id); 
      return result;
   }
   public List<AccountDTO> getAccountList() {
      List<AccountDTO> result = sqlSession.selectList("Account.getAccountList"); 
      return result;
   }
      
   public int countAccountList() {
		int result = sqlSession.selectOne("Account.countAccountList");
		return result;
	}
	
	public List<AccountDTO> selectAccountList(PageDTO dto) {
		// TODO Auto-generated method stub
		List<AccountDTO> result = sqlSession.selectList("Account.selectAccountList",dto);
		return result;
	}
      
	public List<ExpenditureDTO> getExpenditure(){
		List<ExpenditureDTO> list = sqlSession.selectList("Account.getExpenditure");
		return list;
	}
	public List<TagExpenditureDTO> getTagExpenditure(){
		List<TagExpenditureDTO> list = sqlSession.selectList("Account.getTagExpenditure");
		return list;
	}  
	
   public int insert_bucket_Account(AccountDTO dto) {
	      int result=sqlSession.insert("Account.insert_bucket_Account",dto); 
	      return result;
   }
   
   public int insert_s_Account(AccountDTO dto) {
      int result=sqlSession.insert("Account.insert_s_Account",dto); 
      return result;
   }

}   






   


