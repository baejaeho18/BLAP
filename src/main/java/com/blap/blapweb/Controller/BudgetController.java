package com.blap.blapweb.Controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.BudgetBalanceDTO;
import com.blap.blapweb.DTO.BudgetDTO;
import com.blap.blapweb.DTO.MonthExpenditureDTO;
import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.Service.BudgetService;
import com.google.gson.Gson;
import com.blap.blapweb.Service.BucketService;

@Controller
public class BudgetController {   
   @Autowired
   BudgetService budgetService;
   @Autowired
   BucketService bucketService;
   BucketDTO bucketdto = new BucketDTO();
   BudgetDTO budgetdto = new BudgetDTO();
   BudgetBalanceDTO balancedto = new BudgetBalanceDTO();
   MonthExpenditureDTO monthdto = new MonthExpenditureDTO();
   
   
   
 /*  @RequestMapping(value = "/readbudget")
   public String readlist(PageDTO dto, Model model,
         @RequestParam(value="nowPage", required=false) String nowPage,
         @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
    
         int total = bucketService.countBucketList();
         if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
         } else if (nowPage == null) {
            nowPage = "1";
         } else if (cntPerPage == null) { 
            cntPerPage = "5";
         }
         BucketDTO dto2 = new BucketDTO();
         dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
         model.addAttribute("paging", dto);
         model.addAttribute("viewAll", bucketService.selectBucketList(dto));
         model.addAttribute("Budgetlist", budgetService.getBudgetList());
         System.out.println(dto2.toString());
      return "Budget";
 }*/
   
//	@RequestMapping(value="/readbudget", method=RequestMethod.GET)
//	public String noticelist(Model model) {
//		model.addAttribute("Budgetlist", budgetService.getBudgetList());
//		return "Budget";
//		
//	}
   
//     @RequestMapping(value="/viewbudgetpage", method=RequestMethod.GET) 
//     public String noticeBudgetlist(Model model) { 
//        model.addAttribute("Budgetlist", budgetService.getBudgetList()); 
//        System.out.println("=============");
//        System.out.println(budgetdto.toString()); 
//        return "ViewBudget";
//     }
//    
//   @RequestMapping(value="/viewbudgetpage", method=RequestMethod.GET) 
//   public String noticeBudgetlist(Model model) { 
//      model.addAttribute("Budgetlist", budgetService.getBudgetList()); 
//      System.out.println("=============viewbudgetpage");
//      System.out.println(budgetdto.toString()); 
//      return "ViewBudget";
//   }
//   
   @RequestMapping(value="/viewbudgetpage/{bucket_id}", method=RequestMethod.GET)
	public String viewPost(@PathVariable("bucket_id") int bucket_id, Model model) {
		model.addAttribute("bucket", bucketService.getBucket(bucket_id));
		model.addAttribute("Budgetlist", budgetService.getBudgetList(bucket_id)); 
		System.out.println("=============viewbudgetpage");
		System.out.println(budgetdto.toString()); 
		return "ViewBudget";
	}
  
   
   //   Ŷ    Ʈ  ߰  ϴ            ̵ 
   @RequestMapping(value="/addbudget", method = RequestMethod.GET)
   public String addPost() {
      return "AddBudget";
   }
   
   //   Ŷ    Ʈ  ߰     list           ̵ 
   @RequestMapping(value = "/addbudgetok", method = RequestMethod.POST)
   public String addPostOK(BudgetDTO dto) {      
      if (budgetService.insertBudget(dto)==0) 
         System.out.println("        ߰      ");
       else 
          System.out.println("        ߰      !!");
      return "redirect:readbudget";
   }
   
   // 버짓 상세 페이지로 이동
//      @RequestMapping(value="/viewbudget/{budget_id}", method=RequestMethod.GET)
//      public String viewPost(@PathVariable("budget_id") int budget_id, Model model) {
//         BudgetDTO budgetDTO = budgetService.getBudget(budget_id);
//         model.addAttribute("v", budgetDTO);
//         return "ViewBudget";
//      }
//      
      
//      @RequestMapping(value = "/editbudget/{budget_id}", method = RequestMethod.GET)
//      public String editPost(@PathVariable("budget_id") int budget_id, Model model) {      
//         BudgetDTO budgetDTO = budgetService.getBudget(budget_id);
//         model.addAttribute("v", budgetDTO);   
//         return "EditBudget";
//      }

      @RequestMapping(value =  "/editbudgetok/{budget_id}/{bucket_id}", method = RequestMethod.POST)
      public String editPostOK(@PathVariable("budget_id") int budget_id, BudgetDTO dto, @PathVariable("bucket_id") int bucket_id) {
			dto.setBudget_id(budget_id);
         if (budgetService.updateBudget(dto) == 0)
            System.out.println("데이터 수정 실패 ");
         else 
            System.out.println("데이터 수정 성공 !!! ");
         return "redirect:../../viewbudgetpage/"+bucket_id;
      }
      
      @RequestMapping(value = "/deletebudgetok/{budget_id}/{bucket_id}", method = RequestMethod.GET)
		public String deletePostOK(@PathVariable("budget_id") int budget_id, @PathVariable("bucket_id") int bucket_id) {
			if(budgetService.deleteBudget(budget_id) == 0)
				System.out.println("데이터 삭제 실패");
		    else 
		    	System.out.println("데이터 삭제 성공!!");
			return "redirect:../../viewbudgetpage/"+bucket_id;
		}
      
      @RequestMapping(value = "/budgetbalance", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
      public @ResponseBody String budgetBalance(Locale locale, Model model) {
         Gson gson = new Gson();
         List<BudgetDTO> list = budgetService.getBudgetBalance();
//         System.out.println(balancedto.toString());
//         System.out.println("1. is"+list);
         return gson.toJson(list);
      }
      
      @RequestMapping(value = "/monthexpenditure", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
      public @ResponseBody String monthExpenditure(Locale locale, Model model) {
         Gson gson = new Gson();
         List<BudgetDTO>list = budgetService.getMonthExpenditure();
//         System.out.println(monthdto.toString());
//         System.out.println("2. is"+list);
         return gson.toJson(list);
      }
      
      @RequestMapping(value = "/monthbudget", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
      public @ResponseBody String monthBudget(Locale locale, Model model) {
         Gson gson = new Gson();
         List<BudgetDTO>list = budgetService.getMonthBudget();
         return gson.toJson(list);
      }
      
      
      
      
      
}