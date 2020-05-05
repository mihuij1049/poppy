package kr.co.poppy.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import kr.co.poppy.model.Comments;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.CommentsService;

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

	@Autowired
	CommentsService commentsService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** article */
	@RequestMapping(value = "/community/article.do", method = RequestMethod.GET)
	public ModelAndView view(Model model, @RequestParam(value = "bbstype", required = false) String bbstype,
			@RequestParam(value = "bbsno", defaultValue = "0") int bbsno) {
		/** 1) 유효성 검사 */
		if (bbsno == 0) {
			return webHelper.redirect(null, "게시글 번호가 없습니다.");
		}
		if (bbstype == null) {
			return webHelper.redirect(null, "게시글 타입이 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Bbs input = new Bbs();
		input.setBbstype(bbstype);
		input.setBbsno(bbsno);

		Comments input2 = new Comments();
		input2.setBbsno(bbsno);

		// 조회 결과를 저장할 객체 선언
		Bbs output = null;
		List<Comments> output2 = null;

		try {
			// 데이터 조회
			output = bbsService.getBbsItem(input);
			output2 = commentsService.getCommentsList(input2);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) view 처리 */
		if (output.getBbstype().equals("A")) {
			output.setBbstype("공지사항");
		} else {
			output.setBbstype("Q&A");
		}

		model.addAttribute("output", output);
		model.addAttribute("output2", output2);
		return new ModelAndView("community/article");

	}

	/** notice */
	@RequestMapping(value = "/community/notice.do", method = RequestMethod.GET)
	public ModelAndView list(Model model,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 3; // 한 페이지 당 표시한 목록 수
		int pageCount = 3; // 한 그룹 당 표시할 페이지 번호 수

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

	/** qna */
	@RequestMapping(value = "/community/qna.do", method = RequestMethod.GET)
	public ModelAndView listqna(Model model,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;
		int listCount = 5;
		int pageCount = 3;

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(겁색어)를 Beans에 담는다.
		Bbs input = new Bbs();
		input.setBbstype("B");

		// 조회 결과가 저장될 객체
		List<Bbs> output = null;
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = bbsService.getBbsCount(input);
			// 댓글 수 조회
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
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("community/qna");
	}

	/** QnA 검색 기능 구현 */
	@RequestMapping(value = "/community/qnasearch.do", method = RequestMethod.GET)
	public ModelAndView qnaSearch(Model model,
			// 검색어
			@RequestParam(value = "bbstitle", required = false) String bbstitle,
			@RequestParam(value = "bbscontent", required = false) String bbscontent,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "keyword", required = false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {
		/** 1) keyword에 대한 유효성 검사 */
		if (keyword == null) {
			return webHelper.redirect(null, "검색 키워드가 없습니다.");
		}

		/** 2) 어떤 범주로 검색할지 받은 파라미터 검사 */
		Bbs input = new Bbs();
		input.setBbstype("B");
		if (bbstitle != null) {
			input.setBbstitle(keyword);
		}
		if (bbscontent != null) {
			input.setBbscontent(keyword);
		}
		if (userid != null) {
			input.setUserid(keyword);
		}
		if (username != null) {
			input.setUsername(keyword);
		}
		/** 3) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;
		int listCount = 5;
		int pageCount = 3;
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
		return new ModelAndView("community/qna");
	}

	/** 댓글 저장히기 */
	@RequestMapping(value = "community/comments.do", method = RequestMethod.POST)
	public ModelAndView addcmt(Model model, 
			@RequestParam(value = "cmtcontent", required = false) String cmtcontent,
			@RequestParam(value = "regdate", required = false) String regdate,
			@RequestParam(value = "editdate", required = false) String editdate,
			@RequestParam(value = "bbsno", defaultValue = "0") int bbsno,
			@RequestParam(value = "memno", defaultValue = "0") int memno){

		/** 1) 유효성 검사 */
		if (cmtcontent.equals("")) {
			return webHelper.redirect(null, "댓글을 입력하세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Comments input = new Comments();
		input.setCmtcontent(cmtcontent);
		input.setRegdate(regdate);
		input.setEditdate(editdate);
		input.setBbsno(bbsno);

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		Comments myCmt = new Comments();
		myCmt.setMemno(myInfo.getMemno());
		myCmt.setUsername(myInfo.getUsername());
		
		try {
			// 데이터 저장
			commentsService.addComments(input);
			commentsService.addComments(myCmt);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/community/article.do?cmtno=" + input.getCmtno();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}

	/** photo_rv */
	@RequestMapping(value = "/community/photo_rv.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String photo_rv() {
		return "community/photo_rv";
	}

	/** qna_wri */
	@RequestMapping(value = "/community/qna_wri.do", method = RequestMethod.GET)
	public String qna_wri() {
		return "community/qna_wri";
	}

}
