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
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
import kr.co.poppy.service.OrdersService;
import kr.co.poppy.service.PointsService;

@Controller
public class PayAjaxController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	AddressService addressService;	
	
	@Autowired
	PointsService pointsService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 주소 목록페이지 */
	@RequestMapping(value = "/pay/orderform_ajax.do", method = RequestMethod.GET)
	public ModelAndView addrList(Model model,
			@RequestParam(value = "memno", defaultValue = "1") int memno) {

		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (memno == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}

		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Address input = new Address();
		Address input2 = new Address();
		input.setMemno(memno);
		input2.setMemno(memno);
		
		// 조회결과를 저장할 객체 선언
		Address output = null;
		List<Address> output2 = null;
		
		Points input3 = new Points();
		input3.setMemno(memno);
		
		Points output3 = null;

		try { 
			// 데이터 조회
			output = addressService.getAddressItem(input);
			output2 = addressService.getAddressList(input2);
			output3 = pointsService.getPointsMbItem(input3);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("item", output2);
		model.addAttribute("output3", output3);
		return new ModelAndView("pay/orderform_ajax");
	}

}
