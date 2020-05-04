package kr.co.poppy.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value="/gallery", method=RequestMethod.GET)
	public Map<String, Object> goods(Model model,
			@RequestParam(value = "goodsno", defaultValue = "1") int goodsno) {
		
		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (goodsno == 0) {
			return webHelper.getJsonWarning("상품번호가 없습니다.");
		}
		
		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		
		//  빈즈에 담기
		Bbs input = new Bbs();
		input.setGoodsno(goodsno);
		input.setMemno(myInfo.getMemno());

		// 조회결과를 저장할 객체 선언
		List<Bbs> output = null;
		
		try {
			// 데이터 조회
			output = bbsService.getBbsList_goods(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		mySession.setAttribute("userInfo", myInfo);
		
		// 3) 뷰처리
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		return webHelper.getJsonData(data);
	}

}
