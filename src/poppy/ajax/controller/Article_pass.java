package poppy.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/a_pass")
public class Article_pass extends HttpServlet {

	
	private static final long serialVersionUID = 3789034934419212965L;
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html"); 
		
		String upass = request.getParameter("cs_pass");
		
		if (upass == null) { upass = ""; }


		PrintWriter out = response.getWriter();
		if (upass.equals("a123456")) {
			
			out.write("<script>window.location.href = '../community/article.jsp';</script>");
		} else {
			out.write("<script>alert('비밀번호를 확인해주세요..')</script>");
		}
	}


}
