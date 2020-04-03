<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Poppy-Poppy</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="../share/assets/ico/favicon.png" />
    <link rel="apple-touch-icon-precomposed" href="../share/assets/ico/apple-touch-icon-144-precomposed.png" />
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="../share/assets/css/bootstrap.min.css" />
    <!-- 나눔고딕 웹 폰트 적용 -->
    <link rel="stylesheet" type="text/css" href="../share/assets/css/nanumfont.css" />
    <link rel="stylesheet" type="text/css" href="../share/tmpl.css" />
    <!-- 반응형 웹을 지원하지 않을 경우 -->
    <!-- <link rel="stylesheet" href="assets/css/non-responsive.css" /> -->
    <!-- IE8 이하 버전 지원 -->
    <!--[if lt IE 9]>
        <script type="text/javascript" src="assets/js/html5shiv.js"></script>
        <script type="text/javascript" src="assets/js/respond.min.js"></script>
        <![endif]-->
    <!-- IE10 반응형 웹 버그 보완 -->
    <!--[if gt IE 9]>
        <link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
        <script type="text/javascript" src="assets/js/ie10.js"></script>
        <![endif]-->
    <%@ include file="/share/head_tp.jsp"%>
    <style type="text/css">
    .container {
        margin-top: 20px;
    }

    .table span {
        font-size: 11px;
    }

    .table td {
        height: 70px;
    }

    .table .subject {
        vertical-align: middle;
    }

    .pagination>.active>span {
        background-color: #777;
        border-color: #777;
    }

    a {
        color: #777;
    }

    .paging {
        text-align: center;
    }

    .paging .disabled {
        position: relative;
        right: 10px;
    }

    .paging .paging-right {
        position: relative;
        left: 10px;
    }

    .row {
        margin-bottom: 50px;
    }

    .form-group {
        max-width: 100%;
        padding-top: 5px;
        position: relative;
        top: 5px;
    }

    .form-group #array1 {
        font-size: 12px;
        margin-left: 2%;
        margin-right: 2%;
        padding-left: 5px;
        display: inline;
        width: 47%;
        height: 30px;
    }

    .form-group #array2 {
        font-size: 12px;
        margin-right: 2%;
        padding-left: 5px;
        width: 47%;
        height: 30px;
    }

    .form-group #search {
        display: inline;
        margin-top: 8px;
        margin-left: 2%;
        margin-right: 2%;
        width: 82%;
        height: 30px;

    }

    .form-group .btn {
        font-size: 12px;
        color: #fff;
        background: #ff8f83;
        padding-left: 10px;
        margin-top: 8px;
        width: 12%;
        height: 30px;

    }
    </style>
</head>

<body>
    <%@ include file="/share/top_tp.jsp"%>
    <div class="container">
        <div class="content">
            <div class="page-title clearfix">
                <a href="#" onclick="history.back();return false;">
                    <img src="../share/img/back.jpg">
                </a>
                <h4><b>공지사항</b></h>
            </div>
            <div class="container">
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="subject" onclick="#" style="cursor:pointer;">
                                <strong>※아이디 연동 및 적립금 관련 공지※
                                    <span class="comment">[36]</span><br />
                                </strong>
                                <span class="name" title="작성자">(주)뽀삐뽀삐</span>
                                <span class="date" title="작성일">20.03.17</span>
                                <span>조회 200</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="subject" onclick="#" style="cursor:pointer;">
                                <strong>신규 회원가입 고객 혜택안내
                                    <span class="comment">[50]</span>
                                </strong><br />
                                <span class="name" title="작성자">(주)뽀삐뽀삐</span>
                                <span class="date" title="작성일">20.03.17</span>
                                <span>조회 235</span>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class=" paging">
                <ul class="pagination pagination-sm">
                    <li class="disabled"><a href="#">&laquo;</a></li>
                    <!-- 활성화 버튼은 아래의 구조로 구성하시면 됩니다. sr-only는 스크린리더 전용입니다. -->
                    <li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
                    <li class="paging-right"><a href="#">&raquo;</a></li>
                </ul>
            </div>
            <hr>
            <div class="row">
                <div class="form-group">
                    <select id="array1" class="col-xs-6 form-control">
                        <option value="">일주일</option>
                        <option value="1">한달</option>
                        <option value="2">세달</option>
                        <option value="3">전체</option>
                    </select>
                    <select id="array2" class="col-xs-6 form-control">
                        <option value="">내용</option>
                        <option value="1">제목</option>
                        <option value="2">글쓴이</option>
                        <option value="3">아이디</option>
                        <option value="3">별명</option>
                    </select>
                    <input type="text" id="search" class="col-xs-11 form-control">
                    <button type="button" class="col-xs-1 btn btn-dark">검색</button>
                </div>
            </div>
        </div>       
    </div>
    <%@ include file="/share/bottom_tp.jsp"%>
    <!-- Javascript -->
    <script src="../share/assets/js/jquery-3.2.1.min.js"></script>
    <script src="../share/assets/js/bootstrap.min.js"></script>
</body>

</html>