<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/share/cart.css" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Poppy-Poppy</title>
<style>
.btn2:hover {
	background: #ff6261;
	color: #fff;
}

#list {
	list-style: none;
	margin-bottom: 0;
}

#list2 {
	list-style: none;
	margin-bottom: 0;
}

.cart-box {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

.cart-box:last-child {
	border: none;
}

.cart-box2 {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

.cart-box2:last-child {
	border: none;
}

.cart-size {
	float: left;
}

.cart-img {
	float: left;
	display: block;
	margin: 0px 5px 5px 5px;
	width: 100px;
	border: 1px solid #ffc7c1;
	width: 100px;
}

.word {
	height: 110px;
}

.word p {
	font-size: 13px;
}

.word span {
	font-size: 12px;
}

.point-icon {
	font-size: 11px;
	color: #fff;
	width: 17px;
	text-align: center;
	display: inline-block;
	margin-bottom: 10px;
	background: #b88cc5;
	display: inline-block;
	border-radius: 2px;
	display: inline-block;
}

.word-btn {
	margin-top: 10px;
	padding-left: 120px;
}

.word-btn .count {
	padding: 0;
	border: none;
}

.count-label {
	vertical-align: -1px;
	width: 40px;
	text-align: right;
}

.change {
	height: 29px;
	vertical-align: -1.5px;
}

.clear {
	display: block;
	content: '';
	float: none;
	clear: both;
}

.word-botm {
	padding: 10px 15px;
}

.word-botm .btn2 {
	float: right;
	position: relative;
	bottom: 10px;
}
</style>
</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
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
					<div class="panel-header2">
						일반상품 (<span class="cart-count"></span>)
					</div>
					<div class="panel-body2">
						<div class="list-group" id="list"></div>
						<div class="panel-header2 clearfix">[기본배송]</div>
						<div class="selectbtn">
							<button type="button" class="all-check">전체선택</button>
							<button type="button" class="select_delete">선택삭제</button>
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
								<td class="table-header2 td-mny"><span id="table_sum">
								</span>원</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td-title">총 상품금액</td>
								<td class="td-mny"><span id="table_price"> </span>원</td>
							</tr>
							<tr>
								<td class="td-title">총 배송비</td>
								<td class="td-mny"><span id="table_delivery"> </span>원</td>
							</tr>
						</tbody>
					</table>
					<div class="pay">
						<button class="btn btn2 btn-inverse"
							onclick="location.href='${pageContext.request.contextPath}/orderform.do'">선택상품주문</button>
						<button class="btn btn2"
							onclick="location.href='${pageContext.request.contextPath}/orderform.do'">
							전체상품주문</button>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="page2">
					<div class="panel-title6">장바구니 상품</div>
					<div class="panel-header2">
						일반상품 (<span class="cart-count2"></span>)
					</div>
					<div class="panel-body2">
						<div class="list-group" id="list2"></div>
						<div class="panel-header2 clearfix">[기본배송]</div>
						<div class="selectbtn">
							<button type="button" class="all-check2">전체선택</button>
							<button type="button" class="select_delete2">선택삭제</button>
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
								<td class="table-header2 td-mny"><span id="table_sum2">
								</span>원</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="td-title">총 상품금액</td>
								<td class="td-mny"><span id="table_price2"> </span>원</td>
							</tr>
							<tr>
								<td class="td-title">총 배송비</td>
								<td class="td-mny"><span id="table_delivery2"> </span>원</td>
							</tr>
						</tbody>
					</table>
					<div class="pay">
						<button class="btn btn2 btn-inverse"
							onclick="location.href='${pageContext.request.contextPath}/orderform.do'">선택상품주문</button>
						<button class="btn btn2"
							onclick="location.href='${pageContext.request.contextPath}/orderform.do'">
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
						<p>
							<span class="delete_message"></span> 상품을 정말 삭제하시겠습니까?
						</p>
					</div>
					<div class="modal-footer2">
						<button type="button" class="btn btn2 delete_cancel"
							data-dismiss="modal">아니오</button>
						<button type="button" class="btn btn2 delete_ok"
							data-dismiss="modal">예</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Javascript -->
	<%@ include file="../share/bottom_tp.jsp"%>
	<script src="../share/plugins/handlebars/handlebars-v4.0.5.js"></script>
	<script type="text/x-handlebars-template" id="list-item-tmpl">
	{{#each goods}}
	<div class="cart-box clear">
		<li class="list-item">
			<div class="word">
				<input type="checkbox" name="cart_check" class="cart cart-size">
				<img src="{{url}}" class="cart-img" />
				
				<p><b class="name">{{name}}</b></p>
				<span>배송:2500원[조건]/기본배송</span><br>
				<small><span class="point-icon">적</span>&nbsp;<span class="point">{{point}}</span>원</small>
				<b class="search-item-price">
				<p>{{price}}</b><b>원</b></p></br>
			</div>
			<div class="word-btn">
				<button class="count minus">
					<img src="../share/img/마이너스.png">
				</button>
				<input type="number" class="count-label" value="1" id="count-label">
				<button class="count plus">
					<img src="../share/img/플러스.png">
				</button>
				<button class="change">변경</button>
			</div>
			<div class="word-botm">
				<p><b>합계: <span class="price">{{price}}</span>원</b></p>
				<button type="button" class="delete">삭제</button>
				<button type="button">관심상품</button>
				<button type="button" class="btn btn2">주문하기</button>
			</div>
		</li>
	</div>
	{{/each}}
	</script>
	<script type="text/x-handlebars-template" id="list-item-tmpl2">
	{{#each goods}}
	<div class="cart-box2 clear">
		<li class="list-item">
			<div class="word">
				<input type="checkbox" name="cart_check" class="cart2 cart-size">
				<img src="{{url}}" class="cart-img" />
				<p><b class="name">{{name}}</b></p>
				<span>배송:2500원[조건]/기본배송</span><br>
				<small><span class="point-icon">적</span>&nbsp;<span class="point">{{point}}</span>원</small>
				<b class="search-item-price">
				<p>{{price}}</b><b>원</b></p></br>
			</div>
			<div class="word-btn">
				<button class="count minus">
					<img src="../share/img/마이너스.png">
				</button>
				<input type="number" class="count-label" value="1" id="count-label">
				<button class="count plus">
					<img src="../share/img/플러스.png">
				</button>
				<button class="change">변경</button>
			</div>
			<div class="word-botm">
				<p><b>합계: <span class="price">{{price}}</span>원</b></p>
				<button type="button">삭제</button>
				<button type="button">관심상품</button>
				<button type="button" class="btn btn2">주문하기</button>
			</div>
		</li>
	</div>
	{{/each}}
	</script>
	<!-- 사용자 정의 스크립트 -->
	<script type="text/javascript">
		$(function() {
			var table_sum = 0;
			var table_price = 0;
			var table_delivery = 2500;
			var sum_price = 0;

			var table_sum2 = 0;
			var table_price2 = 0;
			var table_delivery2 = 2500;

			$.get("../share/plugins/goods_list.json", function(req) {
				$(function() {
					var template = Handlebars.compile($("#list-item-tmpl")
							.html());
					var html = template(req);
					$("#list").append(html);

					var length = $(".cart-box").length;
					length = $(".cart-box").length;
					$(".cart-count").html(length);

					for (var i = 0; i < length; i++) {
						table_price += parseInt($(".price").eq(i).html());
						if (i == length - 1) {
							$("#table_sum").html(table_price + table_delivery);
							$("#table_price").html(table_price);
							$("#table_delivery").html(table_delivery);
						}
					}
				});
			});

			$.get("../share/plugins/goods_list.json", function(req) {
				$(function() {
					var template = Handlebars.compile($("#list-item-tmpl2")
							.html());
					var html = template(req);
					$("#list2").append(html);
					var length = $(".cart-box2").length;
					$(".cart-count2").html(length);

					for (var i = 0; i < length; i++) {
						table_price2 += parseInt($(".price").eq(i).html());
						if (i == length - 1) {
							$("#table_sum2").html(
									table_price2 + table_delivery2);
							$("#table_price2").html(table_price2);
							$("#table_delivery2").html(table_delivery2);
						}
					}
				});
			});

			$(document).on(
					"click",
					".plus",
					function(e) {
						var value = $(this).prev().val();
						value++;
						$(this).prev().val(value);
						var one_price = $(this).parent().next().children()
								.children().children();
						var price = $(this).parent().prev().children("p")
								.children(".search-item-price").html();
						var result = price * value;
						$(one_price).html(result);

						var point = $(this).parent().prev().children("small")
								.children().next();
						$(point).html(result / 100);

						var length = $(".cart-box").length;
						for (var i = 0; i < length; i++) {
							sum_price += parseInt($(".price").eq(i).html());
						}
						$("#table_price").html(sum_price);
						if (sum_price >= 30000) {
							table_delivery = 0;
							$("#table_delivery").html(table_delivery);
						}
						$("#table_sum").html(sum_price + table_delivery);
						sum_price = 0;
					});

			$(document).on(
					"click",
					".minus",
					function(e) {
						var value = $(this).next().val();
						if (value == 1) {
							alert("구매수량은 1미만으로 불가능합니다.");
							return;
						}
						value--;
						$(this).next().val(value);
						var one_price = $(this).parent().next().children()
								.children().children();
						var price = $(this).parent().prev().children("p")
								.children(".search-item-price").html();
						var result = price * value;
						$(one_price).html(result);

						var point = $(this).parent().prev().children("small")
								.children().next();
						$(point).html(result / 100);

						var length = $(".cart-box").length;
						for (var i = 0; i < length; i++) {
							sum_price += parseInt($(".price").eq(i).html());
						}
						$("#table_price").html(sum_price);
						if (sum_price < 30000) {
							table_delivery = 2500;
							$("#table_delivery").html(table_delivery);
						}
						$("#table_sum").html(sum_price + table_delivery);
						sum_price = 0;
					});

			$(document).on(
					"click",
					".change",
					function(e) {
						value = $(this).prev().prev().val();
						$(this).prev().prev().val(value);
						var one_price = $(this).parent().next().children()
								.children().children();
						var price = $(this).parent().prev().children("p")
								.children(".search-item-price").html();
						var result = price * value;
						$(one_price).html(result);

						var point = $(this).parent().prev().children("small")
								.children().next();
						$(point).html(result / 100);

						var length = $(".cart-box").length;
						for (var i = 0; i < length; i++) {
							sum_price += parseInt($(".price").eq(i).html());
						}
						$("#table_price").html(sum_price);
						if (sum_price >= 30000) {
							table_delivery = 0;
							$("#table_delivery").html(table_delivery);
						} else {
							table_delivery = 2500;
							$("#table_delivery").html(table_delivery);
						}
						$("#table_sum").html(sum_price + table_delivery);
						sum_price = 0;
					});

			$(document).on("click", ".all-check", function(e) {
				var choice = $(".cart").prop("checked");
				if (!choice) {
					$(".cart").prop("checked", true);
				} else {
					$(".cart").prop("checked", false);
				}
			});

			$(document).on("click", ".all-check2", function(e) {
				var choice = $(".cart").prop("checked");
				if (!choice) {
					$(".cart2").prop("checked", true);
				} else {
					$(".cart2").prop("checked", false);
				}
			});

			$(document).on("click", ".delete", function(e) {
				$("#myModal2").modal("show");
				$(".delete_message").html("해당");
				var delete_item = $(this).parent().parent().parent();
				$(document).on("click", ".delete_ok", function(e) {
					delete_item.remove();

					var length = $(".cart-box").length;
					for (var i = 0; i < length; i++) {
						sum_price += parseInt($(".price").eq(i).html());
					}
					$("#table_price").html(sum_price);
					if (sum_price < 30000) {
						table_delivery = 2500;
						$("#table_delivery").html(table_delivery);
					}
					$("#table_sum").html(sum_price + table_delivery);
					sum_price = 0;
				});
			});

			$(document)
					.on(
							"click",
							".select_delete",
							function(e) {
								$("#myModal2").modal("show");
								$(".delete_message").html("선택하신");
								var ss = "실행";
								console.log(ss);
								$(document)
										.on(
												"click",
												".delete_ok",
												function(e) {
													var length = $(".cart-box").length;
													for (var i = 0; i < length; i++) {
														if ($(".cart-size").eq(
																i).prop(
																"checked") == true) {
															$(".cart-size").eq(
																	i).parent()
																	.parent()
																	.parent()
																	.remove();
															i--;
															length--;
															$(".cart-count")
																	.html(
																			length);
														}
													}
													for (var i = 0; i < length; i++) {
														sum_price += parseInt($(
																".price").eq(i)
																.html());
													}
													$("#table_price").html(
															sum_price);
													if (sum_price < 30000) {
														table_delivery = 2500;
														$("#table_delivery")
																.html(
																		table_delivery);
													}
													$("#table_sum")
															.html(
																	sum_price
																			+ table_delivery);
													sum_price = 0;
												});
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