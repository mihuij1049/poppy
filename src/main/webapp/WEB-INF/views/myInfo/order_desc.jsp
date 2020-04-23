<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>
<style type="text/css">
/** 아코디언 클릭이벤트시 화살표 transform 회전 */
.rotate1 {
	-webkit-transform: rotate(180deg);
}

.icon-rotate1 {
	-webkit-transition-duration: 0.5s;
}

.rotate2 {
	-webkit-transform: rotate(180deg);
}

.icon-rotate2 {
	-webkit-transition-duration: 0.5s;
}

.rotate3 {
	-webkit-transform: rotate(180deg);
}

.icon-rotate3 {
	-webkit-transition-duration: 0.5s;
}

.rotate4 {
	-webkit-transform: rotate(180deg);
}

.icon-rotate4 {
	-webkit-transition-duration: 0.5s;
}

.rotate5 {
	-webkit-transform: rotate(180deg);
}

.icon-rotate5 {
	-webkit-transition-duration: 0.5s;
}

.rotate6 {
	-webkit-transform: rotate(180deg);
}

.icon-rotate6 {
	-webkit-transition-duration: 0.5s;
}

#accordion {
	width: 96%;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 50px;
}

#accordion .panel-heading {
	padding: 0px;
}

.order-info {
	width: 100%;
	line-height: 20px;
}

.info-title {
	width: 30%;
	font-weight: bold;
}

.info-desc1 {
	width: 70%;
}

.info-desc2 {
	width: 70%;
	text-align: right;
}

.prd-img {
	width: 30%;
}

.prd {
	width: 70%;
}
.prd-item-price {
	padding-left : 12px;
}

.prd-foot {
	text-align: right;
}
.prd-foot:hover{
	cursor:pointer;
}

.refund-title {
	background-color: #ffc7c1;
	font-size: 16px;
	padding: 7px 7px;
}

.info-title1 {
	width: 75%;
	padding-top: 5px;
	padding-left: 50px;
	line-height: 30px;
}

.info-title2 {
	width: 25%;
	padding-top: 5px;
	text-align: center;
	line-height: 30px;
}

.goods-info {
	width: 75%;
}

p.prd-name {
	margin: 5px 0px;
	font-weight: bold;
}

.goods-qty {
	font-size: 20px;
	text-align: center;
	width: 25%;
	margin-top: 15px;
}

.refund-date {
	width: 70%;
	text-align: center;
	margin-bottom: 5px;
}

.refund-price {
	width: 70%;
	text-align: center;
	margin-bottom: 5px;
}

.price-pre {
	width: 70%;
	text-align: center;
}

.panel-desc a {
	display: block;
	text-decoration: none;
	width: 100%;
	padding: 10px 15px;
}

.panel-order {
	padding: 15px;
}

/** 아코디언 클릭이벤트시 화살표 transform 회전 끝 */
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
								src="../share/img/arrow-down.png" align=right
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
								<div class="info-desc1 order-date pull-left">2020-03-18
									21:07:17</div>
								<div class="info-title pull-left">주문고객</div>
								<div class="info-desc1 order-name pull-left">조대철</div>
								<div class="info-title pull-left">주문처리상태</div>
								<div class="info-desc1 order-state pull-left">취소</div>
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
								aria-controls="collapseTwo"> <b>주문상품 (총 1개/ 0원)</b> <img
								src="../share/img/arrow-down.png" align=right
								class="arrow-down2 icon-rotate2">
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body panel-order" id="goods_info">
							<div class="prd-info clearfix">
								<div class="prd-img pull-left">
									<a href="#"> <img src="../share/img/slide.jpg" width="80"
										height="80">
									</a>
								</div>
								<div class="prd pull-left">
									<div id="prd-title">
										<strong class="prd-name" title="상품명"> <a href="#">펫클럽
												벨버드 토일렛/애견토일렛/강아지화장실/패드</a>
										</strong>
									</div>
									<div class="prd-li">
										<div class="prd-item-price">
											<span class="prd-price" title="판매가"> <b
												id="prd-price-total">6,900</b>원
											</span> <span class="prd-count" title="수량"> <strong>1</strong>개
											</span> <br> <span class="prd-deli"> <span>[조건]/기본배송</span>
											</span>
										</div>
									</div>
								</div>
								<div class="prd-foot" title="합계">
									<span id="prd-total">합계</span> &nbsp; <b id="prd-price-total">
										6,900 </b>원
								</div>
							</div>
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
								src="../share/img/arrow-down.png" align=right
								class="arrow-down3 icon-rotate3">
							</a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body panel-order">
							<div class="order-info">
								<div class="info-title pull-left">결제수단</div>
								<div class="info-desc2 payment-method pull-left">신용카드</div>
								<div class="info-title pull-left pull-left">총 결제금액</div>
								<div class="info-desc2 price-all pull-left">5,400원</div>
								<div class="info-title pull-left">총 주문금액</div>
								<div class="info-desc2 price-order pull-left">0원</div>
								<div class="info-title pull-left">총 할인금액</div>
								<div class="info-desc2 price-disc pull-left">0원</div>
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
								src="../share/img/arrow-down.png" align=right
								class="arrow-down4 icon-rotate4">
							</a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingFour">
						<div class="panel-body panel-order">
							<div class="order-info clearfix">
								<div class="info-title pull-left">총 결제금액</div>
								<div class="info-desc2 price-all pull-left">0원</div>
								<div class="info-title pull-left">상품구매금액</div>
								<div class="info-desc2 price-good pull-left">0원</div>
								<div class="info-title pull-left">배송비</div>
								<div class="info-desc2 price-delivery pull-left">0원</div>
								<div class="info-title pull-left">결제예정금액</div>
								<div class="info-desc2 pull-left">0원</div>
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
								src="../share/img/arrow-down.png" align=right
								class="arrow-down5 icon-rotate5">
							</a>
						</h4>
					</div>
					<div id="collapseFive" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingFive">
						<div class="panel-body panel-order">
							<div class="order-info clearfix">
								<div class="info-title pull-left">받는사람</div>
								<div class="info-desc1 price-all pull-left">조대철</div>
								<div class="info-title pull-left">우편번호</div>
								<div class="info-desc1 price-good pull-left">05218</div>
								<div class="info-title pull-left">주소</div>
								<div class="info-desc1 price-delivery pull-left">서울특별시 행복구
									존버동 8282-5959 이젠아파트 3층 302호</div>
								<div class="info-title pull-left">일반전화</div>
								<div class="info-desc1 pull-left">02-777-5959</div>
								<div class="info-title pull-left">휴대전화</div>
								<div class="info-desc1 pull-left">010-8282-2-5959</div>
								<div class="info-title pull-left">배송메시지</div>
								<div class="info-desc1 pull-left">부재시 경비실로!</div>
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
								src="../share/img/arrow-down.png" align=right
								class="arrow-down6 icon-rotate6">
							</a>
						</h4>
					</div>
					<div id="collapseSix" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingSix">
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
			location.href="../gallery/goods.jsp";
		});
	</script>
</body>

</html>