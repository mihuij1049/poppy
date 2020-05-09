package kr.co.poppy.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 구현체 주입 */
	@Autowired
	HeartService heartService;

	/** 삭제 처리 
	 * @param DelList */
	@RequestMapping(value = "/myInfo/del_item", method = RequestMethod.DELETE)
	public Map<String, Object> delete_item()  {
		
		// 삭제할 대상에 대한 PK 값 얻기
		int heartno = webHelper.getInt("heartno");

		/** 1) 요청받은 파라미터가 heartno 라면? */
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
	public Map<String, Object> delete_list(@RequestParam(value="delList[]") List<Integer> delList)  {
		
		/** 2) 요청받은 파라미터가 delList 라면? */
		
		if (delList!=null) {
			List<Heart> heartList = new ArrayList<Heart>();
			
			for (int i=0; i<delList.size();i++) {
				Heart temp = new Heart();
				temp.setHeartno(delList.get(i));
				heartList.add(temp);
			}
			
			Map<String, Object> input = new HashMap<String, Object>();
			input.put("input", heartList);
			
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
}
