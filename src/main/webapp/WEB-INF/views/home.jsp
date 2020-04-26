<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello Poppy!  
</h1>
<hr />
<br>
<br>
<H2><a href="${pageContext.request.contextPath }/index/index.do">뽀삐뽀삐 쇼핑몰로 이동!</a></H2>
<hr />
<br>
<H2> 데이터베이스 단위테스트</H2>
<p><a href="${pageContext.request.contextPath }/test.do">테스트</a>
<H2></H2>
<H2></H2>


<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
