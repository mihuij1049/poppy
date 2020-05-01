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

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Orders;
import kr.co.poppy.service.OrderdetailService;
import kr.co.poppy.service.OrdersService;

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

	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** order_list (주문조회) */
	/** 목록 페이지 */
	@RequestMapping(value = "/myInfo/order_list.do", method = RequestMethod.GET)
	public ModelAndView order_list(Model model) {
		Orders input = new Orders();

		input.setMemno(1);

		List<Orders> output = null;

		try {
			output = orderService.getOrdersList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);

		String viewPath = "myInfo/order_list";
		return new ModelAndView(viewPath);
	}

	/** 삭제 처리 구현 */
	@RequestMapping(value = "/myInfo/order_delete.do", method = RequestMethod.GET)
	public ModelAndView order_delete(Model model, @RequestParam(value = "orderno", required = false) int orderno) {
		System.out.println("실행됨");
		if (orderno == 0) {
			return webHelper.redirect(null, "주문번호가 없습니다.");
		}

		Orders input = new Orders();
		input.setOrderno(orderno);

		try {
			orderService.deleteOrders(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/myInfo/order_list.do", "삭제되었습니다.");
	}

	/** cancel_list (주문취소내역) */
	@RequestMapping(value = "/myInfo/cancel_list.do", method = RequestMethod.GET)
	public ModelAndView cancel_list(Model model) {
		Orders input = new Orders();
		input.setMemno(1);

		List<Orders> output = null;

		try {
			output = orderService.getOrdersList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("output", output);

		String viewPath = "myInfo/cancel_list";
		return new ModelAndView(viewPath);
	}
}
