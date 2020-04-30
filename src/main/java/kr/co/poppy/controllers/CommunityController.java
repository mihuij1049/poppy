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
import kr.co.poppy.service.BbsService;


@Controller
public class CommunityController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;
	
	/** Serivce 패턴 구현체 주입 */
	@Autowired 
	BbsService bbsService;
	
	/** article */
	@RequestMapping(value="/community/article.do", method=RequestMethod.GET)
	public ModelAndView view(Model model,
			@RequestParam(value="bbsno", defaultValue="0") int bbsno) {
		/** 1) 유효성 검사 */
		if(bbsno==0) {
			return webHelper.redirect(null, "게시글이 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Bbs input = new Bbs();
		input.setBbsno(bbsno);
		
		// 조회 결과를 저장할 객체 선언
		Bbs output = null;
		
		try {
			// 데이터 조회
			output = bbsService.getBbsItem2(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) view 처리 */
 		model.addAttribute("output", output);
 		return new ModelAndView("community/article");
	}
	
	/** notice */
	@RequestMapping(value="/community/notice.do", method=RequestMethod.GET)
	public ModelAndView list(Model model,
			// 검색어
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(겁색어)를 Beans에 담는다.
		Bbs input = new Bbs();
		input.setBbstype("A");
		input.setBbscontent(keyword);
		input.setBbstitle(keyword);
		input.setUsername(keyword);
		input.setUserid(keyword);
		
		// 조회 결과가 저장될 객체
		List<Bbs> output = null;
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = bbsService.getBbsCount(input);
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 limit절에서 사용될 값을 Beans의 static 변수에 저장
			Bbs.setOffset(pageData.getOffset());
			Bbs.setListCount(pageData.getListCount());
			// 데이터 조회하기 --> 검색조건 없이 모든 학과 조회
			output = bbsService.getBbsList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) view 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("community/notice");
	}
	
	/** photo_rv */
	@RequestMapping(value="/community/photo_rv.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String photo_rv() {
		return "community/photo_rv";
	}
	
	/** photo_wri */
	@RequestMapping(value="/community/photo_wri.do", method=RequestMethod.GET)
	public String photo_wri() {
		return "community/photo_wri";
	}
	
	/** photo */
	@RequestMapping(value="/community/photo.do", method=RequestMethod.GET)
	public String photo() {
		return "community/photo";
	}
	
	/** qna_wri */
	@RequestMapping(value="/community/qna_wri.do", method=RequestMethod.GET)
	public String qna_wri() {
		return "community/qna_wri";
	}
	
	/** qna */
	@RequestMapping(value="/community/qna.do", method=RequestMethod.GET)
	public ModelAndView listqna(Model model,
			// 검색어
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPag) {
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(겁색어)를 Beans에 담는다.
		Bbs input = new Bbs();
		input.setBbstype("B");
		input.setBbscontent(keyword);
		input.setBbstitle(keyword);
		input.setUsername(keyword);
		input.setUserid(keyword);
		
		// 조회 결과가 저장될 객체
		List<Bbs> output = null;
		
		try {
			// 데이터 조회하기 --> 검색조건 없이 모든 학과 조회
			output = bbsService.getBbsList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) view 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		return new ModelAndView("community/qna");
	}

}
