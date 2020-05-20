package kr.co.poppy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.poppy.helper.WebHelper;
import kr.co.poppy.model.Members;
import kr.co.poppy.service.MembersService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	WebHelper webHelper;
	@Autowired
	MembersService membersService;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession userSession = webHelper.getSession();
		
		if (userSession.getAttribute("userInfo")==null) {
			log.info("로그인 하지 않은 유저 입니다.");
			// 로그인 유지 쿠키가 존재한다면?
			String loginCookie = webHelper.getCookie("keepLog");
			if ( loginCookie != null) {
				Members input = new Members();
				input.setSessionid(loginCookie);
				Members output = null;
				try {
					// 데이터 조회
					output = membersService.keepLogin(input);
					// 조회 결과가 있다면 세션 저장
					if (output != null) {
						userSession.setAttribute("userInfo", output);
						return true;
					}
				} catch (Exception e) {
					e.getLocalizedMessage();
				}
			}
			throw new ModelAndViewDefiningException(webHelper.redirect("../member/login.do", "로그인 후 이용해주세요."));
		}
		return super.preHandle(request, response, handler);
	}
	
}
