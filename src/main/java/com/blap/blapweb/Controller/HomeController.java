package com.blap.blapweb.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 *
 */


@Controller
public class HomeController {
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) throws Exception {
      logger.info("Welcome home! The client locale is {}.", locale);
      
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      model.addAttribute("serverTime", formattedDate);
      return "Main";
   }
   
   
   @RequestMapping(value = "/Bucketlist", method = RequestMethod.GET)
   public String bucketlist(Model model) {
      return "Bucketlist";
   }
   
   @RequestMapping(value = "/AddList", method = RequestMethod.GET)
   public String managelist(Model model) {
      return "AddList"; //=AddList
   }

   @RequestMapping(value = "/Budget", method = RequestMethod.GET)
   public String budget(Model model) {
      return "Budget";
   }
   
   @RequestMapping(value = "/AddBudget", method = RequestMethod.GET)
   public String managebudget(Model model) {
      return "AddBudget"; //=AddList
   }
   
   @RequestMapping(value = "/Mypage", method = RequestMethod.GET)
   public String mypage(Model model) {
      return "Mypage";
   }
   
   @RequestMapping(value = "/ExpenditureStatistics", method = RequestMethod.GET)
   public String expenditureStatistics(Model model) {
      return "ExpenditureStatistics";
   }
   
//   @RequestMapping(value = "/SignIn", method = RequestMethod.GET)
//   public String signIn(Model model) {
//      return "SignIn";
//   }
   @RequestMapping(value = "/ViewBudget", method = RequestMethod.GET)
   public String viewBudget(Model model) {
      return "ViewBudget";
   }
   
}