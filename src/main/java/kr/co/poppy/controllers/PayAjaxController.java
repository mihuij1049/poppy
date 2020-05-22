package kr.co.poppy.controllers;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.co.poppy.model.GoodsForRv;
import kr.co.poppy.model.Goodsdetail;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.GoodsdetailService;
import kr.co.poppy.service.MembersService;
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

	@Autowired
	MembersService membersService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 주문결제페이지 */
	@RequestMapping(value = "/pay_ajax/orderform.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addrList(Model model, @RequestParam(value = "gddetailno", defaultValue = "0") int gddetailno,
			@RequestParam(value = "gddetailno[]", defaultValue= "0") int[] gddetailList,
			@RequestParam(value = "gdcount", defaultValue = "0") int gdcount) {

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (myInfo == null) {
			return webHelper.redirect("../member/login.do", "로그인이 필요합니다.");
		}
		/**
		 * if (goodsno == 0) { return webHelper.redirect(null, "상품번호가 없습니다."); } if
		 * (gdoption.equals("active")) { return webHelper.redirect(null, "상품옵션을
		 * 선택해주세요."); }
		 */

		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Address input1 = new Address();
		input1.setMemno(myInfo.getMemno());

		Address input2 = new Address();
		input2.setMemno(myInfo.getMemno());

		Points input3 = new Points();
		input3.setMemno(myInfo.getMemno());

		// 1개 혹은 다수의 gddetailno를 데이터 조회하기 위한 분기
		List<Goodsdetail> input4 = new ArrayList<Goodsdetail>();
		if (gddetailno > 0) {
			gddetailList[0] = gddetailno;
		}
		

		for (int i = 0; i < gddetailList.length; i++) {
			Goodsdetail temp = new Goodsdetail();
			temp.setGddetailno(gddetailList[i]);
			input4.add(temp);
		}
		Map<String, Object> input = new HashMap<String, Object>();
		input.put("input", input4);
		// 조회결과를 저장할 객체 선언
		Address output = null;
		List<Address> output2 = null;
		List<Points> output3 = null;
		List<Goodsdetail> gdoutput = null;

		// 신규 - 기존 회원 검사
		int result = 0;

		try {
			result = addressService.getAddressCount(input1);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		if (result > 0) {
			try {
				// 데이터 조회
				output = addressService.getAddressItem(input1);
				output2 = addressService.getAddressList(input2);
				output3 = pointsService.getPointsMbList(input3);
				gdoutput = goodsdetailService.getGoodsdetailList(input);
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
		} else {
			try {
				output3 = pointsService.getPointsMbList(input3);
				gdoutput = goodsdetailService.getGoodsdetailList(input);
			} catch (Exception e) {
				// 신규회원일 경우, 조회된 데이터가 없으므로 오류를 발생시키면 안된다.
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}
		for (Goodsdetail item : gdoutput) {
			String imgPath = item.getImgpath() + item.getImgname() + "." + item.getImgext();
			item.setImgpath(webHelper.getUploadPath(imgPath));
		}

		/** View 처리 */
		model.addAttribute("gdcount", gdcount);
		model.addAttribute("output", output);
		model.addAttribute("item", output2);
		model.addAttribute("input3", input3);
		model.addAttribute("gdoutput", gdoutput);
		return new ModelAndView("pay/orderform_ajax");
	}

}
