package kr.co.poppy.model;

import lombok.Data;

@Data
public class Members {
	// 1) 기본 컬럼
	/** 회원 일련번호 */
	private int memno;
		
	/** 아이디 */
	private String userid;
		
	/** 패스워드 */
	private String userpw;
		
	/** 이름 */
	private String username;
		
	/** 핸드폰 번호 */
	private String userphone;
		
	/** 이메일 주소 */
	private String useremail;
		
	/** 등록일시 */
	private String regdate;
		
	/** 최종변경일시 */
	private String editdate;
		
	//  ( 세션 저장을 위한 추가 변수 선언 )
	/** 총 가용 적립금 */
	private int sumAvpoint;
	
	/** 총 미가용 적립금 */
	private int sumNapoint;
	
	/** 총 사용된 적립금 */
	private int sumUsedpoint;
}
