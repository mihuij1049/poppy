package kr.co.poppy.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.PageData;
import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Bbs;
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Heart;
import kr.co.poppy.model.Imgs;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.GoodsdetailService;
import kr.co.poppy.service.HeartService;
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
	
	/** 갤러리 목록 페이지 (전체) */
	@RequestMapping(value="/gallery/gal_list_all.do", method=RequestMethod.GET)
	public ModelAndView gallistall(Model model) {
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		
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
	
	/** 갤러리 목록 페이지 (신상품별) */
	@RequestMapping(value="/gallery/gal_list_new.do", method=RequestMethod.GET)
	public ModelAndView gallistnew(Model model) {
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		// 데이터저장할곳
		List<Goods> output = null;
		
		try {
			// 데이터조회
			output = goodsService.getGoodsListNew(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output", output);
	
		return new ModelAndView("gallery/gal_list");
	}
	
	/** 갤러리 목록 페이지 (카테고리별) */
	@RequestMapping(value="/gallery/gal_list.do", method=RequestMethod.GET)
	public ModelAndView gallistcate(Model model,
			@RequestParam(value="cate1", required=false) String cate1) {
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		input.setCate1(cate1);
		
		// 데이터저장할곳
		List<Goods> output = null;
		
		try {
			// 데이터조회
			output = goodsService.getGoodsListCate(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output", output);
	
		return new ModelAndView("gallery/gal_list");
	}
	
	/** Goods 카테고리별 select 탭 */
	@RequestMapping(value="/gallery/gal_list_select.do", method=RequestMethod.GET)
	public ModelAndView gallistcate(Model model,
			@RequestParam(value="cate1", required=false) String cate1,
			@RequestParam(value="searchCondition", defaultValue="A") String searchCondition) {
		if (searchCondition == null) {
			return webHelper.redirect(null, "ㅁㄴㅇㄹ");
		}
		if (cate1 == null) {
			return webHelper.redirect(null, "ㅁㄴㅇㄹ");
		}
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		String category = cate1;
		input.setCate1(category);
		input.setSearchCondition(searchCondition);
		
		// 데이터저장할곳
		List<Goods> output = null;		
		
		try {
			// 데이터조회
			output = goodsService.getGoodsListCateS(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
			
		// 3) 뷰처리
		model.addAttribute("output", output);
		return new ModelAndView("gallery/gal_list");
	}
	
	/** 갤러리 목록 페이지 (검색별) */
	@RequestMapping(value="/gallery/gal_list_search.do", method=RequestMethod.GET)
	public ModelAndView gallistsearch(Model model,
			// 검색어
			@RequestParam(value="keyword", required=false) String keyword) {
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		input.setGname(keyword);
		
		// 데이터저장할곳
		List<Goods> output = null;
		
		try {
			// 데이터조회
			output = goodsService.getGoodsListSearch(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output", output);
		model.addAttribute("keyword", keyword);
		
		return new ModelAndView("share/search_gallist");
	}	
}