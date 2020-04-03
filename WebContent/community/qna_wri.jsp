<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="/share/head_tp.jsp" %>
    <style type="text/css">
    .choice {
        margin-top: 20px;
        margin-bottom: 10px;
    }

    .choice .col-xs-8 {
        margin-top: 30px;
    }

    .qna-title,
    .qna-desc,
    .qna-url,
    .qna-pw,
    .qna-private {
        margin-bottom: 10px;
    }

    .col-xs-4,
    .col-xs-8,
    .col-xs-12 {
        margin-bottom: 15px;
    }


    .item-img>img {
        width: 100px;
        height: 100px;
    }

    input[type=text],
    input[type=password] {
        width: 100%;
    }

    .qna_area {
        width: 100%;
        min-height: 180px;
        resize: none;
    }

    .qna_private {}

    .qna_btn {
        margin-top: 0px;
        text-align: center;
        margin-bottom: 50px;
    }

    #qna_ok {
        width: 45%;
    }

    #qna_re {
        width: 45%;
    }

    .modal-wrapper {
        width: 100%;
        height: 100%;
        position: fixed;
        bottom: 0;
        left: 0;
        visibility: hidden;
        opacity: 0;
        transition: all 0.25s ease-in-out;
    }

    .modal-wrapper.open-select {
        opacity: 1;
        visibility: visible;
    }

    .modal-select {
        width: 320px;
        height: 300px;
        display: block;
        margin: 50% 0 0 -300px;
        position: relative;
        top: 40%;
        left: 100%;
        background: #fff;
        opacity: 0;
        transition: all 0.5s ease-in-out;
    }

    .modal-wrapper.open-select .modal-select {
        margin-top: -200px;
        opacity: 1;
    }

    .head {
        width: 96%;
        height: 32px;
        padding: 12px 30px;
        overflow: hidden;
        background: #e2525c;
    }

    .btn-close {
        font-size: 20px;
        color: #333;
        width: 50px;
        height: 30px;
        padding: 0px 0px
    }

    .good-job {
        text-align: center;
        font-family: 'Montserrat', Arial, Helvetica, sans-serif;
        color: #e2525c;
    }

    .good-job .fa-thumbs-o-up {
        font-size: 60px;
    }

    .good-job h1 {
        font-size: 45px;
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
                            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>QnA 글쓰기
                        </b></h4>
                </div>
                <form method="post" action="">
                    <div class="container">
                        <div class="choice clearfix">
                            <div class="col-xs-4"><a href="#" class="item-img"><img src="../share/img/slide.jpg"></a></div>
                            <div class="col-xs-8"><button type="button" class="item-select trigger-select">상품정보선택</button></div>
                        </div>
                        <div class="qna-title">
                            <div class="col-xs-4">
                                <label>제목</label>
                            </div>
                            <div class="col-xs-8"><input type="text">
                            </div>
                        </div>
                        <div class="qna-desc">
                            <div class="col-xs-12">
                                <textarea name="content" class="qna_area" placeholder="내용을 입력하세요." maxlength="1800"></textarea>
                            </div>
                        </div>
                        <div class="qna-url">
                            <div class="col-xs-4">
                                <label>UCC URL</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="text">
                            </div>
                        </div>
                        <div class="qna-pw">
                            <div class="col-xs-4">
                                <label>비밀번호</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="password">
                            </div>
                        </div>
                        <div class="qna-private">
                            <div class="col-xs-4">
                                <label>비밀글설정</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="radio" name="public">
                                <label>공개글 &nbsp;</label>
                                <input type="radio" name="public">
                                <label>비밀글</label>
                            </div>
                        </div>
                    </div>
                    <div class="qna_btn">
                        <button type="submit" id="qna_ok" class="btn">등록</button>
                        <button type="reset" id="qna_re" class="btn btn-inverse">취소</button>
                    </div>
                </form>
            </div>
        </div>
        <%@ include file="/share/bottom_tp.jsp" %>
        </script>
</body>

</html>