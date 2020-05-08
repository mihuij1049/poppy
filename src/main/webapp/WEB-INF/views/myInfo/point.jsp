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
	href="${pageContext.request.contextPath}/share/point.css" />
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>적립금
					</b>
				</h4>
			</div>
			<div class="point clearfix">
				<div class="point-header">적립금</div>
				<div class="point-sub">총 적립금</div>
				<div class="point-save">${myInfo.sumAvpoint+myInfo.sumNapoint }원</div>
				<div class="point-sub">사용가능 적립금</div>
				<div class="point-save">${myInfo.sumAvpoint }원</div>
				<div class="point-sub">사용된 적립금</div>
				<div class="point-save">${myInfo.sumUsedpoint }원</div>
				<div class="point-sub">미가용 적립금</div>
				<div class="point-save">${myInfo.sumNapoint }원</div>
				<div class="point-sub">환불예정 적립금</div>
				<div class="point-save">0원</div>
			</div>
			<div class="point-list clearfix">
				<div class="point-link" onclick="location.href='${pageContext.request.contextPath}/myInfo/pointList.do?pointList=1'">
					<div class="point-list-item">적립내역</div>
					<div class="point-list-link">></div>
				</div>
				<div class="point-link" onclick="location.href='${pageContext.request.contextPath}/myInfo/pointList.do?pointList=2'">
					<div class="point-list-item">미가용 적립내역</div>
					<div class="point-list-link">></div>
				</div>
				<div class="point-link" onclick="location.href='${pageContext.request.contextPath}/myInfo/pointList.do?pointList=3'">
					<div class="point-list-item">적립금 사용내역</div>
					<div class="point-list-link">></div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	</script>
</body>

</html>