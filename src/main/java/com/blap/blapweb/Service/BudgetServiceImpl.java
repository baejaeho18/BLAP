package com.blap.blapweb.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blap.blapweb.DAO.BudgetDAO;
import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.BudgetDTO;
import com.blap.blapweb.DTO.MonthExpenditureDTO;

@Service
public class BudgetServiceImpl implements BudgetService {
	@Autowired
	BudgetDAO budgetDAO;
	
	@Override
	public int insertBudget(BudgetDTO dto) {
		// TODO Auto-generated method stub
		return budgetDAO.insertBudget(dto);
	}
	
	@Override
	public int deleteBudget(int budget_id) {
		// TODO Auto-generated method stub
		return budgetDAO.deleteBudget(budget_id);
	}

	@Override
	public int updateBudget(BudgetDTO dto) {
		// TODO Auto-generated method stub
		return budgetDAO.updateBudget(dto);
	}
	
	@Override
	public List<BudgetDTO> getBudgetList() {
		// TODO Auto-generated method stub
		return budgetDAO.getBudgetList();
	}

//	@Override
//	public BudgetDTO getBudget(int budget_id) {
//		// TODO Auto-generated method stub
//		return budgetDAO.getBudget(budget_id);
//	}
	
	@Override
	public List<BudgetDTO> getBudgetBalance(){
		return budgetDAO.getBudgetBalance();
	}
	
	@Override
	public List<BudgetDTO> getMonthExpenditure(){
		return budgetDAO.getMonthExpenditure();
	}
	
	public List<BudgetDTO> getMonthBudget(){
		return budgetDAO.getMonthBudget();
	}
	
	@Override
	public List<BudgetDTO> getBudgetList(int bucket_id) {
		return budgetDAO.getBudgetList(bucket_id);
	}

	@Override
	public int getBudget(int bucket_id) {
		return budgetDAO.getBudget(bucket_id);
	}
	
}