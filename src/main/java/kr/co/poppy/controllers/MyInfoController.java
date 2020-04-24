package kr.co.poppy.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyInfoController {
	
	@RequestMapping(value="/myInfo/myinfo.do", method=RequestMethod.GET)
	public String myinfo() {
		return "myInfo/myinfo";
	}
	@RequestMapping(value="/myInfo/cancel_list.do", method=RequestMethod.GET)
	public String cancel_list() {
		return "myInfo/cancel_list";
	}
	@RequestMapping(value="/myInfo/order_list.do", method=RequestMethod.GET)
	public String order_list() {
		return "myInfo/order_list";
	}
	@RequestMapping(value="/myInfo/order_desc.do", method=RequestMethod.GET)
	public String order_desc() {
		return "myInfo/order_desc";
	}
	@RequestMapping(value="/myInfo/myinfo_edit.do", method=RequestMethod.GET)
	public String myinfo_edit() {
		return "myInfo/myinfo_edit";
	}
	@RequestMapping(value="/myInfo/like_goods.do", method=RequestMethod.GET)
	public String like_goods() {
		return "myInfo/like_goods";
	}
	@RequestMapping(value="/myInfo/point.do", method=RequestMethod.GET)
	public String point() {
		return "myInfo/point";
	}
	@RequestMapping(value="/myInfo/plist_nota.do", method=RequestMethod.GET)
	public String plist_nota() {
		return "myInfo/plist_nota";
	}
	@RequestMapping(value="/myInfo/plist_grd.do", method=RequestMethod.GET)
	public String plist_grd() {
		return "myInfo/plist_grd";
	}
	@RequestMapping(value="/myInfo/my_rv.do", method=RequestMethod.GET)
	public String my_rv() {
		return "myInfo/my_rv";
	}
	@RequestMapping(value="/myInfo/recent.do", method=RequestMethod.GET)
	public String recent() {
		return "myInfo/recent";
	}
}
