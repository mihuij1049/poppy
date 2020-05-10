<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>

<head>
<%@ include file="../share/head_tp.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/share/like_goods.css" />
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
				My상품(<span>${output.size() }</span>)
			</p>
			<c:choose>
				<%-- 조회결과가 없는 경우 --%>
				<c:when test="${output == null || fn:length(output) == 0}">
					<div class="non-list" style="text-align: center; font-size: 18px;">조회결과가
						없습니다.</div>
				</c:when>
				<%-- 조회결과가 있는 경우 --%>
				<c:otherwise>
					<!-- 물건 1 -->
					<ul class="mycart-list" id="interest-item-group">
						<c:forEach var="item" items="${output}" varStatus="status">
							<c:set var="gname" value="${item.gname }" />
							<c:set var="gsale" value="${item.gsale }" />
							<c:set var="heartno" value="${item.heartno }" />
							<li class="mycart" id="mycart1">
								<div class="mygoods clearfix">
									<span class="chkbox"> <input type="checkbox"
										class="cart" name="check-select"
										data-checknum="${item.heartno }" /></span> <a href="#"><img
										src="" class="cart-img"></a>
									<div class="word">
										<b>${item.gname}</b><br> <small>배송:2500원[조건]/기본배송</small><br>
										<small><span>적</span> <fmt:formatNumber
												value="${item.gsale*0.02}" pattern="#,###" />원</small><br> <b><fmt:formatNumber
												value="${item.gsale}" pattern="#,###" />원</b>
									</div>
								</div>
								<div class="btns">
									<button type="button" class="btn btn-inverse delete-one"
										id="delete-one" data-heartno="${item.heartno }">삭제</button>
									<button type="button" class="btn gocart" id="gotocart">장바구니담기</button>
								</div>
							</li>
						</c:forEach>
					</ul>
				</c:otherwise>
			</c:choose>
			<div class="selectbtn">
				<button type="button" class="select-all" id="select-all">전체선택</button>
				<button type="button" class="border-botton" id="select-choice">선택삭제</button>
			</div>
			<div class="lastbtn">
				<a href="${pageContext.request.contextPath }/pay/orderform.do">
					<button type="button" class="btn btn2" id="all-bye">전체상품주문</button>
				</a>
			</div>
		</div>

	</div>
	<%@ include file="../share/bottom_tp.jsp"%>
	<script
		src="${pageContext.request.contextPath}/share/plugins/ajax/ajax_helper.js"></script>
	<!-- 여기서부터 핸들바 템플릿 구조 만들기 -->
	<!-- <script id="goods_item_tmpl" type="text/x-handlebars-template"> -->
	<!-- {{#each item}} -->
	<!-- <li class="mycart" id="mycart1">
		<div class="mygoods clearfix">
			<span class="chkbox"> <input type="checkbox" class="cart"
				name="check-select" ></span> <a
				href="#"><img src="{{url}}" class="cart-img"></a>
			<div class="word">
				<b>{{item.gname}}</b><br> <small>배송:2500원[조건]/기본배송</small><br>
				<small><span>적</span>{{item.gsale*0.02}}원</small><br> <b>{{item.gsale}}원</b>
			</div>
		</div>
		<div class="btns">
			<button type="button" class="btn btn-inverse delete-one"
				id="delete-one">삭제</button>
			<button type="button" class="btn gocart" id="gotocart">장바구니담기</button>
		</div>
	</li> -->
	<!-- {{/each}} -->
	<!-- </script> -->
	<!-- 핸들바 템플릿 구조 끝 -->
	<script type="text/javascript">
		/* /** Ajax 통신을 통해 json 파일을 읽어들여 핸들바 템플릿에 적용
		$(function() {
			// get요청을 통한 핸들바 템플릿 태그 조립하기
			function get_list() {
				$.get("like_goodsajax.do?item", function(req) {
					// 미리 준비한 HTML틀을 읽어온다.
					var template = Handlebars.compile($("#goods_item_tmpl")
							.html());
					// Ajax 를 통해서 읽어온 JSON 을 템플릿에 병합한다.
					var html = template(req);
					// #interest-item-group 에 읽어온 내용을 추가한다.
					$("#interest-item-group").append(html);
				});
			} // 검색 결과를 템플릿을 이용해서 화면에 나타낼 함수 정의 끝
			/** 함수 호출 -> 이 부분에서 상품 리스트가 화면에 뿌려짐 
			get_list();
		}); // end ajax */
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
				// 체크박스를 탐색하여 heartno를 담을 배열 생성
				var delList = [];
				$("input:checkbox[name=check-select]:checked").each(function(i) {
					// 생성된 배열의 끝에 값 추가하기
					delList.push($(this).data("checknum"));
					$(this).parent().parent().parent().remove();
				});
				// 전체 체크박스를 탐색한다 (반복문 개념)
				$("input:checkbox[name=check-select]:checked").each(function() {
					
					// 체크가 되었다면 부모(span)의 부모(div)의 부모(li)를 제거한다! byebye!
					
					/* $("input:checkbox[name=check-select]:checked").parent().parent().parent().remove(); */
				});
				console.log(delList);
	
				/* delete 메서드로 Ajax 요청하기  */
				$.delete("${pageContext.request.contextPath}/myInfo/del_list", {
					"delList" : delList
				}, function(json) {
					if (json.rt == "OK") {
						alert("삭제되었습니다.");
						// 삭제완료 후 목록 페이지 이동
						window.location = "${pageContext.request.contextPath}/myInfo/like_goods.do";
					}
				});
				;
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
			$("#interest-item-group").on("click", "#gotocart", function(e) {
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
		$("#interest-item-group").on("click", "#delete-one", function(e) {
			e.preventDefault();
			
			let current = $(this);   // 이벤트가 발생한 객체 자신 #delete-one
			let heartno = current.data('heartno');
			// 삭제 확인
			if (!confirm("정말 이 상품을 관심상품에서 삭제하시겠습니까?")) {
				 return false;
			}
			
			/* delete 메서드로 Ajax 요청하기  */
			$.delete("${pageContext.request.contextPath}/myInfo/del_item", {
				"heartno" : heartno
			}, function(json) {
				if (json.rt == "OK") {
					alert("삭제되었습니다.");
					// 삭제완료 후 목록 페이지 이동
					window.location = "${pageContext.request.contextPath}/myInfo/like_goods.do";
				}
			});
			
			$(this).parent().parent().remove();
		});
	</script>


</body>

</html>
