<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../share/head_tp.jsp"%>
    <style type="text/css">

        .notice {
            margin-top: 20px;
        }

        hr {
            margin: 0;
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
    <%@ include file="../share/top_tp.jsp"%>
    <div class="content">
        <div class="page-title clearfix">
         <h4><b>
            <a href="#" onclick="history.back(); return false;"><i class="glyphicon glyphicon-chevron-left"></i></a>공지사항
        </b></h4>
    </div>
    <div class="notice">
        <table class="table">
            <tbody>
                <tr>
                    <td class="subject" onclick="location.href='${pageContext.request.contextPath}/community/article.do';" style="cursor:pointer;">
                        <strong>※아이디 연동 및 적립금 관련 공지※
                            <span class="comment">[36]</span><br />
                        </strong>
                        <span class="name" title="작성자">(주)뽀삐뽀삐</span>
                        <span class="date" title="작성일">20.03.17</span>
                        <span>조회 200</span>
                    </td>
                </tr>
                <tr>
                    <td class="subject" onclick="location.href='${pageContext.request.contextPath}/community/article.do';" style="cursor:pointer;">
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
<%@ include file="../share/bottom_tp.jsp"%>
</body>

</html>