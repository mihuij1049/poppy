package kr.co.poppy.model;

import lombok.Data;

@Data
public class Goodsdetail {
	// 기본 컬럼
	/** 상품 상세 번호 (PK) */
	private int gddetailno;
	/** 상품 옵션 */
	private String gdoption;
	/** 상품 재고 수량 */
	private int gdstock;
	/** 등록일시 */
	private String regdate;
	/** 최종변경일시 */
	private String editdate;
	/** 상품 번호 */
	private int goodsno;

	// JOIN절에 따른 추가 컬럼 미정
	private String username;
	private String bbstitle;
	private String rvlike;
	private String imgname;
	private String imgtype;
	private String imgext;
	private String imgsize;
	private String bbstype;
	private String bbscontent;
	private int memno;	
	private int bbsno;
	
	// 페이지 관련 static 변수 미정
}
