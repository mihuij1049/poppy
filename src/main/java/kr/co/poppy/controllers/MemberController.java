package kr.co.poppy.controllers;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.MailHelper;
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
	
	/** MailHelper 주입 */
	@Autowired
	MailHelper mailHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	MembersService membersService;

	/** Service 패턴 구현체 주입 */
	@Autowired
	AgreeService agreeService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
//-------------------------------------------------------------------------
	
	/** agree_0.jsp 약관동의 페이지 */
	@RequestMapping(value = "/member/agree_0.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String agree_0() {
		
		return "member/agree_0";
	}

	/**
	 * 동의 여부를 미리 DB에 저장하면 가입 절차 취소 시 의미없는 디비 저장, 삭제가 일어나므로 빈즈로 값을 상태유지 한 후, 가입완료 버튼
	 * 클릭 시 회원 정보와 함께 저장하도록 하였다.
	 */
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
			return webHelper.redirect(null, "이름을 입력하세요.");
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

	/** find_pw.jsp */
	@RequestMapping(value = "/member/find_pw.do", method = RequestMethod.GET)
	public String find_pw() {
		return "member/find_pw";
	}
	
	/** find_pw_email.jsp */
	@RequestMapping(value = "/member/find_pw_email.do", method = RequestMethod.POST)
	public ModelAndView find_pw_email(Model model,
			@RequestParam(value="user_name", required=true) String username,
			@RequestParam(value="user_id", required=true) String userid,
			@RequestParam(value="user_email", required=true) String useremail) {
		
		/** 1) 유효성 검사 */
		if (username == null) {
			return webHelper.redirect(null, "이름을 입력하세요.");
		}
		if (userid == null) {
			return webHelper.redirect(null, "아이디를 입력하세요.");
		}
		if (useremail == null) {
			return webHelper.redirect(null, "이메일을 입력하세요.");
		}
		
		/** 2) 데이터 조회하기 */
		Members input = new Members();
		input.setUsername(username);
		input.setUserid(userid);
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
		
		return new ModelAndView("member/find_pw_email");
	}
	
	/** find_pw_ok.jsp */
	@RequestMapping(value = "/member/find_pw_ok.do", method = RequestMethod.POST)
	public ModelAndView find_pw_ok(Model model,
			@RequestParam(value="user_name", required=true) String username,
			@RequestParam(value="user_id", required=true) String userid,
			@RequestParam(value="user_email", required=true) String useremail) {
		
		/** 1) 유효성 검사 */
		if (userid == null) {
			return webHelper.redirect(null, "아이디를 입력하세요.");
		}
		if (useremail == null) {
			return webHelper.redirect(null, "이메일을 입력하세요.");
		}
		
		/** 2) 임시비밀 번호 메일 발송하기  */
		// 임시 비밀번호 생성
		int randomNum = (int)((Math.random() * (999999-1+1) + 1));
		String randomPw = String.format("%06d", randomNum);
		// 임시 비밀번호로 DB 수정하기
		Members input = new Members();
		input.setUserpw(randomPw);
		input.setUsername(username);
		input.setUserid(userid);
		input.setUseremail(useremail);
		
		try {
			membersService.editPwMembers(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "가입된 회원 정보가 없습니다.");
		}
		
		// 메일 발송 변수 설정 -> 받는사람(receiver), 제목(subject), 내용(content)
		String receiver = useremail;
		String subject = "뽀삐뽀삐 쇼핑몰에서 발송된 임시비밀번호 입니다.";
		String content = username + " 님의 뽀삐뽀삐 쇼핑몰 아이디=" + userid + "<br><br>" 
						+ "임시비밀번호는 " + "<b>" + randomPw +"</b>"+ " 변경되었습니다.";
		
		try {
			mailHelper.sendMail(receiver, subject, content);
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, "메일 발송에 실패했습니다.");
		}
		
		/** 3) View에 전달할 Beans */
		// input 객체의 정보로 전달해도되지만, 임시비밀번호가 담긴 Beans를
		// 노출시키는것 같아서 output 객체를 새로 생성하여 View에 전달하였다.
		Members output = new Members();
		output.setUserid(userid);
		output.setUseremail(useremail);
		
		model.addAttribute("output", output);
		return new ModelAndView("member/find_pw_ok");
	}

	/** login.jsp */
	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public String login(Model model, @RequestParam(value = "user_id", required = false) String userid) {
		model.addAttribute("user_id", userid);
		return "member/login";
	}

	@RequestMapping(value = "/member/login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model, @RequestParam(value = "user_id", required = true) String userid,
			@RequestParam(value = "user_pw", required = true
			) String userpw) {
		/** 1) 유효성 검사 */
		if (userid == null) {
			return webHelper.redirect(null, "아이디를 입력하세요.");
		}
		if (userpw == null) {
			return webHelper.redirect(null, "비밀번호를 입력하세요.");
		}
		// 세션 저장하기 (WebHelper로 HttpServletRequest의 request객체 받기
		HttpSession userSession = webHelper.getSession();
		
		
		
		/** 2) 데이터 조회하기 */
		Members input = new Members();
		input.setUserid(userid);
		input.setUserpw(userpw);

		// 조회 결과를 저장할 객체 선언
		Members output = null;

		try {
			// 데이터 조회
			output = membersService.loginMembers(input);
			// 조회 결과가 있다면 세션 저장 
			if (output!=null) {
				userSession.setAttribute("userInfo", output);
			
			}
		} catch (Exception e) {
			return webHelper.redirect(null, "아이디와 비밀번호를 확인하세요!");
		}
		
		/** 3) View 로 데이터 전달 */
		model.addAttribute("myinfo", output);
		
		return webHelper.redirect(contextPath+"/myInfo/myinfo.do", "환영합니다! 댕댕이 주인님~!");
	}
	
	/** 로그아웃 액션 페이지 */
	@RequestMapping(value = "/member/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView logout(Model model) {

		webHelper.removeSession("userInfo");
		
		return webHelper.redirect(contextPath+"/index/index.do", "좋은 하루 되세요, 회원님!");
	}

	/**
	 * myinfo_wri_ok.jsp 회원가입 myinfo_wri_ok 에서 작업을 처리 하였더니, 새로고침 시 작성양식 다시 제출로 DB에
	 * 같은 정보가 반복하여 저장되는것이 확인되어 join_members_ok 라는 Action 페이지로 처리를 이동 하였습니다.
	 */
	@RequestMapping(value = "/member/join_members_ok.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView join_members_ok(Model model, @RequestParam(value = "useagree", defaultValue = "0") int useagree,
			@RequestParam(value = "privateagree", defaultValue = "0") int privateagree,
			@RequestParam(value = "emailagree", defaultValue = "0") int emailagree,
			@RequestParam(value = "shoppingagree", defaultValue = "0") int shoppingagree,
			@RequestParam(value = "user_id", required = true) String userid,
			@RequestParam(value = "user_pw", required = true) String userpw,
			@RequestParam(value = "user_name", required = true) String username,
			@RequestParam(value = "tel1", required = true) String userphone1,
			@RequestParam(value = "tel2", required = true) String userphone2,
			@RequestParam(value = "tel3", required = true) String userphone3,
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
		newmem.setUserphone(userphone1+"-"+userphone2+"-"+userphone3);
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
			// agree 새로 가입한 회원의 memno로 동의서 참조하기
			agreeService.editAgree(agree);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 회원가입 확인 페이지로 세션 저장 후 이동 */
		// 세션 저장하기 (WebHelper로 HttpServletRequest의 request객체 받기
		HttpSession userSession = webHelper.getSession();
		userSession.setAttribute("userInfo", newmem);

		return webHelper.redirect("myinfo_wri_ok.do", "회원가입을 축하드립니다.");
	}

	/** 가입을 환영하는 가입완료 페이지 */
	@RequestMapping(value = "/member/myinfo_wri_ok.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myinfo_wri_ok(Model model) {
		
		// 세션 (WebHelper로 HttpServletRequest의 request객체 받기
		HttpSession userSession = webHelper.getSession();
		// 세션 불러오기
		Members newmem = (Members) userSession.getAttribute("userInfo");
		model.addAttribute("newmembers", newmem);
		
		return new ModelAndView("member/myinfo_wri_ok");
	}

	/** myinfo_wri.jsp 회원 가입 작성 양식 폼 */
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
