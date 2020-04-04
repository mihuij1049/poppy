package poppy.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/find_pw.do")
public class Find_pw extends HttpServlet {
	
	private static final long serialVersionUID = -2942443909020135171L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html"); 
		
		String userId = request.getParameter("user_id");
		String userName = request.getParameter("user_name");
		String userEmail = request.getParameter("user_email");
		
		if (userId == null) { userId = ""; }
		if (userName == null) { userName = ""; }
		if (userEmail == null) { userEmail = ""; }

		PrintWriter out = response.getWriter();
		if (userId.equals("ezen") && userName.equals("기은혜") && userEmail.equals("abc@naver.com")) {
			
			out.write("<script>window.location.href = '../member/find_pw_email.jsp';</script>");
		} else {
			out.write("<script>alert('입력정보를 다시 확인해주세요..')</script>");
		}
	}


}
