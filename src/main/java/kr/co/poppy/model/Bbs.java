package kr.co.poppy.model;

import lombok.Data;

@Data
public class Bbs {
	/** 게시글 일련번호 */
	private int bbsno;
	/** 게시글 종류(A:공지사항, B:QnA, C:포토리뷰 */
	private String bbstype;
	/** 제목 */
	private String bbstitle;
	/** 내용 */
	private String bbscontent;
	/** 공개글 여부 (0:false default(공개글), 1: true(비밀글) */
	private boolean qnasec;
	/** 비밀글일 경우 비밀번호 4자리 */
	private String qnapw;
	/** 좋아요를 받은 횟수(누적) */
	private String rvlike;
	/** 등록일시 */
	private String regdate;
	/** 최종 변경일시 */
	private String editdate;
	/** 회원 일련번호 */
	private int memno;
	/** 상품 일련번호 */
	private int goodsno;
	
}
