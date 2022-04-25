package com.blap.blapweb.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.BudgetDTO;
import com.blap.blapweb.DTO.MonthExpenditureDTO;

@Service
public interface BudgetService {
	public int insertBudget(BudgetDTO dto);
	public int deleteBudget(int budget_id);
	public int updateBudget(BudgetDTO dto);
//	public BudgetDTO getBudget(int budget_id);
	public List<BudgetDTO> getBudgetList();
	public List<BudgetDTO> getBudgetBalance();
	public List<BudgetDTO> getMonthExpenditure();
	public List<BudgetDTO> getMonthBudget();
	public int getBudget(int bucket_id);
	public List<BudgetDTO> getBudgetList(int bucket_id);
}