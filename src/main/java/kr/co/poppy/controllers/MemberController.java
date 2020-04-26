package kr.co.poppy.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MemberController {
	
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
