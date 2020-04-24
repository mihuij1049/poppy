package kr.co.poppy.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GalleryController {
	
	@RequestMapping(value="/gallery/gal_list.do", method=RequestMethod.GET)
	public String gallist() {
		return "gallery/gal_list";
	}
	
	@RequestMapping(value="/gallery/goods.do", method=RequestMethod.GET)
	public String goods() {
		return "gallery/goods";
	}
}
