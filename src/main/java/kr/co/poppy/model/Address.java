package kr.co.poppy.model;

import lombok.Data;

@Data
public class Address {
	// 기본 컬럼
    /** 주소번호(PK) */
    private int addrno;
    /** 주문인 */
    private String odname;
    /** 주문 핸드폰번호 */
    private String odphone;
    /** 주문 이메일 */
    private String odemail;
    /** 우편번호 */
    private int zcode;
    /** 기본주소 */
    private String addr1;
    /** 상세주소 */
    private String addr2;
    /** 등록일 */
    private String regdate;
    /** 수정일 */
    private String editdate;
    /** 회원번호 */
    private int memno;

    // JOIN절에 따른 추가 컬럼 미정
    
    // 페이지 관련 static 변수 미정

}
