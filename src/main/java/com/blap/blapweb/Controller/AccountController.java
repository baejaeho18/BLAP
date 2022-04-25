package com.blap.blapweb.Controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Locale;


import com.blap.blapweb.DTO.AccountDTO;
import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.ExpenditureDTO;
import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.DTO.TagExpenditureDTO;
import com.blap.blapweb.Service.AccountService;
import com.blap.blapweb.Service.AccountServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.springframework.web.bind.annotation.ResponseBody;

//import com.google.gson.Gson;


@Controller
public class AccountController {

   @Autowired
   AccountService accountService;
   
   // 버킷리스트 추가 후 list 페이지로 이동
      @RequestMapping(value = "/addaccountok", method = RequestMethod.POST)
      public String addPostOK(AccountDTO dto) {      
         if (accountService.insertAccount(dto)==0) 
            System.out.println("데이터 추가 실패"); 
          else 
             System.out.println("데이터 추가 성공!!");
         return "redirect:readaccount";
      }
      
      @RequestMapping(value = "/subaccountok", method = RequestMethod.POST)
      public String subPostOK(AccountDTO dto) {      
         if (accountService.insert_s_Account(dto)==0) 
            System.out.println("데이터 추가 실패"); 
          else 
             System.out.println("데이터 추가 성공!!");
         return "redirect:readaccount";
      }
      
      
      
//      @RequestMapping(value="/readaccount", method=RequestMethod.GET)
      @RequestMapping(value="/selectaccount", method=RequestMethod.GET)
      public String noticelist(Model model) {
         model.addAttribute("Account", accountService.getAccountList());
         return "Mypage";
         
      }
      
//      @RequestMapping(value = "/selectaccount")
      @RequestMapping(value = "/readaccount")
      public String boardList(PageDTO dto, Model model,
   		   @RequestParam(value="nowPage", required=false) String nowPage,
   		   @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
    	
   	   	int total = accountService.countAccountList();
//   	   System.out.println("total is "+total);
   	   	if (nowPage == null && cntPerPage == null) {
   	   		nowPage = "1";
   	   		cntPerPage = "7";
   	   	} else if (nowPage == null) {
   	   		nowPage = "1";
   	   	} else if (cntPerPage == null) { 
   	   		cntPerPage = "7";
   	   	}
   	   	AccountDTO dto2 = new AccountDTO();
   	   	dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
   	   	model.addAttribute("paging", dto);
   	   	model.addAttribute("viewAll", accountService.selectAccountList(dto));
   	   	System.out.println(dto2.toString());
//   	   	return "BucketPaging";
   		return "Mypage";
    }
      
    @RequestMapping(value = "/expenditure", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  	public @ResponseBody String expenditure(Locale locale, Model model) {
  		Gson gson = new GsonBuilder().setDateFormat("M월").create();
  		List<ExpenditureDTO> list = accountService.getExpenditure();
  		return gson.toJson(list);
  	}
      
  @RequestMapping(value = "/tagexpenditure", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
   public @ResponseBody String tagExpenditure(Locale locale, Model model) {
	 TagExpenditureDTO tagexpendituredto = new TagExpenditureDTO();
	 System.out.println(tagexpendituredto.toString());
      Gson gson = new Gson();
      List<TagExpenditureDTO> list = accountService.getTagExpenditure();
      return gson.toJson(list);

   }

}

