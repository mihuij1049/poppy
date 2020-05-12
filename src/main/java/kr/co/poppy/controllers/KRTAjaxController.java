package kr.co.poppy.controllers;

import java.util.ArrayList;
import java.util.Calendar;
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

import kr.co.poppy.helper.PageData;
import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Bbs;
import kr.co.poppy.model.Cart;
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Imgs;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.CartService;
import kr.co.poppy.service.OrderdetailService;
import kr.co.poppy.service.OrdersService;
import kr.co.poppy.service.PointsService;

@Controller
public class KRTAjaxController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RexgexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현제 주입 */
	@Autowired
	OrdersService orderService;
	@Autowired
	OrderdetailService orderdetailService;
	@Autowired
	PointsService pointsService;
	@Autowired
	BbsService bbsService;
	@Autowired
	CartService cartService;

	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** order_list (주문조회) */
	/** 목록 페이지 */
	@RequestMapping(value = "/myInfo_ajax/order_list.do", method = RequestMethod.GET)
	public ModelAndView order_list(Model model, @RequestParam(value = "page", defaultValue = "1") int nowPage,
			@RequestParam(value = "odstatus", required = false) String odstatus,
			@RequestParam(value="goodsno", defaultValue="0") int goodsno) {
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		// 전체 게시글 수
		int totalCount = 0;
		// 한 페이지당 표시할 목록 수
		int listCount = 10;
		// 한 그룹당 표시할 페이 번호 수
		int pageCount = 5;

		/** 2) 데이터 조회하기 */
		Orders orders = new Orders();
		orders.setMemno(myInfo.getMemno());
		orders.setOdstatus(odstatus);
		orders.setGoodsno(1);

		List<Orders> ordersList = null;
		List<Orders> output = new ArrayList<Orders>();
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = orderService.getOrdersCount(orders);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT 절에서 사용될 값을 Beans의 static 변수에 저장
			Orders.setOffset(pageData.getOffset());
			Orders.setListCount(pageData.getListCount());

			// 데이터 조회하기
			// input = orderService.getOrdersItem(input);
			ordersList = orderService.getOrdersList(orders);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		for (int i = 0; i < ordersList.size(); i++) {
			orders = ordersList.get(i);
			if (orders.getOdstatus().equals("0")) {
				orders.setOdstatus("입금전");
			} else if (orders.getOdstatus().equals("1")) {
				orders.setOdstatus("배송준비중");
			} else if (orders.getOdstatus().equals("2")) {
				orders.setOdstatus("배송중");
			} else if (orders.getOdstatus().equals("3")) {
				orders.setOdstatus("배송완료");
			} else if (orders.getOdstatus().equals("4")) {
				orders.setOdstatus("취소");
			} else if (orders.getOdstatus().equals("5")) {
				orders.setOdstatus("교환");
			} else if (orders.getOdstatus().equals("6")) {
				orders.setOdstatus("반품");
			}
			output.add(orders);
		}

		/** 3) view 처리 */
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("output", output);

		return new ModelAndView("myInfo/order_list_ajax");
	}
	
	/** 주문 상태 조회 */
	@RequestMapping(value="/myInfo_ajax/order_status.do", method=RequestMethod.GET)
	public ModelAndView order_status(Model model,@RequestParam(value = "page", defaultValue = "1") int nowPage,
			@RequestParam(value="orderno", defaultValue="0") int orderno,
			@RequestParam(value="odstatus", required=false)String odstatus) {
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		// 전체 게시글 수
		int totalCount = 0;
		// 한 페이지당 표시할 목록 수
		int listCount = 10;
		// 한 그룹당 표시할 페이 번호 수
		int pageCount = 5;
		
		/** 2) 데이터 조회하기 */
		Orders orders = new Orders();
		orders.setMemno(myInfo.getMemno());
		orders.setOdstatus(odstatus);
		orders.setGoodsno(1);

		List<Orders> ordersList = null;
		List<Orders> output = new ArrayList<Orders>();
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = orderService.getOrdersCount(orders);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT 절에서 사용될 값을 Beans의 static 변수에 저장
			Orders.setOffset(pageData.getOffset());
			Orders.setListCount(pageData.getListCount());

			// 데이터 조회하기
			// input = orderService.getOrdersItem(input);
			ordersList = orderService.getOrdersList(orders);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		for (int i = 0; i < ordersList.size(); i++) {
			orders = ordersList.get(i);
			if (orders.getOdstatus().equals("0")) {
				orders.setOdstatus("입금전");
			} else if (orders.getOdstatus().equals("1")) {
				orders.setOdstatus("배송준비중");
			} else if (orders.getOdstatus().equals("2")) {
				orders.setOdstatus("배송중");
			} else if (orders.getOdstatus().equals("3")) {
				orders.setOdstatus("배송완료");
			} else if (orders.getOdstatus().equals("4")) {
				orders.setOdstatus("취소");
			} else if (orders.getOdstatus().equals("5")) {
				orders.setOdstatus("교환");
			} else if (orders.getOdstatus().equals("6")) {
				orders.setOdstatus("반품");
			}
			output.add(orders);
		}

		/** 3) view 처리 */
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("output", output);
		
		return new ModelAndView("myInfo/order_list_ajax");
	}

	/** 주문 변경 처리 구현 */
	@RequestMapping(value = "/myInfo_ajax/order_change.do", method = RequestMethod.GET)
	public ModelAndView order_edit(Model model, @RequestParam(value = "orderno", defaultValue = "0") int orderno,
			@RequestParam(value = "odstatus", required = false) String odstatus) {
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (orderno == 0) {
			return webHelper.redirect(null, "주문번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Orders orders = new Orders();
		orders.setOrderno(orderno);

		// 주문 조회 결과를 저장할 객체 선언
		Orders output = null;

		try {
			output = orderService.getOrdersItem(orders);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 2) 데이터 수정하기 */
		// 데이터 수정에 필요한 조건값을 조회 결과에 저장하기
		output.setOdstatus("4");

		try {
			orderService.editOrders(output);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 페이지 이동 */
		model.addAttribute("output", output);
		model.addAttribute("myInfo", myInfo);

		return webHelper.redirect(contextPath + "/myInfo/order_list_ajax.do", "주문 취소 되었습니다.");
	}

	/** cancel_list (주문취소내역) */
	/** 목록 페이지 */
	@RequestMapping(value = "/myInfo_ajax/cancel_list.do", method = RequestMethod.GET)
	public ModelAndView cancel_list(Model model, @RequestParam(value = "page", defaultValue = "1") int nowPage,
			@RequestParam(value="orderno", defaultValue="0") int orderno,
			@RequestParam(value="goodsno", defaultValue="0") int goodsno) {
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		// 전체 게시글 수
		int totalCount = 0;
		// 한 페이지당 표시할 목록 수
		int listCount = 10;
		// 한 그룹당 표시할 페이 번호 수
		int pageCount = 5;

		Orders orders = new Orders();
		orders.setMemno(myInfo.getMemno());
		orders.setGoodsno(1);

		List<Orders> ordersList = null;
		List<Orders> output = new ArrayList<Orders>();

		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = orderService.getOrdersCount(orders);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT 절에서 사용될 값을 Beans의 static 변수에 저장
			Orders.setOffset(pageData.getOffset());
			Orders.setListCount(pageData.getListCount());

			// 데이터 조회하기
			ordersList = orderService.getOrdersList2(orders);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		for (int i = 0; i < ordersList.size(); i++) {
			orders = ordersList.get(i);
			if (orders.getOdstatus().equals("4")) {
				orders.setOdstatus("취소");
			}
			output.add(orders);
		}

		model.addAttribute("myInfo", myInfo);
		model.addAttribute("output", output);

		return new ModelAndView("myInfo/cancel_list_ajax");
	}

	/** photo_wri (포토리뷰 쓰기) */
	/** 작성 폼 페이지 */
	@RequestMapping(value = "/community_ajax/photo_wri.do", method = RequestMethod.GET)
	public ModelAndView photo_wri(Model model) {
		return new ModelAndView("community/photo_wri");
	}

	/** photo (포토리뷰 상세조회) */
	/** 상세 페이지 */
	@RequestMapping(value = "/community_ajax/photo.do", method = RequestMethod.GET)
	public ModelAndView photo(Model model, @RequestParam(value = "bbsno", defaultValue = "24") int bbsno) {
		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (bbsno == 0) {
			return webHelper.redirect(null, "커뮤니티 번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Bbs input = new Bbs();
		input.setBbsno(bbsno);
		input.setBbstype("C");

		// 조회 결과를 저장할 객체 선언
		Bbs output = null;

		try {
			// 데이터 조회
			output = bbsService.getBbsItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) view 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("community/photo");
	}

	/** 장바구니 */
	/** 목록 페이지 */
	@RequestMapping(value = "/pay_ajax/cart.do", method = RequestMethod.GET)
	public ModelAndView cart_list(Model model) {
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		Cart input = new Cart();
		input.setMemno(myInfo.getMemno());

		List<Cart> output = null;

		try {
			output = cartService.getCartList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);

		return new ModelAndView("pay/cart_ajax");
	}

	/** 삭제 처리 구현 */
	@RequestMapping(value = "/pay_ajax/cart_delete.do", method = RequestMethod.GET)
	public ModelAndView cart_delete(Model model, @RequestParam(value = "cartno", defaultValue = "0") int cartno) {
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (cartno == 0) {
			return webHelper.redirect(null, "장바구니 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Cart input = new Cart();
		input.setCartno(cartno);
		input.setMemno(myInfo.getMemno());

		try {
			// 데이터 삭제
			cartService.deleteCart(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.redirect(contextPath + "/pay/cart.do", "삭제되었습니다.");
	}
}