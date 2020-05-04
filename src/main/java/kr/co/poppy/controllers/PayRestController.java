package kr.co.poppy.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Address;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class PayRestController {
	
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	AddressService addressService;


	/** 주소 목록페이지 */
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public Map<String, Object> get_list(Model model) {

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		
		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Address input = new Address();
		input.setMemno(myInfo.getMemno());

		// 조회결과를 저장할 객체 선언
		List<Address> output = null;

		try { 
			// 데이터 조회
			output = addressService.getAddressList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		mySession.setAttribute("userInfo", myInfo);
		
		/** View 처리 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		
		return webHelper.getJsonData(data);
	} 
}
