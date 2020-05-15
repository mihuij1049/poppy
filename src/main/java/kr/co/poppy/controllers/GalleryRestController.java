package kr.co.poppy.controllers;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Heart;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.HeartService;
import kr.co.poppy.service.MembersService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class GalleryRestController {
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
	
	@RequestMapping(value = "/gallery/in_item", method = RequestMethod.POST)
	public Map<String, Object> insert_item(
			@RequestParam(value="goodsno", defaultValue="0") int goodsno) {
		// 로그인한 유저 값 가져오기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		
		int ifmemno = myInfo.getMemno();
		
		/** 1) 요청받은 파라미터가 0이 아니라면? */
		if (goodsno != 0 && ifmemno != 0) {
			Heart input = new Heart();
			input.setMemno(myInfo.getMemno());
			input.setGoodsno(goodsno);
			
			try {
				heartService.addHeart(input);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}
}
