package kr.co.poppy.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
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
@RestController
public class GoodsRestController {

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

	/** 갤러리 상세 페이지 */
	@RequestMapping(value = "/gallery/{goodsno}", method = RequestMethod.GET)
	public Map<String, Object> goods(Model model, 
			@PathVariable("goodsno") int goodsno,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {
		
		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (goodsno == 0) {
			return webHelper.getJsonWarning("상품번호가 없습니다.");
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
		qna.setGoodsno(goodsno);
		qna.setBbstype("B");

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
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		mySession.setAttribute("userInfo", myInfo);

		// 3) 뷰처리
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("goods", goods);
		data.put("heart", heart);
		data.put("item", ptrv);
		data.put("item2", qoutput);
		data.put("meta", pageData);
		return webHelper.getJsonData(data);
	}

}
