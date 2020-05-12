package kr.co.poppy.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Address;
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Goodsdetail;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.GoodsdetailService;
import kr.co.poppy.service.PointsService;
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
	
	/** 주문결제페이지 */
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public Map<String, Object> get_list() {

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Address input2 = new Address();
		input2.setMemno(myInfo.getMemno());
		List<Address> output2 = null;

		try {
			// 데이터 조회			
			output2 = addressService.getAddressList(input2);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		mySession.setAttribute("userInfo", myInfo);

		/** View 처리 */
		Map<String, Object> data = new HashMap<String, Object>();	
		data.put("item", output2);
		return webHelper.getJsonData(data);
	}

	/** 주소 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/pay", method = RequestMethod.POST)
	public Map<String, Object> addrAdd_ok(@RequestParam(value = "odname", defaultValue = "") String odname,
			@RequestParam(value = "odphone", defaultValue = "") String odphone,
			@RequestParam(value = "odemail", defaultValue = "") String odemail,
			@RequestParam(value = "zcode", defaultValue = "") Integer zcode,
			@RequestParam(value = "addr1", defaultValue = "") String addr1,
			@RequestParam(value = "addr2", defaultValue = "") String addr2,
			@RequestParam(value = "regdate", required = false) String regdate,
			@RequestParam(value = "editdate", required = false) String editdate) {

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (odname.equals("")) {
			return webHelper.getJsonWarning("이름을 입력하세요.");
		}
		if (!regexHelper.isKor(odname)) {
			return webHelper.getJsonWarning("이름은 한글만 가능합니다.");
		}
		if (odemail.equals("")) {
			return webHelper.getJsonWarning("이메일을 입력하세요.");
		}
		if (!regexHelper.isEmail(odemail)) {
			return webHelper.getJsonWarning("이메일 형식이 아닙니다.");
		}
		if (addr1.equals("")) {
			return webHelper.getJsonWarning("주소를 입력하세요.");
		}
		if (addr2.equals("")) {
			return webHelper.getJsonWarning("상세주소를 입력하세요.");
		}
		// 숫자형으로 선언된 파라미터()
		if (zcode == null) {
			return webHelper.getJsonWarning("우편번호를 입력하세요.");
		}

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Address save = new Address();
		save.setOdname(odname);
		save.setOdphone(odphone);
		save.setOdemail(odemail);
		save.setZcode(zcode);
		save.setAddr1(addr1);
		save.setAddr2(addr2);
		save.setRegdate("now()");
		save.setEditdate("now()");
		save.setMemno(myInfo.getMemno());

		// 저장된 결과를 조회하기 위한 객체
		Address saves = null;

		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 save 객체에 PK값이 저장된다.
			addressService.addAddress(save);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		mySession.setAttribute("userInfo", myInfo);

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orders", save);
		return webHelper.getJsonData(map);
	}
}
