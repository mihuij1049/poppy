package kr.co.poppy.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.MembersService;


@Controller
public class MemberController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;
	
	/** Serivce 패턴 구현체 주입 */
	@Autowired 
	MembersService membersService;
	
	/** agree_0.jsp */
	@RequestMapping(value="/member/agree_0.do", method=RequestMethod.GET)
		public String agree_0() {
		return "member/agree_0";
	}
	
	/** find_id_ok.jsp */
	@RequestMapping(value="/member/find_id_ok.do", method=RequestMethod.POST)
		public String find_id_ok() {
		return "member/find_id_ok";
	}
	
	/** find_id.jsp */
	@RequestMapping(value="/member/find_id.do", method=RequestMethod.GET)
		public String findId() {
		return "member/find_id";
	}
	
	/** find_pw_email.jsp */
	@RequestMapping(value="/member/find_pw_email.do", method=RequestMethod.POST)
		public String find_pw_email() {
		return "member/find_pw_email";
	}
	
	/** find_pw_ok.jsp */
	@RequestMapping(value="/member/find_pw_ok.do", method=RequestMethod.GET)
		public String find_pw_ok() {
		return "member/find_pw_ok";
	}
	
	/** find_pw.jsp */
	@RequestMapping(value="/member/find_pw.do", method=RequestMethod.GET)
		public String find_pw() {
		return "member/find_pw";
	}
	
	/** login.jsp */
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
		public String login() {
		return "member/login";
	}
	@RequestMapping(value="/member/login_ok.do", method=RequestMethod.POST)
	public ModelAndView login_ok(Model model,
			@RequestParam(value="user_id", required=true) String userid,
			@RequestParam(value="user_pw", required=true) String userpw) {
		/** 1) 유효성 검사 */
		if (userid==null) {
			return webHelper.redirect(null, "아이디를 입력하세요.");
		}
		if (userpw==null) {
			return webHelper.redirect(null, "비밀번호를 입력하세요.");
		}
		/** 2) 데이터 조회하기 */
		Members input = new Members();
		input.setUserid(userid);
		input.setUserpw(userpw);
		
		// 조회 결과를 저장할 객체 선언
		Members output = null;
		
		try {
			// 데이터 조회
			output = membersService.loginMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
			
	return new ModelAndView("myInfo/myinfo");
}
	
	/** myinfo_wri_ok.jsp */
	@RequestMapping(value="/member/myinfo_wri_ok.do", method=RequestMethod.GET)
		public String myinfo_wri_ok() {
		return "member/myinfo_wri_ok";
	}
	
	/** myinfo_wri.jsp */
	@RequestMapping(value="/member/myinfo_wri.do", method=RequestMethod.GET)
		public String myinfo_wri(Model model) {
		// 체크박스의 동의 여부를 view에게 전달
		return "member/myinfo_wri";
	}
}
