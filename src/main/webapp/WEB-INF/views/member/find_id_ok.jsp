<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%
  // 파라미터의 문자열 셋을 설정한다. (페이지 상단에서 최초 1회)
   /**  request.setCharacterEncoding("UTF-8");

    // <input>태그의 name속성값을 사용하여 사용자의 입력값을 받는다.
    String userName = request.getParameter("user_name");
    String userEmail = request.getParameter("user_email"); */
 %> 
<!doctype html>
<html>

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/share/find_id_ok.css" />
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>

	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>아이디 찾기 완료
					</b>
				</h4>
			</div>
			<div class="message">
				<b>아이디 찾기가 완료되었습니다.</b>
			</div>
			<div class="info">
				<b>이 &nbsp;름</b><span class="info-name">${output.username }</span><br> <b>이메일</b><span
					class="info-email">${output.useremail }</span>
			</div>
			<div class=id>
				<input type="radio" name="userid"><span class="id-info">${output.userid }&nbsp;(개인회원,
					2020-02-12 가입)</span>
			</div>
		</div>
		<div class="btns">
			<button type="submit" class="btn btn1"
				onclick="location.href='${pageContext.request.contextPath}/member/login.do?user_id=${output.userid }'">로그인</button>

			<button type="button" class="btn btn-inverse btn2"
				onclick="location.href='${pageContext.request.contextPath}/member/find_pw.do'">비밀번호 찾기</button>

		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>

	<script type="text/javascript">
	</script> 

</body>

</html>