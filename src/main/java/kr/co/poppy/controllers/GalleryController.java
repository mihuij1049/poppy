package kr.co.poppy.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
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
	
	/** 갤러리 목록 페이지 (베스트상품별) */
	@RequestMapping(value="/gallery/gal_list_best.do", method=RequestMethod.GET)
	public ModelAndView gallistBest(Model model) {
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		// 데이터저장할곳
		List<Goods> output = null;
		
		try {
			// 데이터조회
			output = goodsService.getGoodsListBest(input);
			
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
			return webHelper.redirect(null, "서치컨디션없음1");
		}
		if (cate1 == null) {
			return webHelper.redirect(null, "카테1값업슴1");
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
	
	/** 갤러리 목록 페이지 (카테고리별-2) */
	@RequestMapping(value="/gallery/gal_list_2.do", method=RequestMethod.GET)
	public ModelAndView gallistcate2(Model model,
			@RequestParam(value="cate2", required=false) String cate2) {
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		input.setCate2(cate2);
		
		// 데이터저장할곳
		List<Goods> output = null;
		
		try {
			// 데이터조회
			output = goodsService.getGoodsListCate2(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output", output);
	
		return new ModelAndView("gallery/gal_list");
	}
	
	/** Goods 카테고리별 select 탭2 */
	@RequestMapping(value="/gallery/gal_list_select2.do", method=RequestMethod.GET)
	public ModelAndView gallistcate2(Model model,
			@RequestParam(value="cate2", required=false) String cate2,
			@RequestParam(value="searchCondition2", defaultValue="A") String searchCondition2) {
		if (searchCondition2 == null) {
			return webHelper.redirect(null, "서치컨디션없음");
		}
		if (cate2 == null) {
			return webHelper.redirect(null, "카테2값없음");
		}
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		String category = cate2;
		input.setCate2(category);
		input.setSearchCondition(searchCondition2);
		
		// 데이터저장할곳
		List<Goods> output = null;		
		
		try {
			// 데이터조회
			output = goodsService.getGoodsListCateS2(input);
			
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
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지구현
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		// 페이지 구현 변수값
		int totalCount = 0; // 전체글수
		int listCount = 6; // 페이지당 표시 목록 수
		int pageCount = 3; // 한 그룹 당 표시할 페이지 번호 수
		
		// 2) 데이터 조회
		// 굿즈데이터조회
		Goods input = new Goods();
		input.setGname(keyword);
		
		// 데이터저장할곳
		List<Goods> output = null;
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = goodsService.getGoodsCount(input);
			// 페이지 번호 계신 --> 계산 결과 로그 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			// sql의 limit절에서 사용될 값을 beans의 static 변수에 저장
			Goods.setOffset(pageData.getOffset());
			Goods.setListCount(pageData.getListCount());

			// 데이터조회
			output = goodsService.getGoodsListSearch(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output", output);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("share/search_gallist");
	}	
}