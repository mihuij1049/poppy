package kr.co.poppy.controllers;

import java.util.ArrayList;
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

import kr.co.poppy.helper.PageData;
import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Orders;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.CartService;
import kr.co.poppy.service.OrderdetailService;
import kr.co.poppy.service.OrdersService;
import kr.co.poppy.service.PointsService;

@RestController
public class KRTRestController {
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
	
	/** order_list (주문조회) */
	/** 목록 페이지 */
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public Map<String, Object> order_list(@RequestParam(value = "page", defaultValue = "1") int nowPage,
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
			return webHelper.getJsonError(e.getLocalizedMessage());
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

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);

		return webHelper.getJsonData(data);
	}
}
