package kr.co.poppy.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Heart;
import kr.co.poppy.service.HeartService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class LikeGoodsRestController {
	
	/** WebHelper 주입 */
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired RegexHelper regexHelper;
	
	/** Service 구현체 주입 */
	@Autowired HeartService heartService;
	
	/** 삭제 처리 */
	@RequestMapping(value = "/myInfo", method=RequestMethod.DELETE)
	public Map<String, Object> delete_item() {
		/** 1) 필요한 변수값 생성  */
		// 삭제할 대상에 대한 PK 값 얻기
		int heartno = webHelper.getInt("heartno");
		
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값 처리
		if (heartno==0) {
			return webHelper.getJsonWarning("관심상품이 존재하지 않습니다.");
		}
		
		/** 2) 데이터 삭제하기  */
		// 데이터 삭제에 필요한 PK값을 Beans에 담기
		Heart input = new Heart();
		input.setHeartno(heartno);
		
		try {
			heartService.deleteHeart(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		
		return webHelper.getJsonData();
		
	}
}
