package kr.co.poppy.controllers;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Heart;
import kr.co.poppy.model.Members;
import kr.co.poppy.model.Rvheart;
import kr.co.poppy.service.GoodsService;
import kr.co.poppy.service.MembersService;
import kr.co.poppy.service.RvheartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class RvheartRestController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	
	@Autowired
	MembersService membersService;
	
	@Autowired
	RvheartService rvheartService;
	
	@RequestMapping(value="/community/in_item", method = RequestMethod.POST)
	public Map<String, Object> insert_item(
			@RequestParam(value="bbsno", defaultValue="0") int bbsno) {
		// 로그인한 유저 값 가져오기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		
		int ifmemno = myInfo.getMemno();
		
		/** 1) 요청받은 파라미터가 0이 아니라면? */
		if (bbsno != 0 && ifmemno != 0) {
			Rvheart input = new Rvheart();
			input.setMemno(myInfo.getMemno());
			input.setBbsno(bbsno);
			
			try {
				rvheartService.addRvheart(input);
			} catch (Exception e) {
				return webHelper.getJsonError(e.getLocalizedMessage());
			}
		}
		
		return null;
	}
}
