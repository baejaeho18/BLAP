package com.blap.blapweb.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.BudgetDTO;
import com.blap.blapweb.DTO.MonthExpenditureDTO;

@Repository
public interface BudgetDAO {
	
	public int insertBudget(BudgetDTO dto);
	public int deleteBudget(int budget_id);
	public int updateBudget(BudgetDTO dto);
	public List<BudgetDTO> getBudgetList();
//	public BudgetDTO getBudget(int budget_id);
	public List<BudgetDTO> getBudgetBalance();
	public List<BudgetDTO> getMonthExpenditure();
	public List<BudgetDTO> getMonthBudget();
	public List<BudgetDTO> getBudgetList(int bucket_id);
	public int getBudget(int bucket_id);
}