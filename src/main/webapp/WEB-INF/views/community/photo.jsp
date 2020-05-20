<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/photo.css" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>

</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>

	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>포토리뷰
				</b>
			</h4>
		</div>
		<div class="container">
			<input type="hidden" name="bbsno" value="${output.bbsno}" /> <img
				src="${output.imgpath}" alt="리뷰사진" class="big-image">
			<div class="info-box">
				<a
					href="${pageContext.request.contextPath}/gallery_ajax/goods.do?goodsno=${output.goodsno}"><img
					src="${output.gipath}" class="small-image"></a>
				<div class="info-content clear">
					<a
						href="${pageContext.request.contextPath}/gallery_ajax/goods.do?goodsno=${output.goodsno}">
						${output.bbstitle}</a><br>
					<div class="star">
						<p>${output.rvlike}</p>
						<br>
					</div>
					<div class="writer">
						<p>(${fn:substring(output.username,0,1)}**)</p>
					</div>
				</div>
			</div>
			<div class="rv-title">
				<p>이 리뷰에 대해 <span id="rvqty">${output.rvcount}</span>명의 고객님께서 추천해 주셨습니다.</p>
			</div>
			<div class="rv-content">
				<p class="date">${output.regdate}</p>
				<button type=button class="btn"
					onclick="location.href='${pageContext.request.contextPath}/community/photo_delete.do?bbsno=${output.bbsno}'">삭제</button>
				<button type=button class="btn btn-inverse"
					onclick="location.href='${pageContext.request.contextPath}/community/photo_edit.do?bbsno=${output.bbsno}'">수정</button>
				<p class="bbscontent">${output.bbscontent}</p>
			</div>
			<div class="recommend">
				<p>이 리뷰가 도움이 되셨다면 눌러주세요.</p>
				<button type="submit" class="btn btn-inverse insert-one"
					id="insert-one" data-bbsno="${output.bbsno}"
					data-rvheartno="${output.rvheartno}">
					<i class="glyphicon glyphicon-heart icon_size"></i> 추천
				</button>
			</div>
			<div class="rv-footer">
				<p>관리자에게만 댓글작성 권한이 있습니다.</p>
			</div>
		</div>
	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<!-- Javascript -->
	<script type="text/javascript">
		$(function() {
			$(document).on("click", "#insert-one", function(e) {
		        e.preventDefault();
		  
		        if (${empty myInfo.userid}) {
		        	alert("로그인 후 이용해 주세요.")
		        	window.location="${pageContext.request.contextPath}/member/login.do";
		        } else {
		        
		       	let bbsno = $(this).data("bbsno");
		        $.post("${pageContext.request.contextPath}/community/in_item",
		              { "bbsno" : bbsno },
		                   function(json) {
		                     if(json.rt=="OK");
		                     newqty = $("#rvqty").text();
								newqty++;
								$("#rvqty").text(newqty);
		                  }
		              )
		        }
		        /* $(this).css('color', 'red');
		        clicked = false; */
		     });
			});
	</script>
</body>

</html>