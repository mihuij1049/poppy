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
	href="${pageContext.request.contextPath}/share/orderform.css" />

<style type="text/css">
</style>
</head>

<body>
	<div id="title" align="center">
		<h4>
			<b>주문/결제</b>
		</h4>
	</div>
	<div id="orderform" class="orderform" target="_self"
		enctype="multipart/form-data">
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne"> <b>배송지</b> <img
							src="/upload/img/arrow-down.png" align=right
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
									<form class="recents"
										action="${pageContext.request.contextPath}/pay/orderform_ajax.do"
										method="GET">
										<div class="recent">
											<strong class="name"><span id="delivery-info-name">${output.odname}</span></strong>
											<p class="address">
												[ <span id="zipcode">${output.zcode}</span> ] <span
													id="addr1">${output.addr1}</span> <br> <span
													id="addr2">${output.addr2}</span>
											</p>
											<div class="phone">
												<div id="delivery-info-phone">${output.odphone}</div>
											</div>

										</div>
										<span class="side-right">
											<button type="button" id="recent-address-list">배송지
												목록</button>
										</span>
									</form>
									<div class="recent-addr" id="recent-addr"
										style="display: none;">
										<h4 class="heading">배송지를 선택해주세요.</h4>
										<span class="sideRight">
											<button type="button" id="recent-close">닫기</button>
										</span>
									</div>
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
									<form class="new-addr" id="new-addr"
										action="${pageContext.request.contextPath}/pay">
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
												<input type="text" id="zonecode" placeholder="우편번호" readonly />
												<input type="button" id="address-btn"
													onclick="DaumPostcode()" value="주소 찾기" readonly /><br>
												<input type="text" id="address" placeholder="주소" readonly /><br>
												<input type="text" id="detail-address" placeholder="상세주소">
												<div id="wrap"
													style="display: none; border: 1px solid; width: 100%; height: 390px; margin: 5px 0; position: relative; border: 1px solid #ddd;">
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
									</form>
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
								src="/upload/img/arrow-down.png" align=right
								class="arrow-down2 icon-rotate2">
						</span>
						</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">
						<form class="prd-info"
							action="${pageContext.request.contextPath}/pay/orderform_ajax.do"
							method="GET">
							<div class="prd-box">
								<div class=goods-box>
									<div class="thumbnail">
										<a
											href="${pageContext.request.contextPath}/gallery/goods_ajax.do">
											<img src="${user.imgpath}" width="70" height="70">
										</a>
									</div>
									<div class="prd">
										<div id="prd-title">
											<strong class="prd-name" title="상품명"> <a
												href="${pageContext.request.contextPath}/gallery/goods.jsp">펫클럽
													벨버드 토일렛/애견토일렛/강아지화장실/패드</a>
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
						</form>
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
								src="/upload/img/arrow-down.png" align=right
								class="arrow-down3 icon-rotate3">
						</span>
						</a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingThree">
					<form class="panel-body"
						action="${pageContext.request.contextPath}/pay/orderform_ajax.do"
						method="GET">
						<div class="discount clear">
							<div class="dis-title">
								<span class="head">적립금 할인</span> <span class="coupon"> (
									적립금 : <span class="coupon-count">${input3.avpoint}원</span> )
								</span>
							</div>
							<div class="discount-re">
								<button type="button" class="btn btn-default"
									id="btn-coupon-sel">적립금 적용</button>
								<span class="discount-count"> <span>0</span>원
								</span>
							</div>
						</div>
						<div class="total">
							<h4 class="head">적용금액</h4>
							<strong class="total-sum"> - <span id="totla-sale-price">0</span>원
							</strong>
						</div>
					</form>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingFour">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordion" href="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour"> <b>결제정보</b>
							<span id="arrow-down"> <img
								src="/upload/img/arrow-down.png" align=right
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
								src="/upload/img/arrow-down.png" align=right
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
								src="/upload/img/arrow-down.png" align=right
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
				<button type="submit" class="btn">
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
	</div>
	<!-- 배송지 목록 조회 -->
	<script id="recent_addr_tmpl" type="text/x-handlebars-template">
        {{#each item}}
		   	<ul class="addr-content" style="list-style: none">
	            <li delivery-list>
                    <strong class="name">
                        <span id="name">{{odname}}</span>
					</strong>
			        <div class="description">
					    <span class="choice"> 
                            <input type="radio" id="choice-select">
					    </span>
					    <p class="recent-content">
					        [ <span id="zipcode">{{zcode}}</span> ] 
                            <span id="addr1">{{addr1}}</span>
                            <br> 
                            <span id="addr2">{{addr2}}</span>
				    	</p>
				        <dl class="phone">
				            <dt></dt>
				    	    <dd>{{odphone}}</dd>
				         </dl>
					 </div> 
                     <span class="button">
					     <button type="button" id="choice-modify">수정</button>
					  </span>
                 </li>
			</ul>
        {{/each}}
    </script>
	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/share/assets/js/jquery-3.2.1.min.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/share/plugins/ajax/ajax_helper.js"></script>
	<script
		src="${pageContext.request.contextPath}/share/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/share/plugins/handlebars/handlebars-v4.0.5.js"></script>
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

			$("#selbox").change(function(e) {
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
			$("#headingOne").on('click', function(e) {
				$(".arrow-down1").toggleClass("rotate1");
			});

			$("#headingTwo").on('click', function(e) {
				$(".arrow-down2").toggleClass("rotate2");
			});

			$("#headingThree").on('click', function(e) {
				$(".arrow-down3").toggleClass("rotate3");
			});

			$("#headingFour").on('click', function(e) {
				$(".arrow-down4").toggleClass("rotate4");
			});

			$("#headingFive").on('click', function(e) {
				$(".arrow-down5").toggleClass("rotate5");
			});

			$("#headingSix").on('click', function(e) {
				$(".arrow-down6").toggleClass("rotate6");
			});
		});

		$(function() {
			$("#prd-del").click(function(e) {
				$("#myModal").modal("show");
			});

			$(document).on("click", ".btn-delete", function(e) {
				$(this).parents(".prd-info").remove();
				window.history.back();
			});
		});

		$(function() {
			$("#recent-address-list").click(
					function(e) {
						$(".recents").hide();
						$(".recent-addr").show();
						$.get("${pageContext.request.contextPath}/pay",
								function(json) {
									var template = Handlebars.compile($(
											"#recent_addr_tmpl").html());
									var html = template(json);
									$("#recent-addr").append(html);
								});
					});
		});

		$(function() {
			// 라디오박스가 클릭된 경우
			$(".recent-addr").on(
					'change',
					'input',
					function(e) {
						// 클릭된 라디오의  이름 가져오기
						var name = $(this).parent().parent().prev().children()
								.html();
						console.log(name);

						// 클릭된 라디오의 주소 가져오기
						var address = $(this).parent().next().html();
						console.log(address);

						var phone = $(this).parent().next().next().children()
								.next().html();
						console.log(phone);

						// 1) 배송지목록에 주소를 찾아 최근 배송지에 설정
						$("#delivery-info-name").html(name);
						// 2) 주소 가져오기
						$(".address").html(address);
						// 3) 핸드폰번호 가져오기
						$(".phone").html(phone);

						$(".recent-addr").hide();
						$(".recents").show();
						$(".addr-content").remove();
					});
		});

		$(function() {
			// 수정 버튼이 클릭된 경우
			$(".recent-addr")
					.on(
							'click',
							'#choice-modify',
							function(e) {
								// 클릭된 버튼의  이름 가져오기
								var name = $(this).parent().parent().children()
										.children().html();
								console.log(name);

								// 클릭된 버튼의 주소 가져오기
								var zipcode = $(this).parent().prev()
										.children().next().children().html();
								var addr1 = $(this).parent().prev().children()
										.next().children().next().html()
								var addr2 = $(this).parent().prev().children()
										.next().children().next().next().next()
										.html()
								console.log(zipcode);
								console.log(addr1);
								console.log(addr2);

								var phone = $(this).parent().prev().children()
										.next().next().children().next().html();
								console.log(phone);

								// 1) 배송지목록에 주소를 찾아 새로운 배송지에 설정
								$("#delivery-name").val(name);
								// 2) 주소 가져오기
								$("#zonecode").val(zipcode);
								$("#address").val(addr1);
								$("#detail-address").val(addr2);
								// 3) 핸드폰번호 가져오기
								$("#delivery-phone").val(phone);

								$(".recent-addr").hide();
								$(".recents").show();
								$("#mytab a:last").tab("show");
								$("input:radio[id='same-addr2']").prop(
										"checked", true);
								$(".addr-content").remove();
							});
		});

		$(function() {
			$(document).on("click", "#recent-close", function(e) {
				$(".recent-addr").hide();
				$(".recents").show();
				$(".addr-content").remove();
			});
		});

		$(function() {
			// #new-addr에 대한 submit 이벤트롤 가로채서 Ajax 요청을 전송한다.
			$("#new-addr").ajaxForm({
					// 전송 메서드 지정
					method : "POST",
					// 서버에서 200 응답을 전달한 경우 실행됨
					success : function(json) {
						console.log(json);
						// json에 포함된 데이터를 활용하여 상세페이지로 이동한다.
						if (json.rt == "OK") {
							window.location = "${pageContext.request.contextPath}/pay_ajax/orderform.do?memno=" + json.item.memno;
						}
				   }
			});
		});
	</script>
</body>

</html>