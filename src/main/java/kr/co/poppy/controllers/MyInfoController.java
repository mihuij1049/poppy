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

import com.mysql.cj.log.Log;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.OrderdetailService;
import kr.co.poppy.service.OrdersService;
import kr.co.poppy.service.PointsService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyInfoController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RexgexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현제 주입 */
	@Autowired
	PointsService pointsService;
	@Autowired
	OrdersService orderService;
	@Autowired
	OrderdetailService orderdetailService;

	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/myInfo/myinfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myinfo(Model model) {
		
		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		
		
		
		/** 1) 각종 정보 조회를 위한 Beans 생성  */
		// 적립금 조회를 위한 빈즈
		Points myPoint = new Points();
		myPoint.setMemno(myInfo.getMemno());
		// 조회 결과를 담을 List 객체 선언
		List<Points> pointList = null;
		
		// 배송 상태를 조회할 빈즈
		Orders myOrder = new Orders();
		myOrder.setMemno(myInfo.getMemno());
		// 조회 결과를 담을 List 객체 선언
		List<Orders> orderList = null;
		
		/** 2) 정보 조회하기  */ 
		try {
			// 적립금 조회 리스트
			pointList = pointsService.getPointsMbList(myPoint); 
			// 주문내역 조회 리스트
			orderList = orderService.getOrdersList(myOrder);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 조회된 List객체에서 적립금 총합 구하기 */
		int sumAvpoint = 0;
		int sumNapoint = 0;
		
		for (int i=0; i<pointList.size(); i++) {
			Points temp = null;
			temp = pointList.get(i);
			sumAvpoint+=temp.getAvpoint();
			sumNapoint+=temp.getNapoint();
		}
		myPoint.setAvpoint(sumAvpoint);
		myPoint.setNapoint(sumNapoint);
		
		/** 4) 조회된 List 객체에서 주문 상태별로 나누기 */
		int status0 = 0;
		int status1 = 0;
		int status2 = 0;
		int status3 = 0;
		
		for (int i=0; i<orderList.size(); i++) {
			Orders temp = null;
			temp = orderList.get(i);
			if(temp.getOdstatus().equals("0")) {
				status0++;
			} else if(temp.getOdstatus().equals("1")) {
				status1++;
			} else if(temp.getOdstatus().equals("2")) {
				status2++;
			} else if(temp.getOdstatus().equals("3")) {
				status3++;
			}
		}
		// 스트링으로 변환하여 담기
		String odstatus0 = "" + status0;
		String odstatus1 = "" + status1;
		String odstatus2 = "" + status2;
		String odstatus3 = "" + status3;
		
		/** 뷰에 데이터 전달  */
		// 적립금 정보를 담은 Beans
		model.addAttribute("myPoint", myPoint);
		// 주문상태를 담은 String객체
		model.addAttribute("status0", odstatus0);
		model.addAttribute("status1", odstatus1);
		model.addAttribute("status2", odstatus2);
		model.addAttribute("status3", odstatus3);
		
		return new ModelAndView("myInfo/myinfo");
	}

	@RequestMapping(value = "/myInfo/order_desc.do", method = RequestMethod.GET)
	public String order_desc() {
		return "myInfo/order_desc";
	}

	@RequestMapping(value = "/myInfo/myinfo_edit.do", method = RequestMethod.GET)
	public String myinfo_edit() {
		return "myInfo/myinfo_edit";
	}

	@RequestMapping(value = "/myInfo/like_goods.do", method = RequestMethod.GET)
	public String like_goods() {
		return "myInfo/like_goods";
	}

	@RequestMapping(value = "/myInfo/point.do", method = RequestMethod.GET)
	public String point() {
		return "myInfo/point";
	}

	@RequestMapping(value = "/myInfo/plist_nota.do", method = RequestMethod.GET)
	public String plist_nota() {
		return "myInfo/plist_nota";
	}

	@RequestMapping(value = "/myInfo/plist_grd.do", method = RequestMethod.GET)
	public String plist_grd() {
		return "myInfo/plist_grd";
	}

	@RequestMapping(value = "/myInfo/my_rv.do", method = RequestMethod.GET)
	public String my_rv() {
		return "myInfo/my_rv";
	}

	@RequestMapping(value = "/myInfo/recent.do", method = RequestMethod.GET)
	public String recent() {
		return "myInfo/recent";
	}
}
