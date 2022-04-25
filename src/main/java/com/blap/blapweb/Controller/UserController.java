package com.blap.blapweb.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blap.blapweb.DTO.UserDTO;
import com.blap.blapweb.Service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
//	@RequestMapping(value = "/SignIn", method = RequestMethod.GET)
//	public String signIn(Model model) {
//		return "SignIn";
//	}
	
	@RequestMapping(value="/SignIn")
	public String signIn(HttpServletRequest request, HttpServletResponse response, HttpSession session)
		throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("kakaoemail"));
		
		if (request.getParameter("login_ok") == null) {
		}
		else if (request.getParameter("login_ok").equals("1") && !request.getParameter("kakaoemail").equals("")) {

			// ==================== 카카오 로그인 ========================
			System.out.println("카카오로그인");
			System.out.println(request.getParameter("kakaoemail"));
			System.out.println(request.getParameter("kakaoname"));
			
			UserDTO userDto = new UserDTO();
			
			// kakaoid를 to의 id로 세팅
			userDto.setEmail(request.getParameter("kakaoemail"));

			// 카카오계정으로 로그인한 적이 있는지 없는지 
			int result_lookup = userService.loginLookup(userDto);

			if (result_lookup == 0) { // 회원이 아닌경우 (카카오 계정으로 처음 방문한 경우) 카카오 회원정보 설정 창으로 이동
				System.out.println("카카오 회원 정보 설정");

				request.setAttribute("kakaoname",request.getParameter("kakaoname"));
				request.setAttribute("kakaoemail",request.getParameter("kakaoemail"));
				
				userDto.setEmail(request.getParameter("kakaoemail"));
				userDto.setUser_name(request.getParameter("kakaoname"));
				
				userService.insertUser(userDto);
				
				// 회원가입창으로 이동
				return "SignIn";

			} 
			else { // 이미 카카오로 로그인한 적이 있을 때 (최초 1회 로그인때 회원가입된 상태)
				System.out.println("카카오 회원 정보 완료");
				// id, nick, profile을 가져와서
				userDto = userService.loginOkNick(userDto);
				// nick를 세션에 저장
				session.setAttribute("kakaoname", userDto.getUser_name());
				// email을 세션에 저장
				session.setAttribute("kakaoemail", userDto.getEmail());
				
				request.setAttribute("flag", 0);
				
				System.out.println("kakaoname : " + userDto.getUser_name());
				System.out.println("kakaoemail : " + userDto.getEmail());
			}

		}

		return "SignIn";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/SignIn";
	}
	
//	@Autowired
//	UserService userService;
//	
//	@RequestMapping(value="/signInOk", method=RequestMethod.POST)
//	public String signinOk(HttpSession session, UserDTO dto) {
//		System.out.println(dto.getUser_name());
//		String returnURL = "";
//		if (session.getAttribute("signin") != null) {
//			session.removeAttribute("signin");
//		}
//		UserDTO userdto = userService.getUser(dto);
//		if (userdto != null) { // 로그인 성공
//			System.out.println("로그인 성공!");
//			session.setAttribute("user", userdto);
//			returnURL = "redirect:/main";	
//		} else { // 로그인 실패
//			System.out.println("로그인 실패!");
//			returnURL = "redirect:/SignIn";
//		}
//		return returnURL;
//	}
//	
//	@RequestMapping(value="/adduserok", method=RequestMethod.POST)
//	public String addUserOK(HttpSession session, UserDTO dto) {
//		if(userService.insertUser(dto)==0)
//			System.out.println("데이터 추가 실패");
//		else
//			System.out.println("데이터 추가 성공");
//		return "redirect:SignIn";
//	}
}
