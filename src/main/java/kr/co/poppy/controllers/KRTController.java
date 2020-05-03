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

import kr.co.poppy.helper.PageData;
import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Bbs;
import kr.co.poppy.model.Cart;
import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.CartService;
import kr.co.poppy.service.OrderdetailService;
import kr.co.poppy.service.OrdersService;
import kr.co.poppy.service.PointsService;

@Controller
public class KRTController {
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
	@RequestMapping(value = "/myInfo/order_list.do", method = RequestMethod.GET)
	public ModelAndView order_list(Model model, @RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		// 전체 게시글 수
		int totalCount = 0;
		// 한 페이지당 표시할 목록 수
		int listCount = 10;
		// 한 그룹당 표시할 페이 번호 수
		int pageCount = 5;

		/** 2) 데이터 조회하기 */
		Orders input = new Orders();
		input.setMemno(2);

		List<Orders> output = null;
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = orderService.getOrdersCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT 절에서 사용될 값을 Beans의 static 변수에 저장
			Orders.setOffset(pageData.getOffset());
			Orders.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = orderService.getOrdersList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) view 처리 */
		model.addAttribute("output", output);

		String viewPath = "myInfo/order_list";
		return new ModelAndView(viewPath);
	}

	/** 삭제 처리 구현 */
	@RequestMapping(value = "/myInfo/order_delete.do", method = RequestMethod.GET)
	public ModelAndView order_delete(Model model, @RequestParam(value = "orderno", required = false) int orderno) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (orderno == 0) {
			return webHelper.redirect(null, "주문번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Orders input = new Orders();
		input.setOrderno(orderno);

		try {
			orderService.deleteOrders(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 페이지 이동 */
		return webHelper.redirect(contextPath + "/myInfo/order_list.do", "삭제되었습니다.");
	}

	/** cancel_list (주문취소내역) */
	/** 목록 페이지 */
	@RequestMapping(value = "/myInfo/cancel_list.do", method = RequestMethod.GET)
	public ModelAndView cancel_list(Model model, @RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		// 전체 게시글 수
		int totalCount = 0;
		// 한 페이지당 표시할 목록 수
		int listCount = 10;
		// 한 그룹당 표시할 페이 번호 수
		int pageCount = 5;

		Orders input = new Orders();
		input.setMemno(1);

		List<Orders> output = null;
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = orderService.getOrdersCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT 절에서 사용될 값을 Beans의 static 변수에 저장
			Orders.setOffset(pageData.getOffset());
			Orders.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = orderService.getOrdersList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);

		String viewPath = "myInfo/cancel_list";
		return new ModelAndView(viewPath);
	}

	/** plist (적립내역) */
	/** 목록 페이지 */
	@RequestMapping(value = "/myInfo/plist.do", method = RequestMethod.GET)
	public ModelAndView point_list(Model model, @RequestParam(value = "page", defaultValue = "1") int nowPage) {
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		// 전체 게시글 수
		int totalCount = 0;
		// 한 페이지당 표시할 목록 수
		int listCount = 10;
		// 한 그룹당 표시할 페이 번호 수
		int pageCount = 5;

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값을 Beans에 담는다.
		Points input = new Points();
		input.setMemno(2);

		List<Points> output = null;
		PageData pageData = null;

		try {
			totalCount = pointsService.getPointsCount(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT 절에서 사용될 값을 Beans의 static 변수에 저장
			Points.setOffset(pageData.getOffset());
			Points.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = pointsService.getPointsMbList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) view 처리 */
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		String viewPath = "myInfo/plist";
		return new ModelAndView(viewPath);
	}

	/** photo_wri (포토리뷰 쓰기) */
	/** 작성 폼 페이지 */
	@RequestMapping(value = "/community/photo_wri.do", method = RequestMethod.GET)
	public ModelAndView photo_wri(Model model) {
		return new ModelAndView("community/photo_wri");
	}

	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/community/photo_wri_ok/do", method = RequestMethod.POST)
	public ModelAndView photo_wri_ok(Model model, @RequestParam(value = "bbstitle", required = false) String bbstitle,
			@RequestParam(value = "rvlike", required = false) String rvlike,
			@RequestParam(value = "bbscontent", required = false) String bbscontent) {
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 포토리뷰 제목은 필수 항목 이므로 입력 여부를 검사
		if (bbstitle == null) {
			return webHelper.redirect(null, "포토리뷰 제목을 입력하세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Bbs input = new Bbs();
		input.setBbstitle(bbstitle);
		input.setBbscontent(bbscontent);
		input.setRvlike(rvlike);

		try {
			// 데이터 저장
			bbsService.addBbs(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야한다.
		String redirectUrl = contextPath + "/community/photo_rv.do?bbsno=" + input.getBbsno();

		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}

	/** photo (포토리뷰 상세조회) */
	/** 상세 페이지 */
	@RequestMapping(value = "/community/photo.do", method = RequestMethod.GET)
	public ModelAndView photo(Model model, @RequestParam(value = "bbsno", required = false) int bbsno) {
		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (bbsno == 0) {
			return webHelper.redirect(null, "커뮤니티 번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Bbs input = new Bbs();
		input.setBbsno(bbsno);

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
	@RequestMapping(value = "/pay/cart.do", method = RequestMethod.GET)
	public ModelAndView cart_list(Model model) {
		Cart input = new Cart();

		List<Cart> output = null;

		try {
			output = cartService.getCartList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);

		String viewPath = "pay/cart";
		return new ModelAndView(viewPath);
	}

	/** 삭제 처리 구현 */
	@RequestMapping(value = "/pay/cart_delete.do", method = RequestMethod.GET)
	public ModelAndView cart_delete(Model model, @RequestParam(value = "cartno", required = false) int cartno) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (cartno == 0) {
			return webHelper.redirect(null, "장바구니 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Cart input = new Cart();
		input.setCartno(cartno);

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