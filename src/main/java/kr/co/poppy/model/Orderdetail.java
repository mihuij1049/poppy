package kr.co.poppy.model;

import lombok.Data;

@Data
public class Orderdetail {
	// 기본 컬럼
    /** 주문상세번호(PK) */
    private int orderdetailno;
    /** 주문상품코드 */
    private String odgcode;
    /** 주문상품명 */
    private String odgname;
    /** 주문상품가격 */
    private int odgprice;
    /** 주문상품할인가격 */
    private int odgsale ;
    /** 주문상품유통기한 */
    private String odgdate;
    /** 최상단카테고리 */
    private String odcate1;
    /** 최하단카테고리 */
    private String odcate2;
    /** 주문상품옵션 */
    private String odgdoption;
    /** 주문수량 */
    private int odgqty;
    /** 상품구매일 */
    private String regdate;
    /** 수정일 */
    private String editdate;
    /** 주문번호 */
    private int orderno;

    // JOIN절에 따른 추가 컬럼 미정
    
    // 페이지 관련 static 변수 미정

}
