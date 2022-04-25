package com.blap.blapweb.DAOImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blap.blapweb.DAO.BudgetDAO;
import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.BudgetDTO;
import com.blap.blapweb.DTO.MonthExpenditureDTO;

@Repository
public class BudgetDAOImpl implements BudgetDAO{
	@Autowired
	SqlSession sqlSession;
	
	public int insertBudget(BudgetDTO dto) {
		int result = sqlSession.insert("Budget.insertBudget",dto);
		return result;
	}
	
	public int deleteBudget(int budget_id) {
//		System.out.println("===> JDBC로 deleteBucket() 기능 처리");
		
		int result = sqlSession.delete("Budget.deleteBudget", budget_id);
		return result;
	}
	public int updateBudget(BudgetDTO dto) {
//		System.out.println("updateBucket() 기능 처리");
		
		int result = sqlSession.update("Budget.updateBudget", dto);
		return result;
	}
	
//	public BudgetDTO getBudget(int budget_id) {
//		BudgetDTO result = sqlSession.selectOne("Budget.getBudget",budget_id);
//		return result;
//	}	
//	
	public List<BudgetDTO> getBudgetList() {
		List<BudgetDTO> result = sqlSession.selectList("Budget.getBudgetList");
		return result;
	}
	
	public List<BudgetDTO> getBudgetBalance(){
		List<BudgetDTO> result = sqlSession.selectList("Budget.getBudgetBalance");
		return result;
	}
	
	public List<BudgetDTO> getMonthExpenditure(){
		List<BudgetDTO> result = sqlSession.selectList("Budget.getMonthExpenditure");
		return result;
	}
	
	public List<BudgetDTO> getMonthBudget(){
		List<BudgetDTO> result = sqlSession.selectList("Budget.getMonthBudget");
		return result;
	}
	
	public int getBudget(int bucket_id) {
		List<BudgetDTO> bdList = sqlSession.selectList("Budget.getBudget", bucket_id);
		int result=0;
		System.out.println("=============DAO.getBudget");
		for(BudgetDTO budget : bdList) {
			System.out.println(budget);
			result += budget.getBudget();
		}
		return result;
	}	
	
	public List<BudgetDTO> getBudgetList(int bucket_id) {
		List<BudgetDTO> result = sqlSession.selectList("Budget.getBudgetList", bucket_id);
		System.out.println("=============DAO.getBudgetList");
		for(BudgetDTO dto : result) System.out.println(dto);
		return result;
	}

}