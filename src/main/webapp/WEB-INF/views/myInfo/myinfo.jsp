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
.mypoint {
	border: 2px solid #ff8f83;
	border-radius: 2px;
	width: 96%;
	margin: auto;
	line-height: 35px;
	margin-bottom: 25px;
	margin-top: 20px;
	padding: 5px 15px;
	font-size: 16px;
	letter-spacing: 2px;
}

.mydelivery {
	border: 2px solid #ffc7c1;
	border-radius: 2px;
	width: 96%;
	margin: auto;
	line-height: 40px;
	margin-bottom: 25px;
	padding: 10px 0px;
	font-size: 16px;
}

.mydelivery-current {
	text-align: center;
	float: left;
	width: 25%;
	border-right: 1px solid #ff8f83;
}

.mydelivery-current:nth-child(4) {
	border-right: none;
}

.myinfo-list {
	width: 96%;
	margin: auto;
	margin-top: 15px;
	margin-bottom: 50px;
	text-align: center;
	border: 2px solid #ff8f83;
	border-radius: 2px;
}

.myinfo-list-item {
	height: 110px;
	width: 33.33%;
	float: left;
	border-right: 1px dotted #ffc7c1;
	border-bottom: 1px dotted #ffc7c1;
}

.myinfo-list-item:nth-child(3) {
	border-right: none;
}

.myinfo-list-item:nth-child(4) {
	border-bottom: none;
}

.myinfo-list-item:nth-child(5) {
	border-bottom: none;
}

.myinfo-list-item:nth-child(6) {
	border-right: none;
	border-bottom: none;
}

.myinfo-list-item:hover {
	width: 33.33%;
	background: #ffc7c1;
	font-size: 18px;
	font-weight: bold;
}

.myinfo-list-item>a {
	padding-top: 30px;
	color: #333;
	display: block;
	text-decoration: none;
	vertical-align: middle;
}

.myinfo-list .glyphicon {
	font-size: 20px;
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
							class="glyphicon glyphicon-chevron-left"></i></a>내정보
					</b>
				</h4>
			</div>
			<div class="mypoint">
				&nbsp;적립금 :&nbsp; <b>3000</b>원 &nbsp; &nbsp; &nbsp; ${myinfo.username} 님의 회원번호는 ${myinfo.memno} 입니다.
			</div>
			<div class="mydelivery clearfix">
				<div class="mydelivery-current">
					입금전<br>
					<span>0</span>
				</div>
				<div class="mydelivery-current">
					배송준비중<br>
					<span>0</span>
				</div>
				<div class="mydelivery-current">
					배송중<br>
					<span>0</span>
				</div>
				<div class="mydelivery-current">
					배송완료<br>
					<span>0</span>
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