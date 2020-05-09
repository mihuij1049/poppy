package kr.co.poppy.controllers;

import java.util.Calendar;

import javax.servlet.http.HttpSession;

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
import kr.co.poppy.model.Comments;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.BbsService;
import kr.co.poppy.service.CommentsService;

@Controller
public class CommunityAjaxController {
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

	/** 작성 폼 페이지 */
	@RequestMapping(value = "/community_ajax/article.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView add(Model model, @RequestParam(value = "cmtcontent", required = false) String cmtcontent,
			@RequestParam(value = "regdate", required = false) String regdate,
			@RequestParam(value = "editdate", required = false) String editdate,
			@RequestParam(value = "memno", defaultValue = "0") Integer memno,
			@RequestParam(value = "bbsno", defaultValue = "0") Integer bbsno) {
		/** 1) 유효성 검사 */
		if (cmtcontent.equals("")) {
			return webHelper.redirect(null, "댓글을 입력하세요");
		}

		// 가입한 시각을 담은 date 생성
		Calendar c = Calendar.getInstance();
		String date = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
				c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE),
				c.get(Calendar.SECOND));

		// 세션 객체를 이용하여 저장된 세션값 얻기
		HttpSession mySession = webHelper.getSession();
		Members myInfo = (Members) mySession.getAttribute("userInfo");
		

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 beas에 담는다.
		Comments input = new Comments();
		input.setCmtcontent(cmtcontent);
		input.setRegdate(date);
		input.setEditdate(date);
		input.setMemno(myInfo.getMemno());
		input.setBbsno(bbsno);

		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			commentsService.addComments(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 3) 뷰처리
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		String redirectUrl = contextPath + "/community/article.do?bbsno=" + input.getCmtno() + input.getBbsno();
		return webHelper.redirect(redirectUrl, "저장되었습니다.");
	}
}
