<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="../share/head_tp.jsp"%>
<style type="text/css">
.align {
	width: 96%;
	font-weight: bold;
	text-align: center;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 15px;
	padding-top: 20px;
	padding-bottom: 20px;
	font-size: 15px;
	color: white;
	border: #ff6261;
	background: #ff6261;
}

.mycart {
	border: 1px solid #ffc7c1;
	width: 96%;
	margin: auto;
	margin-bottom: 15px;
	list-style: none;
}

.mygoods {
	padding-top: 20px;
}

.mygoods:hover {
	cursor: pointer;
}

.chkbox {
	float: left;
	padding-left: 10px;
}

.mygoods a {
	display: block;
	float: left;
	margin: 5px;
	height: auto;
	padding-left: 5px;
}

.word {
	float: left;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 62%;
	padding-left: 10px;
	padding-top: 5px;
}

.word>b {
	overflow: hidden;
	text-overflow: ellipsis;
}

/** 이미지 */
.cart-img {
	width: 75px;
	border: 1px solid #ffc7c1;
}

.word span {
	border: 1px solid #FFD9FA;
	background-color: #FFD9FA;
}

/** 삭제/장바구니담기 버튼 */
.btns {
	margin-left: 10px;
	margin-top: 50px;
	margin-bottom: 20px;
}

/** 전체선택/선선택삭제 */
.selectbtn {
	border: 1px solid #ffc7c1;
	width: 96%;
	padding: 10px 15px;
	margin: auto;
}

/** 장바구니가기 버튼 */
.gocart {
	background: #FF8F83;
	border: 1px solid #FF8F83;
	color: white;
	font-size: 14px;
}

/** 삭제버튼 두개 */
.border-botton {
	border-radius: 3px;
	margin-right: 5px;
}

/** 전체상품주문 */
.lastbtn {
	text-align: center;
	padding-bottom: 20px;
}

/** 전체상품 버튼 */
.btn2 {
	width: 90%;
	height: 40px;
	margin-bottom: 50px;
	margin-top: 15px;
}

.btn2:hover {
	font-size: 15px;
	color: white;
}
</style>
<script src="../share/plugins/handlebars/handlebars-v4.0.5.js"></script>

</head>

<body>
	<%@ include file="../share/top_tp.jsp"%>
	<div class="content">
		<!-- 여기에 작성 -->

		<div class="page-title clearfix">
			<h4>
				<b> <a href="#" onclick="history.back(); return false;"><i
						class="glyphicon glyphicon-chevron-left"></i></a>관심상품
				</b>
			</h4>
		</div>
		<div class="favorite">
			<p class="align">
				My상품(<span>2</span>)
			</p>
			<!-- 물건 1 -->
			<ul class="mycart-list" id="interest-item-group">
				
			</ul>
			<div class="selectbtn">
				<button type="button" class="select-all" id="select-all">전체선택</button>
				<button type="button" class="border-botton" id="select-choice">선택삭제</button>
			</div>
			<div class="lastbtn">
				<a href="../pay/orderform.jsp">
					<button type="button" class="btn btn2" id="all-bye">전체상품주문</button>
				</a>
			</div>
		</div>

	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<!-- 여기서부터 핸들바 템플릿 구조 만들기 -->
	<script id="goods_item_tmpl" type="text/x-handlebars-template">
	{{#each goods}}
	<li class="mycart" id="mycart1">
		<div class="mygoods clearfix">
			<span class="chkbox"> <input type="checkbox" class="cart"
				name="check-select" ></span> <a
				href="#"><img src="{{url}}" class="cart-img"></a>
			<div class="word">
				<b>{{name}}</b><br> <small>배송:2500원[조건]/기본배송</small><br>
				<small><span>적</span>{{point}}원</small><br> <b>{{price}}원</b>
			</div>
		</div>
		<div class="btns">
			<button type="button" class="btn btn-inverse delete-one"
				id="delete-one">삭제</button>
			<button type="button" class="btn gocart" id="gotocart">장바구니담기</button>
		</div>
	</li>
	{{/each}}
	</script>
	<!-- 핸들바 템플릿 구조 끝 -->
	<script type="text/javascript">
		/** Ajax 통신을 통해 json 파일을 읽어들여 핸들바 템플릿에 적용 */
		$(function() {
			// get요청을 통한 핸들바 템플릿 태그 조립하기
			function get_list() {
				$.get("../share/plugins/goods_list.json", function(req) {
					// 미리 준비한 HTML틀을 읽어온다.
					var template = Handlebars.compile($("#goods_item_tmpl")
							.html());
					// Ajax 를 통해서 읽어온 JSON 을 템플릿에 병합한다.
					var html = template(req);
					// #interest-item-group 에 읽어온 내용을 추가한다.
					$("#interest-item-group").append(html);
				});
			} // 검색 결과를 템플릿을 이용해서 화면에 나타낼 함수 정의 끝
			/** 함수 호출 -> 이 부분에서 상품 리스트가 화면에 뿌려짐 */
			get_list();
		});
		/** 전체선택 */
		$(function() {
			$("#select-all").click(function() {
				var choice = $(".cart").prop('checked')
				if (!choice) {
					$(".cart").prop('checked', true);
				} else {
					$(".cart").prop('checked', false);
				}
			});
		});

		/** 선택삭제 버튼 */
		$(function() {
			$("#select-choice").click(function() {
				// 전체 체크박스를 탐색한다 (반복문 개념)
				$("input:checkbox[name=check-select]").each(function() {
					// 체크가 되었다면 부모(span)의 부모(div)의 부모(li)를 제거한다! byebye!
					$("input:checkbox[name=check-select]:checked").parent().parent().parent().remove();
				});
			});
		});

		/** 전체상품 주문 버튼 예외상황 */
		$("#all-bye").click(function() {
			var check_list = $(".cart:checked");
			if (check_list.length == 0) {
				alert("선택된 항목이 없습니다.");
				return false;
			}
		});

		/** 장바구니 담기 */
		$(function() {
			var count = $("#cart-qty").text();
			var put_cart = count;
			$("#cart-qty").text(put_cart);
			$("#interest-item-group").on("click",
					"#gotocart",
					function(e) {
				put_cart++;
				if (put_cart == Number(count) + 1) {
					$("#cart-qty").text(put_cart);
					alert("해당 상품을 장바구니에 담았습니다.");
				} else {
					alert("이미 해당 상품을 장바구니에 담았습니다.");
				}
			});
		});

		/** 상품삭제 */
		$("#interest-item-group").on("click",
				"#delete-one",
				function(e) {
			$(this).parent().parent().remove();
		});
	</script>


</body>

</html>
