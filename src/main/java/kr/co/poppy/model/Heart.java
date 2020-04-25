package kr.co.poppy.model;

import lombok.Data;

@Data
public class Heart {
	// 1) 기본 컬럼
	/** 관심상품 일련번호 */
	private int heartno;
	
	/** 등록일시 */
	private String regdate;
	
	/** 최종변경일시 */
	private String editdate;
	
	/** 회원 테이블 참조 */
	private int memno;
	
	/** 상품 테이블 참조 */
	private int goodsno;
	
	// JOIN 절에 따른 추가 컬럼
}
