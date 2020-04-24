package kr.co.poppy.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EtcController {
	@RequestMapping(value="/ect/page_info1.do", method = RequestMethod.GET)
	public String pageInfo1() {
		return "ect/page_info1";
	}
	
	@RequestMapping(value="/ect/page_info2.do", method = RequestMethod.GET)
	public String pageInfo2() {
		return "ect/page_info2";
	}
	
	@RequestMapping(value="/ect/page_info3.do", method = RequestMethod.GET)
	public String pageInfo3() {
		return "ect/page_info3";
	}
	
	@RequestMapping(value="/ect/page_info4.do", method = RequestMethod.GET)
	public String pageInfo4() {
		return "ect/page_info4";
	}
}
