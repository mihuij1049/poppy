package kr.co.poppy.controllers;

import java.util.List;

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
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Heart;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.HeartService;

@Controller
public class GoodsAjaxController {
	
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
	@RequestMapping(value="/gallery/goods_ajax.do", method=RequestMethod.GET)
	public ModelAndView goods(Model model,
			@RequestParam(value = "goodsno", defaultValue = "1") int goodsno,
			@RequestParam(value = "memno", defaultValue = "1") int memno) {
		
		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (goodsno == 0) {
			return webHelper.redirect(null, "상품번호가 없습니다.");
		}
		
		if (memno == 0) {
			return webHelper.redirect(null, "회원번호가 업습니다.");
		}
			
		//  빈즈에 담기
		Goods input = new Goods();
		input.setGoodsno(goodsno);
		
		Heart input2 = new Heart(); 
		input2.setGoodsno(goodsno);
		
		Bbs input3 = new Bbs();
		input3.setGoodsno(goodsno);
		input3.setMemno(memno);
		
		// 조회결과를 저장할 객체 선언
		Goods output = null;
		int output2  = 0;
		List<Bbs> output3 = null;
		
		try {
			// 데이터 조회
			output = goodsService.getGoodsItem(input);
			output2 = heartService.getHeartCount(input2);
			output3 = bbsService.getBbsList_goods(input3);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		// 3) 뷰처리
		model.addAttribute("output", output);
		model.addAttribute("output2", output2);
		model.addAttribute("item", output3);
		return new ModelAndView("gallery/goods_ajax");
	}


}
