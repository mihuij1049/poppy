package poppy.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/a_comment.do")
public class A_comment extends HttpServlet {

	
	private static final long serialVersionUID = 3789034934419212965L;
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html"); 
		
		String userName = request.getParameter("name_write");
		String userPass = request.getParameter("pass_write");
		String comment = request.getParameter("comment_area");
		
		if (userName == null) { userName = ""; }
		if (userPass == null) { userPass = ""; }
		if (comment == null) { comment = ""; }

		PrintWriter out = response.getWriter();
		if (userName.equals("기은혜") && userPass.equals("123456") && comment.equals("안녕")) {
			
			out.write("<script>window.location.href = '../community/article.jsp';</script>");
		} else {
			out.write("<script>alert('입력값을 확인하세요.')</script>");
		}
	}


}
