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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/share/gal_list.css" />
</head>
<style>
.pr_in_box button {
	float: right;
	width: 50px;
	height: 45px;
	padding: 0px 10px;
	border: 0px;
	font-size: 13px;
}
</style>
<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>
						
						<c:forEach var="item" items="${output}" varStatus="status" end="0">
							<c:choose>
								<c:when test="${item.heartCnt > 0}">
								BEST
								</c:when>
								<c:when test="${item.cate1 != null}">
								${item.cate1}
								</c:when>
								<c:when test="${item.cate1 == null}">
								${item.cate2}
								</c:when>
							</c:choose>
						</c:forEach>
				</b>
			</h4>
		</div>
			<div class="container_1">
				<div>
				<c:forEach var="item" items="${output}" varStatus="status" end="0">
					<c:choose>
						<c:when test="${item.cate1 != null }">
						<%-- cate1 조회할 때 사용하는 searchCondition --%>
							<form action="${pageContext.request.contextPath}/gallery/gal_list_cate.do" method="get">
								<div class="search_tab_bg">
									<select name="searchCondition" class="cate_select" id="cate_select">
										<c:forEach var="item" items="${output}" varStatus="status" end="0">
										<option value="NONE">정렬방식</option>
										<option value="A">신상품</option>
										<option value="B">상품명</option>
										<option value="C">낮은가격</option>
										<option value="D">높은가격</option>
										</c:forEach>
									</select>
								</div>
							</form>
						</c:when>
						<c:when test="${item.cate1 == null }">
						<%-- cate2 조회할 때 사용하는 searchCondition --%>
							<form action="${pageContext.request.contextPath}/gallery/gal_list_cate.do" method="get">
								<div class="search_tab_bg">
									<select name="searchCondition2" class="cate_select" id="cate_select2">
										<c:forEach var="item" items="${output}" varStatus="status" end="0">
										<option value="NONE">정렬방식</option>
										<option value="A">신상품</option>
										<option value="B">상품명</option>
										<option value="C">낮은가격</option>
										<option value="D">높은가격</option>
										</c:forEach>
									</select>
								</div>
							</form>
						</c:when>
					</c:choose>
				</c:forEach>
				</div>
				<!-- 게시물 영역 시작 -->
				<div id="result">
					<c:forEach var="item" items="${output}" varStatus="status">
						<div>
							<div class="pr_box">
								<div class="pr_in_box">
									<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">
										<img alt="사진" src="${item.imgpath}${item.imgname}.jpg" class="img_size">
											<h5>
												<div class="gnameblock">
													<b>${item.gname}</b>
												</div>
											</h5>
										<hr />
									</a>
									<div class="price_box">
										<span id="gprice"><del>₩${item.gprice}원</del></span>
										<button type="submit" class="btn btn-inverse insert-one" id="insert-one" data-heartno="${item.heartno}" data-goodsno="${item.goodsno}">
										like
										♥
										</button>
										<br>
										<span id="gsale"><b>₩${item.gsale}원</b></span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
			</div>
			<div class="text-center">
				<ul class="pagination pagination-sm">
					<li class="disabled"><a href="#">&laquo;</a></li>
					<li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	
	
	
	<script type="text/javascript">
	
	$("#result").on("click", "#insert-one", function(e) {
        e.preventDefault();
  
        if (${empty userInfo.userid}) {
        	alert("로그인 후 이용해 주세요.")
        	window.location="${pageContext.request.contextPath}/member/login.do";
        } else {
        
       	let goodsno = $(this).data("goodsno");
        $.post("${pageContext.request.contextPath}/gallery/in_item",
              { "goodsno" : goodsno },
                   function(json) {
                     if(json.rt=="OK");
                  }
              )
        }
        /* $(this).css('color', 'red');
        clicked = false; */
     });
	
	/* cate1 에 대한 셀렉트 */
	$(function() {
    	$(document).on('change', '#cate_select', function(e) {
    		var choice = $(this).find("option:selected").val();
        	if(!choice) {
        		return false;
        	}
        	<c:forEach var="item" items="${output}" varStatus="status" end="0">
        	location.href="../gallery/gal_list_select.do?cate1=${item.cate1}"+"&searchCondition="+choice;
        	</c:forEach>
    	});
    });
	
	/* cate2 에 대한 셀렉트 */
	$(function() {
    	$(document).on('change', '#cate_select2', function(e) {
    		var choice = $(this).find("option:selected").val();
        	if(!choice) {
        		return false;
        	}
        	<c:forEach var="item" items="${output}" varStatus="status" end="0">
        	location.href="../gallery/gal_list_select2.do?cate2=${item.cate2}"+"&searchCondition2="+choice;
        	</c:forEach>
    	});
    });
	
    </script>
</body>

</html>