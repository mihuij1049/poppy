<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/plist.css" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>

</head>
<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 적립내역 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>적립내역
				</b>
			</h4>
		</div>
		<div class="container">
			<table class="table table-responsive">
				<thead>
					<tr>
						<th id="today"></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="td-title">적립금</td>
						<td class="td-mny">3,000원</td>
					</tr>
					<tr id="table-content">
						<td class="td-title">내용</td>
						<td class="td-mny">신규회원 적립금</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class=" paging">
			<ul class="pagination pagination-sm">
				<li class="disabled"><a href="#">&laquo;</a></li>
				<!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
				<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
				<li class="paging-right"><a href="#">&raquo;</a></li>
			</ul>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<!-- Javascript -->
	<script type="text/javascript">
		// Date 객체의 생성 --> 이 객체 안에는 기본적으로 현재 시각이 저장되어 있다.
		var mydate = new Date(); // 년, 월, 일, 시간, 분, 초를 리턴받기
		var yy = mydate.getFullYear();

		// 월은 0이 11월 11이 12월을 의미한다. 그러므로 1을 증가시켜준다.
		var mm = mydate.getMonth() + 1;
		var dd = mydate.getDate();
		var hh = mydate.getHours();
		var mi = mydate.getMinutes();
		var ss = mydate.getSeconds();
		var result = yy + "-" + mm + "-" + dd;
		document.getElementById("today").innerHTML = result;
	</script>
</body>

</html>