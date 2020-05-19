package kr.co.poppy.controllers;

import java.util.Calendar;
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
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.CommentsService;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.ImgsService;

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
	
	@Autowired
	GoodsService goodsService;
	
	@Autowired
	ImgsService imgdService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** ========== article Q&A 글보기 페이지 ========== */
	@RequestMapping(value = "/community/article.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView view(Model model, 
			@RequestParam(value = "bbstype", required = false) String bbstype,
			@RequestParam(value = "bbsno", defaultValue = "0") int bbsno,
			
			@RequestParam(value = "cmtno", defaultValue = "0") int cmtno){
		/** 1) 유효성 검사 */
		if (bbsno == 0) {
			return webHelper.redirect(null, "존재하는 게시글이 아닙니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Bbs input = new Bbs();
		input.setBbstype(bbstype);
		input.setBbsno(bbsno);

		Comments input2 = new Comments();
		input2.setBbsno(bbsno);
		input2.setBbstype(bbstype);

		// 조회 결과를 저장할 객체 선언
		Bbs output = null;
		List<Comments> output2 = null;

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		Comments myCmt = new Comments();

		if (myInfo != null) {
			myCmt.setUsername(myInfo.getUsername());
			myCmt.setMemno(myInfo.getMemno());
			model.addAttribute("myCmt", myCmt);
		}

		try {
			// 데이터 조회
			output = bbsService.getBbsItem(input);
			output2 = commentsService.getCommentsList(input2);
				
		} catch (Exception e) {	
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		String imgPath = output.getImgpath()+output.getImgname()+"."+output.getImgext();
		output.setImgpath(webHelper.getUploadPath(imgPath));
		
		model.addAttribute("output", output);
		model.addAttribute("output2", output2);
		return new ModelAndView("community/article");
	}

	/** ========== article 공지사항========== */
	@RequestMapping(value = "/community/noticearticle.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView view(Model model, 
			@RequestParam(value = "bbstype", required = false) String bbstype,
			@RequestParam(value = "bbsno", defaultValue = "0") int bbsno) {
		/** 1) 유효성 검사 */
		if (bbsno == 0) {
			return webHelper.redirect(null, "존재하는 게시글이 아닙니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Bbs input = new Bbs();
		input.setBbstype(bbstype);
		input.setBbsno(bbsno);


		// 조회 결과를 저장할 객체 선언
		Bbs output = null;

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		Comments myCmt = new Comments();

		if (myInfo != null) {
			myCmt.setUsername(myInfo.getUsername());
			myCmt.setMemno(myInfo.getMemno());
			model.addAttribute("myCmt", myCmt);
		}

		try {
			// 데이터 조회
			output = bbsService.getNoticeItem(input);
			
		} catch (Exception e) {	
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		return new ModelAndView("community/noticearticle");
	}
	
	/** ========== Q&A 작성폼 페이지 ========== */
	@RequestMapping(value = "/community/qna_wri.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView add(Model model,
		@RequestParam(value = "goodsno", defaultValue="0") int goodsno) {
		if(goodsno!=0) {
			
			Goods input = new Goods();
			input.setGoodsno(goodsno);
			
			Goods output = null;
	
			try {
				output=goodsService.getGoodsItem(input);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
			
			String imgPath = output.getImgpath()+output.getImgname()+"."+output.getImgext();
			output.setImgpath(webHelper.getUploadPath(imgPath));
			
			model.addAttribute("output", output);
		}
			return new ModelAndView("community/qna_wri");
	}


	
	/** ========== Q&A 작성폼에 대한 action페이지 ========== */
	@RequestMapping(value = "/community/qna_wri_ok.do", method = RequestMethod.POST)
	public ModelAndView add_qna(Model model, 
			@RequestParam(value = "bbstype", required = false) String bbstype,
			@RequestParam(value = "bbstitle", required = false) String bbstitle,
			@RequestParam(value = "bbscontent", required = false) String bbscontent,
			@RequestParam(value = "qnasec", defaultValue = "0") Integer qnasec,
			@RequestParam(value = "qnapw", required = false) String qnapw,
			@RequestParam(value = "regdate", required = false) String regdate,
			@RequestParam(value = "editdate", required = false) String editdate,
			@RequestParam(value = "goodsno", defaultValue="0") int goodsno,
			@RequestParam(value = "memno", defaultValue = "0") Integer memno) {
		// 가입한 시각을 담은 date 생성
		Calendar c = Calendar.getInstance();
		String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
				c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE),
				c.get(Calendar.SECOND));

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		if (bbstitle == null) {
			return webHelper.redirect(null, "제목을 입력하세요.");
		}
		
		if (bbscontent == null) {
			return webHelper.redirect(null, "내용을 입력하세요.");
		}
		
		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		Comments myCmt = new Comments();
		myCmt.setMemno(myInfo.getMemno());
		myCmt.setUsername(myInfo.getUsername());

		/** 2) 데이터 저장하기 */
		Bbs input = new Bbs();
		input.setBbstype("B");
		input.setBbstitle(bbstitle);
		input.setBbscontent(bbscontent);
		input.setQnasec(qnasec);
		input.setQnapw(qnapw);
		input.setRegdate(date);
		input.setEditdate(date);
		input.setMemno(myInfo.getMemno());
		input.setGoodsno(goodsno);
		
		
		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			bbsService.addBbs(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/community/article.do?bbsno=" + input.getBbsno() + "&bbstype="
				+ input.getBbstype();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}

	
	/** ========== Q&A 수정 폼 페이지 ========== */
	@RequestMapping(value = "/community/editqna.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView edit(Model model, 
			@RequestParam(value = "bbstype", required = false) String bbstype,
			@RequestParam(value = "bbsno", defaultValue = "0") int bbsno) {

		/** 1) 파라미터 유효성 검사 */

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 값을 beans에 저장하기
		Bbs input = new Bbs();
		input.setBbsno(bbsno);
		input.setBbstype("B");

		// 게시글 조회결과를 저장할 객체 선언
		Bbs output = null;

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		Comments myCmt = new Comments();

		if (myInfo != null) {
			myCmt.setUsername(myInfo.getUsername());
			model.addAttribute("myCmt", myCmt);
		}

		try {
			// 게시글 기본 정보 조회
			output = bbsService.getBbsItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String imgPath = output.getImgpath()+output.getImgname()+"."+output.getImgext();
		output.setImgpath(webHelper.getUploadPath(imgPath));
		
		/** 3) view 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("community/qna_edit");
	}

	
	/** ========== Q&A 수정폼에 대한 action페이지 ========== */
	@RequestMapping(value = "/community/qna_edit_ok.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView add_qna(Model model, @RequestParam(value = "memno", required = false) Integer memno,
			@RequestParam(value = "bbsno", required = false) int bbsno,
			@RequestParam(value = "bbstype", required = false) String bbstype,
			@RequestParam(value = "bbstitle", required = false) String bbstitle,
			@RequestParam(value = "bbscontent", required = false) String bbscontent,
			@RequestParam(value = "qnasec", defaultValue = "0") Integer qnasec,
			@RequestParam(value = "qnapw", required = false) String qnapw,
			@RequestParam(value = "editdate", required = false) String editdate)
			 {
		// 가입한 시각을 담은 date 생성
		Calendar c = Calendar.getInstance();
		String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
				c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE),
				c.get(Calendar.SECOND));

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		Comments myCmt = new Comments();
		myCmt.setMemno(myInfo.getMemno());
		myCmt.setUsername(myInfo.getUsername());

		/** 2) 데이터 저장하기 */
		Bbs input = new Bbs();
		input.setBbstype("B");
		input.setBbsno(bbsno);
		input.setBbstitle(bbstitle);
		input.setBbscontent(bbscontent);
		input.setQnasec(qnasec);
		input.setQnapw(qnapw);
		input.setEditdate(date);
		input.setMemno(myInfo.getMemno());
		

		try {
			// 데이터 수정
			bbsService.editBbs(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/community/article.do?bbsno=" + input.getBbsno() + "&bbstype="
				+ input.getBbstype();
		return webHelper.redirect(redirectUrl, "수정되었습니다.");
	}

	/** ========== notice 목록페이지 다중행조회 ==========  */
	@RequestMapping(value = "/community/notice.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView list(Model model,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 5; // 한 페이지 당 표시한 목록 수
		int pageCount = 3; // 한 그룹 당 표시할 페이지 번호 수

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(겁색어)를 Beans에 담는다.
		Bbs input = new Bbs();
		input.setBbstype("A");

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
			// 데이터 조회하기 --> 모든 공지사항 게시글 조회
			output = bbsService.getBbsList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) view 처리 */
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("community/notice");
	}

	/** ========== photo_rv 목록페이지 다중행조회 ==========  */
	@RequestMapping(value = "/community/photo_rv.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView photo_rv(Model model,
			// 검색어
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;
		int listCount = 6;
		int pageCount = 3;

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(겁색어)를 Beans에 담는다.
		Bbs input = new Bbs();
		input.setBbstitle(keyword);
		input.setBbstype("C");

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
			
			// 데이터 조회하기 -->
			output = bbsService.getBbsList_myrv(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		for (Bbs item : output) {
			String imgPath = item.getImgpath()+item.getImgname()+"."+item.getImgext();
			item.setImgpath(webHelper.getUploadPath(imgPath));
		}
		
		/** 3) view 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("community/photo_rv");
	}

	/** ========== qna 목록페이지 다중행조회  ========== */
	@RequestMapping(value = "/community/qna.do", method = { RequestMethod.GET, RequestMethod.POST })
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
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			// SQL의 limit절에서 사용될 값을 Beans의 static 변수에 저장
			Bbs.setOffset(pageData.getOffset());
			Bbs.setListCount(pageData.getListCount());
			// 데이터 조회하기 --> 검색조건 없이 모든 QnA데이터 조회
			output = bbsService.getBbsList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) view 처리 */
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("community/qna");
	}

	/** ========== QnA 검색 기능 구현 ==========  */
	@RequestMapping(value = "/community/qnasearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView qnaSearch(Model model,
			// 검색어
			@RequestParam(value = "searchType", required = false) String searchType,
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
		if (searchType.equals("bbstitle")) {
			input.setBbstitle(keyword);
		}
		if (searchType.equals("bbscontent")) {
			input.setBbscontent(keyword);
		}
		if (searchType.equals("username")) {
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

	/** ========== 공지사항 검색 기능 구현  ========== */
	@RequestMapping(value = "/community/noticesearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView noticeSearch(Model model,
			// 검색어
			@RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "keyword", required = false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {
		/** 1) keyword에 대한 유효성 검사 */
		if (keyword == null) {
			return webHelper.redirect(null, "검색 키워드가 없습니다.");
		}

		/** 2) 어떤 범주로 검색할지 받은 파라미터 검사 */
		Bbs input = new Bbs();
		input.setBbstype("A");
		if (searchType.equals("bbstitle")) {
			input.setBbstitle(keyword);
		}
		if (searchType.equals("bbscontent")) {
			input.setBbscontent(keyword);
		}
		if (searchType.equals("username")) {
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
		return new ModelAndView("community/notice");
	}

	/** ========== Q&A 삭제 ==========  */
	@RequestMapping(value = "/community/deleteqna.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model, @RequestParam(value = "bbsno", defaultValue = "0") int bbsno) {

		/** 1) 파라미터 유효성 검사 */
		if (bbsno == 0) {
			return webHelper.redirect(null, "존재하는 게시글이 아닙니다.");
		}

		/** 2) 데이터 삭제하기 */
		Bbs input = new Bbs();
		input.setBbsno(bbsno);

		try {
			bbsService.deleteBbs(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 페이지 이동 */
		return webHelper.redirect(contextPath + "/community/qna.do", "게시글이 삭제되었습니다.");
	}
}
