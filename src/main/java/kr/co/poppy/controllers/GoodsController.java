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
		
		int goodsno = webHelper.getInt("goodsno");

		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (goodsno == 0) {
			return webHelper.redirect(null, "상품번호가 없습니다.");
		}

		/**  페이지 구현에 필요한 변수값 생성 */
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

		Bbs qna = new Bbs();
		qna.setBbstype("B");

		// 조회결과를 저장할 객체 선언
		Goods output = null;
		int output2 = 0;
		List<Bbs> output3 = null;
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
			output = goodsService.getGoodsItem(input);
			output2 = heartService.getHeartCount(input2);
			output3 = bbsService.getBbsList_goods(input3);
			qoutput = bbsService.getBbsList(qna);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		mySession.setAttribute("userInfo", myInfo);

		// 3) 뷰처리
		model.addAttribute("output", output);
		model.addAttribute("output2", output2);
		model.addAttribute("output3", output3);
		model.addAttribute("qoutput", qoutput);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("gallery/goods");
	}

}
