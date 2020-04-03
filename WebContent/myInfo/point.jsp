<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="/share/head_tp.jsp" %>
    <style type="text/css">
    .point {
        width: 95%;
        margin: auto;
        margin-top: 20px;
        border: 1px solid #ff8f83;

    }

    .point-header {
        background-color: #ff8f83;
        text-indent: 10px;
        font-weight: bold;
        color: #fff;
        line-height: 40px;
        font-size: 16px;
    }

    .point-sub {
        width: 70%;
        float: left;
        line-height: 40px;
        padding: 0px 5px;
        border-bottom: 1px dotted #ffc7c1;
    }

    .point-save {
        text-align: right;
        width: 30%;
        float: left;
        line-height: 40px;
        padding: 0px 5px;
        border-bottom: 1px dotted #ffc7c1;
    }

    .point-sub:nth-child(10) {
        border-bottom: none;
    }

    .point-save:nth-child(11) {
        border-bottom: none;
    }

    .point-list {
        width: 95%;
        margin: auto;
        margin-top: 15px;
        margin-bottom: 50px;
        background-color: #ffc7c1;
    }

    .point-link {
        width: 100%;
        height: 46px;
        border-bottom: 1px dotted #fff;
        letter-spacing: 1px;
    }

    .point-link:hover {
        cursor: pointer;
        color: #fff;
        background-color: #ff8f83;
        font-weight: bold;
        font-size: 15px;
    }

    .point-list-item {
        width: 70%;
        float: left;
        line-height: 45px;
        padding: 0px 15px;
    }

    .point-list-link {
        text-align: right;
        width: 30%;
        float: left;
        line-height: 45px;
        padding: 0px 10px;

    }

    .point-link:nth-child(3) {
        border-bottom: none;
    }

    .point-list-link:nth-child(4) {
        border-bottom: none;
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
                            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>적립금
                        </b></h4>
                </div>
                <div class="point clearfix">
                    <div class="point-header">적립금</div>
                    <div class="point-sub">총 적립금</div>
                    <div class="point-save">3,000원</div>
                    <div class="point-sub">사용가능 적립금</div>
                    <div class="point-save">3,000원</div>
                    <div class="point-sub">사용된 적립금</div>
                    <div class="point-save">0원</div>
                    <div class="point-sub">미가용 적립금</div>
                    <div class="point-save">0원</div>
                    <div class="point-sub">환불예정 적립금</div>
                    <div class="point-save">0원</div>
                </div>
                <div class="point-list clearfix">
                    <div class="point-link" onclick="location.href='plist.jsp'">
                        <div class="point-list-item">적립내역</div>
                        <div class="point-list-link">></div>
                    </div>
                    <div class="point-link" onclick="location.href='plist_nota.jsp'">
                        <div class="point-list-item">미가용 적립내역</div>
                        <div class="point-list-link">></div>
                    </div>
                    <div class="point-link" onclick="location.href='plist_grd.jsp'">
                        <div class="point-list-item">회원등급 적립내역</div>
                        <div class="point-list-link">></div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/share/bottom_tp.jsp" %>
    </script>
</body>

</html>