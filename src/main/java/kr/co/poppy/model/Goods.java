package kr.co.poppy.model;

import lombok.Data;

@Data
public class Goods {
	// 기본 컬럼
	/** 상품 번호 (PK) */
	private int goodsno;
	/** 상품코드 */
	private String gcode;
	/** 상품명 */
	private String gname;
	/** 상품 정보 */
	private String ginfo;
	/** 상품 가격 */
	private int gprice;
	/** 상품 세일 가격 */
	private int gsale;
	/** 유통기한 */
	private String gdate;
	/** 상위 카테고리 */
	private String cate1;
	/** 하위 카테고리 */
	private String cate2;
	/** 등록일시 */
	private String regdate;
	/** 최종변경일시 */
	private String editdate;

	// JOIN절에 따른 추가 컬럼 미정
	
	/** 관심상품 일련번호 */
	private int heartno;
	/** 회원 일련번호 */
	private int memno;
	private int gddetailno;

	// 페이지 관련 static 변수 미정
}
