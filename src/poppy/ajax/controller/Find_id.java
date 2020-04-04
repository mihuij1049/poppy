package poppy.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/find_id.do")
public class Find_id extends HttpServlet {
	

	private static final long serialVersionUID = 7983998693717966775L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html"); 
		
		String userName = request.getParameter("user_name");
		String userEmail = request.getParameter("user_email");
		
		if (userName == null) { userName = ""; }
		if (userEmail == null) { userEmail = ""; }

		PrintWriter out = response.getWriter();
		if (userName.equals("기은혜") && userEmail.equals("abc@naver.com")) {
			
			out.write("<script>window.location.href = '../member/find_id_ok.jsp';</script>");
		} else {
			out.write("<script>alert('이름과 이메일을 확인해주세요.')</script>");
		}
	}


}


