package kr.co.poppy.controllers;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Agree;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.AgreeService;
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

	/** Service 패턴 구현체 주입 */
	@Autowired
	AgreeService agreeService;

	/** agree_0.jsp */
	@RequestMapping(value = "/member/agree_0.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String agree_0() {
		return "member/agree_0";
	}

	// 동의 여부를 Beans 에 담아 회원가입 페이지로 이동
	@RequestMapping(value = "/member/agree_ok.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView agree_0(Model model, @RequestParam(value = "useagree", defaultValue = "0") int useagree,
			@RequestParam(value = "privateagree", defaultValue = "0") int privateagree,
			@RequestParam(value = "emailagree", defaultValue = "0") int emailagree,
			@RequestParam(value = "shoppingagree", defaultValue = "0") int shoppingagree) {
		/** 1) 유효성 검사 */
		if (useagree == 0) {
			return webHelper.redirect(null, "이용약관 에 동의하세요.");
		}
		if (privateagree == 0) {
			return webHelper.redirect(null, "개인정보취급방침 에 동의하세요.");
		}
		/** 데이터 담기 */

		// Agree Beans 객체 선언
		Agree agree = new Agree();
		agree.setUseagree(1);
		agree.setPrivateagree(1);
		if (emailagree == 1) {
			agree.setEmailagree(1);
		} else {
			agree.setEmailagree(0);
		}
		if (shoppingagree == 1) {
			agree.setShoppingagree(1);
		} else {
			agree.setShoppingagree(0);
		}

		model.addAttribute("agree_ok", agree);

		return new ModelAndView("member/myinfo_wri.do");
	}

	/** find_id.jsp */
	@RequestMapping(value = "/member/find_id.do", method = RequestMethod.GET)
	public String findId() {
		return "member/find_id";
	}

	/** find_id_ok.jsp */
	@RequestMapping(value = "/member/find_id_ok.do", method = RequestMethod.POST)
	public ModelAndView find_id_ok(Model model, @RequestParam(value = "user_name", required = true) String username,
			@RequestParam(value = "user_email", required = true) String useremail) {

		/** 1) 유효성 검사 */
		if (username == null) {
			return webHelper.redirect(null, "아이디를 입력하세요.");
		}
		if (useremail == null) {
			return webHelper.redirect(null, "비밀번호를 입력하세요.");
		}
		/** 2) 데이터 조회하기 */
		Members input = new Members();
		input.setUsername(username);
		input.setUseremail(useremail);

		// 조회한 데이터를 담을 Beans 선언
		Members output = null;

		try {
			// 데이터 조회
			output = membersService.findIdMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "가입된 회원 정보가 없습니다.");
		}

		model.addAttribute("output", output);

		return new ModelAndView("member/find_id_ok");
	}

	/** find_pw_email.jsp */
	@RequestMapping(value = "/member/find_pw_email.do", method = RequestMethod.POST)
	public String find_pw_email() {
		return "member/find_pw_email";
	}

	/** find_pw_ok.jsp */
	@RequestMapping(value = "/member/find_pw_ok.do", method = RequestMethod.GET)
	public String find_pw_ok() {
		return "member/find_pw_ok";
	}

	/** find_pw.jsp */
	@RequestMapping(value = "/member/find_pw.do", method = RequestMethod.GET)
	public String find_pw() {
		return "member/find_pw";
	}

	/** login.jsp */
	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public String login(Model model, @RequestParam(value = "user_id", required = false) String userid) {
		model.addAttribute("user_id", userid);
		return "member/login";
	}

	@RequestMapping(value = "/member/login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model, @RequestParam(value = "user_id", required = true) String userid,
			@RequestParam(value = "user_pw", required = true) String userpw) {
		/** 1) 유효성 검사 */
		if (userid == null) {
			return webHelper.redirect(null, "아이디를 입력하세요.");
		}
		if (userpw == null) {
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
		model.addAttribute("myinfo", output);
		return new ModelAndView("myInfo/myinfo");
	}

	/** myinfo_wri_ok.jsp */
	@RequestMapping(value = "/member/myinfo_wri_ok.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myinfo_wri_ok(Model model, @RequestParam(value = "useagree", defaultValue = "0") int useagree,
			@RequestParam(value = "privateagree", defaultValue = "0") int privateagree,
			@RequestParam(value = "emailagree", defaultValue = "0") int emailagree,
			@RequestParam(value = "shoppingagree", defaultValue = "0") int shoppingagree,
			@RequestParam(value = "user_id", required = true) String userid,
			@RequestParam(value = "user_pw", required = true) String userpw,
			@RequestParam(value = "user_name", required = true) String username,
			@RequestParam(value = "tel", required = true) String userphone,
			@RequestParam(value = "email", required = true) String useremail) {
		
		// 가입한 시각을 담은 date 생성
		Calendar c = Calendar.getInstance();
		String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
				c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE),
				c.get(Calendar.SECOND));
		
		/** agree Beans 선언 및 할당 */
		Agree agree = new Agree();
		agree.setUseagree(1);
		agree.setPrivateagree(1);
		if (emailagree == 1) {
			agree.setEmailagree(1);
		} else {
			agree.setEmailagree(0);
		}
		if (shoppingagree == 1) {
			agree.setShoppingagree(1);
		} else {
			agree.setShoppingagree(0);
		}
		agree.setRegdate(date);
		agree.setEditdate(date);

		/** Members Beans 선언 및 할당 */

		Members newmem = new Members();
		newmem.setUserid(userid);
		newmem.setUserpw(userpw);
		newmem.setUsername(username);
		newmem.setUseremail(useremail);
		newmem.setUserphone(userphone);
		newmem.setRegdate(date);
		newmem.setEditdate(date);

		/** 동의서 및 회원정보 DB에 저장 */
		try {
			// 동의서 저장
			agreeService.addAgree(agree);
			// 회원정보 저장
			membersService.addMembers(newmem);
			// memno 담기
			agree.setMemno(newmem.getMemno());
			// agree 테이블 갱신
			agreeService.editAgree(agree);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 새로 가입한 회원의 memno로 동의서 참조하기 */
		model.addAttribute("newmembers", newmem);

		return new ModelAndView("member/myinfo_wri_ok");
	}

	/** myinfo_wri.jsp */
	@RequestMapping(value = "/member/myinfo_wri.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myinfo_wri(Model model, @RequestParam(value = "useagree", defaultValue = "0") int useagree,
			@RequestParam(value = "privateagree", defaultValue = "0") int privateagree,
			@RequestParam(value = "emailagree", defaultValue = "0") int emailagree,
			@RequestParam(value = "shoppingagree", defaultValue = "0") int shoppingagree) {

		Agree agree = new Agree();
		agree.setUseagree(useagree);
		agree.setPrivateagree(privateagree);
		agree.setEmailagree(emailagree);
		agree.setShoppingagree(shoppingagree);

		model.addAttribute("agree_ok", agree);

		return new ModelAndView("member/myinfo_wri");
	}
}
