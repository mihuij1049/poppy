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
	href="${pageContext.request.contextPath}/share/order_desc.css" />
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="container">
			<div class="page-title clearfix">
				<h4>
					<b> <a href="#" onclick="history.back(); return false;"><i
							class="glyphicon glyphicon-chevron-left"></i></a>주문내역 상세조회
					</b>
				</h4>
			</div>
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<div class="panel panel-default panel-desc">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> <b>주문정보</b> <img
								src="../share/img/pparrowdown.png" align=right
								class="arrow-down1 icon-rotate1">
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body panel-order">
							<div class="order-info clearfix">
								<div class="info-title pull-left">주문번호</div>
								<div class="info-desc1 order-num pull-left">20200318-0000195</div>
								<div class="info-title pull-left">주문일자</div>
								<div class="info-desc1 order-date pull-left">${orderInfo.regdate }</div>
								<div class="info-title pull-left">주문고객</div>
								<div class="info-desc1 order-name pull-left">${myInfo.username }</div>
								<div class="info-title pull-left">주문처리상태</div>
								<div class="info-desc1 order-state pull-left">${orderInfo.odstatus }</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end panelOne -->
				<div class="panel panel-default panel-desc">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseTwo" aria-expanded="true"
								aria-controls="collapseTwo"> <b>주문상품 (총
									${detailInfo.size() }개/ <fmt:formatNumber
										value="${orderInfo.sumOdgprice }" pattern="#,###" />원)
							</b> <img src="../share/img/pparrowdown.png" align=right
								class="arrow-down2 icon-rotate2">
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body panel-order" id="goods_info">
							<%-- 조회 결과에 따른 반복 처리 --%>
							<c:forEach var="item" items="${detailInfo}" varStatus="status">
								<%-- 출력을 위해 준비한 변수 --%>
								<c:set var="odgname" value="${item.odgname}" />
								<c:set var="odgsale" value="${item.odgsale}" />
								<c:set var="odgqty" value="${item.odgqty}" />
								<div class="prd-info clearfix">
									<div class="prd-img pull-left">
										<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}"> 
										<img src="${item.imgpath }" width="80"
											height="80">
										</a>
									</div>
									<div class="prd pull-left">
										<div id="prd-title">
											<strong class="prd-name" title="상품명"> 
											<a href="${pageContext.request.contextPath }/gallery_ajax/goods.do?goodsno=${item.goodsno}">${item.odgname }</a>
											</strong>
										</div>
										<div class="prd-li">
											<div class="prd-item-price">
												<span class="prd-price" title="판매가"> <b
													id="prd-price-total"><fmt:formatNumber
															value="${item.odgsale}" pattern="#,###" /></b>원
												</span> <span class="prd-count" title="수량"> <strong>${item.odgqty}</strong>개
												</span> <br> <span class="prd-deli"> <c:choose>
														<c:when test="${(item.odgsale*item.odgqty)>30000 }">[조건]/기본배송
												</c:when>
														<c:otherwise>
												[조건]/배송료 2500원
												</c:otherwise>
													</c:choose>
												</span>
											</div>
										</div>
									</div>
									<div class="prd-foot" title="합계">
										<span id="prd-total">합계</span> &nbsp; <b id="prd-price-total">
											<fmt:formatNumber value="${item.odgsale*item.odgqty}"
												pattern="#,###" />
										</b>원
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- end panelTwo -->
				<div class="panel panel-default panel-desc">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseThree" aria-expanded="true"
								aria-controls="collapseThree"> <b>결제 정보</b> <img
								src="../share/img/pparrowdown.png" align=right
								class="arrow-down3 icon-rotate3">
							</a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body panel-order">
							<div class="order-info">
								<div class="info-title pull-left">결제수단</div>
								<div class="info-desc2 payment-method pull-left">${orderInfo.paytype }</div>
								<div class="info-title pull-left pull-left">총 결제금액</div>
								<div class="info-desc2 price-all pull-left">
									<fmt:formatNumber value="${orderInfo.sumOdgsale}"
										pattern="#,###" />
									원
								</div>
								<div class="info-title pull-left">총 주문금액</div>
								<div class="info-desc2 price-order pull-left">
									<fmt:formatNumber value="${orderInfo.sumOdgprice}"
										pattern="#,###" />
									원
								</div>
								<div class="info-title pull-left">총 할인금액</div>
								<div class="info-desc2 price-disc pull-left">
									<fmt:formatNumber
										value="${orderInfo.sumOdgprice-orderInfo.sumOdgsale }"
										pattern="#,###" />
									원
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end panelThree -->
				<div class="panel panel-default panel-desc">
					<div class="panel-heading" role="tab" id="headingFour">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseFour" aria-expanded="true"
								aria-controls="collapseFour"> <b>최종 결제 정보</b> <img
								src="../share/img/pparrowdown.png" align=right
								class="arrow-down4 icon-rotate4">
							</a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingFour">
						<div class="panel-body panel-order">
							<div class="order-info clearfix">
								<div class="info-title pull-left">총 결제금액</div>
								<div class="info-desc2 price-all pull-left">
									<fmt:formatNumber
										value="${orderInfo.sumOdgsale+orderInfo.deliprice}"
										pattern="#,###" />
									원
								</div>
								<div class="info-title pull-left">상품구매금액</div>
								<div class="info-desc2 price-good pull-left">
									<fmt:formatNumber value="${orderInfo.sumOdgsale}"
										pattern="#,###" />
									원
								</div>
								<div class="info-title pull-left">배송비</div>
								<div class="info-desc2 price-delivery pull-left">
									<fmt:formatNumber value="${orderInfo.deliprice}"
										pattern="#,###" />
									원
								</div>
								<div class="info-title pull-left">결제예정금액</div>
								<div class="info-desc2 pull-left">
									<fmt:formatNumber
										value="${orderInfo.sumOdgsale+orderInfo.deliprice}"
										pattern="#,###" />
									원
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end panelFour -->
				<div class="panel panel-default panel-desc">
					<div class="panel-heading" role="tab" id="headingFive">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseFive" aria-expanded="true"
								aria-controls="collapseFive"> <b>배송지 정보</b> <img
								src="../share/img/pparrowdown.png" align=right
								class="arrow-down5 icon-rotate5">
							</a>
						</h4>
					</div>
					<div id="collapseFive" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingFive">
						<div class="panel-body panel-order">
							<div class="order-info clearfix">
								<div class="info-title pull-left">받는사람</div>
								<div class="info-desc1 price-all pull-left">${addrInfo.odname}</div>
								<div class="info-title pull-left">우편번호</div>
								<div class="info-desc1 price-good pull-left">${addrInfo.zcode}</div>
								<div class="info-title pull-left">주소</div>
								<div class="info-desc1 price-delivery pull-left">
									${addrInfo.addr1 } ${addrInfo.addr2 }</div>
								<div class="info-title pull-left">휴대전화</div>
								<div class="info-desc1 pull-left">${addrInfo.odphone}</div>
								<div class="info-title pull-left">배송메시지</div>
								<div class="info-desc1 pull-left">${orderInfo.odmsg}</div>
							</div>
						</div>
					</div>
				</div>
				<!-- end panelFive -->
				<div class="panel panel-default panel-desc">
					<div class="panel-heading" role="tab" id="headingSix">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapseSix" aria-expanded="true"
								aria-controls="collapseSix"> <b>환불 정보</b> <img
								src="../share/img/pparrowdown.png" align=right
								class="arrow-down6 icon-rotate6">
							</a>
						</h4>
					</div>
					<div id="collapseSix" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingSix">
						<c:choose>
							<c:when
								test="${orderInfo.odstatus=='입금전' || orderInfo.odstatus=='배송준비중' || orderInfo.odstatus=='배송중' || orderInfo.odstatus=='배송완료'}">
								<div class="panel-body panel-order">
									<div class="order-info clreafix">환불 신청된 정보가 없습니다.</div>
								</div>
							</c:when>


							<c:otherwise>
								<div class="panel-body panel-order">
									<div class="order-info clreafix">
										<div class="refund-title" colspan="2">취소 상품</div>
										<div class="info-title1 pull-left">상품정보</div>
										<div class="info-title2 pull-left">수량</div>
										<div class="goods-info pull-left">
											<p class="prd-name">펫클럽 알파독 칼슘 덴탈껌간식/강아지간식/치석제거</p>
											<p class="prd-option">[옵션: 알파독칼슘밀크덴탈껌]</p>
										</div>
										<div class="goods-qty pull-left">1</div>
										<div class="info-title pull-left">
											&nbsp;환불일자<br>(처리상태)
										</div>
										<div class="refund-date pull-left">
											2020-03-19 10:26:35<br> <b>(환불완료)</b>
										</div>
										<div class="info-title pull-left">&nbsp;환불금액</div>
										<div class="refund-price pull-left">
											상품금액 2,900+2,500(배송비) = 합계 : <b class="price-all">5,400원</b>
										</div>
										<div class="info-title pull-left">&nbsp;환불수단</div>
										<div class="price-pre pull-left">신용카드</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
					<!-- end panelSix -->
				</div>
			</div>
		</div>
		<!-- end container -->
	</div>
	<!-- end content -->
	<%@ include file="../share/bottom_tp.jsp"%>
	<script type="text/javascript">
		$(function() {
			$("#headingOne").on('click', function() {
				$(".arrow-down1").toggleClass("rotate1");

			});
		});

		$(function() {
			$("#headingTwo").on('click', function() {
				$(".arrow-down2").toggleClass("rotate2");

			});
		});

		$(function() {
			$("#headingThree").on('click', function() {
				$(".arrow-down3").toggleClass("rotate3");

			});
		});

		$(function() {
			$("#headingFour").on('click', function() {
				$(".arrow-down4").toggleClass("rotate4");

			});
		});
		$(function() {
			$("#headingFive").on('click', function() {
				$(".arrow-down5").toggleClass("rotate5");

			});
		});
		$(function() {
			$("#headingSix").on('click', function() {
				$(".arrow-down6").toggleClass("rotate6");

			});
		});
		$("#goods_info").click(function(e) {
			location.href = "../gallery/goods.jsp";
		});
	</script>
</body>

</html>