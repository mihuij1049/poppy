<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<%@ include file="/share/head_tp.jsp" %>
    <link rel="stylesheet" type="text/css" href="index.css" />
</head>

<body>
<%@ include file="/share/top_tp.jsp" %>
        <div class="content">
            <!-- 여기에 작성 -->
            <div class="container_in">
                <!-- 캐러셀 영역 구성 -->
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- 현재 위치 표시 -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>
                    <!-- 내용 영역 -->
                    <div class="carousel-inner">
                        <!-- 항목 (1) -->
                        <div class="item active">
                            <img src="../share/img/main_M.jpg" alt="슬라이더(1)">
                        </div>
                        <!-- 항목 (2) -->
                        <div class="item">
                            <img src="../share/img/2_M.jpg" alt="슬라이더(2)">
                        </div>
                        <!-- 항목 (3) -->
                        <div class="item">
                            <img src="../share/img/3_M.jpg" alt="슬라이더(3)">
                        </div>
                    </div>
                    <!-- // 내용영역 구성 -->
                    <!-- 이동 버튼 -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> <span class="icon-prev"></span> </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> <span class="icon-next"></span> </a>
                </div>
                <!-- 캐러셀 영역 끝 -->
                <center>
                    <i class="glyphicon glyphicon-thumbs-up icon_size1" id="glyp_list"></i>
                    <h3 id="sale_h3">추천상품</h3>
                </center>
                <!-- 스와이퍼 플러그인 갤러리 시작!!! -->
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="gal_sug_main">
                                <div class="gal_sug">
                                    <div class="gal_sug_img"><img src="../share/img/index_gal_img1.jpg" id="img_sug"></div>
                                    강아지간식
                                    <hr />
                                    5,400원<i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i>
                                </div>
                                <div class="gal_sug">
                                    <div class="gal_sug_img"><img src="../share/img/index_gal_img2.jpg" id="img_sug"></div>
                                    강아지간식
                                    <hr />
                                    5,400원<i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i>
                                </div>
                                <div class="gal_sug">
                                    <div class="gal_sug_img"><img src="../share/img/index_gal_img3.jpg" id="img_sug"></div>
                                    강아지간식
                                    <hr />
                                    5,400원
                                    <i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="gal_sug_main">
                                <div class="gal_sug">
                                    <div class="gal_sug_img"><img src="../share/img/index_gal_img1.jpg" id="img_sug"></div>
                                    강아지간식
                                    <hr />
                                    5,400원<i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i>
                                </div>
                                <div class="gal_sug">
                                    <div class="gal_sug_img"><img src="../share/img/index_gal_img2.jpg" id="img_sug"></div>
                                    강아지간식
                                    <hr />
                                    5,400원<i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i>
                                </div>
                                <div class="gal_sug">
                                    <div class="gal_sug_img"><img src="../share/img/index_gal_img3.jpg" id="img_sug"></div>
                                    강아지간식
                                    <hr />
                                    5,400원
                                    <i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="gal_sug_main">
                                <div class="gal_sug">
                                    <div class="gal_sug_img"><img src="../share/img/index_gal_img1.jpg" id="img_sug"></div>
                                    강아지간식
                                    <hr />
                                    5,400원<i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i>
                                </div>
                                <div class="gal_sug">
                                    <div class="gal_sug_img"><img src="../share/img/index_gal_img2.jpg" id="img_sug"></div>
                                    강아지간식
                                    <hr />
                                    5,400원<i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i>
                                </div>
                                <div class="gal_sug">
                                    <div class="gal_sug_img"><img src="../share/img/index_gal_img3.jpg" id="img_sug"></div>
                                    강아지간식
                                    <hr />
                                    5,400원
                                    <i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i>
                                </div>
                            </div>
                        </div>
                    </div><!-- If we need pagination -->
                    <div class="swiper-pagination"></div>
                </div>
                <!-- 스와이퍼 플러그인 갤러리 끝!!! -->
                <center><button type="button" class="btn btn-inverse index_btn" onclick="location.href='community/gal_list.html'">베스트 상품 더보기</button></center>
                <center>
                    <i class="glyphicon glyphicon-bullhorn icon_size1 t_btn" id="glyp_list"></i>
                    <h3 id="sale_h3">TIME SALE</h3>
                </center>
                <div class="gal_best_main">
                    <div class="gal_best">
                        <div class="gal_sug_img"><img src="../share/img/index_gal_img1.jpg" id="img_sug"></div>
                        타임세일
                        <hr />
                        5,400원
                        <a href="#"><i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i></a>
                    </div>
                    <div class="gal_best">
                        <div class="gal_sug_img"><img src="../share/img/index_gal_img2.jpg" id="img_sug"></div>
                        타임세일
                        <hr />
                        5,400원
                        <a href="#"><i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i></a>
                    </div>
                    <div class="gal_best">
                        <div class="gal_sug_img"><img src="../share/img/index_gal_img3.jpg" id="img_sug"></div>
                        타임세일
                        <hr />
                        5,400원
                        <a href="#"><i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i></a>
                    </div>
                    <div class="gal_best">
                        <div class="gal_sug_img"><img src="../share/img/index_gal_img1.jpg" id="img_sug"></div>
                        타임세일ㅎㅎ
                        <hr />
                        5,400원
                        <a href="#"><i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i></a>
                    </div>
                    <div class="gal_best">
                        <div class="gal_sug_img"><img src="../share/img/index_gal_img2.jpg" id="img_sug"></div>
                        타임세일
                        <hr />
                        5,400원
                        <a href="#"><i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i></a>
                    </div>
                    <div class="gal_best">
                        <div class="gal_sug_img"><img src="../share/img/index_gal_img3.jpg" id="img_sug"></div>
                        타임세일
                        <hr />
                        5,400원
                        <a href="#"><i class="glyphicon glyphicon-heart icon_size1" id="glyp_gal"></i></a>
                    </div>
                    <button type="button" class="btn btn-inverse index_btn">뽀삐뽀삐 단독 최저가 보장</button>
                </div>
                <div class="img_banner">
                    <img src="../share/img/index_banner1.jpg">
                    <img src="../share/img/index_banner2.jpg">
                    <img src="../share/img/index_banner3.jpg">
                </div>
                <div class="review">
                    <center>
                        <h3>실시간 리뷰</h3>
                    </center>
                    <!-- 게시물 하나 시작 -->
                    <div width="50%">
                        <div class="pr_box">
                            <div class="pr_in_box">
                                <a href="#"><img alt="사진" src="../share/img/img1.jpg" class="img_size"></a>
                                <div>
                                    <h5><b>글제목</b></h5>
                                    아이디<br>
                                    <hr />
                                    글내용<br>
                                    글내용<br>
                                    <br>
                                    <a href="#" class="btn btn-default"><i class="glyphicon glyphicon-heart icon_size"></i> 추천</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 게시물 하나 끝 -->
                    <!-- 게시물 하나 시작 -->
                    <div>
                        <div class="pr_box">
                            <div class="pr_in_box">
                                <img alt="사진" src="../share/img/img2.jpg" class="img_size">
                                <div>
                                    <h5><b>글제목</b></h5>
                                    아이디<br>
                                    <hr />
                                    글내용<br>
                                    글내용<br>
                                    <br>
                                    <a href="#" class="btn btn-default"><i class="glyphicon glyphicon-heart icon_size"></i> 추천</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--// 게시물 하나 끝 -->
                    <!-- 게시물 하나 시작 -->
                    <div>
                        <div class="pr_box">
                            <div class="pr_in_box">
                                <img alt="사진" src="../share/img/img3.jpg" class="img_size">
                                <div>
                                    <h5><b>글제목</b></h5>
                                    아이디<br>
                                    <hr />
                                    글내용<br>
                                    글내용<br>
                                    <br>
                                    <a href="#" class="btn btn-default"><i class="glyphicon glyphicon-heart icon_size"></i> 추천</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--// 게시물 하나 끝 -->
                    <!-- 게시물 하나 시작 -->
                    <div>
                        <div class="pr_box">
                            <div class="pr_in_box">
                                <img alt="사진" src="../share/img/img4.jpg" class="img_size">
                                <div>
                                    <h5><b>글제목</b></h5>
                                    아이디<br>
                                    <hr />
                                    글내용<br>
                                    글내용<br>
                                    <br>
                                    <a href="#" class="btn btn-default"><i class="glyphicon glyphicon-heart icon_size"></i> 추천</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--// 게시물 하나 끝 -->
                </div>
                <center><button type="button" class="btn btn-inverse index_btn" onclick="location.href='community/photo_rv..jsp'">실시간 리뷰 더보기</button></center>
            </div>
        <%@ include file="/share/bottom_tp.jsp" %>
        <!-- Javascript -->
        <script src="../share/assets/js/jquery-3.2.1.min.js"></script>
        <script src="../share/assets/js/bootstrap.min.js"></script>
        <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
        <script>
        var mySwiper = new Swiper('.swiper-container', {


            // 현재 페이지를 나타내는 점이 생깁니다. 클릭하면 이동합니다.
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
            },

        });

        $(".glyphicon-heart").click(function() {
            $(".glyphicon-heart").toggleClass(".glyphicon-heart-click");
        });
        </script>
</body>

</html>