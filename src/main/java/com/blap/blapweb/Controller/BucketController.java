package com.blap.blapweb.Controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.Console;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.blap.blapweb.DTO.BucketDTO;
import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.DTO.TagDTO;
//import com.blap.blapweb.DTO.PageDTO;
import com.blap.blapweb.Service.BucketService;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class BucketController   {
   @Autowired
   BucketService bucketService;
   BucketDTO bucketdto = new BucketDTO();
   
   // 버킷리스트를 읽어들여 리스트 보여주는 페이지로 이동
   
//   @RequestMapping(value="/readbucket", method=RequestMethod.GET) // 해당 페이지를 보여줄 주소.
   @RequestMapping(value="/selectlist", method=RequestMethod.GET) 
   public String noticelist(Model model) {
      model.addAttribute("Bucketlist", bucketService.getBucketList()); // 버킷리스트를 모두 읽어들여 Bucketlist이 변수 이름으로 저장.
      System.out.println(bucketdto.toString());
      return "Bucketlist"; // 보여줄 페이지이름.
   }
   
  
   
   // 버킷리스트 추가하는 페이지로 이동
   @RequestMapping(value="/addbucket", method = RequestMethod.GET)
   public String addPost() {
      return "AddList";
   }
   
   
   // 버킷리스트 추가 후 list 페이지로 이동
   @RequestMapping(value = "/addbucketok", method = RequestMethod.POST)
   public String addPostOK(BucketDTO dto) {   
      System.out.println("hello");
      if (bucketService.insertBucket(dto)==0) 
         System.out.println("데이터 추가 실패");
       else 
          System.out.println("데이터 추가 성공!!");
      return "redirect:readbucket";
   }   
   
   // 버킷리스트 상세 페이지로 이동
   @RequestMapping(value="/viewbucket/{bucket_id}", method=RequestMethod.GET)
   public String viewPost(@PathVariable("bucket_id") int bucket_id, Model model) {
      BucketDTO bucketDTO = bucketService.getBucket(bucket_id);
      model.addAttribute("v", bucketDTO);
      return "View";
   }
   
   
   @RequestMapping(value = "/editbucket/{bucket_id}", method = RequestMethod.GET)
   public String editPost(@PathVariable("bucket_id") int bucket_id, Model model) {      
      BucketDTO bucketDTO = bucketService.getBucket(bucket_id);
      model.addAttribute("v", bucketDTO);   
      return "EditList";
   }

   @RequestMapping(value = "/editbucketok", method = RequestMethod.POST)
   public String editPostOK(BucketDTO dto) {
      if (bucketService.updateBucket(dto) == 0)
         System.out.println("데이터 수정 실패 ");
      else 
         System.out.println("데이터 수정 성공 !!! ");
      return "redirect:readbucket";
   }
   
   @RequestMapping(value = "/deletebucketok/{bucket_id}", method = RequestMethod.GET)
   public String deletePostOK(@PathVariable("bucket_id") int bucket_id) {
      if(bucketService.deleteBucket(bucket_id) == 0)
         System.out.println("데이터 삭제 실패");
       else 
          System.out.println("데이터 삭제 성공!!");
      return "redirect:../readbucket";
   }
   
   @RequestMapping(value = "/alldeletebucketok", method = RequestMethod.GET)
   public String alldeletePostOK() {
      if(bucketService.alldeleteBucket() == 0)
         System.out.println("데이터 삭제 실패");
       else 
          System.out.println("데이터 삭제 성공!!");
      return "redirect:../readbucket";
   }
   
   @RequestMapping(value = "/statelist", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
   public @ResponseBody String stateList(Locale locale, Model model) {
      Gson gson = new Gson();
      List<BucketDTO> list = bucketService.getStateList();
      return gson.toJson(list);

   }
   
   @RequestMapping(value = "/tagCount", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
   public @ResponseBody String tagCount(Locale locale, Model model) {
      Gson gson = new Gson();
      List<BucketDTO> list = bucketService.getTagCount();
      return gson.toJson(list);

   }
   
//   @RequestMapping(value = "/taglist", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
//   public @ResponseBody String tagList(Locale locale, Model model) {
//      Gson gson = new Gson();
//      List<BucketDTO> list = bucketService.getTagList();
//      return gson.toJson(list);
//
//   }
   
// @RequestMapping(value = "/selectlist")
   @RequestMapping(value = "/readbucket")
   public String boardList(PageDTO dto, Model model,
         @RequestParam(value="nowPage", required=false) String nowPage,
         @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
	   
	   
//	   
//	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//	   
//	   Date date = new Date(dateFormat.parse(strDate).getTime());
//	   Date date = bucketService.getGoalDate();
//	   Date today = new Date(dateFormat.parse(todayFm).getTime());
//	       
//	   long calculate = date.getTime() - today.getTime();
	   
	   
	   
	   
	   
    
         int total = bucketService.countBucketList();
//      System.out.println("total is "+total);
         if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "9";
         } else if (nowPage == null) {
            nowPage = "1";
         } else if (cntPerPage == null) { 
            cntPerPage = "9";
         }
         BucketDTO dto2 = new BucketDTO();
         dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
         model.addAttribute("paging", dto);
         model.addAttribute("viewAll", bucketService.selectBucketList(dto));
         System.out.println(dto2.toString());
//         return "BucketPaging";
      return "Bucketlist";
 }
   @RequestMapping(value = "/readbudget")
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
//         model.addAttribute("Bucketlist", bucketService.getBucketList2()); 
         model.addAttribute("viewAll", bucketService.selectBucketList(dto));
         System.out.println(dto2.toString());
      return "Budget";
 }
   
   
   //정렬기준
   @RequestMapping(value="/readbuckett", method=RequestMethod.GET) 
   public String showList(Model model) {
      model.addAttribute("RecentlyList", bucketService.showRecently());
      model.addAttribute("NeedList", bucketService.showNeed());
      System.out.println(bucketdto.toString());
      return "Bucketlist"; // 보여줄 페이지이름.
   }
   
   
   @RequestMapping(value = "/startbucketok/{bucket_id}", method = RequestMethod.GET)
   public String startPostOK(@PathVariable("bucket_id") int bucket_id) {
      if(bucketService.startBucket(bucket_id) == 0)
         System.out.println("데이터 시작 실패");
       else 
          System.out.println("데이터 시작 성공!!");
      return "redirect:../readbucket";
   }
   
//   @RequestMapping(value = "/endbucketok/{bucket_id}", method = RequestMethod.GET)
//   public String endPostOK(@PathVariable("bucket_id") int bucket_id) {
//      if(bucketService.endBucket(bucket_id) == 0)
//         System.out.println("데이터 완료 실패");
//       else 
//          System.out.println("데이터 완료 성공!!");
//      return "redirect:../readbucket";
//   }
   
   
   
 @RequestMapping(value = "/endbucketok/{bucket_id}", method = RequestMethod.GET)
 public String endPostOK(@PathVariable("bucket_id") int bucket_id) {
    if(bucketService.endBucket(bucket_id) == 0)
       System.out.println("데이터 완료 실패");
     else 
        System.out.println("데이터 완료 성공!!");
    return "redirect:/viewbudgetpage/{bucket_id}";
 }
   
 @RequestMapping(value="/searchByTag", method = RequestMethod.POST)
	public String searchTagList(Model model, TagDTO dto) {
		model.addAttribute("list", bucketService.searchOneBucketByTag(dto));
		return "Bucketlist";
	}   
   
//   @RequestMapping(value="/readbudget", method=RequestMethod.GET) // 해당 페이지를 보여줄 주소.
//   public String readlist(Model model) {
//      model.addAttribute("Bucketlist", bucketService.getBucketList()); // 버킷리스트를 모두 읽어들여 Bucketlist이 변수 이름으로 저장.
//      System.out.println(bucketdto.toString());
//      return "Budget"; // 보여줄 페이지이름.   
//   }
//   
//   
// 
   
//   @RequestMapping(value="/readbucket", method=RequestMethod.GET) // 해당 페이지를 보여줄 주소.
//   public String noticelist(Model model) {
//      model.addAttribute("Bucketlist", bucketService.getBucketList()); // 버킷리스트를 모두 읽어들여 Bucketlist이 변수 이름으로 저장.
//      System.out.println(bucketdto.toString());
//      return "Bucketlist"; // 보여줄 페이지이름.
//   }
   

   
   
   
   
}