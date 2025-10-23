 package com.infohub.project.login;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginServiceImpl se;
	
	@Autowired
    private KakaoService kakaoService;
	
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
	@PostMapping("/passwordCheck")
	@ResponseBody
	public String passwordCheck(@RequestBody Map<String, String> data) {
		String password = data.get("password");
		String passwordConfirm = data.get("passwordConfirm");
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
	public String myinfo(@RequestParam("name")String name ,Model model, HttpServletRequest request) {
		model.addAttribute("name", name);
		HttpSession session = request.getSession();
		String loginNo = (String) session.getAttribute("loginNo");
		System.out.println(loginNo);
		return "./login/myinfo";
	}
	@PostMapping("myinfo")
	public String myinfo(Model model, 
						HttpServletRequest request,
						@RequestParam("userId")String userId,
						@RequestParam("password")String password,
						@RequestParam("email")String email,
						@RequestParam("name")String name,
						@RequestParam("phone")String phone,
						@RequestParam("gender")String gender,
						@RequestParam("keywords")String keywords) {
		
		int i = se.updateUser(new LoginDTO(0,userId,password,name,email,phone,null,null,1,1,0,gender,keywords));
		LoginDTO dto = se.getUserById(userId);
		if( i > 0 ) {
			logger.info("변경성공");
			request.getSession().invalidate();
			HttpSession session = request.getSession(true);			
			session.setAttribute("userId", userId);
			session.setAttribute("loginNo", dto.getName());
			session.setAttribute("name", dto.getName());
		}
		
		return "redirect:/";
	}
	
	@PostMapping("login_ok")
	public String login_ok(Model model, LoginRequest lr, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		LoginDTO res = se.login(lr);
		int status = 0;
		if(res != null) {
			
			LoginDTO latest = se.getUserById(res.getUserId());
			status = latest.getStatus();

		}
		
		if(res!=null && status != 0) {
			request.getSession().invalidate(); //기존 세션 파기
			
			HttpSession session = request.getSession(true);
			
			LoginDTO latest = se.getUserById(res.getUserId());
			
			session.setAttribute("userId", latest.getUserId());
            session.setAttribute("loginNo", latest.getLoginNo());
            session.setAttribute("name", latest.getName());
            session.setAttribute("email", latest.getEmail());
            session.setAttribute("phone", latest.getPhone());
            session.setAttribute("keywords", latest.getKeywords());
			
			return "redirect:/";
		}else {
			redirectAttributes.addFlashAttribute("errorMsg","아이디와 비밀번호를 확인해 주세요");
			return "redirect:/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/memberjoin")
	public String memberjoin(Model model, HttpServletRequest request, 
							@RequestParam("userId")String userId, 
							@RequestParam("password")String password,
							@RequestParam("passwordConfirm")String passwordConfirm,
							@RequestParam("email")String email,
							@RequestParam("name")String name,
							@RequestParam("phone")String phone,
							@RequestParam("age")int age,
							@RequestParam("gender")String gender,
							@RequestParam("keywords")String keywords) {
		
		if(se.checkNameDuplicate(name)) {
			logger.info("중복이름");
			return "FAIL";
		}
		
		if(se.checkuserIdDuplicate(userId)) {
			logger.info("중복아이디");
			return "FAIL";
		}
			
		if(!password.equals(passwordConfirm)) {
			logger.info("패스워드 체크 틀림");
			return "FAIL";
		}
		
		phone = se.formatPhoneNumber(phone);
		
		int i = se.insertUser(new LoginDTO(0, userId,password,name,email,phone,null,null,1,1,age,gender,keywords));
		if( i > 0 )
			return "OK";
		
		return "FAIL";
	}
	
	@GetMapping("withdrawal")
	public String withdrawal(Model medel,@RequestParam("name")String name, HttpServletRequest request) {
		
		String userId = se.getUserByname(name).getUserId();
		
		int i = se.deleteUser(userId);
		
		if(i>0) {
			request.getSession().invalidate();
			logger.info("삭제성공");
		}
		
		return "./login/withdrawal";
	}
	
	@PostMapping("/findid")
	public String findid(Model model,
						@RequestParam("name")String name,
						@RequestParam("email")String email,
						@RequestParam("phone")String phone){
		
		phone = se.formatPhoneNumber(phone);
		
		String foundId = se.findid(name, email, phone);
		
		if(foundId != null) {
			model.addAttribute("foundId", foundId);	
		}else {
			model.addAttribute("error", "아이디를 찾지 못했습니다");
		}
		
		return "login/idfind";
	}
	
	@PostMapping("/findpassword")
	public String findpassword(Model model,
							@RequestParam("userId")String userId,
							@RequestParam("email")String email,
							@RequestParam("phone")String phone) {
		phone = se.formatPhoneNumber(phone);
		int i = se.findpassword(userId, email, phone);
		if(i>0) {
			model.addAttribute("resetEmail", userId);
		}else {
			model.addAttribute("error", "해당 가입자를 찾지 못했습니다");
		}
		
		return "login/idfind";
	}
	
	@PostMapping("/updatePassword")
	public String updatePassword(Model model,
								@RequestParam("newPassword")String newPassword,
								@RequestParam("userId")String userId){
		
		int i = se.updatepassword(newPassword, userId);
		if(i>0) {
			model.addAttribute("passwordChanged", true);
		}else {
			model.addAttribute("error", "비밀번호 변경에 실패했습니다.");
		}
		return "login/idfind";
	}
	
	@GetMapping("mypage_main")
	public String mypage_main(Model model,
							HttpServletRequest request) {
		HttpSession session =request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null) {
			return "index";
		}
		model.addAttribute("name", se.getUserById(userId).getName());
		model.addAttribute("email", se.getUserById(userId).getEmail());
		model.addAttribute("phone", se.getUserById(userId).getPhone());
		model.addAttribute("keywords", se.getUserById(userId).getKeywords());
				
		
		return "/mypage/mypage_main";
	}
	
	@PostMapping(value="/api/checkPassword", produces="application/json")
	@ResponseBody
	public Map<String, Object> apiCheckPassword(@RequestBody Map<String, String>body,
												HttpSession session){
		String password = body.get("password");
		String userId = (String) session.getAttribute("userId");
		boolean ok = false;
		
		if(password.equals(se.checkPasswordById(userId))) {
			ok = true;
		}
		
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("ok", ok);
		
		return res;
	}
	
	@PostMapping(value = "/api/updateprofile", produces="application/json")
	@ResponseBody
	public Map<String, Object> updateprofile(@RequestBody ProfileUpdateRequest body,
											HttpSession session){
		String userId = (String) session.getAttribute("userId");
		String name = body.getName();
		String email = body.getEmail();
		String phone = body.getPhone();
		String password = body.getPassword();
		String keywords = body.getKeywords();
		
		int tmp = se.updateUser(new LoginDTO(0, userId, password, name, email, phone, null, null, 0, 0, 0 , null, keywords));
		boolean ok = false;
		
		if(tmp>0) {
			ok = true;
			
			session.setAttribute("name", name);
	        session.setAttribute("email", email);
	        session.setAttribute("phone", phone);
	        session.setAttribute("keywords", keywords);
			
		}
		
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("ok", ok);
		
		return res;
	}
	
	@PostMapping("/api/withdrawal")
	@ResponseBody
	public Map<String, Object> withdrawal(HttpSession session){
		String userId = (String) session.getAttribute("userId");
		boolean ok = false;
		
		if(userId != null) {
			int result = se.deleteUser(userId);
			if(result > 0) {
				ok = true;
				session.invalidate();
			}
		}
		
		Map<String , Object> res = new HashMap<String, Object>();
		res.put("ok", ok);
		
		return res;
	}
	
	 @GetMapping("/kakaoLogin")
	 public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {

		 String accessToken = kakaoService.getAccessToken(code);

	     LoginDTO dto = kakaoService.getUserInfo(accessToken);

	     se.saveIfNotExist(dto);

	     LoginDTO loginUser = se.findByKakaoId(dto.getKakaoId());
	     
	     session.setAttribute("userId", loginUser.getUserId());
	     session.setAttribute("name", loginUser.getName());
	     session.setAttribute("loginNo", loginUser.getLoginNo());
	     
	     System.out.println("세션 저장: " + session.getAttribute("userId") + ", " + session.getAttribute("name"));


	     return "redirect:/";
	 }
}
