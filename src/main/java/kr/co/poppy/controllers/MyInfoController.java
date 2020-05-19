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
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.poppy.helper.PageData;
import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Address;
import kr.co.poppy.model.Bbs;
import kr.co.poppy.model.Goods;
import kr.co.poppy.model.GoodsForRv;
import kr.co.poppy.model.Goodsdetail;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Orderdetail;
import kr.co.poppy.model.Orders;
import kr.co.poppy.model.Points;
import kr.co.poppy.service.AddressService;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.GoodsForRvService;
import kr.co.poppy.service.MembersService;
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
	MembersService membersSerivce;
	@Autowired
	OrderdetailService orderdetailService;
	@Autowired
	AddressService addressService;
	@Autowired
	BbsService bbsService;
	@Autowired
	GoodsForRvService goodsForRvService;

	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** My정보 페이지 */
	@RequestMapping(value = "/myInfo/myinfo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView myinfo(Model model) {

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 1) 각종 정보 조회를 위한 Beans 생성 */
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

		/** 2) 정보 조회하기 */
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
		int sumUsedpoint = 0;

		for (int i = 0; i < pointList.size(); i++) {
			Points temp = null;
			temp = pointList.get(i);
			if (temp.getAvpoint() == null || temp.getAvpoint() == 0) {
				temp.setAvpoint(0);
			}
			sumAvpoint += temp.getAvpoint();
			if (temp.getNapoint() == null || temp.getNapoint() == 0) {
				temp.setNapoint(0);
			}
			sumNapoint += temp.getNapoint();
			if (temp.getUsedpoint() == null || temp.getUsedpoint() == 0) {
				temp.setUsedpoint(0);
			}
			sumUsedpoint += temp.getUsedpoint();
		}
		myPoint.setAvpoint(sumAvpoint);
		myPoint.setNapoint(sumNapoint);
		myPoint.setUsedpoint(sumUsedpoint);
		// 세션에도 정보 담기
		myInfo.setSumAvpoint(sumAvpoint);
		myInfo.setSumNapoint(sumNapoint);
		myInfo.setSumUsedpoint(sumUsedpoint);

		mySession.setAttribute("userInfo", myInfo);

		/** 4) 조회된 List 객체에서 주문 상태별로 나누기 */
		int status0 = 0;
		int status1 = 0;
		int status2 = 0;
		int status3 = 0;

		for (int i = 0; i < orderList.size(); i++) {
			Orders temp = null;
			temp = orderList.get(i);
			if (temp.getOdstatus().equals("0")) {
				status0++;
			} else if (temp.getOdstatus().equals("1")) {
				status1++;
			} else if (temp.getOdstatus().equals("2")) {
				status2++;
			} else if (temp.getOdstatus().equals("3")) {
				status3++;
			}
		}
		// 스트링으로 변환하여 담기
		String odstatus0 = "" + status0;
		String odstatus1 = "" + status1;
		String odstatus2 = "" + status2;
		String odstatus3 = "" + status3;

		/** 뷰에 데이터 전달 */
		// 적립금 정보를 담은 Beans
		model.addAttribute("myInfo", myInfo);
		// 주문상태를 담은 String객체
		model.addAttribute("status0", odstatus0);
		model.addAttribute("status1", odstatus1);
		model.addAttribute("status2", odstatus2);
		model.addAttribute("status3", odstatus3);

		return new ModelAndView("myInfo/myinfo");
	}

	/** 주문조회 상세보기 페이지 */
	@RequestMapping(value = "/myInfo/order_desc.do", method = RequestMethod.GET)
	public ModelAndView order_desc(Model model, @RequestParam(value = "orderno", required = true) String orderno) {
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 파라미터 유효성 검사 */
		if (orderno == null) {
			webHelper.redirect(null, "선택된 주문 정보가 없습니다.");
		}

		/** 주문 정보 상세 조회를 위한 Beans 생성 */
		// 1) orders 테이블 조회를 위한 Beans
		int odnum = Integer.parseInt(orderno);
		Orders orders = new Orders();
		orders.setOrderno(odnum);

		// 2) orderdetail 테이블 조회를 위한 Beans
		Orderdetail input = new Orderdetail();
		input.setOrderno(odnum);
		List<Orderdetail> orderDetail = null;

		// 3) Address 정보를 담기 위한 빈즈
		Address addr = new Address();

		/** DB 정보 조회 */
		try {
			// order 테이블의 정보 단일행 조회 (파라미터 orderno)
			orders = orderService.getOrdersItem(orders);
			// orderdetail 테이블의 정보 다중행 조회 (파라미터 orderno)
			orderDetail = orderdetailService.getOrderdetailList(input);
			// address 테이블의 정보 단일행 조회 (파라미터 orderno)
			addr = addressService.getAddressItem(orders);
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
		}

		/** View 에 Beans를 통한 데이터 전달 */
		// 주문 상태 > 한글 처리
		if (orders.getOdstatus().equals("0")) {
			orders.setOdstatus("입금전");
		} else if (orders.getOdstatus().equals("1")) {
			orders.setOdstatus("배송준비중");
		} else if (orders.getOdstatus().equals("2")) {
			orders.setOdstatus("배송중");
		} else if (orders.getOdstatus().equals("3")) {
			orders.setOdstatus("배송완료");
		} else if (orders.getOdstatus().equals("4")) {
			orders.setOdstatus("주문취소");
		} else if (orders.getOdstatus().equals("5")) {
			orders.setOdstatus("반품처리중");
		} else if (orders.getOdstatus().equals("6")) {
			orders.setOdstatus("환불완료");
		}
		// 결제방식 > 한글처리
		if (orders.getPaytype().equals("credit")) {
			orders.setPaytype("신용카드");
		}
		// orderdetail에서 동일한 orderno를 참조하는 odgprice 와 odgsale 총 금액
		int sumOdgprice = 0;
		int sumOdgsale = 0;

		for (int i = 0; i < orderDetail.size(); i++) {
			Orderdetail temp = orderDetail.get(i);
			sumOdgprice += temp.getOdgprice() * temp.getOdgqty();
			sumOdgsale += temp.getOdgsale() * temp.getOdgqty();
		}
		orders.setSumOdgprice(sumOdgprice);
		orders.setSumOdgsale(sumOdgsale);

		model.addAttribute("myInfo", myInfo);
		model.addAttribute("orderInfo", orders);
		model.addAttribute("detailInfo", orderDetail);
		model.addAttribute("addrInfo", addr);

		return new ModelAndView("myInfo/order_desc");
	}

	@RequestMapping(value = "/myInfo/myinfo_edit.do", method = RequestMethod.GET)
	public String myinfo_edit() {
		return "myInfo/myinfo_edit";
	}

	@RequestMapping(value = "/myInfo/like_goods.do", method = RequestMethod.GET)
	public ModelAndView like_goods(Model model) {
		// 세션에서 멤버 정보 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		//  DB조회준비  Beans, 조회결과를 담을 컬렉션
		GoodsForRv input = new GoodsForRv();
		input.setMemno(myInfo.getMemno());

		List<GoodsForRv> output = null;
		List<GoodsForRv> output2 = null;
		try {
			output = goodsForRvService.getGoodsLikeList(input);
			output2 = goodsForRvService.getGoodsLikeListDetail(input);
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
		}
		
		// View에 리스트 전달
		model.addAttribute("output", output);
		model.addAttribute("output2", output);
		return new ModelAndView("myInfo/like_goods");
	}

	@RequestMapping(value = "/myInfo/point.do", method = RequestMethod.GET)
	public ModelAndView point(Model model) {
		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		model.addAttribute("myInfo", myInfo);

		return new ModelAndView("myInfo/point");
	}

	@RequestMapping(value = "/myInfo/pointList.do", method = RequestMethod.GET)
	public ModelAndView plist_used(Model model,
					@RequestParam(value="pointList", defaultValue="1") int pointList,
					// 페이지 구현에서 사용할 현재 페이지 번호
					@RequestParam(value = "page", defaultValue = "1") int nowPage) {
		// 세션으로 회원의 일련번호 획득
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		
		/** 1) 페이지 구현에 필요한 변수값 생성 */
		String pageTitle = null;
		int totalCount = 0; // 전체 게시글 수
		int listCount = 5; // 한 페이지 당 표시한 목록 수
		int pageCount = 3; // 한 그룹 당 표시할 페이지 번호 수
		
		/** 2) 데이터 조회하기  */
		Points input = new Points();
		input.setMemno(myInfo.getMemno());
		
		List<Points> output = null;
		PageData pageData = null;

		if (pointList==1) {
			pageTitle = "적립내역";
			try {
				// 전체 적립금 갯수 조회
				totalCount = pointsService.getPointsCount1(input);
				// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				// SQL의 limit절에서 사용될 값을 Beans의 static 변수에 저장
				Points.setOffset(pageData.getOffset());
				Points.setListCount(pageData.getListCount());
				// 데이터 조회
				output=pointsService.getPointsMbList1(input);
			} catch (Exception e) {
				log.debug(e.getLocalizedMessage());
			}
		}
		if (pointList==2) {
			pageTitle = "미가용 적립내역";
			try {
				// 전체 적립금 갯수 조회
				totalCount = pointsService.getPointsCount2(input);
				// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				// SQL의 limit절에서 사용될 값을 Beans의 static 변수에 저장
				Points.setOffset(pageData.getOffset());
				Points.setListCount(pageData.getListCount());
				// 데이터 조회
				output=pointsService.getPointsMbList2(input);
			} catch (Exception e) {
				log.debug(e.getLocalizedMessage());
			}
		}
		if (pointList==3) {
			pageTitle = "적립금 사용내역";
			try {
				// 전체 적립금 갯수 조회
				totalCount = pointsService.getPointsCount3(input);
				// 페이지 번호 계산 --> 계산결과가 로그로 출력될 것이다.
				pageData = new PageData(nowPage, totalCount, listCount, pageCount);
				// SQL의 limit절에서 사용될 값을 Beans의 static 변수에 저장
				Points.setOffset(pageData.getOffset());
				Points.setListCount(pageData.getListCount());
				// 데이터 조회
				output=pointsService.getPointsMbList3(input);
			} catch (Exception e) {
				log.debug(e.getLocalizedMessage());
			}
			
		}
		
		/** View 에 데이터 전달 */
		model.addAttribute("myInfo", myInfo);
		model.addAttribute("pointList", pointList);
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("myInfo/pointList");
	}

	/** 후기관리 페이지 */
	@RequestMapping(value = "/myInfo/my_rv.do", method = RequestMethod.GET)
	public ModelAndView my_rv(Model model) {
		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");

		/** 정보 조회를 위해 일할 Beans */
		// 작성 가능한 리뷰 탭을 조회할 Beans
		GoodsForRv goodsForRv = new GoodsForRv();
		/* goodsForRv.setBbstype("C"); */
		goodsForRv.setMemno(myInfo.getMemno());

		List<GoodsForRv> avRvList = null;

		// 내가 작성한 리뷰 탭을 조회할 Beans
		Bbs myBbs = new Bbs();
		myBbs.setMemno(myInfo.getMemno());

		List<Bbs> myBbsList = null;

		try {
			myBbsList = bbsService.getBbsList_myrv(myBbs);

			avRvList = goodsForRvService.getGoodsList(goodsForRv);
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		
		for (Bbs item : myBbsList) {
			String imgPath = item.getImgpath()+item.getImgname()+"."+item.getImgext();
			item.setImgpath(webHelper.getUploadPath(imgPath));
		}
		
		for (GoodsForRv item : avRvList) {
			String imgPath = item.getImgpath()+item.getImgname()+"."+item.getImgext();
			item.setImgpath(webHelper.getUploadPath(imgPath));
		}

		/** 1) 작성 가능한 리뷰 탭 (내가 구매한 상품목록(다중행조회)필요 param=memno) */
		model.addAttribute("avRvList", avRvList);

		/** 2) 내가 작성한 리뷰 탭 (bbs 다중행조회필요 - param=memno) */
		model.addAttribute("myReview", myBbsList);

		return new ModelAndView("myInfo/my_rv");
	}
	
	/** 쿠키값을 이용한 최근본 상품 페이지 */
	@RequestMapping(value = "/myInfo/recent.do", method = RequestMethod.GET)
	public ModelAndView recent(Model model,
			@CookieValue(value="recentItem", required=false) String recentItem) {
		
			// 스트링 배열에 쿠키에서 넘어온 goodsno 받기
			if (recentItem!=null) {
				String[] recentList = recentItem.split(",");
				// goodsno 배열을 List<Goods>에 담기
				List<GoodsForRv> goodsList = new ArrayList<GoodsForRv>();
				for (int i=0;i<recentList.length;i++) {
					GoodsForRv temp = new GoodsForRv();
					temp.setGoodsno(Integer.parseInt(recentList[i]));
					goodsList.add(temp);
				}
				
				// MyBatis의 파라미터로 전달할 Map 객체 생성 및 할당
				Map<String, Object> input = new HashMap<String, Object>();
				input.put("input", goodsList);
				
				List<GoodsForRv> output = null;
				/** 데이터 조회하기 */
				try {
					output = goodsForRvService.getRecentList(input);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				for (GoodsForRv item : output) {
					String imgPath = item.getImgpath()+item.getImgname()+"."+item.getImgext();
					item.setImgpath(webHelper.getUploadPath(imgPath));
				}
				
				model.addAttribute("output", output);
				System.out.println("-------결과물은 " + output.toString());
			}
		
		return new ModelAndView("myInfo/recent");
	}
	
	/** myinfo_edit.jsp 개인정보 수정 페이지 */
	/** My정보 페이지 */
	@RequestMapping(value = "/myInfo/myinfo_edit_view.do", method = RequestMethod.POST)
	public ModelAndView myinfo_edit_view(Model model) {
		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");	

		/** 1) 정보 조회를 위한 Beans 생성 및 정보 수정 */
		Members members = new Members();
		members.setMemno(myInfo.getMemno());
		
		Members membersContents = null;

		/** 2) 정보 조회 및 정보 수정 */
		try {
			membersContents = membersSerivce.getMembersItem(members);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("membersContents", membersContents);
		return new ModelAndView("myInfo/myinfo_edit");
	}
	
	@RequestMapping(value="/myinfo/myinfo_edit.do", method=RequestMethod.POST)
	public ModelAndView myinfo_edit(Model model,
			@RequestParam(value="userid", required=false) String userid,
			@RequestParam(value="userpw", required=false) String userpw,
			@RequestParam(value="userphone", required=false) String userphone,
			@RequestParam(value="tel2", required=false) String tel2,
			@RequestParam(value="tel3", required=false) String tel3,
			@RequestParam(value="useremail", required=false) String useremail) {
		
		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");	

		/** 1) 정보 조회를 위한 Beans 생성 및 정보 수정 */
		Members members = new Members();
		members.setMemno(myInfo.getMemno());
		members.setUserpw(userpw);
		members.setUserphone(userphone+"-"+tel2+"-"+tel3);
		members.setUseremail(useremail);
		
		/** 2) 정보 조회 및 정보 수정 */
		try {
			membersSerivce.editMembers(members);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 수정된 사항으로 세션정보 갱신하기 */
		myInfo.setUserpw(members.getUserpw());
		myInfo.setUserphone(members.getUserphone());
		myInfo.setUseremail(members.getUseremail());
		
		mySession.setAttribute("userInfo", myInfo);

		String redirectUrl = contextPath + "/myInfo/myinfo.do";
		return webHelper.redirect(redirectUrl, "고객님의 소중한 정보가 수정되었습니다.");
	}
}
