<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>

<head>
<%@ include file="/share/head_tp.jsp" %>
    <style type="text/css">
    /** 글쓰기 버튼 */
    .btn1 {
        position: absolute;
        right: 5px;
        top: 127px;
        height: 30px;
    }

    /** 상품 이미지 */
    .img-good {
        margin-left: 30px;
    }

    /** re박스 */
    .re {
        display: inline-block;
        border: 1px solid #ffc7c1;
        background-color: #ffc7c1;
        border-radius: 3px;
        width: 50px;
        height: 30px;
        text-align: center;
        padding-top: 5px;
        margin-left: 60px;
    }

    /** 글리피콘 */
    .glyphicon-lock {
        padding-left: 20px;
    }

    /** 제목 */
    .media-body b {
        padding-left: 15px;
    }

    /** 고객 작성자/날짜 */
    .date-co {
        display: block;
        padding-top: 8px;
        margin-left: 20px;
    }

    .co {
        margin-left: 22px;
    }

    /** 뽀삐뽀삐 작성자/날짜 */
    .date-ppo {

        margin-left: 130px;
        margin-top: -4px;
    }

    .ppo {
        margin-left: 130px;
    }

    /** 페이지 */
    .paging {
        text-align: center;
    }

    .pagination>.active>span {
        background-color: #FF8F83;
        border-color: #FF8F83;
    }

    .container a {
        color: #777;
    }
    </style>
</head>

<body>
<%@ include file="/share/top_tp.jsp" %>
<div class="content">
            <!-- 여기에 작성 -->
            <div class="page-title clearfix">
                <h4><b>
                        <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>상품Q&A
                    </b></h4>
                <button type="button" onclick="location.href='qna_wri.jsp'" class="btn btn1">글쓰기</button>
            </div>
            <!-- 웹진 박스를 목록으로 구성하기 위한 구조 입니다. -->
            <div class="box-list">
                <ul class="media-list">
                    <!-- 문의글 -->
                    <hr>
                    <li class="media">
                        <a class="pull-left" href="#"> <img class="media-object img-good" src="../share/img/s1.jpg" width="60" height="60" alt="Generic placeholder image"> </a>
                        <div class="media-body">
                            <!-- 제목영역의 float 처리를 위한 마감제 박스 -->
                            <div class="clearfix">
                                <span class="glyphicon glyphicon-lock"></span>
                                <b>궁금합니다.</b><br><small class="date-co">&nbsp;2019-10-20 13:12:32</small></h4>
                            </div>
                            <p class="co">김** 조회5</p>
                        </div>
                    </li>
                    <hr>
                    <!-- 문의글 답변 -->
                    <li class="media">
                        <div class="media-body">
                            <b class="re">RE</b>
                            <span class="glyphicon glyphicon-lock"></span>
                            <b>답변드립니다!</b>
                            <br>
                            <small class="date-ppo">&nbsp;2019-11-20 16:12:12</small>
                            <p class="ppo">(주) 뽀삐뽀삐 조회3</p>
                        </div>
                    </li>
                    <hr>
                    <!-- 문의글 -->
                    <li class="media">
                        <a class="pull-left" href="#"> <img class="media-object img-good" src="../share/img/s1.jpg" width="60" height="60" alt="Generic placeholder image"> </a>
                        <div class="media-body">
                            <!-- 제목영역의 float 처리를 위한 마감제 박스 -->
                            <div class="clearfix">
                                <span class="glyphicon glyphicon-lock"></span>
                                <b>궁금합니다.</b><br><small class="date-co">&nbsp;2019-10-20 13:12:32</small></h4>
                            </div>
                            <p class="co">김** 조회5</p>
                        </div>
                    </li>
                    <hr>
                    <!-- 문의글 답변 -->
                    <li class="media">
                        <div class="media-body">
                            <b class="re">RE</b>
                            <span class="glyphicon glyphicon-lock"></span>
                            <b>답변드립니다!</b>
                            <br>
                            <small class="date-ppo">&nbsp;2019-10-20 17:12:12</small>
                            <p class="ppo">(주) 뽀삐뽀삐 조회2</p>
                        </div>
                    </li>
                    <hr>
                </ul>
            </div>
            <div class="paging">
                <ul class="pagination pagination-sm">
                    <li class="disabled"><a href="#">&laquo;</a></li>
                    <!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
                    <li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
                    <li><a href=" #">&raquo;</a></li>
                </ul>
            </div>
        </div>
        <%@ include file="/share/bottom_tp.jsp" %>
        </script>
    
</body>

</html>