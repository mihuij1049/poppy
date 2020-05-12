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

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Address;
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Goodsdetail;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.GoodsdetailService;
import kr.co.poppy.service.PointsService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PayAjaxController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	AddressService addressService;

	@Autowired
	PointsService pointsService;

	@Autowired
	GoodsService goodsService;

	@Autowired
	GoodsdetailService goodsdetailService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 주문결제페이지 */
	@RequestMapping(value = "/pay_ajax/orderform.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addrList(Model model, @RequestParam(value = "goodsno", defaultValue = "0") int goodsno,
			@RequestParam(value = "gddetailno", defaultValue = "0") int gddetailno,
			@RequestParam(value = "gdoption", required = false) String gdoption) {

		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (goodsno == 0) {
			return webHelper.redirect(null, "상품번호가 없습니다.");
		}

		if (gdoption == null) {
			return webHelper.redirect(null, "상품옵션이 없습니다.");
		}

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Address input = new Address();
		input.setMemno(myInfo.getMemno());

		Address input2 = new Address();
		input2.setMemno(myInfo.getMemno());

		Points input3 = new Points();
		input3.setMemno(myInfo.getMemno());

		Goods gd = new Goods();
		gd.setGoodsno(goodsno);
		gd.setMemno(myInfo.getMemno());

		Goodsdetail gdetail = new Goodsdetail();
		gdetail.setGoodsno(goodsno);
		gdetail.setGddetailno(gddetailno);
		gdetail.setGdoption(gdoption);
		gdetail.setMemno(myInfo.getMemno());

		// 조회결과를 저장할 객체 선언
		Address output = null;
		List<Address> output2 = null;
		List<Points> output3 = null;
		Goods goods = null;
		List<Goodsdetail> gdoutput = null;

		try {
			// 데이터 조회
			output = addressService.getAddressItem(input);
			output2 = addressService.getAddressList(input2);
			output3 = pointsService.getPointsMbList(input3);
			goods = goodsService.getGoodsItem(gd);
			gdoutput = goodsdetailService.getGoodsdetailList(gdetail);
		} catch (Exception e) {
			// 신규회원일 경우, 조회된 데이터가 없으므로 오류를 발생시키면 안된다.
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 조회된 List객체에서 적립금 총합 구하기 */
		int sumAvpoint = 0;

		for (int i = 0; i < output3.size(); i++) {
			Points temp = null;
			temp = output3.get(i);
			if (temp.getAvpoint() == null || temp.getAvpoint() == 0) {
				temp.setAvpoint(0);
			}
			sumAvpoint += temp.getAvpoint();
		}

		input3.setAvpoint(sumAvpoint);

		// 세션에도 정보 담기
		myInfo.setSumAvpoint(sumAvpoint);

		mySession.setAttribute("userInfo", myInfo);

		/** View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("item", output2);
		model.addAttribute("input3", input3);
		model.addAttribute("goods", goods);
		model.addAttribute("gdoutput", gdoutput);
		return new ModelAndView("pay/orderform_ajax");
	}

}
