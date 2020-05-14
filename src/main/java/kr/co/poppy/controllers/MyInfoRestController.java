package kr.co.poppy.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Goodsdetail;
import kr.co.poppy.model.Heart;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.GoodsdetailService;
import kr.co.poppy.service.HeartService;
import kr.co.poppy.service.MembersService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MyInfoRestController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 구현체 주입 */
	@Autowired
	MembersService membersService;
	@Autowired
	HeartService heartService;
	@Autowired
	GoodsdetailService goodsDetailService;

	/**
	 * 삭제 처리
	 * 
	 * @param DelList
	 */
	@RequestMapping(value = "/myInfo/del_item", method = RequestMethod.DELETE)
	public Map<String, Object> delete_item() {

		// 삭제할 대상에 대한 PK 값 얻기
		int heartno = webHelper.getInt("heartno");

		/** 1) 요청받은 파라미터가 0이 아니라면? */
		if (heartno != 0) {

			/** 2) 데이터 삭제하기 */
			// 데이터 삭제에 필요한 PK값을 Beans에 담기
			Heart input = new Heart();
			input.setHeartno(heartno);

			try {
				heartService.deleteHeart(input);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}

		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}

	@RequestMapping(value = "/myInfo/del_list", method = RequestMethod.DELETE)
	public Map<String, Object> delete_list(@RequestParam(value = "delList[]") List<Integer> delList) {

		/** 1) 요청받은 파라미터가 null 이 아니라면? */

		if (delList != null) {

			// 리스트 객체 생성 및 할당
			List<Heart> heartList = new ArrayList<Heart>();

			// 전달받은 배열을 반복문으로 Heart객체의 Heartno에 할당하여
			// Heart 객체를 리스트 객체에 할당
			for (int i = 0; i < delList.size(); i++) {
				Heart temp = new Heart();
				temp.setHeartno(delList.get(i));
				heartList.add(temp);
			}
			// MyBatis의 파라미터로 전달할 Map 객체 생성 및 할당
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("input", heartList);

			/** 2) 데이터 삭제하기 */
			try {
				heartService.deleteHeartList(input);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}

	/** ID 중복확인과 Email 중복 확인을 검사 */

	@RequestMapping(value = "/myInfo/same_check", method = RequestMethod.GET)
	public Map<String, Object> id_check(@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "useremail", required = false) String useremail) {

		/** 요청 받은 파라미터의 유효성 검사 */
		if (userid != null) {
			Members input = new Members();
			input.setUserid(userid);
			Members output = null;
			try {
				output = membersService.sameCheckMembers(input);
			} catch (Exception e) {
				return webHelper.getJsonData(200, "Fail", null);
			}

		} else if (useremail != null) {
			Members input = new Members();
			input.setUseremail(useremail);
			Members output = null;
			try {
				output = membersService.sameCheckMembers(input);
			} catch (Exception e) {
				return webHelper.getJsonData(200, "Fail", null);
			}

		}
		return webHelper.getJsonData();

	}

	@RequestMapping(value = "/myInfo/select_opt", method = RequestMethod.GET)
	public Map<String, Object> select_opt(@RequestParam(value = "goodsnum", defaultValue = "0") int goodsno) {

		if (goodsno == 0) {
			return webHelper.getJsonWarning("결과없음");
		}
		Goodsdetail gd = new Goodsdetail();
		gd.setGoodsno(goodsno);

		List<Goodsdetail> output = null;

		try {
			output = goodsDetailService.getGoodsdetailList(gd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return webHelper.getJsonWarning("결과없음");
		}
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
			
		return webHelper.getJsonData(data);
	}
	
}
