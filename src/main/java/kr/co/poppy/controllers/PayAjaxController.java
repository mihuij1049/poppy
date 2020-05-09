package kr.co.poppy.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
import kr.co.poppy.service.OrdersService;
import kr.co.poppy.service.PointsService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	@RequestMapping(value = "/pay_ajax/orderform.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addrList(Model model) {

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
	
		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Address input = new Address();	
		input.setMemno(myInfo.getMemno());
		// 조회결과를 저장할 객체 선언
		Address output = null;
		
		Address input2 = new Address();
		input2.setMemno(myInfo.getMemno());
		List<Address> output2 = null;
		
		Points input3 = new Points();
		input3.setMemno(myInfo.getMemno());	
		List<Points> output3 = null;

		try { 
			// 데이터 조회
			output = addressService.getAddressItem(input);
			output2 = addressService.getAddressList(input2);
			output3 = pointsService.getPointsMbList(input3);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 조회된 List객체에서 적립금 총합 구하기 */
		int sumAvpoint = 0;
		
		for (int i = 0; i < output3.size(); i++) {
			Points temp = null;
			temp = output3.get(i);
			if (temp.getAvpoint() == null || temp.getAvpoint()==0) {
				temp.setAvpoint(0);
			}
			sumAvpoint += temp.getAvpoint();		
		}
		
		input3.setAvpoint(sumAvpoint);

		// 세션에도 정보 담기
		myInfo.setSumAvpoint(sumAvpoint);

		mySession.setAttribute("userInfo", myInfo);

		/** View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("item", output2);
		model.addAttribute("input3", input3);
	
		return new ModelAndView("pay/orderform_ajax");
	}

}
