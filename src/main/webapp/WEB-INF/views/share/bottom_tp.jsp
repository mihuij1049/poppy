<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="footer">
		<div id="topbt">
		<a style="display:scroll;position:fixed;bottom:80px; right:10px;" href="#">
			<img src="${pageContext.request.contextPath }/share/img/pptopbt.png">
		</div>
	<!-- 하단 네비게이션 고정-->
	<!--- 소개 4인방 링크 -->
	<hr />
	<div class="etc">
		<a href="${pageContext.request.contextPath }/etc/page_info1.do">회사소개</a> <a
			href="${pageContext.request.contextPath }/etc/page_info2.do">이용약관</a> <a href="${pageContext.request.contextPath }/etc/page_info3.do">개인정보취급방침</a>
		<a href="${pageContext.request.contextPath }/etc/page_info4.do">이용안내</a>
	</div>
	<hr />
	<div class="row">
		<div class="col-xs-6 etc">
			<h5>
				<b>상담센터</b>
			</h5>
			<p style="font-size: 15px; font-weight: bold;">070-123-4567</p>
			<p style="font-size: 12px">
				운영시간 : 10:00 - 18:00<br />주말, 공휴일은 후뮤입니다.
			</p>
		</div>
		<div class="col-xs-6 etc">
			<h5>
				<b>입금계좌안내</b>
			</h5>
			<br />
			<p>
				하나 355-342432-23445<br>예금주 : (주)뽀삐뽀삐
			</p>
		</div>
	</div>
	<address class="clearfix">
		<p>
			상점명: (주)뽀삐뽀삐 대표 : 아무개 <br>주소 : 서울특별시 행복구 존버동 8282-5959 102호 -
			물류팀<br> 사업자등록번호 : 123-86-43567<br> 통신판매업신고 :
			제2020-서울서초-0082호<br> 개인정보관리책임 : 아무개 <br> <br />
			COPYRIGHT&copy; (주)뽀삐뽀삐 ALL RIGHTS RESERVED <br /> <i>DESIGN BY
				EZEN-team4</i>
		</p>
	</address>
	<!-- 하단 네비바 시작!!! -->
	<div class="navbar" id="navbarback">
		<ul class="btmbar-nav clearfix navbar-fixed-bottom">
			<hr />
			<a data-toggle="modal" href="#cmuModal"><span
				class="glyphicon glyphicon-comment">
					<p>커뮤니티</p>
			</span> </a>
			<!-- 커뮤니티탭 영역 시작!-->
			<div id="cmuModal" class="modal fade" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<!-- .modal-dialog -->
				<div class="modal-dialog footer-dialog" id="modal-dialog">
					<!-- .modal-content -->
					<div class="modal-content footer-content clearfix">
						<div class="cmubutton-close">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="community_md_content">
							<a href="${pageContext.request.contextPath }/community/notice.do"><div class="cmu_menu">공지사항</div></a>
							<hr />
							<a href="${pageContext.request.contextPath}/community/photo_rv.do"><div class="cmu_menu">포토리뷰</div></a>
							<hr />
							<a href="${pageContext.request.contextPath }/community/qna.do"><div class="cmu_menu">Q
									& A</div></a>
						</div>
						<div class="community_md_footer"></div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- 커뮤니티탭 영역 끝!-->
			<a href="${pageContext.request.contextPath }/myInfo/order_list.do"> <span
				class="glyphicon glyphicon-list-alt">
					<p>주문조회</p>
			</span>
			</a>
			<a data-toggle="modal" href="#scModal"><span
				class="glyphicon glyphicon-search">
					<p>검색</p>
			</span> </a>
			<!-- 검색탭 영역 시작!-->
			<div id="scModal" class="modal fade" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<!-- .modal-dialog -->
				<div class="modal-dialog footer-dialog" id="modal-dialog">
					<!-- .modal-content -->
					<div class="modal-content footer-content clearfix">
						<div class="scbutton-close">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="search_md_content">
							<form method="get" action="${pageContext.request.contextPath}/gallery/gal_list_search.do">
								<label><i class="glyphicon glyphicon-search"
									id="searchicon"></i></label> <input type="search" name="keyword" value="${keyword}" />
								<button type="submit" class="btn btn" value="${keyword}">검색</button>
							</form>
						</div>
						<div class="search_md_footer">
							<hr />
							<p id="recent-search">최근검색어</p>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- 검색탭 영역 끝!-->
			<!-- .modal -->
			<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<!-- .modal-dialog -->
				<div class="modal-dialog footer-dialog" id="modal-dialog">
					<!-- .modal-content -->
					<div class="modal-content footer-content clearfix">
						<!-- 제목 -->
						<div class="modal-header footer-header">
							<div class="logo">
								<img alt="사진" src="${pageContext.request.contextPath }/share/img/pplogo.jpg">
							</div>
							<!-- 닫기버튼 -->
							<div class="button-close">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
							</div>

						</div>
						<!-- 내용 -->
						<div class="modal-body footer-body clearfix">
							<div class="footer-buttons ">
							<c:choose>
							<c:when test="${empty userInfo.userid }">
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/member/login.do'"
									class="btn btn-footer btn-sm">로그인</button>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/member/agree_0.do'"
									class="btn btn-footer btn-sm">회원가입</button>
							</c:when>
							<c:otherwise>
								<button type="button"
									onclick="location.href='${pageContext.request.contextPath }/member/logout.do'"
									class="btn btn-footer btn-sm">로그아웃</button>
							</c:otherwise>
							</c:choose>
							</div>
							<div class="footer-category">
								<b>카테고리</b>
							</div>

							<!-- 아코디언 영역 -->
							<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								<!-- 항목(1) -->
								<div class="panel panel-default fm-default">
									<div class="panel-heading fm-heading ">
										<a onclick="location.href='${pageContext.request.contextPath }/gallery/gal_list_all.do'" class="accordion-toggle fm-toggle clearfix"
											id="new-good" data-toggle="collapse"
											data-parent="#accordion-tab">
											<h4 class="panel-title-new box1">전체상품</h4>
										</a>
									</div>
								</div>
								<!-- 항목(2) -->
								<div class="panel panel-default fm-default">
									<div class="panel-heading fm-heading">
										<a onclick="location.href='${pageContext.request.contextPath }/gallery/gal_list_best.do'" class="accordion-toggle fm-toggle" id="best-good"
											data-toggle="collapse" data-parent="#accordion-tab">
											<h4 class="panel-title-best box1">인기상품</h4>
										</a>
									</div>
								</div>
								<!-- 항목(3) -->
								<div class="panel panel-default fm-default">
									<div class="panel-heading fm-heading">
										<a class="accordion-toggle fm-toggle" id="accordion-toggle1"
											data-toggle="collapse" data-parent="#accordion-tab"
											href="#collapse-One">
											<h4 class="panel-title1 box1">
												푸드<img src="${pageContext.request.contextPath }/share/img/pparrowdown.png" align=right
													class="arrow-down11 icon-rotate11">
											</h4>
										</a>
									</div>
									<div id="collapse-One" class="panel-collapse collapse">
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=건식사료">
											<span class="hhh">♡</span>건식사료 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=반건식사료">
											<span class="hhh">♡</span>반건식사료 </a>
										</div>
									</div>
								</div>
								<!-- 항목(4) -->
								<div class="panel panel-default fm-default">
									<div class="panel-heading fm-heading">
										<a class="accordion-toggle fm-toggle" id="accordion-toggle2"
											data-toggle="collapse" data-parent="#accordion-tab"
											href="#collapse-Two">
											<h4 class="panel-title2 box1">
												의류<img src="${pageContext.request.contextPath }/share/img/pparrowdown.png" align=right
													class="arrow-down22 icon-rotate22">
											</h4>
										</a>
									</div>
									<div id="collapse-Two" class="panel-collapse collapse">
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=아우터">
											<span class="hhh">♡</span>아우터 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=티셔츠">
											<span class="hhh">♡</span>티셔츠 </a>
										</div>
									</div>
								</div>
								<!-- 항목(5) -->
								<div class="panel panel-default fm-default">
									<div class="panel-heading fm-heading">
										<a class="accordion-toggle fm-toggle" id="accordion-toggle3"
											data-toggle="collapse" data-parent="#accordion-tab"
											href="#collapse-Three">
											<h4 class="panel-title3 box1">
												외출용품<img src="${pageContext.request.contextPath }/share/img/pparrowdown.png" align=right
													class="arrow-down33 icon-rotate33">
											</h4>
										</a>
									</div>
									<div id="collapse-Three" class="panel-collapse collapse">
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=목줄">
											<span class="hhh">♡</span>목줄 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=하네스">
											<span class="hhh">♡</span>하네스</a>
										</div>
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=이동장">
											<span class="hhh">♡</span>이동장 </a>
										</div>
									</div>
								</div>
								<!-- 항목(6) -->
								<div class="panel panel-default fm-default">
									<div class="panel-heading fm-heading">
										<a class="accordion-toggle fm-toggle" id="accordion-toggle4"
											data-toggle="collapse" data-parent="#accordion-tab"
											href="#collapse-Four">
											<h4 class="panel-title4 box1">
												대형견코너<img src="${pageContext.request.contextPath }/share/img/pparrowdown.png" align=right
													class="arrow-down44 icon-rotate44">
											</h4>
										</a>
									</div>
									<div id="collapse-Four" class="panel-collapse collapse">
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=사료">
											<span class="hhh">♡</span>사료 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=하네스">
											<span class="hhh">♡</span>하네스 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=의류">
											<span class="hhh">♡</span>의류 </a>
										</div>
									</div>
								</div>
								<!-- 항목(7) -->
								<div class="panel panel-default fm-default">
									<div class="panel-heading fm-heading">
										<a class="accordion-toggle fm-toggle" id="accordion-toggle5"
											data-toggle="collapse" data-parent="#accordion-tab"
											href="#collapse-Five">
											<h4 class="panel-title5 box1">
												홈/리빙<img src="${pageContext.request.contextPath }/share/img/pparrowdown.png" align=right
													class="arrow-down55 icon-rotate55">
											</h4>
										</a>
									</div>
									<div id="collapse-Five" class="panel-collapse collapse">
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=방석">
											<span class="hhh">♡</span>방석 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=계단">
											<span class="hhh">♡</span></a>
										</div>
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=울타리">
											<span class="hhh">♡</span></a>
										</div>
										<div class="panel-body fm-body">
											<a href="${pageContext.request.contextPath }/gallery/gal_list_2.do?cate2=매트">
											<span class="hhh">♡</span>매트 </a>
										</div>
									</div>
								</div>
							</div>
							<!--// 아코디언 영역 -->
						</div>
						<!-- 하단 -->
						<div class="modal-footer fm-footer"></div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- 화면 영역 -->
			<a data-toggle="modal" href="#myModal"><span
				class="glyphicon glyphicon-th-large">
					<p>카테고리</p>
			</span> </a>
			<!-- 화면 영역 끝 -->
			<a href="${pageContext.request.contextPath }/myInfo/myinfo.do"> <span
				class="glyphicon glyphicon-user">
					<p>MY정보</p>
			</span>
			</a>
		</ul>
	</div>
</div>
</div>
<script src="${pageContext.request.contextPath }/share/assets/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/share/assets/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script src="${pageContext.request.contextPath }/share/plugins/ajax/ajax_helper.js"></script>
<script src="${pageContext.request.contextPath }/share/assets/js/regex.js"></script>
<script src="${pageContext.request.contextPath }/share/assets/js/bottom_tp.js"></script>