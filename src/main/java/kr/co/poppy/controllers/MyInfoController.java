package kr.co.poppy.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Orders;
import kr.co.poppy.service.OrderdetailService;
import kr.co.poppy.service.OrdersService;

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
	OrdersService orderService;
	@Autowired
	OrderdetailService orderdetailService;

	@RequestMapping(value = "/myInfo/myinfo.do", method = RequestMethod.GET)
	public String myinfo() {
		return "myInfo/myinfo";
	}

	@RequestMapping(value = "/myInfo/cancel_list.do", method = RequestMethod.GET)
	public String cancel_list() {
		return "myInfo/cancel_list";
	}

	/** order_list (주문조회) */
	/** 목록 페이지 */
	@RequestMapping(value = "/myInfo/order_list.do", method = RequestMethod.GET)
	public ModelAndView order_list(Model model) {
		Orders input = new Orders();

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

	@RequestMapping(value = "/myInfo/order_desc.do", method = RequestMethod.GET)
	public String order_desc() {
		return "myInfo/order_desc";
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
	public String point() {
		return "myInfo/point";
	}

	@RequestMapping(value = "/myInfo/plist_nota.do", method = RequestMethod.GET)
	public String plist_nota() {
		return "myInfo/plist_nota";
	}

	@RequestMapping(value = "/myInfo/plist_grd.do", method = RequestMethod.GET)
	public String plist_grd() {
		return "myInfo/plist_grd";
	}

	@RequestMapping(value = "/myInfo/my_rv.do", method = RequestMethod.GET)
	public String my_rv() {
		return "myInfo/my_rv";
	}

	@RequestMapping(value = "/myInfo/recent.do", method = RequestMethod.GET)
	public String recent() {
		return "myInfo/recent";
	}
}
