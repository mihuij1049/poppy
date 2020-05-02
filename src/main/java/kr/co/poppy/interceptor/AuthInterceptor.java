package kr.co.poppy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.poppy.helper.WebHelper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	WebHelper webHelper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession userSession = webHelper.getSession();
		
		if (userSession.getAttribute("userInfo")==null) {
			log.info("로그인 하지 않은 유저 입니다.");
			
			webHelper.redirect(null, "로그인 후 이용해주세요.");
			 
			response.sendRedirect("../member/login.do");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
	
}
