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
import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;
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

	/** photo_wri */
	@RequestMapping(value = "/community/photo_wri.do", method = RequestMethod.GET)
	public String photo_wri() {
		return "community/photo_wri";
	}

	/** photo */
	@RequestMapping(value = "/community/photo.do", method = RequestMethod.GET)
	public String photo() {
		return "community/photo";
	}

	/** 장바구니 */
	/** 목록 페이지 */
	@RequestMapping(value = "/pay/cart.do", method = RequestMethod.GET)
	public String list() {

		return "pay/cart";
	}
}
