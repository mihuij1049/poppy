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

import com.mysql.cj.log.Log;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Address;
import kr.co.poppy.model.Bbs;
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Orderdetail;
import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.OrderdetailService;
import kr.co.poppy.service.OrdersService;
import kr.co.poppy.service.PointsService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyInfoController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RexgexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현제 주입 */
	@Autowired
	PointsService pointsService;
	@Autowired
	OrdersService orderService;
	@Autowired
	OrderdetailService orderdetailService;
	@Autowired
	AddressService addressService;
	@Autowired
	BbsService bbsService;

	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** My정보 페이지 */
	@RequestMapping(value = "/myInfo/myinfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myinfo(Model model) {

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 1) 각종 정보 조회를 위한 Beans 생성 */
		// 적립금 조회를 위한 빈즈
		Points myPoint = new Points();
		myPoint.setMemno(myInfo.getMemno());
		// 조회 결과를 담을 List 객체 선언
		List<Points> pointList = null;

		// 배송 상태를 조회할 빈즈
		Orders myOrder = new Orders();
		myOrder.setMemno(myInfo.getMemno());
		// 조회 결과를 담을 List 객체 선언
		List<Orders> orderList = null;

		/** 2) 정보 조회하기 */
		try {
			// 적립금 조회 리스트
			pointList = pointsService.getPointsMbList(myPoint);
			// 주문내역 조회 리스트
			orderList = orderService.getOrdersList(myOrder);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 조회된 List객체에서 적립금 총합 구하기 */
		int sumAvpoint = 0;
		int sumNapoint = 0;
		int sumUsedpoint = 0;

		for (int i = 0; i < pointList.size(); i++) {
			Points temp = null;
			temp = pointList.get(i);
			if (temp.getAvpoint() == null || temp.getAvpoint()==0 ) {
				temp.setAvpoint(0);
			}
			sumAvpoint += temp.getAvpoint();
			if (temp.getNapoint() == null || temp.getNapoint()==0 ) {
				temp.setNapoint(0);
			}
			sumNapoint += temp.getNapoint();
			if (temp.getUsedpoint() == null || temp.getUsedpoint() == 0 ) {
				temp.setUsedpoint(0);
			}
			sumUsedpoint += temp.getUsedpoint();
		}
		myPoint.setAvpoint(sumAvpoint);
		myPoint.setNapoint(sumNapoint);
		myPoint.setUsedpoint(sumUsedpoint);
		// 세션에도 정보 담기
		myInfo.setSumAvpoint(sumAvpoint);
		myInfo.setSumNapoint(sumNapoint);
		myInfo.setSumUsedpoint(sumUsedpoint);

		mySession.setAttribute("userInfo", myInfo);

		/** 4) 조회된 List 객체에서 주문 상태별로 나누기 */
		int status0 = 0;
		int status1 = 0;
		int status2 = 0;
		int status3 = 0;

		for (int i = 0; i < orderList.size(); i++) {
			Orders temp = null;
			temp = orderList.get(i);
			if (temp.getOdstatus().equals("0")) {
				status0++;
			} else if (temp.getOdstatus().equals("1")) {
				status1++;
			} else if (temp.getOdstatus().equals("2")) {
				status2++;
			} else if (temp.getOdstatus().equals("3")) {
				status3++;
			}
		}
		// 스트링으로 변환하여 담기
		String odstatus0 = "" + status0;
		String odstatus1 = "" + status1;
		String odstatus2 = "" + status2;
		String odstatus3 = "" + status3;

		/** 뷰에 데이터 전달 */
		// 적립금 정보를 담은 Beans
		model.addAttribute("myPoint", myPoint);
		// 주문상태를 담은 String객체
		model.addAttribute("status0", odstatus0);
		model.addAttribute("status1", odstatus1);
		model.addAttribute("status2", odstatus2);
		model.addAttribute("status3", odstatus3);

		return new ModelAndView("myInfo/myinfo");
	}
	
	/** 주문조회 상세보기 페이지 */
	@RequestMapping(value = "/myInfo/order_desc.do", method = RequestMethod.GET)
	public ModelAndView order_desc(Model model,
			@RequestParam(value = "orderno", required=true) String orderno) {
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		
		/** 파라미터 유효성 검사 */
		if (orderno==null) {
			webHelper.redirect(null, "선택된 주문 정보가 없습니다.");
		}
		
		/** 주문 정보 상세 조회를 위한 Beans 생성 */
		// 1) orders 테이블 조회를 위한 Beans
		int odnum = Integer.parseInt(orderno);
		Orders orders = new Orders();
		orders.setOrderno(odnum);
		
		// 2) orderdetail 테이블 조회를 위한 Beans
		Orderdetail input = new Orderdetail();
		input.setOrderno(odnum);
		List<Orderdetail> orderDetail = null;
		
		// 3) Address 정보를 담기 위한 빈즈
		Address addr = new Address();
		
		/** DB 정보 조회 */
		try {
			// order 테이블의 정보 단일행 조회 (파라미터 orderno)
			orders = orderService.getOrdersItem(orders);
			// orderdetail 테이블의 정보 다중행 조회 (파라미터 orderno)
			orderDetail = orderdetailService.getOrderdetailList(input);
			// address 테이블의 정보 단일행 조회 (파라미터 orderno)
			addr = addressService.getAddressItem(orders);	
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
		}
		
		/** View 에 Beans를 통한 데이터 전달 */
		// 주문 상태 > 한글 처리 
		if (orders.getOdstatus().equals("0")) {
			orders.setOdstatus("입금전");
		} else if (orders.getOdstatus().equals("1")) {
			orders.setOdstatus("배송준비중");
		} else if (orders.getOdstatus().equals("2")) {
			orders.setOdstatus("배송중");
		} else if (orders.getOdstatus().equals("3")) {
			orders.setOdstatus("배송완료");
		} else if (orders.getOdstatus().equals("4")) {
			orders.setOdstatus("주문취소");
		} else if (orders.getOdstatus().equals("5")) {
			orders.setOdstatus("반품처리중");
		} else if (orders.getOdstatus().equals("6")) {
			orders.setOdstatus("환불완료");
		}
		// 결제방식 > 한글처리
		if (orders.getPaytype().equals("credit")) {
			orders.setPaytype("신용카드");
		}
		// orderdetail에서 동일한 orderno를 참조하는  odgprice 와 odgsale 총 금액 
		int sumOdgprice = 0;
		int sumOdgsale = 0;
		
		for (int i=0;i<orderDetail.size();i++) {
			Orderdetail temp = orderDetail.get(i);
			sumOdgprice += temp.getOdgprice()*temp.getOdgqty();
			sumOdgsale += temp.getOdgsale()*temp.getOdgqty();
		}
		orders.setSumOdgprice(sumOdgprice);
		orders.setSumOdgsale(sumOdgsale);
		
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("orderInfo", orders);
		model.addAttribute("detailInfo", orderDetail);
		model.addAttribute("addrInfo", addr);
		
		return new ModelAndView("myInfo/order_desc");
	}

	@RequestMapping(value = "/myInfo/myinfo_edit.do", method = RequestMethod.GET)
	public String myinfo_edit() {
		return "myInfo/myinfo_edit";
	}

	@RequestMapping(value = "/myInfo/like_goods.do", method = RequestMethod.GET)
	public String like_goods() {
		return "myInfo/like_goods";
	}

	@RequestMapping(value = "/myInfo/point.do", method = RequestMethod.GET)
	public ModelAndView point(Model model) {
		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		
		model.addAttribute("myInfo", myInfo);
		
		return new ModelAndView("myInfo/point");
	}
	
	@RequestMapping(value = "/myInfo/plist_nota.do", method = RequestMethod.GET)
	public String plist_nota() {
		return "myInfo/plist_nota";
	}

	@RequestMapping(value = "/myInfo/plist_grd.do", method = RequestMethod.GET)
	public String plist_grd() {
		return "myInfo/plist_grd";
	}
	
	/** 후기관리 페이지 */
	@RequestMapping(value = "/myInfo/my_rv.do", method = RequestMethod.GET)
	public ModelAndView my_rv(Model model) {
		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members)mySession.getAttribute("userInfo");
		
		Bbs myBbs = new Bbs();
		myBbs.setMemno(myInfo.getMemno());
		
		List<Bbs> myBbsList = null;
		
		try {
			myBbsList = bbsService.getBbsList_myrv(myBbs);
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		
		/** 1) 작성 가능한 리뷰 탭 (내가 구매한 상품목록(다중행조회)필요 param=memno) */
		
		/** 2) 내가 작성한 리뷰 탭 (bbs 다중행조회필요 - param=memno) */
		model.addAttribute("myReview", myBbsList);
		
		return new ModelAndView("myInfo/my_rv");
	}

	@RequestMapping(value = "/myInfo/recent.do", method = RequestMethod.GET)
	public String recent() {
		return "myInfo/recent";
	}
}
