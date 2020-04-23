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
		
	// JOIN 절에 따른 추가 컬럼
		
}
