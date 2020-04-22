package kr.co.poppy.model;

import lombok.Data;

@Data
public class agree {
	// 1) 기본 컬럼
	/** 약관동의 일련번호 */
	private int agreeno;
	
	/** 이용약관 동의 */
	private int useagree;
	
	/** 개인정보 동의 */
	private int privateagree;
	
	/** 이메일 발송 동의 */
	private int emailagree;
	
	/** 쇼핑정보 수신 동의 */
	private int shoppingagree;
	
	/** 등록일시 */
	private String regdate;
	
	/** 최종변경일시 */
	private String editdate;
	
	/** 회원 테이블 참조 */
	private int memno;
	
	// JOIN 절에 따른 추가 컬럼
	
}
