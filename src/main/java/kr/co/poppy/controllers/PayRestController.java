package kr.co.poppy.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Address;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Orderdetail;
import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
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
	@RequestMapping(value = "/pay", method = { RequestMethod.PUT, RequestMethod.POST })
	public Map<String, Object> addrAdd_ok(@RequestParam(value = "raddrno", defaultValue = "0") int raddrno,
			/** 주소 INSERT */
			@RequestParam(value = "odname", required = false) String odname,
			@RequestParam(value = "odphone", required = false) String odphone,
			@RequestParam(value = "odemail", required = false) String odemail,
			@RequestParam(value = "zcode", defaultValue = "") Integer zcode,
			@RequestParam(value = "addr1", required = false) String addr1,
			@RequestParam(value = "addr2", required = false) String addr2,
			/** 주문 INSERT */
			@RequestParam(value = "odmsg1", defaultValue = "") String odmsg1,
			@RequestParam(value = "odmsg2", defaultValue = "") String odmsg2,
			@RequestParam(value = "paytype", defaultValue = "") String paytype,
			@RequestParam(value = "odstatus", defaultValue = "") String odstatus,
			@RequestParam(value = "deliprice", defaultValue = "0") int deliprice,
			@RequestParam(value = "regdate", required = false) String regdate,
			@RequestParam(value = "editdate", required = false) String editdate,
			@RequestParam(value = "selboxDirect1", required = false) String selboxDirect1,
			@RequestParam(value = "selboxDirect2", required = false) String selboxDirect2,
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
			@RequestParam(value = "gdcount", defaultValue = "0") int gdcount,
			/** 포인트 적립 INSERT */
			@RequestParam(value = "pointno", defaultValue = "0") int pointno,
			@RequestParam(value = "pay-price", defaultValue = "0") double napoint,
			@RequestParam(value = "pointtype", defaultValue = "") String pointtype) {

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (raddrno == 0) {
			if (odname.equals("")) {
				return webHelper.getJsonWarning("이름을 입력하세요.");
			}
			if (odemail.equals("")) {
				return webHelper.getJsonWarning("이메일을 입력하세요.");
			}
			if (!regexHelper.isEmail(odemail)) {
				return webHelper.getJsonWarning("이메일 형식으로 입력하세요.");
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
		}

		if (paytype.equals("credit") || paytype.equals("phone")) {
			odstatus = "1";
		}

		if (paytype.equals("BankTransfer") || paytype.equals("NotBankTransfer")) {
			odstatus = "0";
		}
		
		/** napoint 형변환 */
		double pay_price = napoint;

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		/** 주소 저장 */
		Address radd = new Address();
		radd.setAddrno(raddrno);
		radd.setMemno(myInfo.getMemno());
		Address rasave = null;

		
		/** 주문 */
		Orders order = new Orders();
		order.setPaytype(paytype);
		order.setOdstatus(odstatus);
		order.setDeliprice(deliprice);
		order.setRegdate("now()");
		order.setEditdate("now()");
		order.setMemno(myInfo.getMemno());
		Orders osave = null;

		/** 주문 상품 */
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
		Orderdetail odsave = null;

		Points poi = new Points();
		poi.setPointno(pointno);
		poi.setNapoint((int) pay_price);
		poi.setPointtype("상품구입 적립금");
		poi.setRegdate("now()");
		poi.setEditdate("now()");
		poi.setMemno(myInfo.getMemno());
		Points psave = null;
		Address asave = null;

		if (!odname.equals("") && !odemail.equals("") && !addr1.equals("") && !addr2.equals("") && zcode != null) {
			try {
				if (odmsg2.equals("1")) {
					odmsg2 = "배송전에 미리 연락드립니다.";
				}

				if (odmsg2.equals("2")) {
					odmsg2 = "부재시 경비실에 맡겨주세요.";
				}

				if (odmsg2.equals("3")) {
					odmsg2 = "부재시 문 앞에 놓아주세요.";
				}

				if (odmsg2.equals("4")) {
					odmsg2 = "빠른 배송 부탁드립니다.";
				}

				if (odmsg2.equals("5")) {
					odmsg2 = "택배함에 보관해 주세요.";
				}

				if (odmsg2.equals("direct")) {
					odmsg2 = selboxDirect2;
				}
				
				Address add = new Address();
				add.setOdname(odname);
				add.setOdphone(odphone);
				add.setOdemail(odemail);
				add.setZcode(zcode);
				add.setAddr1(addr1);
				add.setAddr2(addr2);
				add.setRegdate("now()");
				add.setEditdate("now()");
				add.setMemno(myInfo.getMemno());
				
				order.setOdmsg(odmsg2);

				addressService.addAddress(add);
				orderdetailService.addOrderdetail(oddetail);
				order.setAddrno(add.getAddrno());
				ordersService.addOrders(order);
				poi.setOrderno(order.getOrderno());
				pointsService.addPoints(poi);

				// 데이터조회
				asave = addressService.getAddressItem(add);
				odsave = orderdetailService.getOrderdetailItem(oddetail);
				osave = ordersService.getOrdersItem(order);
				odsave.setOrderno(osave.getOrderno());
				orderdetailService.editOrderdetail(odsave);
				psave = pointsService.getPointsOdItem(poi);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
		} else {
			try {
				if (odmsg1.equals("1")) {
					odmsg1 = "배송전에 미리 연락드립니다.";
				}

				if (odmsg1.equals("2")) {
					odmsg1 = "부재시 경비실에 맡겨주세요.";
				}

				if (odmsg1.equals("3")) {
					odmsg1 = "부재시 문 앞에 놓아주세요.";
				}

				if (odmsg1.equals("4")) {
					odmsg1 = "빠른 배송 부탁드립니다.";
				}

				if (odmsg1.equals("5")) {
					odmsg1 = "택배함에 보관해 주세요.";
				}

				if (odmsg1.equals("direct")) {
					odmsg1 = selboxDirect1;
				}
				
				order.setOdmsg(odmsg1);
				
				orderdetailService.addOrderdetail(oddetail);
				order.setAddrno(radd.getAddrno());
				ordersService.addOrders(order);
				poi.setOrderno(order.getOrderno());
				pointsService.addPoints(poi);

				// 데이터조회
			    asave = addressService.getAddressItem(radd);
				odsave = orderdetailService.getOrderdetailItem(oddetail);
				osave = ordersService.getOrdersItem(order);
				odsave.setOrderno(osave.getOrderno());
				orderdetailService.editOrderdetail(odsave);
				psave = pointsService.getPointsOdItem(poi);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
		}

		mySession.setAttribute("userInfo", myInfo);

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("asave", asave);
		map.put("odsave", odsave);
		map.put("osave", osave);
		map.put("psave", psave);
		return webHelper.getJsonData(map);
	}
}
