package kr.co.poppy.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Address;
import kr.co.poppy.service.AddressService;

@Controller
public class PayController {
	
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
    /** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired AddressService addressService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value = "/pay/cart.do", method = RequestMethod.GET)
	public String cart() {
		return "pay/cart";
	}

	/** 상세페이지 */
	@RequestMapping(value = "/pay/orderform.do", method = RequestMethod.POST)
	public ModelAndView addrView(Model model,
			@RequestParam(value="memno", defaultValue="") int memno) {
		
		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (memno == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}
		
		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을  Beans에 저장하기
		Address input = new Address();
		input.setMemno(memno);
		
		// 조회결과를 저장할 객체 선언
		Address output = null;
		
		try {
			// 데이터 조회
			output = addressService.getAddressItem(input); 
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("pay/orderform");
	}
	
	/** 목록페이지 */
	@RequestMapping(value = "/pay/orderform.do", method = RequestMethod.POST)
	public ModelAndView addrList(Model model,
			@RequestParam(value="memno", defaultValue="") int memno) {
		
		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (memno == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}
		
		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을  Beans에 저장하기
		Address input = new Address();
		input.setMemno(memno);
		
		// 조회결과를 저장할 객체 선언
		List<Address> output = null;
		
		try {
			// 데이터 조회
			output = addressService.getAddressList(input); 
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** View 처리 */
		model.addAttribute("output", output);
		
		String viewPath = "pay/orderform";
		return new ModelAndView(viewPath);
	}
	
	
	
}
