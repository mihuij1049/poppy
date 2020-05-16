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
    /** 상품가격 (orderdetail 테이블 참조) */
    private int odgprice;
    /** 상품 세일가격 (orderdetail 테이블 참조) */
    private int odgsale;
    /** 상품 주문수량 (orderdetail 테이블 참조) */
    private int odgqty;
    /** 상품 주문옵션 (orderdetail 테이블 참조) */
    private String odgdoption;
    /** 이미지명 (imgs 테이블 참조) */
    private String imgname;
    /** 이미지 확장자 (imgs 테이블 참조) */
    private String imgext;
    /** 이미지 경로 (imgs 테이블 참조) */
    private String imgpath;
    /** 이미지 타입 (imgs 테이블 참조) */
    private String imgtype;
    /** 상품 번호 (goods 테이블 참조) */
    private int goodsno;
    
    // View 페이지에 이용할 변수 추가
    private int sumOdgprice;
    private int sumOdgsale;
    
    // 페이지 관련 static 변수
	// LIMIT 절에서 사용할 검색 시작 위치
	private static int offset;
	// LIMIT 절에서 사용할 검색할 데이터 수
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Orders.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Orders.listCount = listCount;
	}
}

