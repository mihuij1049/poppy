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
import kr.co.poppy.model.Address;
import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
import kr.co.poppy.service.OrdersService;
import kr.co.poppy.service.PointsService;

@Controller
public class PayController {

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
	OrdersService ordersService;
	

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** orderform 페이지 단일행 조회 */
	@RequestMapping(value="/pay/orderform.do", method=RequestMethod.GET)
	public ModelAndView orederformView(Model model, 
		@RequestParam(value = "memno", defaultValue = "1") int memno) {

		    /** 유효성 검사 */
			// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
			if (memno == 0) {
				return webHelper.redirect(null, "회원번호가 없습니다.");
			}
			
			
			/** 데이터 조회하기 */
			// 데이터 조회에 필요한 조건값을 Beans에 저장하기
			Address input = new Address();
			Address input2 = new Address();
			input.setMemno(memno);
			input2.setMemno(memno);
			
			// 조회결과를 저장할 객체 선언
			Address output = null;
			List<Address> output2 = null;
			
			Points input3 = new Points();
			input3.setMemno(memno);
			
			List<Points> output3 = null;

			try { 
				// 데이터 조회
				output = addressService.getAddressItem(input);
				output2 = addressService.getAddressList(input2);
				output3 = pointsService.getPointsMbAvList(input3);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}

			/** View 처리 */
			model.addAttribute("output", output);
			model.addAttribute("output2", output2);
			model.addAttribute("output3", output3);
			return new ModelAndView("pay/orderform");

	}

	/** 주소 목록페이지 */
	@RequestMapping(value = "/pay/orderform_list.do", method = RequestMethod.GET)
	public ModelAndView addrList(Model model,
			@RequestParam(value = "memno", defaultValue = "") int memno) {

		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (memno == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}

		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Address input = new Address();
		input.setMemno(memno);

		// 조회결과를 저장할 객체 선언
		List<Address> output = null;

		try { 
			// 데이터 조회
			output = addressService.getAddressList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("pay/orderform");
	}
	
	/** 주소 작성 폼에 대한 action 페이지 */
    @RequestMapping(value = "/pay/orderform_add_ok.do", method = RequestMethod.POST)
    public ModelAndView addrAdd_ok(Model model,
            @RequestParam(value="odname", required=false) String odname,
            @RequestParam(value="odphone", required=false) String odphone,
            @RequestParam(value="odemail", required=false) String odemail,
            @RequestParam(value="zcode", required=false) Integer zcode,
            @RequestParam(value="addr1", required=false) String addr1,
            @RequestParam(value="addr2", required=false) String addr2,
            @RequestParam(value="regdate", defaultValue="0") int regdate,
            @RequestParam(value="editdate", defaultValue="0") int editdate,
            @RequestParam(value="memno", defaultValue="0") int memno) {

        /** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
        // 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리된다.
        if (odname.equals(""))                { return webHelper.redirect(null, "이름을 입력하세요."); }
        if (!regexHelper.isKor(odname))       { return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
        if (odemail.equals(""))               { return webHelper.redirect(null, "이메일을 입력하세요."); }
        if (!regexHelper.isEngNum(odemail))   { return webHelper.redirect(null, "이메일은 영어와 숫자로만 가능합니다."); }
        if (addr1.equals(""))                 { return webHelper.redirect(null, "주소를 입력하세요."); }
        if (addr2.equals(""))                 { return webHelper.redirect(null, "상세주소를 입력하세요."); }

        // 숫자형으로 선언된 파라미터()
        if (zcode == null)                    { return webHelper.redirect(null, "우편번호를 입력하세요."); } 

        /** 2) 데이터 저장하기 */
        // 저장할 값들을 Beans에 담는다.
        Address input = new Address();
        input.setOdname(odname);
        input.setOdphone(odphone);
        input.setOdemail(odemail);
        input.setZcode(zcode);
        input.setAddr1(addr1);
        input.setAddr2(addr2);
        input.setRegdate("now()");
        input.setEditdate("now()");
        input.setMemno(memno);

        try {
            // 데이터 저장
            // --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
            addressService.addAddress(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
        String redirectUrl = contextPath + "/pay/orderform.do?memno=" + input.getMemno();
        return webHelper.redirect(redirectUrl, "저장되었습니다.");
    }
    
    /** 주소 수정 폼 페이지 */
    @RequestMapping(value = "/pay/orderform_edit_ok.do", method = RequestMethod.POST)
    public ModelAndView addrEdit_ok(Model model,
            @RequestParam(value="odname", required=false) String odname,
            @RequestParam(value="zcode", required=false) Integer zcode,
            @RequestParam(value="addr1", required=false) String addr1,
            @RequestParam(value="addr2", required=false) String addr2,
            @RequestParam(value="odphone", required=false) String odphone,
            @RequestParam(value="odemail", required=false) String odemail,
            @RequestParam(value="editdate", required=false) String editdate) {
        
        /** 1) 사용자가 입력한 파라미터 유효성 검사 */
        if (odname == null)                   { return webHelper.redirect(null, "이름을 입력하세요."); }
        if (!regexHelper.isKor(odname))       { return webHelper.redirect(null, "이름은 한글만 가능합니다."); }
        if (odemail == null)                  { return webHelper.redirect(null, "이메일을 입력하세요."); }
        if (!regexHelper.isEngNum(odemail))   { return webHelper.redirect(null, "이메일은 영어와 숫자로만 가능합니다."); }
        if (addr1 == null)                    { return webHelper.redirect(null, "주소를 입력하세요."); }
        if (addr2 == null)                    { return webHelper.redirect(null, "상세주소를 입력하세요."); }
        if (!regexHelper.isKor(addr2))        { return webHelper.redirect(null, "상세주소는 한글만 가능합니다."); }
        if (odphone == null)                  { return webHelper.redirect(null, "핸드폰 번호를 입력하세요."); }
        if (zcode == null)                    { return webHelper.redirect(null, "우편번호를 입력하세요."); }

        /** 2) 데이터 수정하기 */
        // 수정할 값들을 Beans에 담는다.
        Address input = new Address();
        input.setOdname(odname);
        input.setZcode(zcode);
        input.setAddr1(addr1);
        input.setAddr2(addr2);
        input.setOdphone(odphone);
        input.setOdemail(odemail);
        input.setEditdate(editdate);

        try {
            // 데이터 수정
            addressService.editAddress(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) 결과를 확인하기 위한 페이지 이동 */
        // 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다. 
        String redirectUrl = contextPath + "/pay/orderform.do?memno=" + input.getMemno();
        return webHelper.redirect(redirectUrl, "수정되었습니다.");
    }  
    
    /** 주문내역 목록페이지 */
	@RequestMapping(value = "/myInfo/order_list_ok.do", method = RequestMethod.GET)
	public ModelAndView orderList(Model model,
			@RequestParam(value = "memno", defaultValue = "0") int memno,
			@RequestParam(value = "odstatus", defaultValue = "") String odstatus) {

		/** 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (memno == 0)       { return webHelper.redirect(null, "회원번호가 없습니다."); }
		if (odstatus == "")    { return webHelper.redirect(null, "주문상태가 없습니다."); }

		
		/** 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Orders input = new Orders();
		input.setMemno(memno);

		// 조회결과를 저장할 객체 선언
		List<Orders> output = null;

		try { 
			// 데이터 조회
			output = ordersService.getOrdersList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리 */
		model.addAttribute("output", output);
		return new ModelAndView("myInfo/order_list");
	}
	
}
