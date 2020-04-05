<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%
	/** 쿠키값 추출!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */
	// 쿠키값을 저장할 문자열
	String myCookie = null;

	Cookie[] cookies = request.getCookies();
	
	// 목록있으면?
	if (cookies != null) {
		// 가져온 배열의 길이만큼 반복
		for (int i = 0; i<cookies.length; i++) {
			// i번째 쿠키의 이름을 취득한다.
			String cookieName=cookies[i].getName();
			
			if (cookieName.equals("mycookie")) {
				String value = cookies[i].getValue();
				
				// 저장된 값의 문자열 길이가 0보다 크다면?
				if (value.length() > 0) {
					myCookie = URLDecoder.decode(value,"UTF-8");
				}
			}
		}
	}
%>
<div class=" footer">
<div class="topbtn">
	<div><i class="glyphicon glyphicon-triangle-top"></i></div>
	<!-- 하단 네비게이션 고정-->
	<!--- 소개 4인방 링크 -->
	<hr />
	<div class="etc">
		<a href="../etc/page_info1.jsp">회사소개</a> <a
			href="../etc/page_info2.jsp">이용약관</a> <a href="../etc/page_info3.jsp">개인정보취급방침</a>
		<a href="../etc/page_info4.jsp">이용안내</a>
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
			</span>
			</a>
			<!-- 커뮤니티탭 영역 시작!-->
			<div id="cmuModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        			<!-- .modal-dialog -->
        			<div class="modal-dialog footer-dialog" id="modal-dialog">
            			<!-- .modal-content -->
            			<div class="modal-content footer-content clearfix">
                    			<div class="cmubutton-close">
                        			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    			</div>
                			<div class="community_md_content">
                				<a href="../community/notice.jsp"><div class="cmu_menu">공지사항</div></a>
                				<hr />
                				<a href="../community/photo_rv.jsp"><div class="cmu_menu">포토리뷰</div></a>
                				<hr />
                				<a href="../community/qna.jsp"><div class="cmu_menu">Q & A</div></a>
                    		</div>
                			<div class="community_md_footer">
                			</div>
            			</div>
            			<!-- /.modal-content -->
        			</div>
        			<!-- /.modal-dialog -->
    			</div>
    			<!-- /.modal -->
			<!-- 커뮤니티탭 영역 끝!-->
			<a href="../myInfo/order_list.jsp"> <span
				class="glyphicon glyphicon-list-alt">
					<p>주문조회</p>
			</span>
			</a>
			<a data-toggle="modal" href="#scModal"><span
				class="glyphicon glyphicon-search">
				<p>검색</p>
			</span> </a>
			<!-- 검색탭 영역 시작!-->
			<div id="scModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        			<!-- .modal-dialog -->
        			<div class="modal-dialog footer-dialog" id="modal-dialog">
            			<!-- .modal-content -->
            			<div class="modal-content footer-content clearfix">
                    			<div class="scbutton-close">
                        			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    			</div>
                			<div class="search_md_content">
                			<!-- 쿠키값 출력합니다! -->
                			<form method="post" action="../share/search_cookie.jsp">
                    			<label><i class="glyphicon glyphicon-search" id="searchicon"></i></label>
                    			<input type="text" name="search_input" />
                    			<button type="submit" class="btn btn">검색</button>
                    		</form>
                    		<!-- 쿠키값~! 출력~! 끝~! -->
                    		</div>
                			<div class="search_md_footer">
                			<hr />
                			<p>최근검색어</p>
                			<%
                				if(myCookie == null) {
                					out.println("최근검색어가 없습니다.");
                				} else {
                					out.println(myCookie);
                				}
                			%>
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
								<img alt="사진" src="../share/img/logojpg.jpg">
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
								<button type="button"
									onclick="location.href='../member/login.jsp'"
									class="btn btn-footer btn-sm">로그인</button>
								<button type="button"
									onclick="location.href='../member/agree_0.jsp'"
									class="btn btn-footer btn-sm">회원가입</button>
							</div>
							<div class="footer-category">
								<b>카테고리</b>
							</div>

							<!-- 아코디언 영역 -->
							<div class="panel-group clearfix" id="accordion-tab">
								<!-- 항목(1) -->
								<div class="panel panel-default fm-default">
									<div class="panel-heading fm-heading ">
										<a href="#" class="accordion-toggle fm-toggle clearfix"
											id="new-good" data-toggle="collapse"
											data-parent="#accordion-tab">
											<h4 class="panel-title-new">신상품</h4>
										</a>
									</div>
								</div>
								<!-- 항목(2) -->
								<div class="panel panel-default fm-default">
									<div class="panel-heading fm-heading">
										<a href="#" class="accordion-toggle fm-toggle" id="best-good"
											data-toggle="collapse" data-parent="#accordion-tab">
											<h4 class="panel-title-best">인기상품</h4>
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
												푸드<img src="../share/img/arrow-down.png" align=right
													class="arrow-down11 icon-rotate11">
											</h4>
										</a>
									</div>
									<div id="collapse-One" class="panel-collapse collapse">
										<div class="panel-body fm-body">
											<a href="#">- 사료 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 간식 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 영양제 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 우유 </a>
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
												의류<img src="../share/img/arrow-down.png" align=right
													class="arrow-down22 icon-rotate22">
											</h4>
										</a>
									</div>
									<div id="collapse-Two" class="panel-collapse collapse">
										<div class="panel-body fm-body">
											<a href="#">- 아우터 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 티셔츠 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 신발 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 양말 </a>
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
												외출용품<img src="../share/img/arrow-down.png" align=right
													class="arrow-down33 icon-rotate33">
											</h4>
										</a>
									</div>
									<div id="collapse-Three" class="panel-collapse collapse">
										<div class="panel-body fm-body">
											<a href="#">- 목줄/리드줄 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 자동줄 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 이동장 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 배변봉투 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 휴대용식기 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 입마개 </a>
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
												대형견코너<img src="../share/img/arrow-down.png" align=right
													class="arrow-down44 icon-rotate44">
											</h4>
										</a>
									</div>
									<div id="collapse-Four" class="panel-collapse collapse">
										<div class="panel-body fm-body">
											<a href="#">- 사료,간식 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 목줄/리드줄 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 의류 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 장난감 </a>
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
												홈/리빙<img src="../share/img/arrow-down.png" align=right
													class="arrow-down55 icon-rotate55">
											</h4>
										</a>
									</div>
									<div id="collapse-Five" class="panel-collapse collapse">
										<div class="panel-body fm-body">
											<a href="#">- 방석 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 계단 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 식기 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 하우스/울타리 </a>
										</div>
										<div class="panel-body fm-body">
											<a href="#">- 매트 </a>
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
			<a href="../myInfo/myinfo.jsp"> <span
				class="glyphicon glyphicon-user">
					<p>MY정보</p>
			</span>
			</a>
		</ul>
	</div>
</div>
</div>
<script src="../share/assets/js/jquery-3.2.1.min.js"></script>
<script src="../share/assets/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script src="../share/plugins/ajax/ajax_helper.js"></script>
<script src="../share/assets/js/regex.js"></script>
<script src="../share/assets/js/bottom_tp.js"></script>