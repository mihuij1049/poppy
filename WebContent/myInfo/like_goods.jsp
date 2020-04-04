<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>

<head>
<%@ include file="/share/head_tp.jsp"%>
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


</head>

<body>
	<%@ include file="/share/top_tp.jsp"%>
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
			<ul class="mycart-list">
				<li class="mycart" id="mycart1">
					<div class="mygoods clearfix">
						<span class="chkbox"> <input type="checkbox" class="cart"
							name="check-select" value="check" id="check-select1"></span> <a
							href="#"><img src="../share/img/4_M.jpg" class="cart-img"></a>
						<div class="word">
							<b>1펫클럽 데이스포 케어츄르 15kg*4개입/츄르간식</b><br> <small>배송:2500원[조건]/기본배송</small><br>
							<small><span>적</span>40원</small><br> <b>3,500원</b>
						</div>
					</div>
					<div class="btns">
						<button type="button" class="btn btn-inverse delete-one"
							id="delete-one">삭제</button>
						<button type="button" class="btn gocart" id="gotocart">장바구니담기</button>
					</div>
				</li>
				<!-- 물건 2 -->
				<li class="mycart" id="mycart1">
					<div class="mygoods clearfix">
						<span class="chkbox"> <input type="checkbox" class="cart"
							name="check-select" value="check" id="check-select2"></span> <a
							href="#"><img src="../share/img/4_M.jpg" class="cart-img"></a>
						<div class="word">
							<b>1펫클럽 데이스포 케어츄르 15kg*4개입/츄르간식</b><br> <small>배송:2500원[조건]/기본배송</small><br>
							<small><span>적</span>40원</small><br> <b>3,500원</b>
						</div>
					</div>
					<div class="btns">
						<button type="button" class="btn btn-inverse delete-one"
							id="delete-one">삭제</button>
						<button type="button" class="btn gocart" id="gotocart">장바구니담기</button>
					</div>
				</li>
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
	<%@ include file="/share/bottom_tp.jsp"%>
	<script type="text/javascript">
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
        $("#gotocart").click(function(e) {
            put_cart++;
            if (put_cart == Number(count) + 1) {
                $("#cart-qty").text(put_cart);
                alert("해당 상품을 장바구니에 담았습니다.");
            } else {
                alert("이미 해당 상품을 장바구니에 담았습니다.");
            }
        });
    });
    </script>


</body>

</html>
