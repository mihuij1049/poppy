package kr.co.poppy.model;

import lombok.Data;

@Data
public class Cart {
	// 기본 컬럼
	/** 장바구니 번호 (PK) */
	private int cartno;
	/** 장바구니 품목 수 */
	private int cartqty;
	/** 등록일시 */
	private String regdate;
	/** 최종변경일시 */
	private String editdate;
	/** 상품 상세 번호 */
	private int gddetailno;
	/** 회원 번호 */
	private int memno;
	
    // JOIN절에 따른 추가 컬럼 미정
	/** 이미지명 */
    private String imgname;
    /** 이미지 확장자 */
    private String imgext;
    /** 이미지 경로 */
    private String imgpath;
    /** 이미지 타입 */
    private String imgtype;
    /** 상품명 */
	private String gname;
	/** 배송비 */
    private int deliprice;
	/** 상품 가격 */
	private int gprice;
	/** 상품 세일가격 */
	private int gsale;
	/** 상품 번호 */
	private int goodsno;
	/** 주문 번호 */
    private int orderno;
    /** 상품상세 옵션 */
    private String gdoption;
}
