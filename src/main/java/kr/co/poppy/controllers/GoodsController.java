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
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Heart;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.HeartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class GoodsController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	GoodsService goodsService;

	@Autowired
	HeartService heartService;

	@Autowired
	BbsService bbsService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 갤러리 상세 페이지 */
	@RequestMapping(value = "/gallery/goods.do", method = RequestMethod.GET)
	public ModelAndView goods(Model model, @RequestParam(value = "goodsno", defaultValue = "0") int goodsno,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (goodsno == 0) {
			return webHelper.redirect(null, "상품번호가 없습니다.");
		}

		/** 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;
		int listCount = 5;
		int pageCount = 3;

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		// 빈즈에 담기
		Goods input = new Goods();
		input.setGoodsno(goodsno);

		Heart input2 = new Heart();
		input2.setGoodsno(goodsno);
		input2.setMemno(myInfo.getMemno());

		Bbs input3 = new Bbs();
		input3.setGoodsno(goodsno);
		input3.setMemno(myInfo.getMemno());
		input3.setBbstype("C");

		Bbs qna = new Bbs();
		qna.setBbstype("B");
		qna.setGoodsno(goodsno);

		// 조회결과를 저장할 객체 선언
		Goods goods = null;
		int heart = 0;
		List<Bbs> ptrv = null;
		List<Bbs> qoutput = null;
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = bbsService.getBbsCount(qna);
			// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			// SQL의 limit절에서 사용될 값을 Beans의 static 변수에 저장
			Bbs.setOffset(pageData.getOffset());
			Bbs.setListCount(pageData.getListCount());

			// 데이터 조회
			goods = goodsService.getGoodsItem(input);
			heart = heartService.getHeartCount(input2);
			ptrv = bbsService.getBbsList(input3);
			qoutput = bbsService.getBbsList(qna);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		mySession.setAttribute("userInfo", myInfo);

		// 3) 뷰처리
		model.addAttribute("goods", goods);
		model.addAttribute("heart", heart);
		model.addAttribute("ptrv", ptrv);
		model.addAttribute("qoutput", qoutput);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("gallery/goods");
	}

	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/gallery/goods_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model, @RequestParam(value = "bbstype", defaultValue = "B") String bbstype,
			@RequestParam(value = "bbstitle", defaultValue = "") String bbstitle,
			@RequestParam(value = "bbscontent", defaultValue = "") String bbscontent,
			@RequestParam(value = "qnasec", defaultValue = "0") int qnasec,
			@RequestParam(value = "qnapw", required = false) String qnapw,
			@RequestParam(value = "rvlike", required = false) String rvlike,
			@RequestParam(value = "regdate", required = false) String regdate,
			@RequestParam(value = "editdate", required = false) String editdate,
			@RequestParam(value = "memno", defaultValue = "0") int memno,
			@RequestParam(value = "goodsno", defaultValue = "0") int goodsno) {

		// 가입한 시각을 담은 date 생성
		Calendar c = Calendar.getInstance();
		String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
				c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE),
				c.get(Calendar.SECOND));
		
		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
		if (bbstitle.equals("")) {
			return webHelper.redirect(null, "제목을 입력하세요.");
		}
		if (bbscontent.equals("")) {
			return webHelper.redirect(null, "내용을 입력하세요.");
		}
		
		/** 2) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
        Bbs qsave = new Bbs();
        qsave.setBbstype("B");
        qsave.setBbstitle(bbstitle);
        qsave.setBbscontent(bbscontent);
        qsave.setQnasec(qnasec);
        qsave.setQnapw(qnapw);
        qsave.setRvlike(rvlike);
        qsave.setRegdate(date);
        qsave.setEditdate(date);
        qsave.setMemno(myInfo.getMemno());
        qsave.setGoodsno(goodsno);
        

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            bbsService.addBbs(qsave);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }


		/** 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/gallery/goods.do?goodsno=" + qsave.getGoodsno();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");

	}

}
