<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../share/assets/ico/favicon.png" />
<link rel="apple-touch-icon-precomposed"
	href="../share/assets/ico/apple-touch-icon-144-precomposed.png" />
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="../share/assets/css/bootstrap.min.css" />
<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="../share/assets/css/nanumfont.css" />
<link rel="stylesheet" type="text/css" href="orderform.css" />
<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" href="assets/css/non-responsive.css" /> -->
<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
        <script type="text/javascript" src="assets/js/html5shiv.js"></script>
        <script type="text/javascript" src="assets/js/respond.min.js"></script>
        <![endif]-->
<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
        <link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
        <script type="text/javascript" src="assets/js/ie10.js"></script>
        <![endif]-->
<style type="text/css">
</style>
</head>

<body>
	<div id="title" align="center">
		<h4>
			<b>주문/결제</b>
		</h4>
	</div>
	<form id="orderform" class="orderform" action="" method="post"
		target="_self" enctype="multipart/form-data">
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne"> <b>배송지</b> <img
							src="../share/img/arrow-down.png" align=right
							class="arrow-down1 icon-rotate1">
						</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">
						<!-- 탭 버튼 구성 -->
						<ul class="nav nav-tabs" id="mytab">
							<li class="active"><a href="#page1" data-toggle="tab">최근
									배송지</a></li>
							<li><a href="#page2" data-toggle="tab">직접입력</a></li>
						</ul>
						<!-- 탭 페이지 구성 -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane fade active in" id="page1">
								<div class="recent-address">
									<div class="recents">
										<div class="recent">
											<strong class="name"><span id="delivery-info-name">조대철</span></strong>
											<p class="address">
												[ <span id="zipcode">05218</span> ] <span
													id="delivery-info-address"> 서울특별시 강동구 라랄라라 </span>
											</p>
											<div class="phone">
												<div id="delivery-info-phone">010-8222-9650</div>
											</div>
										</div>
										<span class="side-right">
											<button type="button" id="recent-address-list">배송지
												목록</button>
										</span>
									</div>
									<div class="recent-addr" style="display: none;">
										<h4 class="heading">배송지를 선택해주세요.</h4>
										<ul class="addr-content" style="list-style: none">
											<li delivery-list><strong class="name"> <span
													id="name">조대철</span>
											</strong>
												<div class="description">
													<span class="choice"> <input type="radio"
														id="choice-select">
													</span>
													<p class="recent-content">
														[ <span class="zipcode">05218</span> ] <span class="addr1">서울특별시
															강동구</span> <br> <span class="addr2">1단지아파트</span>
													</p>
													<dl class="tel">
														<dt></dt>
														<dd>010-8222-9650</dd>
														<dt></dt>
													</dl>
												</div> <span class="button">
													<button type="button" id="choice-modify">수정</button>
											</span></li>
										</ul>
										<span class="sideRight">
											<button type="button" id="recent-close">닫기</button>
										</span>
									</div>
									<hr>
									<div class="form-group">
										<select id="selbox">
											<option value="">-- 메시지 선택(선택사항) --</option>
											<option value="1">배송전에 미리 연락바랍니다.</option>
											<option value="2">부재시 경비실에 맡겨주세요.</option>
											<option value="3">부재시 문 앞에 놓아주세요.</option>
											<option value="4">빠른 배송 부탁드립니다.</option>
											<option value="5">택배함에 보관해 주세요.</option>
											<option value="direct">직접입력</option>
										</select>
										<textarea id="selboxDirect" name="selboxDirect"
											style="resize: none;"></textarea>
									</div>
								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade" id="page2">
								<div class="new-address">
									<div class="segment same-addr">
										<div class="same">
											<input type="radio" name="same-addr" id="same-addr1">
											<label for="same-addr1">회원 정보와 동일</label>
										</div>
										<div class="new">
											<input type="radio" name="same-addr" id="same-addr2" /> <label
												for="same-addr2">새로운 배송지</label>
										</div>
									</div>
									<div class="new-addr">
										<div class="na-name">
											<label class="receiver">받는분</label>
											<div class="required">＊</div>
											<div class="na-body">
												<div class="input-text">
													<input type="text" name="delivery-name" id="delivery-name" />
												</div>
											</div>
										</div>
										<div class="na-address">
											<div class="na-address-head">
												<label class="receiver">주소</label>
												<div class="required">＊</div>
											</div>
											<div class="na-address-body">
												<input type="text" id="zonecode" placeholder="우편번호">
												<input type="button" id="address-btn"
													onclick="DaumPostcode()" value="주소 찾기"><br> <input
													type="text" id="address" placeholder="주소"><br>
												<input type="text" id="detail-address" placeholder="상세주소">
												<div id="wrap"
													style="display: none; border: 1px solid; width: 343px; height: 390px; margin: 5px 0; position: relative; border: 1px solid #ddd;">
													<img
														src="https://t1.daumcdn.net/postcode/resource/images/close.png"
														id="btnFoldWrap"
														style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
														onclick="foldDaumPostcode();" alt="접기 버튼">
												</div>
												<div class="addInfo">나머지 주소는 선택입력이 가능합니다.</div>
											</div>
											<div class="na-phone">
												<div class="na-phone-head">
													<label class="receiver">휴대전화</label>
													<div class="required">＊</div>
												</div>
												<div class="na-phone-body">
													<div class="input-text">
														<input type="text" name="delivery-phone"
															id="delivery-phone" />
													</div>
												</div>
											</div>
											<div class=" na-email">
												<div class="na-email-head">
													<label class="receiver"> 이메일 </label>
													<div class="required">＊</div>
												</div>
												<div class="na-email-body">
													<div class="input-text">
														<input type="text" name="delivery-email"
															id="delivery-email" />
													</div>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="form-group2">
										<select id="selbox2">
											<option value="">-- 메시지 선택(선택사항) --</option>
											<option value="1">배송전에 미리 연락바랍니다.</option>
											<option value="2">부재시 경비실에 맡겨주세요.</option>
											<option value="3">부재시 문 앞에 놓아주세요.</option>
											<option value="4">빠른 배송 부탁드립니다.</option>
											<option value="5">택배함에 보관해 주세요.</option>
											<option value="direct2">직접입력</option>
										</select>
										<textarea id="selboxDirect2" name="selboxDirect"
											style="resize: none;"></textarea>
									</div>
									<div class="addr-save">
										<input type="checkbox" name="default"> <span>
											기본 배송지로 저장 </span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo"> <b>주문상품</b>
							<span id="arrow-down"> <img
								src="../share/img/arrow-down.png" align=right
								class="arrow-down2 icon-rotate2">
						</span>
						</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">
						<div class="prd-info">
							<div class="prd-box">
								<div class="thumbnail">
									<a href="../gallery/goods.jsp"> <img
										src="../share/img/slide.jpg" width="70" height="70">
									</a>
								</div>
								<div class="prd">
									<div id="prd-title">
										<strong class="prd-name" title="상품명"> <a
											href="../gallery/goods.jsp">펫클럽 벨버드 토일렛/애견토일렛/강아지화장실/패드</a>
										</strong>
									</div>
									<ul class="prd-li">
										<li style="list-style: none"><span class="prd-price"
											title="판매가"> <strong>6,900</strong>원
										</span> <span class="prd-count" title="수량"> <strong>1</strong>개
										</span> <br> <span class="prd-deli"> <span>[조건]/기본배송</span>
										</span></li>
									</ul>
								</div>
								<div class="cencel-btn">
									<button type="button" class="btn" id="prd-del">
										<span>&times;</span>
									</button>
								</div>
								<div class="modal fade" id="myModal">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title">상품 취소</h4>
											</div>
											<div class="modal-body">
												<p>선택하신 상품을 삭제하시겠습니까?</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-delete"
													data-dismiss="modal">예</button>
												<button type="button" class="btn" data-dismiss="modal">아니오</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="prd-foot" title="합계">
								<span id="prd-total">합계</span> <span class="pt-right"> <span
									id="prd-tal-pri"> 6,900 </span>원
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingThree">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree"> <b>할인/부가결제</b>
							<span id="arrow-down"> <img
								src="../share/img/arrow-down.png" align=right
								class="arrow-down3 icon-rotate3">
						</span>
						</a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingThree">
					<div class="panel-body">
						<div class="discount clear">
							<div class="dis-title">
								<span class="head">쿠폰 할인</span> <span class="coupon"> (
									보유쿠폰 <span class="coupon-count">3개</span> )
								</span>
							</div>
							<div class="discount-re">
								<button type="button" class="btn btn-default"
									id="btn-coupon-sel">쿠폰 적용</button>
								<span class="discount-count"> <span>0</span>원
								</span>
							</div>
						</div>
						<div class="total">
							<h4 class="head">적용금액</h4>
							<strong class="total-sum"> - <span id="totla-sale-price">0</span>원
							</strong>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingFour">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour"> <b>결제정보</b>
							<span id="arrow-down"> <img
								src="../share/img/arrow-down.png" align=right
								class="arrow-down4 icon-rotate4">
						</span>
						</a>
					</h4>
				</div>
				<div id="collapseFour" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingFour">
					<div class="panel-body">
						<div class="pay-info">
							<div class="pay-content">
								<div class="pay-con1">
									<h5>주문상품</h5>
									<span class="total-price"> <span
										id="total-gallery-price">6,900</span>원
									</span>
								</div>
								<div class="pay-con2">
									<h5>할인/부가결제</h5>
									<span class="total-price"> - <span id="totla-sale-price">0</span>원
									</span>
								</div>
								<div class="pay-con3">
									<h5>배송비</h5>
									<span class="total-price"> + <span id="delivery-price">2,500</span>원
									</span>
								</div>
							</div>
							<div class="pay-price">
								<h4 class="head">결제금액</h4>
								<strong class="total-price"> <span id="pay-price">9,400</span>원
								</strong>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingFive">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseFive"
							aria-expanded="false" aria-controls="collapseFive"> <b>결제수단</b>
							<span id="arrow-down"> <img
								src="../share/img/arrow-down.png" align=right
								class="arrow-down5 icon-rotate5">
						</span>
						</a>
					</h4>
				</div>
				<div id="collapseFive" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingFive">
					<div class="panel-body">
						<div class="pay-box">
							<ul class="pay-method">
								<li class="pay-sel" style="list-style: none"><label
									class="pay-method-sel"> <span>결제수단 선택</span>
								</label></li>
								<div class="content">
									<div class="button-list">
										<div>신용카드</div>
										<div>계좌이체</div>
										<div>휴대폰</div>
										<div>무통장입금</div>
									</div>
								</div>
							</ul>
						</div>
						<div class="content-detail">
							<span>- 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</span>
						</div>
						<div class="save">
							<input type="checkbox" name="pay-method-save"
								id="pay-method-save"> <label for="pay-method-save">결제수단과
								입력정보를 다음에도 사용</label>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingSix">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseSix"
							aria-expanded="false" aria-controls="collapseSix"> <b>적립
								혜택</b> <span id="arrow-down"> <img
								src="../share/img/arrow-down.png" align=right
								class="arrow-down6 icon-rotate6">
						</span>
						</a>
					</h4>
				</div>
				<div id="collapseSix" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingSix">
					<div class="panel-body">
						<div class="save-point">
							<div class="save-content">
								<div class="save-con1">
									<h5>상품별 적립금</h5>
									<span class="total-price"> <span
										id="total-gallery-price">70</span>원
									</span>
								</div>
								<div class="save-con2">
									<h5>회원 적립금</h5>
									<span class="total-price"> <span id="totla-sale-price">0</span>원
									</span>
								</div>
								<div class="save-con3">
									<h5>쿠폰 적립금</h5>
									<span class="total-price"> <span id="delivery-price">0</span>원
									</span>
								</div>
							</div>
						</div>
						<div class="save-price">
							<h4 class="head">적립 예정금액</h4>
							<strong class="total-price"> <span id="pay-price">70</span>원
							</strong>
						</div>
					</div>
				</div>
			</div>
			<div class="order">
				<button type="button" class="btn">
					<span id="order-total-price"> 9,400 </span>원 <span>결제하기</span>
				</button>
			</div>
			<div class="order-info">
				<ul class="order-info-box">
					<li>무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에
						대해 무이자할부가 적용되지 않습니다. 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기
						바랍니다.</li>
					<li>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</li>
				</ul>
			</div>
		</div>
	</form>
	<!-- Javascript -->
	<script src="../share/assets/js/jquery-3.2.1.min.js"></script>
	<script src="../share/assets/js/bootstrap.min.js"></script>
	<script
		src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		var element_wrap = document.getElementById('wrap');

		function foldDaumPostcode() {
			element_wrap.style.display = 'none';
		}

		function DaumPostcode() {
			var currentScroll = Math.max(document.body.scrollTop,
					document.documentElement.scrollTop);

			new daum.Postcode({
				oncomplete : function(data) {
					var addr = '';
					var extraAddr = '';

					if (data.userSelectedType === 'R') {
						addr = data.roadAddress;
					} else {
						addr = data.jibunAddress;
					}

					document.getElementById("zonecode").value = data.zonecode;
					document.getElementById("address").value = addr;
					document.getElementById("detail-address").focus();

					element_wrap.style.display = 'none';

					document.body.scrollTop = currentScroll;
				},

				onresize : function(size) {
					element_wrap.style.height = size.height + 'px';
				},
				width : '100%',
				height : '100%'
			}).embed(element_wrap);

			element_wrap.style.display = 'block';
		}

		$(function() {
			$(".collapse").collapse({
				toggle : false
			})
		});

		$(function() {
			$("#selboxDirect").hide();

			$("#selbox").change(function() {
				// 직접입력을 누를 때 나타남
				if ($("#selbox").val() == "direct") {
					$("#selboxDirect").show();
				} else {
					$("#selboxDirect").hide();
				}
			})

			$("#selboxDirect2").hide();

			$("#selbox2").change(function() {
				// 직접입력을 누를 때 나타남
				if ($("#selbox2").val() == "direct2") {
					$("#selboxDirect2").show();
				} else {
					$("#selboxDirect2").hide();
				}
			})
		});

		$(function() {
			$("#headingOne").on('click', function() {
				$(".arrow-down1").toggleClass("rotate1");
			});

			$("#headingTwo").on('click', function() {
				$(".arrow-down2").toggleClass("rotate2");
			});

			$("#headingThree").on('click', function() {
				$(".arrow-down3").toggleClass("rotate3");
			});

			$("#headingFour").on('click', function() {
				$(".arrow-down4").toggleClass("rotate4");
			});

			$("#headingFive").on('click', function() {
				$(".arrow-down5").toggleClass("rotate5");
			});

			$("#headingSix").on('click', function() {
				$(".arrow-down6").toggleClass("rotate6");
			});
		});

		$(function() {
			$("#selbox2").change(function() {
				// 직접입력을 누를 때 나타남
				if ($("#selbox2").val() == "direct2") {
					$("#selboxDirect2").show();
				} else {
					$("#selboxDirect2").hide();
				}
			})
		})

		$(function() {
			$("#prd-del").click(function(e) {
				$("#myModal").modal("show");
			});

			$(document).on("click", ".btn-delete", function() {
				$(this).parents(".prd-info").remove();

				window.history.back();
			});
		});
		
		$(function() {
			$("#recent-address-list").click(function() {
				$(".recents").hide();
				$(".recent-addr").show();
			});
			
			$("#recent-close").click(function() {
				$(".recent-addr").hide();
				$(".recents").show();
			})
		});
	</script>
</body>

</html>