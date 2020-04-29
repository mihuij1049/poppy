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

<style type="text/css">
.table {
	width: 96%;
	margin: auto;
	border-top: 1px solid #ffc7c1;
	margin-top: 20px;
	margin-bottom: 50px;
}

.table tr {
	line-height: 30px;
	border: 1px solid #ffc7c1;
}

.table th {
	width: 35%;
}

.table>tbody>tr>th, .table>tbody>tr>td {
	border-top: 1px solid #ffc7c1;
	line-height: 30px;
}
</style>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>회사소개
					</b>
				</h4>
			</div>
			<table class="table table-responsive">
				<tbody>
					<tr>
						<th>상점명</th>
						<td>(주)뽀삐뽀삐</td>
					</tr>
					<tr>
						<th>대표이사</th>
						<td>아무개</td>
					</tr>
					<tr>
						<th>대표전화</th>
						<td>070-123-4567</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>서울특별시 행복구 존버동 8282-5959<br> 3층 뽀삐뽀삐 / 반품주소 102호 -
							인터넷물류팀
						</td>
					</tr>
					<tr>
						<th>사업자등록번호</th>
						<td>123-86-43567</td>
					</tr>
					<tr>
						<th>통신판매업신고</th>
						<td>제2020-서울서초-0082호</td>
					</tr>
					<tr>
						<th>개인정보<br>관리책임
						</th>
						<td>아무개</td>
					</tr>
					<tr>
						<th>호스팅제공</th>
						<td>ITPAPER corp.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	</script>
</body>

</html>