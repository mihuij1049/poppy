package kr.co.poppy.controllers;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Bbs;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.CommentsService;

@Controller
public class CommunityRestController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Serivce 패턴 구현체 주입 */
	@Autowired
	BbsService bbsService;

	@Autowired
	CommentsService commentsService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** qna 수정 */
	@RequestMapping(value="/community", method=RequestMethod.PUT)
	public Map<String, Object> put(
			@RequestParam(value="bbsno", defaultValue="0") int bbsno,
			@RequestParam(value="bbstitle", required=false) String bbstitle,
			@RequestParam(value="bbscontent", required=false) String bbscontent,
			@RequestParam(value="editdate", required=false) String editdate) {
		/** 1) 파라미터 유효성 검사 */
		if(bbsno==0) {
			return webHelper.getJsonWarning("게시글 번호가 없습니다."); }
		if(bbstitle==null) {
			return webHelper.getJsonWarning("제목을 입력하세요.");
		}
		if(bbscontent==null) {
			return webHelper.getJsonWarning("내용을 입력하세요.");
		}
		
		 Calendar c = Calendar.getInstance();
			String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
					c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), c.get(Calendar.SECOND));

		/** 2) 데이터 수정하기 */
		Bbs input = new Bbs();
		input.setBbsno(bbsno);
		input.setBbstitle(bbstitle);
		input.setBbscontent(bbscontent);
		input.setEditdate(date);
		
		// 조회결과를 저장할 객체 선언
		Bbs output = null;
		
		try {
			bbsService.editBbs(input);
			output = bbsService.getBbsItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 JSON출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

}
