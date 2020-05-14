package kr.co.poppy.controllers;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.poppy.helper.RegexHelper;
import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Comments;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.CommentsService;

@RestController
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

	/** 댓글 작성폼에 대한 action page */
	@RequestMapping(value = "/community/article_cmtAdd", method = RequestMethod.POST)
	public Map<String, Object> post(@RequestParam(value = "cmtcontent", required = false) String cmtcontent,
			@RequestParam(value = "regdate", required = false) String regdate,
			@RequestParam(value = "editdate", required = false) String editdate,
			@RequestParam(value = "bbstype", required = false) String bbstype,
			@RequestParam(value = "memno", defaultValue = "0") int memno,
			@RequestParam(value = "bbsno", defaultValue = "0") int bbsno) {
		
		/** 1) 유효성 검사 */
		if (cmtcontent.equals("")) {
			return webHelper.getJsonWarning("댓글을 입력하세요");
		}

		// 가입한 시각을 담은 date 생성
		Calendar c = Calendar.getInstance();
		String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
				c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE),
				c.get(Calendar.SECOND));

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 beans에 담는다.
		Comments input = new Comments();
		input.setCmtcontent(cmtcontent);
		input.setRegdate(date);
		input.setEditdate(date);
		input.setMemno(memno);
		input.setBbsno(bbsno);
		input.setBbstype(bbstype);

		Comments output = new Comments();

		try {
			// 데이터 저장 --> 저장에 성공하면 파라미터로 전달하는 input객체에 pk값이 저장된다.
			commentsService.addComments(input);
			// 저장결과 조회
			output = commentsService.getCommentsItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	@RequestMapping(value = "/community/article_cmtEdit", method = RequestMethod.PUT)
	public Map<String, Object> put(
			@RequestParam(value = "cmtno", defaultValue = "0") int cmtno,
			@RequestParam(value = "cmtcontent", required = false) String cmtcontent,
			@RequestParam(value = "editdate", required = false) String editdate,
			@RequestParam(value = "bbsno", defaultValue = "0") int bbsno) {
		/** 1) 유효성 검사 */
	

		/** 2) 데이터 수정하기 */
		Comments input = new Comments();
		input.setCmtno(cmtno);
		input.setCmtcontent(cmtcontent);
		input.setEditdate(editdate);
		input.setBbsno(bbsno);

		// 수정된 결과를 조회하기 위한 객체
		Comments output = null;

		try {
			commentsService.editComments(input);
			// 수정결과 조회
			output = commentsService.getCommentsItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);

	}
	
	/** 댓글 삭제 */
	@RequestMapping(value = "/community/article", method = RequestMethod.DELETE)
	public Map<String, Object> delete(
			@RequestParam(value = "bbstype", required = false) String bbstype,
			@RequestParam(value="cmtno", defaultValue="0") int cmtno,
			@RequestParam(value = "bbsno", defaultValue = "0") int bbsno){
		/** 1) 유효성 검사 */
		if(cmtno==0) {
			return webHelper.getJsonWarning("댓글번호가 없습니다.");
		}
		/** 2) 데이터 삭제하기 */
		Comments input = new Comments();
		input.setCmtno(cmtno);
		input.setBbsno(bbsno);
		input.setBbstype(bbstype);
		
		try {
			commentsService.deleteComments(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		/** 3) 결과를 확인하기 위한 JSON출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		return webHelper.getJsonData(map);
		
	}
	
	
}