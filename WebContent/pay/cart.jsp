<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css" href="cart.css" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
</head>

<body>
	<%@ include file="/share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->
		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>장바구니
				</b>
			</h4>
		</div>
		<div class="container">
			<!-- 탭 버튼 구성 -->
			<ul class="nav nav-tabs" id="mytab">
				<li class="active col-xs-6 etc"><a href="#page1"
					data-toggle="tab">국내배송상품</a></li>
				<li class="col-xs-6 etc"><a href="#page2" data-toggle="tab">해외배송상품</a></li>
			</ul>
			<!-- 탭 페이지 구성 -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active fade in" id="page1">
					<div class="panel-title6">장바구니 상품</div>
					<div class="panel-header2">일반상품 (n)</div>
					<div class="panel-body2">
						<div class="mycart">
							<div class="mygoods clearfix">
								<span class="chkbox"><input type="checkbox"
									class="cart cart-size"></span> <a href=" ../gallery/goods.jsp">
									<img src="../share/img/4_M.jpg" class="cart-img">
								</a>
								<div class="word">
									<b><a href="../gallery/goods.jsp">펫클럽 데이스포 케어츄르
											15kg*4개입/츄르간식</a></b><br> <small>배송:2500원[조건]/기본배송</small><br>
									<small><span>적</span>40원</small><br> <b>3,500원</b> <br>
									<br>
									<div class="word-btn">
										<button class="count" id="minus">
											<img src="../share/img/마이너스.png">
										</button>
										<input type="number" class="count-label" value="1"
											id="count-label">
										<button class="count" id="plus">
											<img src="../share/img/플러스.png">
										</button>
										<button type="button" id="change">변경</button>
									</div>
								</div>
							</div>
							<div class="selectbtn">
								<div class=summ>
									<b class="summ">합계:</b> <b class="summ" id="price"></b> <b
										class="summ">원</b>
								</div>
								<button type="button" id="delete">삭제</button>
								<button type="button" id="like">관심상품</button>
								<button type="button" class="btn btn2 right-btn"
									onclick="location.href='orderform.jsp'">주문하기</button>
							</div>
						</div>
						<div class="panel-header2 clearfix">[기본배송]</div>
						<div class="selectbtn">
							<button type="button" id="all-check">전체선택</button>
							<button type="button" id="select-delete">선택삭제</button>
						</div>
						<div class="cart-move">
							<button type="button" class="btn btn2" id="cart-move">해외장바구니로
								이동</button>
						</div>
					</div>
					<table class="table table-responsive">
						<thead>
							<tr>
								<td class="table-header">결제예정금액</td>
								<td class="table-header2 td-mny"><span id="table-sum">
								</span>원</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td-title">총 상품금액</td>
								<td class="td-mny"><span id="table-price"> </span>원</td>
							</tr>
							<tr>
								<td class="td-title">총 배송비</td>
								<td class="td-mny"><span id="table-delivery"> </span>원</td>
							</tr>
						</tbody>
					</table>
					<div class="pay">
						<button class="btn btn2 btn-inverse"
							onclick="location.href='orderform.jsp'">선택상품주문</button>
						<button class="btn btn2" onclick="location.href='orderform.jsp'">
							전체상품주문</button>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="page2">
					<div class="panel-title6">장바구니 상품</div>
					<div class="panel-header2">일반상품 (n)</div>
					<div class="panel-body2">
						<div class="mycart">
							<div class="mygoods clearfix">
								<span class="chkbox"><input type="checkbox"
									class="cart2 cart-size"></span> <a href="#"><img
									src="../share/img/4_M.jpg" class="cart-img"></a>
								<div class="word">
									<b><a href="../gallery/goods.jsp">펫클럽 데이스포 케어츄르
											15kg*4개입/츄르간식</a></b><br> <small>배송:2500원[조건]/기본배송</small><br>
									<small><span>적</span>40원</small><br> <b>3,500원</b> <br>
									<br>
									<div class="word-btn">
										<button class="count" id="minus2">
											<img src="../share/img/마이너스.png">
										</button>
										<input type="number" class="count-label" value="1"
											id="count-label2">
										<button class="count" id="plus2">
											<img src="../share/img/플러스.png">
										</button>
										<button type="button" id="change2">변경</button>
									</div>
								</div>
							</div>
							<div class="selectbtn">
								<div class=summ>
									<b class="summ">합계:</b> <b class="summ" id="price2"></b> <b
										class="summ">원</b>
								</div>
								<button type="button" id="delete2">삭제</button>
								<button type="button" id="like2">관심상품</button>
								<button type="button" class="btn btn2 right-btn"
									onclick="location.href='orderform.jsp'">주문하기</button>
							</div>
						</div>
						<div class="panel-header2 clearfix">[기본배송]</div>
						<div class="selectbtn">
							<button type="button" id="all-check2">전체선택</button>
							<button type="button" id="select-delete2">선택삭제</button>
						</div>
						<div class="cart-move">
							<button type="button" class="btn btn2" id="cart-move2">국내장바구니로
								이동</button>
						</div>
					</div>
					<table class="table table-responsive">
						<thead>
							<tr>
								<td class="table-header">결제예정금액</td>
								<td class="table-header2 td-mny"><span id="table-sum2">
								</span>원</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td-title">총 상품금액</td>
								<td class="td-mny"><span id="table-price2"> </span>원</td>
							</tr>
							<tr>
								<td class="td-title">총 배송비</td>
								<td class="td-mny"><span id="table-delivery2"> </span>원</td>
							</tr>
						</tbody>
					</table>
					<div class="pay">
						<button class="btn btn2 btn-inverse"
							onclick="location.href='orderform.jsp'">선택상품주문</button>
						<button class="btn btn2" onclick="location.href='orderform.jsp'">
							전체상품주문</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="cart-modal">
					<div class="modal-header2">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">상품 삭제</h4>
					</div>
					<div class="modal-body2">
						<p>선택하신 상품을 정말 삭제하시겠습니까?</p>
					</div>
					<div class="modal-footer2">
						<button type="button" class="btn btn2" data-dismiss="modal">아니오</button>
						<button type="button" class="btn btn2" data-dismiss="modal">예</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Javascript -->
	<%@ include file="/share/bottom_tp.jsp"%>
	<!-- 사용자 정의 스크립트 -->
	<script type="text/javascript">
		$(function() {
			$("#all-check").click(function() {
				var choice = $(".cart").prop("checked");
				if (!choice) {
					$(".cart").prop("checked", true);
				} else {
					$(".cart").prop("checked", false);
				}
			});

			$("#all-check2").click(function() {
				var choice2 = $(".cart2").prop("checked");
				if (!choice2) {
					$(".cart2").prop("checked", true);
				} else {
					$(".cart2").prop("checked", false);
				}
			});

			var counter = 1;
			var counter2 = 1;
			var price = 3500;
			var delivery = 2500;

			$("#price").html(counter * price);
			$("#table-price").html(counter * price);
			$("#table-sum").html((counter * price) + delivery);
			$("#table-delivery").html(delivery);
			$("#price2").html(counter2 * price);
			$("#table-price2").html(counter2 * price);
			$("#table-sum2").html((counter2 * price) + delivery);
			$("#table-delivery2").html(delivery);

			$("#plus").click(function(e) {
				counter++;
				if (counter * price >= 30000) {
					delivery = 0;
				}
				$("#count-label").val(counter);
				$("#price").html(counter * price);
				$("#table-price").html(counter * price);
				$("#table-sum").html((counter * price) + delivery);
				$("#table-delivery").html(delivery);
			});
			$("#plus2").click(function(e) {
				counter2++;
				if (counter2 * price >= 30000) {
					delivery = 0;
				}
				$("#count-label2").val(counter2);
				$("#price2").html(counter2 * price);
				$("#table-price2").html(counter2 * price);
				$("#table-sum2").html((counter2 * price) + delivery);
				$("#table-delivery2").html(delivery);
			});

			$("#minus").click(function(e) {
				if (counter < 2) {
					alert("구매수량은 1미만으로 불가합니다.");
					return;
				}
				counter--;
				if (counter * price >= 30000) {
					delivery = 0;
				}
				if (counter * price < 30000) {
					delivery = 2500;
				}
				$("#count-label").val(counter);
				$("#price").html(counter * price);
				$("#table-price").html(counter * price);
				$("#table-sum").html((counter * price) + delivery);
				$("#table-delivery").html(delivery);
			});
			$("#minus2").click(function(e) {
				if (counter2 < 2) {
					alert("구매수량은 1미만으로 불가합니다.");
					return;
				}
				counter2--;
				if (counter2 * price >= 30000) {
					delivery = 0;
				}
				if (counter2 * price < 30000) {
					delivery = 2500;
				}
				$("#count-label2").val(counter2);
				$("#price2").html(counter2 * price);
				$("#table-price2").html(counter2 * price);
				$("#table-sum2").html((counter2 * price) + delivery);
				$("#table-delivery2").html(delivery);
			});

			$("#change").click(function(e) {
				counter = $("#count-label").val();
				$("#count-label").val(counter);
				if (counter * price >= 30000) {
					delivery = 0;
				}
				if (counter * price < 30000) {
					delivery = 2500;
				}
				$("#price").html(counter * price);
				$("#table-price").html(counter * price);
				$("#table-sum").html((counter * price) + delivery);
				$("#table-delivery").html(delivery);
			});
			$("#change2").click(function(e) {
				counter2 = $("#count-label2").val();
				$("#count-label2").val(counter2);
				if (counter2 * price >= 30000) {
					delivery = 0;
				}
				if (counter2 * price < 30000) {
					delivery = 2500;
				}
				$("#price2").html(counter2 * price);
				$("#table-price2").html(counter2 * price);
				$("#table-sum2").html((counter2 * price) + delivery);
				$("#table-delivery2").html(delivery);
			});

			$("#delete").click(function(e) {
				$("#myModal2").modal("show");
			});

			$("#select-delete").click(function(e) {
				$("#myModal2").modal("show");
			});

			$("#delete2").click(function(e) {
				$("#myModal2").modal("show");
			});

			$("#select-delete2").click(function(e) {
				$("#myModal2").modal("show");
			});

			$("#like").click(function(e) {
				alert("해당상품이 관심상품으로 등록되었습니다.")
			})

			$("#like2").click(function(e) {
				alert("해당상품이 관심상품으로 등록되었습니다.")
			})

			$("#cart-move").click(function(e) {
				alert("해외장바구니로 해당 상품이 이동 되었습니다.");
			});

			$("#cart-move2").click(function(e) {
				alert("국내장바구니로 해당 상품이 이동 되었습니다.");
			});
		});
	</script>
</body>

</html>