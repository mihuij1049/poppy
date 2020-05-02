package kr.co.poppy.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.PageData;
import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Imgs;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.GoodsdetailService;
import kr.co.poppy.service.ImgsService;

@Controller
public class GalleryController {
	/** webHelper */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper */
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 */
	@Autowired GoodsService goodsService;
	@Autowired ImgsService imgsService;
	@Autowired GoodsdetailService goodsdetailService;
	
	/** 갤러리 목록 페이지 */
	@RequestMapping(value="/gallery/gal_list_food.do", method=RequestMethod.GET)
	public ModelAndView gallist(Model model,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {
		// 1) 페이지 구현에 필요한 변수값 생성
		int totalCount = 0;
		int listCount = 4;
		int pageCount = 5;
		
		// 2) 데이터 조회
		Goods input1 = new Goods();
		input1.setCate1("푸드");
		Imgs input2 = new Imgs();
		input2.setCate1("푸드");
		input2.setImgtype("A");
		
		List<Goods> output1 = null;
		List<Imgs> output2 = null;
		PageData pageData = null;
		
		try {
			// 페이지만들기
			totalCount = goodsService.getGoodsCount(input1);
			
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			Goods.setOffset(pageData.getOffset());
			Goods.setListCount(pageData.getListCount());
			
			// 데이터조회
			output1 = goodsService.getGoodsList(input1);
			output2 = imgsService.getImgsList(input2);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output1", output1);
		model.addAttribute("output2", output2);
		model.addAttribute("pageData", pageData);
	
		return new ModelAndView("gallery/gal_list");
	}
}
