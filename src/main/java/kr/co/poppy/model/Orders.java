package kr.co.poppy.model;

import lombok.Data;

@Data
public class Orders {
	// 기본 컬럼
    /** 주문번호(PK) */
    private int orderno;
    /** 주문메시지 */
    private String odmsg;
    /** 결제방법 */
    private String paytype;
    /** 주문상태 */
    private String odstatus;
    /** 배송비 */
    private int deliprice;
    /** 주문일자 */
    private String regdate;
    /** 수정날짜 */
    private String editdate;
    /** 회원번호 */
    private int memno;
    /** 주소번호 */
    private int addrno;

    // JOIN절에 따른 추가 컬럼 미정
    /** 상품코드 (orderdetail 테이블 참조) */
    private String odgcode;
    /** 상품이름 (orderdetail 테이블 참조) */
    private String odgname;
    /** 상품이름 (orderdetail 테이블 참조) */
    private int odgprice;
    /** 상품이름 (orderdetail 테이블 참조) */
    private int odgqty;
    /** 상품이름 (orderdetail 테이블 참조) */
    private String odgdoption;
    
    // 페이지 관련 static 변수 미정

}

