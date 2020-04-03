<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="/share/head_tp.jsp" %>
    <style type="text/css">
    .mycart {
        border: 1px solid #ffc7c1;
        width: 96%;
        margin: auto;
        margin-bottom: 15px;
    }

    .recent {
        margin-bottom: 50px;
        margin-top: 20px;

    }

    .mygoods {
        padding-top: 20px;
    }

    .mygoods:hover {
        cursor: pointer;
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
        width: 70%;
        margin-top: 10px;
        font-size: 16px;
    }

    .word>b {
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .cart-img {
        width: 75px;
        border: 1px solid #ffc7c1;
    }

    .summ {
        text-align: right;
        padding-bottom: 10px;
    }

    .word span {
        text-decoration: line-through;
        color: #696969;
    }

    .btns {
        padding-left: 30px;
        padding-bottom: 20px;
        padding-top: 20px;
        padding-right: 20px;
    }

    .btns .btn-inverse {
        font-size: 12px;
    }

    .btn1 {
        float: right;
    }

    .recent-item-list {
        margin-bottom: 10px;
    }
    </style>
</head>

<body>
    <%@ include file="/share/top_tp.jsp" %>
        <div class="content">
            <!-- 여기에 작성 -->
            <div class="container">
                <div class="page-title clearfix">
                    <h4><b>
                            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>최근 본 상품
                        </b></h4>
                </div>
                <!-- 최근본 상품 목록 시작 -->
                <ul class="recent" id="recent-item-group">
                    <!-- 첫번째 아이템 -->
                    <li class="recent-item-list" id="item-list-1">
                        <div class="mycart">
                            <div class="mygoods clearfix">
                                <a href="#"><img src="../share/img/4_M.jpg" class="cart-img"></a>
                                <div class="word">
                                    <b>펫클럽 데이스포 케어츄르 15kg*4개입/츄르간식</b><br>
                                    <small><span class="price1">7,000원</span></small><br>
                                    <b>3,500원</b>
                                </div>
                            </div>
                            <div class="btns">
                                <button type="button" class="btn btn-inverse" id="delete-list-item">삭제</button>
                                <button type="button" class="btn btn-inverse in-cart" id="put-cart">장바구니담기</button>
                                <button type="button" class="btn btn1" id="order">주문하기</button>
                            </div>
                        </div>
                    </li>
                    <!-- 두번째 아이템 -->
                    <li class="recent-item-list" id="item-list-2">
                        <div class="mycart">
                            <div class="mygoods clearfix">
                                <a href="#"><img src="../share/img/4_M.jpg" class="cart-img"></a>
                                <div class="word">
                                    <b>펫클럽 데이스포 케어츄르 15kg*4개입/츄르간식</b><br>
                                    <small><span class="price1">7,000원</span></small><br>
                                    <b>3,500원</b>
                                </div>
                            </div>
                            <div class="btns">
                                <button type="button" class="btn btn-inverse" id="delete-list-item">삭제</button>
                                <button type="button" class="btn btn-inverse in-cart" id="put-cart">장바구니담기</button>
                                <button type="button" class="btn btn1" id="order">주문하기</button>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <%@ include file="/share/bottom_tp.jsp" %>
    $(function() {
    	/** 주문하기 */
        $("#order").click(function(e) {
            location.href = "../pay/orderform.jsp";
        });
    	/** 최근 본 상품에서 삭제 */
        $("#delete-list-item").click(function(e) {
            $("li").remove("#item-list-1");
        });
    	/** 장바구니 담기 */
    	var count = $("#cart-qty").text();
 	    var put_cart = count;
    	$("#cart-qty").text(put_cart);
    	$("#put-cart").click(function(e) {
    		put_cart++;
    		if (put_cart==Number(count)+1) {
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