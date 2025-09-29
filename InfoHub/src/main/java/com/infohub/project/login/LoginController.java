package com.infohub.project.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginServiceImpl se;
	
	@GetMapping("login")
	public String login(Model model) {
		model.addAttribute("listAll", se.listAll());

		return "/login/login";
	}
	
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("userId")String userId) {
		
		boolean exists = se.checkuserIdDuplicate(userId);
		return exists ? "EXISTS" : "OK";
	}
	@GetMapping("/nameCheck")
	@ResponseBody
	public String nameCheck(@RequestParam("name")String name) {
		
		boolean exists = se.checkNameDuplicate(name);
		return exists ? "EXISTS" : "OK";
	}
	@GetMapping("/passwordCheck")
	@ResponseBody
	public String passwordCheck(@RequestParam("password")String password,
								@RequestParam("passwordConfirm")String passwordConfirm) {
		return password.equals(passwordConfirm) ? "MATCH" : "MISMATCH";
	}
	
	@GetMapping("idfind")
	public String idfind(Model model) {
		
		return "./login/idfind";
	}
	@GetMapping("logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}

	@GetMapping("myinfo")
	public String myinfo(@RequestParam("name")String name ,Model model) {
		model.addAttribute("name", name);
		return "./login/myinfo";
	}
	@PostMapping("myinfo")
	public String myinfo(Model model, 
						HttpServletRequest request,
						@RequestParam("userId")String userId,
						@RequestParam("password")String password,
						@RequestParam("email")String email,
						@RequestParam("name")String name,
						@RequestParam("phone")String phone) {
		
		int i = se.updateUser(new LoginDTO(userId,password,name,email,phone,null,null,1,1,0));
		if( i > 0 ) {
			logger.info("변경성공");
			request.getSession().invalidate();
			HttpSession session = request.getSession(true);
			session.setAttribute("userId", userId);
		}
		
		return "redirect:/";
	}
	
	@GetMapping("passwordfind")
	public String passwordfind(Model model) {
		return "./login/passwordfind";
	}
	
	@PostMapping("login_ok")
	public String login_ok(Model model, LoginRequest lr, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		LoginDTO res = se.login(lr);
		
		if(res!=null) {
			request.getSession().invalidate(); //기존 세션 파기
			
			HttpSession session = request.getSession(true);
			session.setAttribute("userId", res.getuserId()); //세션이 없으면 새로운 세션에 유저id값 부여
			session.setAttribute("loginNo", res.getLoginNo());
			
			return "redirect:/";
		}else {
			redirectAttributes.addFlashAttribute("errorMsg","아이디와 비밀번호를 확인해 주세요");
			return "redirect:/login";
		}
	}
	
	@GetMapping("memberjoin")
	public String movememberjoin(Model model){
		return "./login/memberjoin";
	}
	@ResponseBody
	@PostMapping("memberjoin")
	public String memberjoin(Model model, 
							@RequestParam("userId")String userId, 
							@RequestParam("password")String password,
							@RequestParam("passwordConfirm")String passwordConfirm,
							@RequestParam("email")String email,
							@RequestParam("name")String name,
							@RequestParam("phone")String phone,
							@RequestParam("birthyear")int birthyear) {
		int currentYear = java.time.LocalDate.now().getYear();
		int age = currentYear - birthyear;
		boolean nameCheck = false;
		boolean userIdCheck = false;
		boolean passwordCheck = false;
		
		if(se.checkNameDuplicate(name)) {
			logger.info("중복이름");
		}
		
		if(se.checkuserIdDuplicate(userId)) {
			logger.info("중복아이디");
		}
			
		if(!password.equals(passwordConfirm)) {
			logger.info("패스워드 체크 틀림");
		}
		
		int i = se.insertUser(new LoginDTO(userId,password,name,email,phone,null,null,1,1,age));
		if( i > 0 )
			logger.info("생성성공");
		
		return "./login/memberjoin";
	}
	
	@GetMapping("withdrawal")
	public String withdrawal(Model medel,@RequestParam("name")String name, HttpServletRequest request) {
		
		String userId = se.getUserByname(name).getuserId();
		
		int i = se.deleteUser(userId);
		
		if(i>0) {
			request.getSession().invalidate();
			logger.info("삭제성공");
		}
		
		return "./login/withdrawal";
	}
}
