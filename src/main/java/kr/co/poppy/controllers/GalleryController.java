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
import kr.co.poppy.model.Bbs;
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
	@RequestMapping(value="/gallery/gal_list_all.do", method=RequestMethod.GET)
	public ModelAndView gallistall(Model model) {
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		
		// 데이터저장할곳
		List<Goods> output = null;
		
		try {
			// 데이터조회
			output = goodsService.getGoodsList2(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output", output);
	
		return new ModelAndView("gallery/gal_list");
	}
	
	/** 갤러리 목록 페이지 */
	@RequestMapping(value="/gallery/gal_list.do", method=RequestMethod.GET)
	public ModelAndView gallist(Model model,
			@RequestParam(value="cate1", required=false) String cate1) {
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		input.setCate1(cate1);
		
		// 데이터저장할곳
		List<Goods> output = null;
		
		try {
			// 데이터조회
			output = goodsService.getGoodsList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output", output);
	
		return new ModelAndView("gallery/gal_list");
	}
	
	@RequestMapping(value="/gallery/gal_list_cate.do", method=RequestMethod.GET)
	public ModelAndView gallistcate(Model model,
			@RequestParam(value="cate1", required=false) String cate1,
			@RequestParam("searchCondition") String searchCondition) {
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		input.setCate1(cate1);
		input.setSearchCondition(searchCondition);
		
		// 데이터저장할곳
		List<Goods> output1 = null;		
		
		if (searchCondition=="A") {
			/** select에서 a를 선택했을 때 */
			try {
				// 데이터조회
				output1 = goodsService.getGoodsListCate1(input);
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
		} else if (searchCondition=="B") {
			/** select에서 B를 선택했을 때 */
			try {
				// 데이터조회
				output1 = goodsService.getGoodsListCate2(input);
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
		} else if (searchCondition=="C") {
			/** select에서 C를 선택했을 때 */
			try {
				// 데이터조회
				output1 = goodsService.getGoodsListCate3(input);
				
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
		} else if (searchCondition=="D") {
			
		try {
			/** select에서 D를 선택했을 때 */
			// 데이터조회
			output1 = goodsService.getGoodsListCate4(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		}

		// 3) 뷰처리
		model.addAttribute("output1", output1);
		return new ModelAndView("gallery/gal_list");
	}
}
