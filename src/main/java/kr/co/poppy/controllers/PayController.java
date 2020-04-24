package kr.co.poppy.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PayController {
	@RequestMapping(value = "/pay/cart.do", method = RequestMethod.GET)
	public String cart() {
		return "pay/cart";
	}

	@RequestMapping(value = "/pay/orderform.do", method = RequestMethod.GET)
	public String orderform() {
		return "pay/orderform";
	}
}
