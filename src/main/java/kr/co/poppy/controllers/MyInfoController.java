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
}
