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
	href="${pageContext.request.contextPath}/share/myinfo.css" />
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>내정보
					</b>
				</h4>
			</div>
			<div class="mypoint">
				&nbsp;적립금 :&nbsp; <b>${myInfo.sumAvpoint + myInfo.sumNapoint }</b>원
			</div>
			<div class="mydelivery clearfix">
				<div class="mydelivery-current">
					입금전<br>
					<span>${status0 }</span>
				</div>
				<div class="mydelivery-current">
					배송준비중<br>
					<span>${status1 }</span>
				</div>
				<div class="mydelivery-current">
					배송중<br>
					<span>${status2 }</span>
				</div>
				<div class="mydelivery-current">
					배송완료<br>
					<span>${status3 }</span>
				</div>
			</div>
			<div class="myinfo-list clearfix">
				<div id="list-alt" class="myinfo-list-item">
					<a href="${pageContext.request.contextPath}/myInfo/order_list.do"><span
						class="glyphicon glyphicon-list-alt"></span></span><br>주문조회 </a>
				</div>
				<div id="user" class="myinfo-list-item">
					<a href="${pageContext.request.contextPath}/myInfo/myinfo_edit.do"><span
						class="glyphicon glyphicon-user"></span><br>내정보수정</a>
				</div>
				<div id="thumb" class="myinfo-list-item">
					<a href="${pageContext.request.contextPath}/myInfo/like_goods.do"><span
						class="glyphicon glyphicon-thumbs-up"></span><br>좋아요</a>
				</div>
				<div id="point" class="myinfo-list-item">
					<a href="${pageContext.request.contextPath}/myInfo/point.do"><span class="glyphicon glyphicon-usd"></span><br>적립금</a>
				</div>
				<div id="commu" class="myinfo-list-item">
					<a href="${pageContext.request.contextPath}/myInfo/my_rv.do"><span
						class="glyphicon glyphicon-folder-open"></span><br>후기관리</a>
				</div>
				<div id="recent" class="myinfo-list-item">
					<a href="${pageContext.request.contextPath}/myInfo/recent.do"><span class="glyphicon glyphicon-eye-open"></span><br>최근본상품</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	</script>
</body>

</html>