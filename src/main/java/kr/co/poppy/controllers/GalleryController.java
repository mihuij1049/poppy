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
import kr.co.poppy.model.Goods;
import kr.co.poppy.service.GoodsService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class GalleryController {
	/** webHelper */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 */
	@Autowired GoodsService goodsService;
	
	
	/** 갤러리 목록 페이지 */
	@RequestMapping(value="/gallery/gal_list.do", method=RequestMethod.GET)
	public ModelAndView gallist(Model model) {
		
		// 1) 빈즈에 담기
		Goods input = new Goods();
		
		// 2) 데이터 조회하기
		List<Goods> output = null;
		try {
			output = goodsService.getGoodsList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output", output);
	
		return new ModelAndView("gallery/gal_list");
	}
	
	
	/** 갤러리 상세 페이지 */
	@RequestMapping(value="/gallery/goods.do", method=RequestMethod.GET)
	public String goods() {
		return "gallery/goods";
	}
}
