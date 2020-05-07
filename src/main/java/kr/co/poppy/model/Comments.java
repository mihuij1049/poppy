package kr.co.poppy.model;

import lombok.Data;

@Data
public class Comments {
	// 1) 기본 컬럼
	/** 댓글 일련번호 */
	private int cmtno;
	
	/** 댓글내용 */
	private String cmtcontent;
	
	/** 등록일시 */
	private String regdate;
	
	/** 최종변경일시 */
	private String editdate;
	
	/** 회원 테이블 참조 */
	private int memno;
	
	/** 게시판 테이블 참조 */
	private int bbsno;
	
	private String username;
	
	
	// JOIN 절에 따른 추가 컬럼

}
