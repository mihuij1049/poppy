package kr.co.poppy.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Bbs;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.CommentsService;

@Controller
public class CommunityAjaxController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Serivce 패턴 구현체 주입 */
	@Autowired
	BbsService bbsService;

	@Autowired
	CommentsService commentsService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** qna 수정 */
	@RequestMapping(value="/community/qna_edit", method=RequestMethod.GET)
	public ModelAndView edit(Model model,
			@RequestParam(value="bbsno", defaultValue="0") int bbsno) {
		/** 1) 파라미터 유효성 검사 */
		if(bbsno==0) {
			return webHelper.redirect(null, "게시글 번호가 없습니다.");
		}
		
		/** 2) 데이터 조회하기 */
		Bbs input = new Bbs();
		input.setBbsno(bbsno);
		
		// 조회결과를 저장할 객체 선언
		Bbs output = null;
		
		try {
			output = bbsService.getBbsItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) view처리 */
		model.addAttribute("output", output);
		return new ModelAndView("community/qna_edit");
	}
	}
