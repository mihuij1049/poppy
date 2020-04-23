package kr.co.poppy.model;

import lombok.Data;

@Data
public class Rvheart {
	// 1) 기본 컬럼
	/** 포토리뷰 추천 일련번호 */
	private int rvhearno;
		
	/** 등록일시 */
	private String regdate;
		
	/** 최종변경일시 */
	private String editdate;
		
	/** 회원 테이블 참조 */
	private int memno;
		
	/** 게시판 테이블 참조 */
	private int bbsno;
		
	// JOIN절에 따른 추가 컬럼

}
