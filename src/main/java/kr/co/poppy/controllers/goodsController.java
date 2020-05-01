package kr.co.poppy.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Goodsdetail;
import kr.co.poppy.service.AddressService;
import kr.co.poppy.service.GoodsdetailService;
import kr.co.poppy.service.OrdersService;
import kr.co.poppy.service.PointsService;

public class goodsController {
	
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	GoodsdetailService goodsdetailService;
	

	
	
	/** 갤러리 상세 페이지 */
	@RequestMapping(value="/gallery/goods.do", method=RequestMethod.GET)
	public ModelAndView goods(Model model) {
		
		// 1) 빈즈에 담기
		Goodsdetail input = new Goodsdetail();
		
		// 2) 데이터 조회하기
		Goodsdetail output = null;
		
		try {
			output = goodsdetailService.getGoodsdetailItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output", output);
		
		return new ModelAndView("gallery/goods");
	}

}
