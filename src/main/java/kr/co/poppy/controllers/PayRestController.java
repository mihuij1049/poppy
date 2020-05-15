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
import kr.co.poppy.model.Orderdetail;
import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.GoodsdetailService;
import kr.co.poppy.service.OrderdetailService;
import kr.co.poppy.service.OrdersService;
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
	
	@Autowired
	OrdersService ordersService;
	
	@Autowired
	OrderdetailService orderdetailService;
	
	@Autowired
	PointsService pointsService;
	
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
	public Map<String, Object> addrAdd_ok(
			/** 주소 INSERT */
			@RequestParam(value = "addrno", defaultValue = "0") int addrno,
			@RequestParam(value = "odname", defaultValue = "") String odname,
			@RequestParam(value = "odphone", defaultValue = "") String odphone,
			@RequestParam(value = "odemail", defaultValue = "") String odemail,
			@RequestParam(value = "zcode", defaultValue = "") Integer zcode,
			@RequestParam(value = "addr1", defaultValue = "") String addr1,
			@RequestParam(value = "addr2", defaultValue = "") String addr2,
			@RequestParam(value = "memno", defaultValue = "0") int memno,
			/** 주문 INSERT */
			@RequestParam(value = "orderno", defaultValue = "0") int orderno,
			@RequestParam(value = "odmsg", defaultValue = "") String odmsg,
			@RequestParam(value = "paytype", defaultValue = "") String paytype,
			@RequestParam(value = "odstatus", defaultValue = "") String odstatus,
			@RequestParam(value = "deliprice", defaultValue = "0") int deliprice,
			@RequestParam(value = "regdate", required = false) String regdate,
			@RequestParam(value = "editdate", required = false) String editdate,
			/** 주문상품 INSERT */
			@RequestParam(value = "goodsno", defaultValue = "0") int goodsno,
			@RequestParam(value = "gcode", defaultValue = "") String gcode,
			@RequestParam(value = "gname", defaultValue = "") String gname,
			@RequestParam(value = "ginfo", defaultValue = "") String ginfo,
			@RequestParam(value = "gprice", defaultValue = "0") int gprice,
			@RequestParam(value = "gsale", defaultValue = "0") int gsale,
			@RequestParam(value = "gdate", required = false) String gdate,
			@RequestParam(value = "cate1", defaultValue = "") String cate1,
			@RequestParam(value = "cate2", defaultValue = "") String cate2,
			@RequestParam(value = "gdoption", defaultValue = "") String gdoption,
			@RequestParam(value = "gdcount", defaultValue = "0") int gdcount) {

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
	 
		if (paytype.equals("credit") || paytype.equals("phone")) {
		    odstatus = "1";
		}
		
		if (paytype.equals("BankTransfer") || paytype.equals("NotBankTransfer")) {
			odstatus = "0";
		}

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Goods gd = new Goods();
		gd.setGoodsno(goodsno);
		gd.setMemno(myInfo.getMemno());		
		
		Address address = new Address();
		address.setOdname(odname);
		address.setOdphone(odphone);
		address.setOdemail(odemail);
		address.setZcode(zcode);
		address.setAddr1(addr1);
		address.setAddr2(addr2);
		address.setRegdate("now()");
		address.setEditdate("now()");
		address.setMemno(myInfo.getMemno());

		Orders order = new Orders();
		order.setOrderno(orderno);
		order.setOdmsg(odmsg);
		order.setPaytype(paytype);
		order.setOdstatus(odstatus);
		order.setDeliprice(deliprice);
		order.setRegdate("now()");
		order.setEditdate("now()");
		order.setMemno(myInfo.getMemno());
		
		
		Orderdetail oddetail = new Orderdetail();
		oddetail.setOrderdetailno(goodsno);
		oddetail.setOdgcode(gcode);
		oddetail.setOdgname(gname);
		oddetail.setOdgprice(gprice);
		oddetail.setOdgsale(gsale);
		oddetail.setOdgdate(gdate);
		oddetail.setOdcate1(cate1);
		oddetail.setOdcate2(cate2);
		oddetail.setOdgdoption(gdoption);
		oddetail.setOdgqty(gdcount);
		oddetail.setRegdate("now()");
		oddetail.setEditdate("now()");
		oddetail.setOrderno(orderno);
		
		
		// 저장된 결과를 조회하기 위한 객체
		Address Asave = null;
		Orders Osave = null;
		Orderdetail Odsave = null;
		
	
		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 save 객체에 PK값이 저장된다.
			addressService.addAddress(address);
			order.setAddrno(address.getAddrno());
			ordersService.addOrders(order);
			oddetail.setOrderno(order.getOrderno());
			orderdetailService.addOrderdetail(oddetail);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		mySession.setAttribute("userInfo", myInfo);

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order", order);
		map.put("oddetail", oddetail);
		map.put("address", address);	
		return webHelper.getJsonData(map);
	}
	
	/** 주소 수정 폼 페이지 */
	@RequestMapping(value = "/pay", method = RequestMethod.PUT)
	public Map<String, Object> addrEdit_ok(
			@RequestParam(value = "addrno", defaultValue = "0") int addrno,
			@RequestParam(value = "odname", required = false) String odname,
			@RequestParam(value = "zcode", required = false) Integer zcode,
			@RequestParam(value = "addr1", required = false) String addr1,
			@RequestParam(value = "addr2", required = false) String addr2,
			@RequestParam(value = "odphone", required = false) String odphone,
			@RequestParam(value = "odemail", required = false) String odemail,
			@RequestParam(value = "editdate", required = false) String editdate) {

		/** 1) 사용자가 입력한 파라미터 유효성 검사 */
		if (addrno == 0) {
			return webHelper.getJsonWarning("주소번호가 없습니다.");
		}
		if (odname == null) {
			return webHelper.getJsonWarning("이름을 입력하세요.");
		}
		if (!regexHelper.isKor(odname)) {
			return webHelper.getJsonWarning("이름은 한글만 가능합니다.");
		}
		if (odemail == null) {
			return webHelper.getJsonWarning("이메일을 입력하세요.");
		}
		if (!regexHelper.isEmail(odemail)) {
			return webHelper.getJsonWarning("이메일 형식이 아닙니다.");
		}
		if (addr1 == null) {
			return webHelper.getJsonWarning("주소를 입력하세요.");
		}
		if (addr2 == null) {
			return webHelper.getJsonWarning("상세주소를 입력하세요.");
		}
		if (!regexHelper.isKor(addr2)) {
			return webHelper.getJsonWarning("상세주소는 한글만 가능합니다.");
		}
		if (odphone == null) {
			return webHelper.getJsonWarning("핸드폰 번호를 입력하세요.");
		}
		if (!regexHelper.isNum(odphone)) {
			return webHelper.getJsonWarning("핸드폰 번호는 숫자만 가능합니다.");
		}
		if (zcode == null) {
			return webHelper.getJsonWarning("우편번호를 입력하세요.");
		}

		/** 2) 데이터 수정하기 */
		// 수정할 값들을 Beans에 담는다.
		Address addr = new Address();
		addr.setAddrno(addrno);
		addr.setOdname(odname);
		addr.setZcode(zcode);
		addr.setAddr1(addr1);
		addr.setAddr2(addr2);
		addr.setOdphone(odphone);
		addr.setOdemail(odemail);
		addr.setEditdate(editdate);
		
		// 수정된 결과를 조회하기 위한 객체 
		Address addrup = null;

		try {
			// 데이터 수정
			addressService.editAddress(addr);
			// 수정결과 조회
			addrup = addressService.getAddressItem(addr);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", addrup);
		return webHelper.getJsonData(map);	
	}

}
